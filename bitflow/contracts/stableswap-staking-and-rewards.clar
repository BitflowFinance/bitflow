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

;;;;;;;;;;;;;;;
;; Variables ;;
;;;;;;;;;;;;;;;

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

;; Get cycle rewards
(define-read-only (get-cycle-rewards (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <lp-trait>) (cycle uint)) 
    (let 
        (
            (pair-data (unwrap! (contract-call? .stableswap get-pair-data x-token y-token lp-token) (err "err-no-pair-data")))
            (cycle-data (unwrap! (contract-call? .stableswap get-cycle-data x-token y-token lp-token cycle) (err "err-no-cycle-data")))
            (balance-x-fee (get cycle-fee-balance-x cycle-data))
            (balance-y-fee (get cycle-fee-balance-y cycle-data))
            (user-data (unwrap! (map-get? StakerDataPerCycleMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: cycle}) (err "err-no-user-data")))
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
        })
    )
)


;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;; Stake Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Stake LP Tokens
;; @desc: This function allows users to stake LP tokens for X cycles to earn rewards
;; @param: x-token - The X token contract, y-token - The Y token contract, lp-token - The LP token contract, cycles - The number of cycles to stake for, lp-token-amount - The amount of LP tokens to stake
;; minimal amount to stake?
;; require amount by divisible by cycle length? or fine dumping remainder into last cycle?
(define-public (stake-lp-tokens (x-token <sip-010-trait>) (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (cycles uint) (amount uint)) 
    (let 
        (
            (current-staker-data (map-get? StakerDataMap {x-token: (contract-of x-token), y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}))
        )
        (ok true)
    )
)

;; Stake Helper Tokens