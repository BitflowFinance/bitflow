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


;; Helper uint for filtering out null values & mapping from index to next cycle
(define-data-var helper-uint uint u0)

;; Helper uint list for filtering out existing cycles in cycles-staked list
(define-data-var helper-uint-list (list 12000 uint) (list ))


;;;;;;;;;;
;; Maps ;;
;;;;;;;;;;

;; Map that tracks all staking data for a given principal
(define-map StakerDataMap {y-token: principal, lp-token: principal, user: principal} {
    cycles-staked: (list 12000 uint),
    cycles-to-unstake: (list 12000 uint),
    total-currently-staked: uint
})

;; Map that tracks staking data per cycle for a given principal
(define-map StakerDataPerCycleMap {y-token: principal, lp-token: principal, user: principal, cycle: uint} {
    lp-token-staked: uint,
    reward-claimed: bool,
    lp-token-to-unstake: uint
})

;; Map that tracks staking data per cycle for all stakers
(define-map DataPerCycleMap {y-token: principal, lp-token: principal, cycle: uint} uint)

;; Map that tracks the total LP tokens currently staked by everyone for a given pair
(define-map TotalStakedPerPairMap {y-token: principal, lp-token: principal} {total-staked: uint})


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Read-Only Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Get user data
(define-read-only (get-user-data (y-token <sip-010-trait>) (lp-token <lp-trait>) (user principal)) 
    (map-get? StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: user})
)

;; Get user data at cycle
(define-read-only (get-user-data-at-cycle (y-token <sip-010-trait>) (lp-token <lp-trait>) (user principal) (cycle uint)) 
    (map-get? StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: user, cycle: cycle})
)

;; Get user data at cycle
(define-read-only (get-data-at-cycle (y-token <sip-010-trait>) (lp-token <lp-trait>) (cycle uint)) 
    (map-get? DataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle: cycle})
)

;; Get total LP tokens staked for a given pair
(define-read-only (get-total-staked (y-token <sip-010-trait>) (lp-token <lp-trait>)) 
    (map-get? TotalStakedPerPairMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token)})
)

;; Claim staking rewards per cycle
(define-read-only (get-staking-rewards-at-cycle (y-token principal) (lp-token principal) (cycle uint))
    (let 
        (
            (param-cycle-user-data (unwrap! (map-get? StakerDataPerCycleMap {y-token: y-token, lp-token: lp-token, user: tx-sender, cycle: cycle}) (err u4)))
            (param-cycle-reward-claimed (get reward-claimed param-cycle-user-data))
            (param-cycle-user-lp-staked (get lp-token-staked param-cycle-user-data))
            (param-cycle-total-lp-staked (unwrap! (map-get? DataPerCycleMap {y-token: y-token, lp-token: lp-token, cycle: cycle}) (err u5)))
            (param-cycle-fees (unwrap! (contract-call? .stableswap-stackingDAO get-cycle-data y-token lp-token cycle) (err u0)))
            (param-cycle-balance-x-fee (get cycle-fee-balance-x param-cycle-fees))
            (param-cycle-x-rewards (/ (* param-cycle-balance-x-fee param-cycle-user-lp-staked) param-cycle-total-lp-staked))
            (claimer tx-sender)
        )

        ;; Assert that param-cycle-x rewards are greater than 0
        (asserts! (> param-cycle-x-rewards u0) (err u1))

        ;; Assert that param-cycle-reward-claimed is false
        (asserts! (not param-cycle-reward-claimed) (err u2))

        (ok {x-token-reward: param-cycle-x-rewards})
    )
)



;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;
;;; Stake Function ;;;
;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;

