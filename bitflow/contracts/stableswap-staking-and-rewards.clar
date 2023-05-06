;; Bitflow Staking & Rewards
;; This contract handles the core logic for staking & rewards, it's where fees are collected and distributed

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

;; Reward cycle index for looping when claiming rewards
(define-constant reward-cycle-index (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120))

;;;;;;;;;;;;;;;
;; Variables ;;
;;;;;;;;;;;;;;;

;; Total lp tokens staked
(define-data-var total-lp-tokens-staked uint u0)

;; Helper uint for filtering out null values & mapping from index to next cycle
(define-data-var helper-uint uint u0)

;; Helper uint list for filtering out existing cycles in cycles-staked list
(define-data-var helper-uint-list (list 12000 uint) (list ))


;;;;;;;;;;
;; Maps ;;
;;;;;;;;;;

;; Map that tracks all staking data for a given principal
(define-map StakerDataMap {x-token: principal, y-token: principal, lp-token: principal, user: principal} {
    cycles-staked: (list 12000 uint),
    total-currently-staked: uint
})

;; Map that tracks staking data per cycle for a given principal
(define-map StakerDataPerCycleMap {x-token: principal, y-token: principal, lp-token: principal, user: principal, cycle: uint} {
    lp-token-staked: uint,
    reward-claimed: uint,
    lp-token-to-unstake: uint
})



;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Read-Only Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get user data
(define-read-only (get-user-data (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (user principal)) 
    (map-get? StakerDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: user})
)

;; Get user data at cycle
(define-read-only (get-user-data-at-cycle (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (user principal) (cycle uint)) 
    (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: user, cycle: cycle})
)

;; Get cycle rewards
(define-read-only (get-cycle-rewards (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (cycle uint)) 
    (let 
        (
            (pair-data (unwrap! (contract-call? .stableswap get-pair-data x-token y-token lp-token) (err "err-no-pair-data")))
            (cycle-data (unwrap! (contract-call? .stableswap get-cycle-data x-token y-token lp-token cycle) (err "err-no-cycle-data")))
            (balance-x-fee (get cycle-fee-balance-x cycle-data))
            (balance-y-fee (get cycle-fee-balance-y cycle-data))
            (user-data (unwrap! (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: cycle}) (err "err-no-user-data")))
            (total-lpt-staked (var-get total-lp-tokens-staked))
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
        })
    )
)



;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;; Stake Function ;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

;; Stake LP Tokens
;; @desc: This function allows users to stake LP tokens for X cycles to earn rewards
;; @param: x-token - The X token contract, y-token - The Y token contract, lp-token - The LP token contract, cycles - The number of cycles to stake for, lp-token-amount - The amount of LP tokens to stake
;; minimal amount to stake?
;; require amount by divisible by cycle length? or fine dumping remainder into last cycle?
;; likely a less expensive way to deal with vars passed down to loops*
(define-public (stake-lp-tokens (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (cycles uint) (amount uint))
    (let 
        (
            (current-staker-data (map-get? StakerDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}))
            (current-cycles-staked (default-to (list ) (get cycles-staked current-staker-data)))
            (updated-helper-uint-to-filter (var-set helper-uint cycles))
            (filtered-null-list (filter filter-null-value reward-cycle-index))
            (current-cycle (contract-call? .stableswap get-current-cycle))
            (updated-helper-uint-to-map (var-set helper-uint current-cycle))
            (next-cycles (map map-filtered-null-list filtered-null-list))
            (updated-helper-uint-list (var-set helper-uint-list current-cycles-staked))
            (next-cycles-not-in-current-cycles (filter filter-cycles-staked next-cycles))
        )

        ;; Assert that cycles is less than 121
        (asserts! (< cycles u121) (err "err-cycles-too-high"))

        ;; Assert that cycles is greater than 0
        (asserts! (> cycles u0) (err "err-cycles-too-low"))

        ;; Assert that amount is greater than 0
        (asserts! (> amount u0) (err "err-amount-too-low"))

        ;; Transfer LP tokens from user to contract
        (unwrap! (contract-call? lp-token transfer amount tx-sender (as-contract tx-sender) none) (err "err-lp-token-transfer-failed"))

        ;; Update total-lp-tokens-staked
        (fold update-staker-data-per-cycle-fold next-cycles {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycles-staked: current-cycles-staked, amount: amount})

        ;; Update staker data
        ;; Update StakerDataMap
        (if (is-some current-staker-data)
            ;; Staker already exists, update cycles-staked list
            (map-set StakerDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender} {
                cycles-staked: (unwrap! (as-max-len? (concat current-cycles-staked next-cycles-not-in-current-cycles) u12000) (err "err-cycles-staked-overflow")),
                total-currently-staked: (+ amount (default-to u0 (get total-currently-staked current-staker-data)))
            })
            ;; Staker doesn't exist, create new staker
            (map-set StakerDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender} {
                cycles-staked: next-cycles,
                total-currently-staked: amount
            })
        )

        ;; Update unstakeable lp-token StakerDataMap
        (ok (if (is-some (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: (+ (+ u1 current-cycle) cycles)}))
            ;; Staker already exists, only update lp-token-to-unstake
            (map-set StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: (+ (+ u1 current-cycle) cycles)} (merge 
                (default-to { lp-token-staked: u0, reward-claimed: u0, lp-token-to-unstake: u0} (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: (+ (+ u1 current-cycle) cycles)}))
                {lp-token-to-unstake: (+ amount (default-to u0 (get lp-token-to-unstake (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: (+ (+ u1 current-cycle) cycles)}))))}
            ))
            ;; Staker doesn't exist, create new entry
            (map-set StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: (+ (+ u1 current-cycle) cycles)} { 
                lp-token-staked: u0, 
                reward-claimed: u0, 
                lp-token-to-unstake: u0
            })
        ))

    )
)

