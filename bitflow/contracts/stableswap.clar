;; Bitflow Stableswap Core Contract
;; This contract handles the core logic of the Stableswap protocol.
;; The initial trading pair is sUSDT/USDA
;; USDA is 6 decimals
;; sUSDT is 8 decimals

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Cons, Vars, & Maps ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)
(use-trait lp-trait .lp-trait.lp-trait)

;;;;;;;;;;;;;;;
;; Constants ;;
;;;;;;;;;;;;;;;

;; This contract address
(define-constant this-contract (as-contract tx-sender))

;; Fee escrow contract address
(define-constant staking-and-rewards-contract .stableswap-staking-and-rewards)

;; Deployment height
(define-constant deployment-height block-height)

;; Cycle length in blocks (1 day = 144 blocks)
(define-constant cycle-length u144)

;; Index loop for using Newton-Raphson method to converge square root that goes up to u384
(define-constant index-list (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120 u121 u122 u123 u124 u125 u126 u127 u128 u129 u130 u131 u132 u133 u134 u135 u136 u137 u138 u139 u140 u141 u142 u143 u144 u145 u146 u147 u148 u149 u150 u151 u152 u153 u154 u155 u156 u157 u158 u159 u160 u161 u162 u163 u164 u165 u166 u167 u168 u169 u170 u171 u172 u173 u174 u175 u176 u177 u178 u179 u180 u181 u182 u183 u184 u185 u186 u187 u188 u189 u190 u191 u192 u193 u194 u195 u196 u197 u198 u199 u200 u201 u202 u203 u204 u205 u206 u207 u208 u209 u210 u211 u212 u213 u214 u215 u216 u217 u218 u219 u220 u221 u222 u223 u224 u225 u226 u227 u228 u229 u230 u231 u232 u233 u234 u235 u236 u237 u238 u239 u240 u241 u242 u243 u244 u245 u246 u247 u248 u249 u250 u251 u252 u253 u254 u255 u256 u257 u258 u259 u260 u261 u262 u263 u264 u265 u266 u267 u268 u269 u270 u271 u272 u273 u274 u275 u276 u277 u278 u279 u280 u281 u282 u283 u284 u285 u286 u287 u288 u289 u290 u291 u292 u293 u294 u295 u296 u297 u298 u299 u300 u301 u302 u303 u304 u305 u306 u307 u308 u309 u310 u311 u312 u313 u314 u315 u316 u317 u318 u319 u320 u321 u322 u323 u324 u325 u326 u327 u328 u329 u330 u331 u332 u333 u334 u335 u336 u337 u338 u339 u340 u341 u342 u343 u344 u345 u346 u347 u348 u349 u350 u351 u352 u353 u354 u355 u356 u357 u358 u359 u360 u361 u362 u363 u364 u365 u366 u367 u368 u369 u370 u371 u372 u373 u374 u375 u376 u377 u378 u379 u380 u381 u382 u383 u384))

;; Number of tokens per pair
(define-constant number-of-tokens u2)

;; Test Protocol Address
(define-constant protocol-address 'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5)


;;;;;;;;;;;;
;; Errors ;;
;;;;;;;;;;;;


;;;;;;;;;;;;;;;
;; Variables ;;
;;;;;;;;;;;;;;;

;; Admin Governance List
(define-data-var admins (list 5 principal) (list tx-sender))

;; Swap Fees (5% initialized, 3% to LPs, 2% to protocol)
(define-data-var swap-fees {lps: uint, protocol: uint} {lps: u3, protocol: u2})

;; Liquidity Fees (3% initialized, all 3% to protocol)
(define-data-var liquidity-fees uint u3)

;; Test Different Constant
(define-constant test-constant u2)


;;;;;;;;;;
;; Maps ;;
;;;;;;;;;;

(define-map PairsDataMap {x-token: principal, y-token: principal, lp-token: principal} {
    approval: bool,
    total-shares: uint,
    x-decimals: uint,
    y-decimals: uint,
    balance-x: uint,
    balance-y: uint,
    d: uint,
    amplification-coefficient: uint,
})

(define-map CycleDataMap {x-token: principal, y-token: principal, lp-token: principal, cycle-num: uint} {
    cycle-fee-balance-x: uint,
    cycle-fee-balance-y: uint,
})



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Read-Only Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get pair data
(define-read-only (get-pair-data (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>)) 
    (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)})
)

;; Get cycle data
(define-read-only (get-cycle-data (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (cycle-num uint)) 
    (map-get? CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: cycle-num})
)

;; Get current cycle
(define-read-only (get-current-cycle) 
    (/ (- block-height deployment-height) cycle-length)
)

;; Get cycle from height
(define-read-only (get-cycle-from-height (height uint)) 
    (/ (- height deployment-height) cycle-length)
)

;; Get starting height from cycle
(define-read-only (get-starting-height-from-cycle (cycle uint)) 
    (+ deployment-height (* cycle cycle-length))
)

;; Get deployment height
(define-read-only (get-deployment-height) 
    deployment-height
)

;; Get up to last 120 cycle rewards -> nice to have
;; (define-read-only (get-cycle-rewards) body)