;; Stake LP Tokens
;; @desc: This function allows users to stake LP tokens for X cycles to earn rewards
;; @param: y-token - The Y token contract, lp-token - The LP token contract, cycles - The number of cycles to stake for, lp-token-amount - The amount of LP tokens to stake
(define-public (stake-lp-tokens (y-token <sip-010-trait>) (lp-token <sip-010-trait>) (cycles uint) (amount uint))
    (let 
        (
            (current-staker-data (map-get? StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}))
            (current-cycles-staked (default-to (list ) (get cycles-staked current-staker-data)))
            (current-cycles-to-unstake (default-to (list ) (get cycles-to-unstake current-staker-data)))
            (updated-helper-uint-to-filter (var-set helper-uint cycles))
            (filtered-null-list (filter filter-null-value reward-cycle-index))
            (current-cycle (contract-call? .stableswap-stackingDAO get-current-cycle))
            (updated-helper-uint-to-map (var-set helper-uint current-cycle))
            (next-cycles (map map-filtered-null-list filtered-null-list))
            (updated-helper-uint-list-current-cycles (var-set helper-uint-list current-cycles-staked))
            (next-cycles-not-in-current-cycles (filter filter-list next-cycles))
            (unstake-cycle (+ u1 (+ current-cycle cycles)))
            (is-unstakeable-block-in-unstakeable-cycles (is-some (index-of current-cycles-to-unstake unstake-cycle)))
            (current-all-staker-data (map-get? DataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycle: current-cycle}))
            (pair-data (unwrap! (contract-call? .stableswap-stackingDAO get-pair-data y-token lp-token) (err "err-no-pair-data")))
            (total-currently-staked-data (default-to {total-staked: u0} (map-get? TotalStakedPerPairMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token)})))
            (total-currently-staked-in-contract (get total-staked total-currently-staked-data))
            (approved-pair (get approval pair-data))
        )

        ;; Assert that pair is approved
        (asserts! approved-pair (err "err-pair-not-approved"))

        ;; Assert that cycles is less than 121
        (asserts! (< cycles u121) (err "err-cycles-too-high"))

        ;; Assert that cycles is greater than 0
        (asserts! (> cycles u0) (err "err-cycles-too-low"))

        ;; Assert that amount is greater than 0
        (asserts! (> amount u0) (err "err-amount-too-low"))

        ;; Transfer LP tokens from user to contract
        (unwrap! (contract-call? lp-token transfer amount tx-sender (as-contract tx-sender) none) (err "err-lp-token-transfer-failed"))

        ;; Update lp-tokens-staked in the appropriate cycles
        (fold update-staker-data-per-cycle-fold next-cycles {y-token: (contract-of y-token), lp-token: (contract-of lp-token), cycles-staked: current-cycles-staked, amount: amount})

        ;; Updating the total balance of LP tokens staked in this contract
        (map-set TotalStakedPerPairMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token)} {total-staked: (+ total-currently-staked-in-contract amount)})

        ;; Update StakerDataMap
        (if (is-some current-staker-data)
            ;; Staker already exists, update cycles-staked list
            (map-set StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender} {
                cycles-staked: (unwrap! (as-max-len? (concat current-cycles-staked next-cycles-not-in-current-cycles) u12000) (err "err-cycles-staked-overflow")),
                cycles-to-unstake: (if is-unstakeable-block-in-unstakeable-cycles 
                    ;; Unstakeable cycle already exists, don't update cycles-to-unstake list
                    current-cycles-to-unstake
                    ;; Unstakeable cycle doesn't exist, update cycles-to-unstake list
                    (unwrap! (as-max-len? (concat current-cycles-to-unstake (list unstake-cycle)) u12000) (err "err-cycles-to-unstake-overflow"))
                ),
                total-currently-staked: (+ amount (default-to u0 (get total-currently-staked current-staker-data)))
            })
            ;; Staker doesn't exist, create new staker
            (map-set StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender} {
                cycles-staked: next-cycles,
                cycles-to-unstake: (list unstake-cycle),
                total-currently-staked: amount
            })
        )

        ;; Update unstakeable lp-token StakerDataMap
        (ok (if (is-some (map-get? StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: unstake-cycle}))
            ;; Staker already exists, only update lp-token-to-unstake
            (map-set StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: unstake-cycle} (merge 
                (default-to { lp-token-staked: u0, reward-claimed: false, lp-token-to-unstake: u0} (map-get? StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: unstake-cycle}))
                {lp-token-to-unstake: (+ amount (default-to u0 (get lp-token-to-unstake (map-get? StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: unstake-cycle}))))}
            ))
            ;; Staker doesn't exist, create new entry
            (map-set StakerDataPerCycleMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender, cycle: unstake-cycle} { 
                lp-token-staked: u0, 
                reward-claimed: false, 
                lp-token-to-unstake: amount
            })
        ))

    )
)

;; Helper filter function to filter out null values lower than helper-uint var
(define-private (filter-null-value (value uint)) 
    (if (<= value (var-get helper-uint)) 
        true
        false
    )
)

;; Helper map function to map from a filtered index list to a map of next cycles
(define-private (map-filtered-null-list (index uint)) 
    (+ (var-get helper-uint) index)
)