;; Helper filter function to filter out null values lower than helper-uint var
(define-private (filter-null-value (value uint)) 
    (if (< value (var-get helper-uint)) 
        true
        false
    )
)

;; Helper map function to map from a filtered index list to a map of next cycles
(define-private (map-filtered-null-list (index uint)) 
    (+ (var-get helper-uint) index)
)

;; Helper filter function to filter out cycles already in cycles-staked list
(define-private (filter-cycles-staked (value uint)) 
    (if (is-some (index-of (var-get helper-uint-list) value))
        false
        true
    )
)

;; Helper function to update StakerDataPerCycleMap
(define-private (update-staker-data-per-cycle-fold (next-cycle uint) (static-user-and-cycle-data {x-token: principal, y-token: principal, lp-token: principal, cycles-staked: (list 12000 uint), amount: uint}))
    (let 
        (
            (x-token-static (get x-token static-user-and-cycle-data))
            (y-token-static (get y-token static-user-and-cycle-data))
            (lp-token-static (get lp-token static-user-and-cycle-data))
            (cycles-staked-static (get cycles-staked static-user-and-cycle-data))
            (amount-static (get amount static-user-and-cycle-data))
            (current-cycle-user-data (default-to {lp-token-staked: u0, reward-claimed: u0, lp-token-to-unstake: u0} (map-get? StakerDataPerCycleMap {x-token: x-token-static, y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle})))
            (current-cycle-lp-token-staked (get lp-token-staked current-cycle-user-data))
            (current-cycle-lp-token-to-unstake (get lp-token-to-unstake current-cycle-user-data))
            (current-cycle-reward-claimed (get reward-claimed current-cycle-user-data))
        )
        ;; Check if staker is already staked in this cycle
        (if (is-some (index-of cycles-staked-static next-cycle))
            ;; Staker is already staked in this cycle, update StakerDataPerCycleMap
            (map-set StakerDataPerCycleMap {x-token: x-token-static, y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle} (merge 
                    current-cycle-user-data
                    {lp-token-staked: (+ amount-static current-cycle-lp-token-staked)}
            ))
            ;; Staker is not already staked in this cycle, create new StakerDataPerCycleMap
            (map-set StakerDataPerCycleMap {x-token: x-token-static, y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle} {
                lp-token-staked: amount-static,
                reward-claimed: u0,
                lp-token-to-unstake: u0
            })
        )
        static-user-and-cycle-data
    )
)



;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;; Unstake Function ;;;
;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Stake LP Tokens