;; Get DY
(define-read-only (get-dy (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (x-amount uint))
    (let 
        (
            (pair-data (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-balance-x (get balance-x pair-data))
            (current-balance-y (get balance-y pair-data))
            (swap-fee-lps (get lps (var-get swap-fees)))
            (swap-fee-protocol (get protocol (var-get swap-fees)))
            (total-swap-fee (+ swap-fee-lps swap-fee-protocol))
            (x-amount-fee (/ (* x-amount total-swap-fee) u10000))
            (updated-x-amount (- x-amount x-amount-fee))
            (updated-x-balance (+ current-balance-x updated-x-amount))
            (new-y (get-y updated-x-balance current-balance-y updated-x-amount (* (get amplification-coefficient pair-data) number-of-tokens)))
            (dy (- current-balance-y new-y))
        )
        (ok dy)
    )
)

;; Get X
;; Maybe move into get-dx?
(define-read-only (get-x (y-bal uint) (x-bal uint) (y-amount uint) (ann uint))
    (let 
        (
            (y-bal-new (+ y-bal y-amount))
            (current-D (get-D x-bal y-bal ann))
            (c0 current-D)
            (c1 (/ (* c0 current-D) (* number-of-tokens y-bal-new)))
            (c2 (/ (* c1 current-D) (* ann number-of-tokens)))
            (b (+ y-bal-new (/ current-D ann)))
        )
        (get converged (fold x-for-loop index-list {x: current-D, c: c2, b: b, D: current-D, converged: u0}))
    )
)

;; Get X Helper
(define-private (x-for-loop (n uint) (x-info {x: uint, c: uint, b: uint, D: uint, converged: uint})) 
    (let
        (
            (current-x (get x x-info))
            (current-c (get c x-info))
            (current-b (get b x-info))
            (current-D (get D x-info))
            (current-converged (get converged x-info))
            (x-numerator (+ (* current-x current-x) current-c))
            (x-denominator (- (+ (* u2 current-x) current-b) current-D))
            (new-x (/ x-numerator x-denominator))
        )

        (if (is-eq current-converged u0)
            (if (> new-x  current-x)
                (if (<= (- new-x current-x) test-constant)
                    {x: new-x, c: current-c, b: current-b, D: current-D, converged: new-x}
                    {x: new-x, c: current-c, b: current-b, D: current-D, converged: u0}
                )
                (if (<= (- current-x new-x) test-constant)
                    {x: new-x, c: current-c, b: current-b, D: current-D, converged: new-x}
                    {x: new-x, c: current-c, b: current-b, D: current-D, converged: u0}
                )
            )
            x-info
        )


    )
)

;; Get Y
;; Maybe move into get-dy?
(define-read-only (get-y (x-bal uint) (y-bal uint) (x-amount uint) (ann uint))
    (let 
        (
            (x-bal-new (+ x-bal x-amount))
            (current-D (get-D x-bal y-bal ann))
            (c0 current-D)
            (c1 (/ (* c0 current-D) (* number-of-tokens x-bal-new)))
            (c2 (/ (* c1 current-D) (* ann number-of-tokens)))
            (b (+ x-bal-new (/ current-D ann)))
        )
        (get converged (fold y-for-loop index-list {y: current-D, c: c2, b: b, D: current-D, converged: u0}))
    )
)

;; Get Y Helper
(define-private (y-for-loop (n uint) (y-info {y: uint, c: uint, b: uint, D: uint, converged: uint})) 
    (let
        (
            (current-y (get y y-info))
            (current-c (get c y-info))
            (current-b (get b y-info))
            (current-D (get D y-info))
            (current-converged (get converged y-info))
            (y-numerator (+ (* current-y current-y) current-c))
            (y-denominator (- (+ (* u2 current-y) current-b) current-D))
            (new-y (/ y-numerator y-denominator))
        )

        (if (is-eq current-converged u0)
            (if (> new-y  current-y)
                (if (<= (- new-y current-y) test-constant)
                    {y: new-y, c: current-c, b: current-b, D: current-D, converged: new-y}
                    {y: new-y, c: current-c, b: current-b, D: current-D, converged: u0}
                )
                (if (<= (- current-y new-y) test-constant)
                    {y: new-y, c: current-c, b: current-b, D: current-D, converged: new-y}
                    {y: new-y, c: current-c, b: current-b, D: current-D, converged: u0}
                )
            )
            y-info
        )

    )
)



;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;; Swap Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

;; Swap X -> Y
;; @desc: Swaps X token for Y token
;; @params: x-token: principal, y-token: principal, lp-token: principal, x-amount: uint, min-y-amount: uint
(define-public (swap-x-for-y (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (x-amount uint) (min-y-amount uint)) 
    (let 
        (
            (pair-data (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-approval (get approval pair-data))
            (current-balance-x (get balance-x pair-data))
            (current-balance-y (get balance-y pair-data))
            (swap-fee-lps (get lps (var-get swap-fees)))
            (swap-fee-protocol (get protocol (var-get swap-fees)))
            (x-amount-fee-lps (/ (* x-amount swap-fee-lps) u10000))
            (x-amount-fee-protocol (/ (* x-amount swap-fee-protocol) u10000))
            (x-amount-fee-total (+ x-amount-fee-lps x-amount-fee-protocol))
            (updated-x-amount (- x-amount x-amount-fee-total))
            (updated-x-balance (+ current-balance-x updated-x-amount))
            (new-y (get-y updated-x-balance current-balance-y updated-x-amount (* (get amplification-coefficient pair-data) number-of-tokens)))
            (dy (- current-balance-y new-y))
            (swapper tx-sender)
            ;; As long as get-y converges, the stableswap invariant D should remain approximately the same.
            (old-D (get d pair-data))
            (new-D (get-D updated-x-balance new-y (* (get amplification-coefficient pair-data) number-of-tokens)))
        )

        ;; Assert that pair is approved
        (asserts! current-approval (err "err-pair-not-approved"))

        ;; Assert that x-amount is less than x10 of current-balance-x
        (asserts! (< x-amount (* u10 current-balance-x)) (err "err-x-amount-too-high"))

        ;; Assert that dy is greater than min-y-amount
        (asserts! (> dy min-y-amount) (err "err-min-y-amount"))

        (if (and (> x-amount-fee-lps u0) (> x-amount-fee-protocol u0))

            (begin
                ;; Transfer updated-x-balance tokens from tx-sender to this contract
                (unwrap! (contract-call? x-token transfer updated-x-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-x"))

                ;; Transfer x-amount-fee-lps tokens from tx-sender to staking-and-rewards-contract
                (unwrap! (contract-call? x-token transfer x-amount-fee-lps swapper staking-and-rewards-contract none) (err "err-transferring-token-x-fee"))

                ;; Transfer x-amount-fee-protocol tokens from tx-sender to protocol-address
                (unwrap! (contract-call? x-token transfer x-amount-fee-protocol swapper protocol-address none) (err "err-transferring-token-x-fee-protocol"))

                ;; Transfer dy tokens from this contract to tx-sender
                (unwrap! (as-contract (contract-call? y-token transfer dy tx-sender swapper none)) (err "err-transferring-token-y")) 
            )

            (if (and (is-eq x-amount-fee-lps u0) (is-eq x-amount-fee-protocol u0)) 
                (begin
                    ;; Transfer updated-x-balance tokens from tx-sender to this contract
                    (unwrap! (contract-call? x-token transfer updated-x-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-x"))

                    ;; Transfer dy tokens from this contract to tx-sender
                    (unwrap! (as-contract (contract-call? y-token transfer dy tx-sender swapper none)) (err "err-transferring-token-y")) 
                )
                (if (and (> x-amount-fee-lps u0) (is-eq x-amount-fee-protocol u0))
                    (begin
                        ;; Transfer updated-x-balance tokens from tx-sender to this contract
                        (unwrap! (contract-call? x-token transfer updated-x-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-x"))

                        ;; Transfer x-amount-fee-lps tokens from tx-sender to staking-and-rewards-contract
                        (unwrap! (contract-call? x-token transfer x-amount-fee-lps swapper staking-and-rewards-contract none) (err "err-transferring-token-x-fee"))

                        ;; Transfer dy tokens from this contract to tx-sender
                        (unwrap! (as-contract (contract-call? y-token transfer dy tx-sender swapper none)) (err "err-transferring-token-y")) 
                    )
                    (begin
                        ;; Transfer updated-x-balance tokens from tx-sender to this contract
                        (unwrap! (contract-call? x-token transfer updated-x-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-x"))

                        ;; Transfer x-amount-fee-protocol tokens from tx-sender to protocol-address
                        (unwrap! (contract-call? x-token transfer x-amount-fee-protocol swapper protocol-address none) (err "err-transferring-token-x-fee-protocol"))

                        ;; Transfer dy tokens from this contract to tx-sender
                        (unwrap! (as-contract (contract-call? y-token transfer dy tx-sender swapper none)) (err "err-transferring-token-y")) 
                    )
                )
                    
            )

        )

        ;; Update all appropriate maps
        ;; Update PairsDataMap
        (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} (merge 
            pair-data 
            {
                balance-x: updated-x-balance,
                balance-y: new-y,
                d: new-D
            }
        ))

        ;; Match if map-get? returns some for CycleDataMap
        (ok (match (map-get? CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)})
            cycle-data
                ;; Update CycleDataMap
                (map-set CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)} (merge 
                    cycle-data 
                    {
                        cycle-fee-balance-x: (+ (get cycle-fee-balance-x cycle-data) x-amount-fee-lps)
                    }
                ))
                ;; Create new CycleDataMap
                (map-set CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)} {
                    cycle-fee-balance-x: x-amount-fee-lps,
                    cycle-fee-balance-y: u0,
                })
            
        ))

    )
)

;; Swap Y -> X
;; @desc: Swaps Y token for X token
;; @params: y-token: principal, x-token: principal, lp-token: principal, x-amount: uint, min-x-amount: uint
(define-public (swap-y-for-x (y-token <sip-010-trait>) (x-token <sip-010-trait>) (lp-token <lp-trait>) (y-amount uint) (min-x-amount uint)) 
    (let 
        (
            (pair-data (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-approval (get approval pair-data))
            (current-balance-x (get balance-x pair-data))
            (current-balance-y (get balance-y pair-data))
            (swap-fee-lps (get lps (var-get swap-fees)))
            (swap-fee-protocol (get protocol (var-get swap-fees)))
            (y-amount-fee-lps (/ (* y-amount swap-fee-lps) u10000))
            (y-amount-fee-protocol (/ (* y-amount swap-fee-protocol) u10000))
            (y-amount-fee-total (+ y-amount-fee-lps y-amount-fee-protocol))
            (updated-y-amount (- y-amount y-amount-fee-total))
            (updated-y-balance (+ current-balance-y updated-y-amount))
            (new-x (get-x updated-y-balance current-balance-x updated-y-amount (* (get amplification-coefficient pair-data) number-of-tokens)))
            (dx (- current-balance-x new-x))
            (swapper tx-sender)
            ;; As long as get-x converges, the stableswap invariant D should remain approximately the same.
            (old-D (get d pair-data))
            (new-D (get-D updated-y-balance new-x (* (get amplification-coefficient pair-data) number-of-tokens)))

        )

        ;; Assert that pair is approved
        (asserts! current-approval (err "err-pair-not-approved"))

        ;; Assert that y-amount is less than x10 of current-balance-y
        (asserts! (< y-amount (* u10 current-balance-y)) (err "err-y-amount-too-high"))

        ;; Assert that dx is greater than min-x-amount
        (asserts! (> dx min-x-amount) (err "err-min-x-amount"))

        (if (and (> y-amount-fee-lps u0) (> y-amount-fee-protocol u0))

            (begin
                ;; Transfer updated-y-balance tokens from tx-sender to this contract
                (unwrap! (contract-call? y-token transfer updated-y-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-y-updated-amount"))

                ;; Transfer y-amount-fee-lps tokens from tx-sender to staking-and-rewards-contract
                (unwrap! (contract-call? y-token transfer y-amount-fee-lps swapper staking-and-rewards-contract none) (err "err-transferring-token-y-swap-fee"))

                ;; Transfer y-amount-fee-protocol tokens from tx-sender to protocol-address
                (unwrap! (contract-call? y-token transfer y-amount-fee-protocol swapper protocol-address none) (err "err-transferring-token-y-protocol-fee"))

                ;; Transfer dx tokens from this contract to tx-sender
                (unwrap! (as-contract (contract-call? x-token transfer dx tx-sender swapper none)) (err "err-transferring-token-x"))
            )

            (if (and (is-eq y-amount-fee-lps u0) (is-eq y-amount-fee-protocol u0)) 
                (begin
                    ;; Transfer updated-y-balance tokens from tx-sender to this contract
                    (unwrap! (contract-call? y-token transfer updated-y-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-y-updated-amount"))

                    ;; Transfer dx tokens from this contract to tx-sender
                    (unwrap! (as-contract (contract-call? x-token transfer dx tx-sender swapper none)) (err "err-transferring-token-x"))
                )
                (if (and (> y-amount-fee-lps u0) (is-eq y-amount-fee-protocol u0))
                    (begin
                        ;; Transfer updated-y-balance tokens from tx-sender to this contract
                        (unwrap! (contract-call? y-token transfer updated-y-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-y-updated-amount"))

                        ;; Transfer y-amount-fee-lps tokens from tx-sender to staking-and-rewards-contract
                        (unwrap! (contract-call? y-token transfer y-amount-fee-lps swapper staking-and-rewards-contract none) (err "err-transferring-token-y-swap-fee"))

                        ;; Transfer dx tokens from this contract to tx-sender
                        (unwrap! (as-contract (contract-call? x-token transfer dx tx-sender swapper none)) (err "err-transferring-token-x"))
                    )
                    (begin
                        ;; Transfer updated-y-balance tokens from tx-sender to this contract
                        (unwrap! (contract-call? y-token transfer updated-y-amount swapper (as-contract tx-sender) none) (err "err-transferring-token-y-updated-amount"))

                        ;; Transfer y-amount-fee-protocol tokens from tx-sender to protocol-address
                        (unwrap! (contract-call? y-token transfer y-amount-fee-protocol swapper protocol-address none) (err "err-transferring-token-y-protocol-fee"))

                        ;; Transfer dx tokens from this contract to tx-sender
                        (unwrap! (as-contract (contract-call? x-token transfer dx tx-sender swapper none)) (err "err-transferring-token-x"))
                    )
                )
                    
            )

        )

        ;; Update all appropriate maps
        ;; Update PairsDataMap
        (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} (merge 
            pair-data 
            {
                balance-x: new-x,
                balance-y: updated-y-balance,
                d: new-D
            }
        ))

        ;; Match if map-get? returns some for CycleDataMap
        (ok (match (map-get? CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)})
            cycle-data
                ;; Update CycleDataMap
                (map-set CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)} (merge 
                    cycle-data 
                    {
                        cycle-fee-balance-y: (+ (get cycle-fee-balance-y cycle-data) y-amount-fee-lps)
                    }
                ))
                ;; Create new CycleDataMap
                (map-set CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: (get-current-cycle)} {
                    cycle-fee-balance-x: u0,
                    cycle-fee-balance-y: y-amount-fee-lps,
                })
            
        ))

    )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Liquidity Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add Liquidity
;; @desc: Adds liquidity to a pair, mints the appropriate amount of LP tokens
;; @params: x-token: principal, y-token: principal, lp-token: principal, x-amount-added: uint, y-amount-added: uint
(define-public (add-liquidity (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (x-amount-added uint) (y-amount-added uint) (min-lp-amount uint) )
    (let 
        (
            ;; Grabbing all data from PairsDataMap
            (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-approval (get approval current-pair))
            (current-balance-x (get balance-x current-pair))
            (new-balance-x (+ current-balance-x x-amount-added))
            (current-balance-y (get balance-y current-pair))
            (new-balance-y (+ current-balance-y y-amount-added))
            (current-total-shares (get total-shares current-pair))
            (current-amplification-coefficient (get amplification-coefficient current-pair))
            
            ;; Calculating the ideal balance
            (d0 (get-D current-balance-x current-balance-y current-amplification-coefficient))
            (d1 (get-D new-balance-x new-balance-y current-amplification-coefficient))
            (ideal-balance-x (/ (* d1 current-balance-x) d0))
            (ideal-balance-y (/ (* d1 current-balance-y) d0))
            (x-difference (if (> ideal-balance-x new-balance-x) (- ideal-balance-x new-balance-x) (- new-balance-x ideal-balance-x)))
            (y-difference (if (> ideal-balance-y new-balance-y) (- ideal-balance-y new-balance-y) (- new-balance-y ideal-balance-y)))
            ;; Applying fees for imbalanced liquidity
            (ideal-x-fee (/ (* x-difference (var-get liquidity-fees)) u10000))
            (ideal-y-fee (/ (* y-difference (var-get liquidity-fees)) u10000))
            (x-fee (if (> x-amount-added ideal-x-fee) ideal-x-fee x-amount-added))
            (y-fee (if (> y-amount-added ideal-y-fee) ideal-y-fee y-amount-added))
            (x-amount-added-updated (- x-amount-added x-fee))
            (y-amount-added-updated (- y-amount-added y-fee))
            (new-balance-x-post-fee (+ current-balance-x x-amount-added-updated))
            (new-balance-y-post-fee (+ current-balance-y y-amount-added-updated))
            (d2 (get-D new-balance-x-post-fee new-balance-y-post-fee current-amplification-coefficient))
            (liquidity-provider tx-sender)
        )

        ;; Assert that pair is approved
        (asserts! current-approval (err "err-pair-not-approved"))

        ;; Assert that either x-amount-added or y-amount-added is greater than 0
        (asserts! (or (> x-amount-added u0) (> y-amount-added u0)) (err "err-x-or-y-amount-added-zero"))

        ;; Assert that d2 is greater than d0
        (asserts! (> d2 d0) (err "err-d2-less-than-d0"))

        ;; Assert that derived mint amount is greater than min-lp-amount
        (asserts! (> (/ (* current-total-shares (- d2 d0)) d0) min-lp-amount) (err "err-derived-amount-less-than-lp"))

        ;; Check if current liquidity is equal
        (if (is-eq current-balance-x current-balance-y) 
            (if (or (is-eq x-amount-added u0) (is-eq y-amount-added u0))
                ;; Check which is non-zero
                (if (is-eq x-amount-added u0)
                    ;; Only transferring y tokens to this contract
                    (begin 
                        ;; Transfer y-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y"))                
                    )
                    ;; Only transferring x tokens to this contract
                    (begin 
                        ;; Transfer x-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                    )
                )
                ;; Transfer both x & y tokens to this contract
                (begin
                    ;; Transfer x-amount-added tokens from tx-sender to this contract
                    (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                    
                    ;; Transfer y-amount-added tokens from tx-sender to this contract
                    (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y-escrow"))
                )
            )
            (if (and (is-eq x-fee u0) (is-eq y-fee u0))
                (if (or (is-eq x-amount-added u0) (is-eq y-amount-added u0))
                    ;; Check which is non-zero
                    (if (is-eq x-amount-added u0)
                        ;; Only transferring y tokens to this contract
                        (begin 
                            ;; Transfer y-amount-added tokens from tx-sender to this contract
                            (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y"))                
                        )
                        ;; Only transferring x tokens to this contract
                        (begin 
                            ;; Transfer x-amount-added tokens from tx-sender to this contract
                            (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                        )
                    )
                    ;; Transfer both x & y tokens to this contract
                    (begin
                        ;; Transfer x-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                        
                        ;; Transfer y-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y-escrow"))
                    )
                )   
                (if (or (is-eq x-amount-added u0) (is-eq y-amount-added u0))
                    ;; Check which is non-zero
                    (if (is-eq x-amount-added u0)
                        ;; Only transferring y tokens to this contract
                        (begin 
                            ;; Transfer y-amount-added tokens from tx-sender to this contract
                            (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y"))                
                            ;; Transfer y-fees tokens from tx-sender to protocol-address
                            (unwrap! (contract-call? y-token transfer y-fee liquidity-provider protocol-address none) (err "err-transferring-token-y-protocol"))
                        )
                        ;; Only transferring x tokens to this contract
                        (begin 
                            ;; Transfer x-amount-added tokens from tx-sender to this contract
                            (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                            ;; Transfer x-fees tokens from tx-sender to protocol-address
                            (unwrap! (contract-call? x-token transfer x-fee liquidity-provider protocol-address none) (err "err-transferring-token-x-protocol"))
                        )
                    )
                    ;; Transfer both x & y tokens to this contract
                    (begin
                        ;; Transfer x-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? x-token transfer x-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-x-escrow"))
                        ;; Transfer x-fees tokens from tx-sender to protocol-address
                        (unwrap! (contract-call? x-token transfer x-fee liquidity-provider protocol-address none) (err "err-transferring-token-x-protocol"))
                        ;; Transfer y-amount-added tokens from tx-sender to this contract
                        (unwrap! (contract-call? y-token transfer y-amount-added-updated liquidity-provider (as-contract tx-sender) none) (err "err-transferring-token-y-escrow"))
                        ;; Transfer y-fees tokens from tx-sender to protocol-address
                        (unwrap! (contract-call? y-token transfer y-fee liquidity-provider protocol-address none) (err "err-transferring-token-y-protocol"))
                    )
                )
            )
        )

        ;; Mint LP tokens to tx-sender
        (unwrap! (as-contract (contract-call? lp-token mint liquidity-provider (/ (* current-total-shares (- d2 d0)) d0))) (err "err-minting-lp-tokens"))

        ;; Update all appropriate maps
        ;; Update PairsDataMap
        (ok (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} 
            (merge 
                current-pair 
                {
                    balance-x: new-balance-x-post-fee,
                    balance-y: new-balance-y-post-fee,
                    total-shares: (+ current-total-shares (/ (* current-total-shares (- d2 d0)) d0)),
                    d: d2
                }
            ))
        )
    )
)

;; Withdraw Liquidity
;; @desc: Withdraws liquidity from both pairs & burns the appropriate amount of LP tokens
;; @params: x-token: principal, y-token: principal, lp-token: principal, lp-amount: uint, min-x-amount: uint, min-y-amount: uint
(define-public (withdraw-liquidity (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (lp-amount uint) (min-x-amount uint) (min-y-amount uint))
    (let 
        (
            ;; Grabbing all data from PairsDataMap
            (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-approval (get approval current-pair))
            (current-balance-x (get balance-x current-pair))
            (current-balance-y (get balance-y current-pair))
            (current-total-shares (get total-shares current-pair))
            (current-amplification-coefficient (get amplification-coefficient current-pair))
            (withdrawal-balance-x (/ (* current-balance-x lp-amount) current-total-shares))
            (withdrawal-balance-y (/ (* current-balance-y lp-amount) current-total-shares))
            (new-balance-x (- current-balance-x withdrawal-balance-x))
            (new-balance-y (- current-balance-y withdrawal-balance-y))
            (liquidity-remover tx-sender)
            ;; get-D using the new-balance-x and new-balance-y
            (new-d (get-D new-balance-x new-balance-y current-amplification-coefficient))
        )

        ;; Assert that withdrawal-balance-x is greater than min-x-amount
        (asserts! (> withdrawal-balance-x min-x-amount) (err "err-withdrawal-balance-x-less-than-min-x-amount"))

        ;; Assert that withdrawal-balance-y is greater than min-y-amount
        (asserts! (> withdrawal-balance-y min-y-amount) (err "err-withdrawal-balance-y-less-than-min-y-amount"))

        ;; Burn LP tokens from tx-sender
        (unwrap! (contract-call? lp-token burn liquidity-remover lp-amount) (err "err-burning-lp-tokens"))

        ;; Transfer withdrawal-balance-x tokens from this contract to liquidity-taker
        (unwrap! (as-contract (contract-call? x-token transfer withdrawal-balance-x tx-sender liquidity-remover none)) (err "err-transferring-token-x"))

        ;; Transfer withdrawal-balance-y tokens from this contract to liquidity-taker
        (unwrap! (as-contract (contract-call? y-token transfer withdrawal-balance-y tx-sender liquidity-remover none)) (err "err-transferring-token-y"))

        ;; Update all appropriate maps
        ;; Update PairsDataMap
        (ok (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} (merge 
            current-pair 
            {
                balance-x: new-balance-x,
                balance-y: new-balance-y,
                total-shares: (- current-total-shares lp-amount),
                d: new-d
            }
        )))
    )
)


;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;
;;; AMM Functions ;;;
;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;

;; D for loop
;; Get D
(define-read-only (get-D (x-bal uint) (y-bal uint) (ann uint))
    (get converged (fold D-for-loop index-list {D: (+ x-bal y-bal), x-bal: x-bal, y-bal: y-bal, ann: ann, converged: u0}))
)

;; Get D Helper
(define-private (D-for-loop (n uint) (D-info {D: uint, x-bal: uint, y-bal: uint, ann: uint, converged: uint})) 
    (let 
        (
            ;; Grabbing everything from D-info
            (current-D-partial (get D D-info))
            (current-D (get D D-info))
            (current-x-bal (get x-bal D-info))
            (current-y-bal (get y-bal D-info))
            (current-S (+ current-x-bal current-y-bal))
            (current-ann (get ann D-info))
            (current-converged (get converged D-info))

            ;; Start logic for calculating new D
            ;; Calculate new partial D with respect to x
            (new-D-partial-x (/ (* current-D current-D-partial) (* u2 current-x-bal)))
            ;; Calculate new partial D with respect to now x & y
            (new-D-partial (/ (* current-D new-D-partial-x ) (* u2 current-y-bal)))

            (new-numerator (* (+ (* current-ann current-S) (* number-of-tokens new-D-partial)) current-D))
            (new-denominator (+ (* (- current-ann u1) current-D) (* (+ number-of-tokens u1 ) new-D-partial)))

            (new-D (/ new-numerator new-denominator))
            
        )
        
        ;; Check if converged value / new D was already found
        (if (is-eq current-converged u0)
            (if (> new-D  current-D)
                (if (<= (- new-D current-D) test-constant)
                    {D: new-D, x-bal: current-x-bal, y-bal: current-y-bal, ann: current-ann, converged: new-D}
                    {D: new-D, x-bal: current-x-bal, y-bal: current-y-bal, ann: current-ann, converged: u0}
                )
                (if (<= (- current-D new-D) test-constant)
                    {D: new-D, x-bal: current-x-bal, y-bal: current-y-bal, ann: current-ann, converged: new-D}
                    {D: new-D, x-bal: current-x-bal, y-bal: current-y-bal, ann: current-ann, converged: u0}
                )
            )
            D-info
        )
    
    )
)

;; Scale up the token amounts to the same level of precision before performing AMM calculations
;; @params: x-token: principal, y-token: principal, lp-token: principal, x-amount-unscaled, y-amount-unscaled
(define-private (get-scaled-up-token-amounts (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (x-amount-unscaled uint) (y-amount-unscaled uint))
    (let 
        (
            ;; (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            ;; (x-num-decimals (get x-decimals current-pair))
            ;; (y-num-decimals (get y-decimals current-pair))
            (x-num-decimals (unwrap! (contract-call? x-token get-decimals) (err "err-getting-x-decimals")))
            (y-num-decimals (unwrap! (contract-call? y-token get-decimals) (err "err-getting-y-decimals")))
            (scaled-x 
                ;; if same number of decimals, set to x-amount-unscaled
                (if (is-eq x-num-decimals y-num-decimals)
                    x-amount-unscaled
                    ;; if x has more decimals, set to x-amount-unscaled; otherwise scale up by the difference in decimals
                    (if (> x-num-decimals y-num-decimals) x-amount-unscaled (* x-amount-unscaled (pow u10 (- y-num-decimals x-num-decimals))))
                )
            )
            (scaled-y 
                ;; if same number of decimals, set to y-amount-unscaled
                (if (is-eq x-num-decimals y-num-decimals)
                    y-amount-unscaled
                    ;; if y has more decimals, set to y-amount-unscaled; otherwise scale up by the difference in decimals
                    (if (> y-num-decimals x-num-decimals) y-amount-unscaled (* y-amount-unscaled (pow u10 (- x-num-decimals y-num-decimals))))
                )
            )
        )
        (ok {scaled-x: scaled-x, scaled-y: scaled-y})
    )
)

;; Scale down the token amounts to their respective levels of precision before performing any transfers
;; @params: x-token: principal, y-token: principal, lp-token: principal, x-amount-unscaled, y-amount-unscaled
(define-private (get-scaled-down-token-amounts (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (x-amount-scaled uint) (y-amount-scaled uint))
    (let 
        (
            ;; (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            ;; (x-num-decimals (get x-decimals current-pair))
            ;; (y-num-decimals (get y-decimals current-pair))
            (x-num-decimals (unwrap! (contract-call? x-token get-decimals) (err "err-getting-x-decimals")))
            (y-num-decimals (unwrap! (contract-call? y-token get-decimals) (err "err-getting-y-decimals")))
        
            (scaled-x 
                ;; if same number of decimals, set to x-amount-scaled
                (if (is-eq x-num-decimals y-num-decimals)
                    x-amount-scaled
                    ;; if x has more decimals, set to x-amount-scaled; otherwise scale down by the difference in decimals
                    (if (> x-num-decimals y-num-decimals) x-amount-scaled (/ x-amount-scaled (pow u10 (- y-num-decimals x-num-decimals))))
                )
            )
            (scaled-y 
                ;; if same number of decimals, set to y-amount-scaled
                (if (is-eq x-num-decimals y-num-decimals)
                    y-amount-scaled
                    ;; if y has more decimals, set to y-amount-scaled; otherwise scale down by the difference in decimals
                    (if (> y-num-decimals x-num-decimals) y-amount-scaled (/ y-amount-scaled (pow u10 (- x-num-decimals y-num-decimals))))
                )
            )
        )
        (ok {scaled-x: scaled-x, scaled-y: scaled-y})
    )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Goverance Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create Pair
;; @desc: Creates a new pair for trading
;; @params: x-token: principal, y-token: principal, lp-token: principal, amplification-coefficient: uint, pair-name: string, x-balance: uint, y-balance: uint
;; initial-balance param is for TOTAL balance of x + y tokens (aka 2x or 2y or (x + y))
(define-public (create-pair (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (amplification-coefficient uint) (pair-name (string-ascii 32)) (initial-x-bal uint) (initial-y-bal uint))
    (let 
        (
            (lp-owner tx-sender)
        )

        ;; Assert that tx-sender is an admin using is-some & index-of with the admins var
        (asserts! (is-some (index-of (var-get admins) tx-sender )) (err "err-not-admin"))

        ;; Assert using and that the pair does not already exist using is-none & map-get?
        (asserts! (and 
            (is-none (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}))
            (is-none (map-get? PairsDataMap {x-token: (contract-of y-token), y-token: (contract-of x-token), lp-token: (contract-of lp-token)}))
        )  (err "err-pair-xy-or-yx-exists"))

        ;; Assert that both initial balances are greater than 0
        (asserts! (or (> initial-x-bal u0) (> initial-y-bal u0)) (err "err-initial-bal-zero"))

        ;; Assert that x & y tokens are the same
        (asserts! (is-eq initial-x-bal initial-y-bal) (err "err-initial-bal-odd"))

        ;; Mint LP tokens to tx-sender
        (unwrap! (as-contract (contract-call? .usda-susdt-lp-token mint lp-owner (+ initial-x-bal initial-y-bal))) (err "err-minting-lp-tokens"))

        ;; Transfer token x liquidity to this contract
        (unwrap! (contract-call? x-token transfer initial-x-bal tx-sender (as-contract tx-sender) none) (err "err-transferring-token-x"))

        ;; Transfer token y liquidity to this contract
        (unwrap! (contract-call? y-token transfer initial-y-bal tx-sender (as-contract tx-sender) none) (err "err-transferring-token-y"))

        ;; Update all appropriate maps
        (ok (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} {
            approval: true,
            total-shares: (+ initial-x-bal initial-y-bal),
            x-decimals: (unwrap! (contract-call? x-token get-decimals) (err "err-getting-x-decimals")),
            y-decimals: (unwrap! (contract-call? y-token get-decimals) (err "err-getting-y-decimals")),
            balance-x: initial-x-bal,
            balance-y: initial-y-bal,
            d: (+ initial-x-bal initial-y-bal),
            amplification-coefficient: amplification-coefficient,
        }))
    )
)


;; Setting Pair Approval
;; @desc: Sets the approval of a pair
;; @params: x-token: principal, y-token: principal, lp-token: principal, approval: bool
(define-public (set-pair-approval (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (approval bool))
    (let 
        (
            (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
        )

        ;; Assert that tx-sender is an admin using is-some & index-of with the admins var
        (asserts! (is-some (index-of (var-get admins) tx-sender)) (err "err-not-admin"))

        ;; Update all appropriate maps
        (ok (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} (merge 
            current-pair
            {
                approval: approval
            }
        )))
    )
)

;; Add Admin
;; @desc: Adds an admin to the admins var list
;; @params: admin: principal
(define-public (add-admin (admin principal))
    (let 
        (
            (current-admins (var-get admins))
            ;;(new-admins (unwrap! (as-max-len? (append current-admins admin) u5) ("err-add-admin-overflow")))
        )

        ;; Assert that tx-sender is an admin using is-some & index-of with the admins var
        (asserts! (is-some (index-of current-admins tx-sender)) (err "err-not-admin"))

        ;; Assert that admin is not already an admin using is-none & index-of with the admins var
        (asserts! (is-none (index-of current-admins admin)) (err "err-already-admin"))

        ;; Update all appropriate maps
        (ok (var-set admins (unwrap! (as-max-len? (append current-admins admin) u5) (err "err-admin-overflow"))))
    )
)

;; Remove Admin
;; Change Swap Fee
;; Change Liquidity Fee

;; Admins can change the amplification coefficient in PairsDataMap
;; @params: x-token: principal, y-token: principal, lp-token: principal, amplification-coefficient: uint
(define-public (change-amplification-coefficient (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (amplification-coefficient uint))
    (let 
        (
            (current-pair (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (current-admins (var-get admins))
        )

        ;; Assert that tx-sender is an admin using is-some & index-of with the admins var
        (asserts! (is-some (index-of current-admins tx-sender)) (err "err-not-admin"))

        ;; Update all appropriate maps
        (ok (map-set PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)} (merge 
            current-pair
            {
                amplification-coefficient: amplification-coefficient
            }
        )))
    )
)