;; Helper filter function to filter out cycles already in cycles-staked list
(define-private (filter-list (value uint)) 
    (if (is-some (index-of (var-get helper-uint-list) value))
        false
        true
    )
)

;; Helper filter function to filter out cycles where lp-tokens have already been unstaked
(define-private (filter-unstaked-cycle (value uint)) 
    (if (is-eq value (var-get helper-uint)) 
        false
        true
    )
)

;; Helper function to update StakerDataPerCycleMap
(define-private (update-staker-data-per-cycle-fold (next-cycle uint) (static-user-and-cycle-data {y-token: principal, lp-token: principal, cycles-staked: (list 12000 uint), amount: uint}))
    (let 
        (
            (y-token-static (get y-token static-user-and-cycle-data))
            (lp-token-static (get lp-token static-user-and-cycle-data))
            (cycles-staked-static (get cycles-staked static-user-and-cycle-data))
            (amount-static (get amount static-user-and-cycle-data))
            (current-cycle-user-data (default-to {lp-token-staked: u0, reward-claimed: false, lp-token-to-unstake: u0} (map-get? StakerDataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle})))
            (current-cycle-lp-token-staked (get lp-token-staked current-cycle-user-data))
            (current-cycle-lp-token-to-unstake (get lp-token-to-unstake current-cycle-user-data))
            (current-cycle-reward-claimed (get reward-claimed current-cycle-user-data))
            (current-all-staker-data (map-get? DataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, cycle: next-cycle}))
        )
        ;; Check if staker is already staked in this cycle
        (if (is-some (index-of cycles-staked-static next-cycle))
            ;; Staker is already staked in this cycle, update StakerDataPerCycleMap
            (map-set StakerDataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle} (merge 
                    current-cycle-user-data
                    {lp-token-staked: (+ amount-static current-cycle-lp-token-staked)}
            ))
            ;; Staker is not already staked in this cycle, create new StakerDataPerCycleMap
            (map-set StakerDataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, user: tx-sender, cycle: next-cycle} (merge 
                    current-cycle-user-data
            {
                lp-token-staked: amount-static,
                reward-claimed: false,
            }))
        )
        ;; Update DataPerCycleMap
        (if (is-some current-all-staker-data)
            ;; Cycle data already exists, update total-lp-token-staked
            (map-set DataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, cycle: next-cycle} (+ amount-static (default-to u0 current-all-staker-data)))
            ;; Staker doesn't exist, create new entry
            (map-set DataPerCycleMap {y-token: y-token-static, lp-token: lp-token-static, cycle: next-cycle} amount-static)
        )

        static-user-and-cycle-data
    )
)



;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;; Claim Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

