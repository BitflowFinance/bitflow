;; Stableswap Core Contract
;; This contract handles the core logic of the Stableswap protocol.
;; The initial trading pair is sUSDT/USDA

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Cons, Vars, & Maps ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

;;;;;;;;;;;;;;;
;; Constants ;;
;;;;;;;;;;;;;;;

;; This contract address
(define-constant this-contract (as-contract tx-sender))

;; Fee escrow contract address
(define-constant fee-escrow-contract .stableswap-fee-escrow)

;; Deployment height
(define-constant deployment-height block-height)

;; Cycle length in blocks (1 day = 144 blocks)
(define-constant cycle-length u144)

;; Reward cycle index for looping when claiming rewards
(define-constant reward-cycle-index (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120))

;; Number of tokens per pair
(define-constant number-of-tokens u2)


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


;;;;;;;;;;
;; Maps ;;
;;;;;;;;;;

(define-map PairsDataMap {x-token: principal, y-token: principal, lp-token: principal} {
    approval: bool,
    total-shares: uint,
    balance-x: uint,
    balance-y: uint,
    fee-balance-x: uint,
    fee-balance-y: uint,
    d: uint,
    amplification-coefficient: uint,
})

(define-map CycleDataMap {x-token: principal, y-token: principal, lp-token: principal, cycle-num: uint} {
    cycle-fee-balance-x: uint,
    cycle-fee-balance-y: uint,
    total-lp-token-staked: uint
})

(define-map UserDataMap {x-token: principal, y-token: principal, lp-token: principal, user: principal} {
    lp-token-staked: uint,
    reward-claimed: uint,
    lp-token-to-unstake: uint
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

;; Get user data
(define-read-only (get-user-data (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (user principal)) 
    (map-get? UserDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: user})
)

;; Get current cycle
(define-read-only (get-current-cycle) 
    (/ (- block-height deployment-height) cycle-length)
)

;; Get deployment height
(define-read-only (get-deployment-height) 
    deployment-height
)

;; Get any cycle rewards; maybe -and-claimable-lpt 
(define-read-only (get-cycle-rewards (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (cycle uint)) 
    (let 
        (
            (pair-data (unwrap! (map-get? PairsDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-pair-data")))
            (cycle-data (unwrap! (map-get? CycleDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle-num: cycle}) (err "err-no-cycle-data")))
            (balance-x-fee (get cycle-fee-balance-x cycle-data))
            (balance-y-fee (get cycle-fee-balance-y cycle-data))
            (user-data (unwrap! (map-get? UserDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}) (err "err-no-user-data")))
            (total-lpt-staked (get total-lp-token-staked cycle-data))
            (user-lpt-staked (get lp-token-staked user-data))
            (user-liquidity-pct 
                (if (> total-lpt-staked u0) 
                    (/ (* u1000 user-lpt-staked) total-lpt-staked)
                    u0
                )     
            )
            (user-x-rewards (/ (* user-liquidity-pct balance-x-fee) u1000))
            (user-y-rewards (/ (* user-liquidity-pct balance-y-fee) u1000))
        )

        (ok {
            x-token-reward: user-x-rewards,
            y-token-reward: user-y-rewards,
            ;; might not need below
            ;; claimable-lpt: (get lp-token-to-unstake user-data)
        })
    )
)

;; Get up to last 120 cycle rewards -> nice to have
;; (define-read-only (get-cycle-rewards) body)

;; Get DY


;; Get DX

;; Get D
(define-read-only (D-for-loop (n uint) (D-info {D: uint, x-bal: uint, y-bal: uint, ann: uint})) 
    (let 
        (
            ;; Grabbing everything from D-info
            (current-D-partial (get D D-info))
            (current-D (get D D-info))
            (current-x-bal (get x-bal D-info))
            (current-y-bal (get y-bal D-info))
            (current-S (+ current-x-bal current-y-bal))
            (current-ann (get ann D-info))

            ;; Start logic for calculating new D
            ;; Calculate new partial D with respect to x
            (new-D-partial-x (/ (* current-D current-D-partial) (* u2 current-x-bal)))
            ;; Calculate new partial D with respect to now x & y
            (new-D-partial (/ (* current-D new-D-partial-x ) (* u2 current-y-bal)))

            (new-numerator (* (+ (* current-ann current-S) (* number-of-tokens new-D-partial)) current-D))
            
        )
        true
    )
)

;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;; Swap Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

;; Swap X -> Y
;; Swap Y -> X

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Liquidity Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Add Liquidity
;; Withdraw Liquidity


;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;; Stake Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Stake LP Tokens
;; Unstake LP Tokens


;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;; Reward Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Claim Rewards / Many


;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;
;;; AMM Functions ;;;
;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;

;; D for loop

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Goverance Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create Pair
;; Setting Pair Approval
;; Set A
;; Add Admin
;; Remove Admin
;; Change Swap Fee
;; Change Liquidity Fee