;; Claim staking rewards per cycle
;; @desc: This function allows users to claim staking rewards for a given cycle
;; @param: y-token - The Y token contract, lp-token - The LP token contract, cycle - The cycle to claim rewards for
(define-public (claim-cycle-staking-rewards (y-token principal) (lp-token principal) (y-token-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (cycle uint))
    (let 
        (
            (current-cycle (contract-call? .stableswap-stackingDAO get-current-cycle))
            (param-cycle-user-data (unwrap! (map-get? StakerDataPerCycleMap {y-token: y-token, lp-token: lp-token, user: tx-sender, cycle: cycle}) (err "err-no-cycle-data")))
            (param-cycle-reward-claimed (get reward-claimed param-cycle-user-data))
            (param-cycle-user-lp-staked (get lp-token-staked param-cycle-user-data))
            (param-cycle-total-lp-staked (unwrap! (map-get? DataPerCycleMap {y-token: y-token, lp-token: lp-token, cycle: cycle}) (err "err-no-cycle-data")))
            (param-cycle-fees (unwrap! (contract-call? .stableswap-stackingDAO get-cycle-data y-token lp-token cycle) (err "err-no-cycle-data")))
            (param-cycle-balance-x-fee (get cycle-fee-balance-x param-cycle-fees))
            (param-cycle-x-rewards (/ (* param-cycle-balance-x-fee param-cycle-user-lp-staked) param-cycle-total-lp-staked))
            (claimer tx-sender)
        )

        ;; Assert that param-cycle-x rewards are greater than 0
        (asserts! (> param-cycle-x-rewards u0) (err "err-no-x-rewards-to-claim"))

        ;; Assert that param-cycle-reward-claimed is false
        (asserts! (not param-cycle-reward-claimed) (err "err-rewards-already-claimed"))

        ;; Assert that claiming from a previous cycle
        (asserts! (< cycle current-cycle) (err "err-cycle-too-high"))

        ;; Transfer the rewards from the contract to the claimer
        (unwrap! (as-contract (stx-transfer? param-cycle-x-rewards tx-sender claimer)) (err "err-x-token-transfer-failed"))

        ;; Update StakerDataPerCycleMap with reward-claimed = true
        (map-set StakerDataPerCycleMap {y-token: y-token, lp-token: lp-token, user: claimer, cycle: cycle} (merge 
            param-cycle-user-data
            {reward-claimed: true}
        ))

        ;; Return the number X tokens received after claiming staking rewards from a particular cycle
        (ok {x-token-reward: param-cycle-x-rewards})
    )
)

;; Claim all staking rewards
;; @desc: This function allows users to claim all staking rewards
;; @param: y-token - The Y token contract, lp-token - The LP token contract
(define-public (claim-all-staking-rewards (y-token <sip-010-trait>) (lp-token <sip-010-trait>))
    (let 
        (
            (current-cycle (contract-call? .stableswap-stackingDAO get-current-cycle))
            (current-cycle-helper (var-set helper-uint current-cycle))
            (current-staker-data (unwrap! (map-get? StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}) (err "err-no-staker-data")))
            (current-cycles-staked (get cycles-staked current-staker-data))
            (rewards-to-claim (fold fold-from-all-cycles-to-cycles-unclaimed current-cycles-staked {y-token: (contract-of y-token), lp-token: (contract-of lp-token), total-rewards-x: u0, current-cycle: current-cycle}))
            (rewards-to-claim-x (get total-rewards-x rewards-to-claim))
            (claimer tx-sender)
        )

        ;; Transfer rewards from the contract to the claimer
        (if (> rewards-to-claim-x u0)
            (unwrap! (as-contract (stx-transfer? rewards-to-claim-x tx-sender claimer)) (err "err-x-token-transfer-failed"))
            false
        )

        ;; Return the number X tokens received after claiming all staking rewards
        (ok {x-token-reward: rewards-to-claim-x})

    )
)

;; Helper function to map from all cycles staked to all cycles unclaimed
;; The below needs to be a fold, not a map, so that we don't have to transfer every iteration for rather at the end
(define-private (fold-from-all-cycles-to-cycles-unclaimed (cycle uint) (fold-data {y-token: principal, lp-token: principal, total-rewards-x: uint, current-cycle: uint})) 
    (let 
        (
            (static-current-cycle (get current-cycle fold-data))
            (static-y-token (get y-token fold-data))
            (static-lp-token (get lp-token fold-data))
            (current-total-rewards-x (get total-rewards-x fold-data))
            (param-cycle-staking-rewards (get-staking-rewards-at-cycle static-y-token static-lp-token cycle))
            (param-cycle-rewards-x (match param-cycle-staking-rewards 
                ok-branch
                    (get x-token-reward ok-branch)
                err-branch
                    u0
            ))
            ;; If the param-cycle is not in the past, then the rewards have to be zero.
            (param-cycle-x-rewards (if (>= cycle static-current-cycle) u0 param-cycle-rewards-x))

            (param-cycle-user-data (default-to {lp-token-staked: u0,reward-claimed: false, lp-token-to-unstake: u0} (map-get? StakerDataPerCycleMap {y-token: static-y-token, lp-token: static-lp-token, user: tx-sender, cycle: cycle})))
        )

        (if (> param-cycle-x-rewards u0)
            ;; There are rewards to claim
            (begin 
                ;; Update StakerDataPerCycleMap with reward-claimed = true
                (map-set StakerDataPerCycleMap {y-token: static-y-token, lp-token: static-lp-token, user: tx-sender, cycle: cycle} (merge 
                    param-cycle-user-data
                    {reward-claimed: true}
                ))
                {y-token: static-y-token, lp-token: static-lp-token, total-rewards-x: (+ current-total-rewards-x param-cycle-x-rewards), current-cycle: static-current-cycle}
            )
            ;; There are no rewards to claim
            fold-data
        )

    )
)



;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Unstake Functions ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

(define-public (unstake-all-lp-tokens (y-token <sip-010-trait>) (lp-token <sip-010-trait>))
    (let 
        (
            (liquidity-provider tx-sender)
            (current-cycle (contract-call? .stableswap-stackingDAO get-current-cycle))
            (current-cycle-helper (var-set helper-uint current-cycle))
            (current-staker-data (unwrap! (map-get? StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender}) (err "err-no-staker-data")))
            (current-cycles-to-unstake (get cycles-to-unstake current-staker-data))
            (current-staked-by-unstaker (get total-currently-staked current-staker-data))
            (total-currently-staked-data (unwrap! (map-get? TotalStakedPerPairMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token)}) (err "err-no-total-staked-per-pair")))
            (total-currently-staked-in-contract (get total-staked total-currently-staked-data))
            (unstake-data (fold fold-from-all-cycles-to-unstakeable-cycles current-cycles-to-unstake {y-token: (contract-of y-token), lp-token: (contract-of lp-token), total-lps-to-unstake: u0, current-cycles-to-unstake: current-cycles-to-unstake}))
            (lp-tokens-to-unstake (get total-lps-to-unstake unstake-data))
            (updated-total-currently-staked (- total-currently-staked-in-contract lp-tokens-to-unstake))
            (updated-total-currently-staked-by-unstaker (- current-staked-by-unstaker lp-tokens-to-unstake))
            (updated-current-cycles-to-unstake (get current-cycles-to-unstake unstake-data))
        )

        (asserts! (> lp-tokens-to-unstake u0) (err "err-no-lp-tokens-to-unstake"))
        
        ;; Transfer LP tokens to unstake from the contract to the user
        (unwrap! (as-contract (contract-call? lp-token transfer lp-tokens-to-unstake tx-sender liquidity-provider none)) (err "err-failed-to-transfer-lp-tokens"))
        
        (map-set StakerDataMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token), user: tx-sender} (merge 
            current-staker-data
            {total-currently-staked: updated-total-currently-staked-by-unstaker, cycles-to-unstake: updated-current-cycles-to-unstake}
        ))
        ;; Updating the total balance of LP tokens staked in this contract
        (map-set TotalStakedPerPairMap {y-token: (contract-of y-token), lp-token: (contract-of lp-token)} {total-staked: updated-total-currently-staked})

        ;; Return the number of LP tokens user receives that were no longer staked in any current or upcoming cycles
        (ok lp-tokens-to-unstake)

    )
)

(define-private (fold-from-all-cycles-to-unstakeable-cycles (cycle uint) (fold-data {y-token: principal, lp-token: principal, total-lps-to-unstake: uint, current-cycles-to-unstake: (list 12000 uint)})) 
    (let 
        (
            (current-cycle (contract-call? .stableswap-stackingDAO get-current-cycle))
            (current-total-lp-tokens-to-unstake (get total-lps-to-unstake fold-data))
            (static-y-token (get y-token fold-data))
            (static-lp-token (get lp-token fold-data))
            (current-cycles-to-unstake (get current-cycles-to-unstake fold-data))
            (param-cycle-user-data (match (map-get? StakerDataPerCycleMap {y-token: static-y-token, lp-token: static-lp-token, user: tx-sender, cycle: cycle}) 
                ;; StakerDataPerCycleMap entry exists, save it to param-cycle-user-data
                unwrapped-value
                    unwrapped-value
                ;; StakerDataPerCycleMap entry doesn't exist (this should never happen)
                {lp-token-staked: u0,
                reward-claimed: false,
                lp-token-to-unstake: u0}
            ))
            
            (param-cycle-user-lp-tokens-to-unstake (get lp-token-to-unstake param-cycle-user-data))
            (updated-helper-uint-to-filter (var-set helper-uint cycle))
            (updated-cycles-to-unstake (filter filter-unstaked-cycle current-cycles-to-unstake))

        )

        (if (and (> param-cycle-user-lp-tokens-to-unstake u0) (<= cycle current-cycle))
            ;; There are lp-tokens to unstake
            (begin 
                ;; Update StakerDataPerCycleMap with lp-token-to-unstake = u0
                (map-set StakerDataPerCycleMap {y-token: static-y-token, lp-token: static-lp-token, user: tx-sender, cycle: cycle} (merge 
                    param-cycle-user-data
                    {lp-token-to-unstake: u0}
                ))
                {y-token: static-y-token, lp-token: static-lp-token, total-lps-to-unstake: (+ param-cycle-user-lp-tokens-to-unstake current-total-lp-tokens-to-unstake), current-cycles-to-unstake: updated-cycles-to-unstake}
            )
            ;; There are no rewards to claim
            fold-data
        )

    )
)
