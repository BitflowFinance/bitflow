
(use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ERROR CODES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-constant INVALID_PAIR_ERR (err u1))
(define-constant PAIR_ALREADY_EXISTS_ERR (err u2))
(define-constant TOO_MUCH_SLIPPAGE_ERR (err u3))
(define-constant TRANSFER_X_FAILED_ERR (err u4))
(define-constant TRANSFER_Y_FAILED_ERR (err u5))
(define-constant TRANSFER_LP_FAILED_ERR (err u6))
(define-constant VALUE_OUT_OF_RANGE_ERR (err u7))
(define-constant MAX_STAKING_LENGTH_ERR (err u8))
(define-constant MIN_STAKING_LENGTH_ERR (err u9))
(define-constant CLAIM_TOO_EARLY_ERR (err u10))
(define-constant ALREADY_CLAIMED_ERR (err u11))
(define-constant PANIC_ERR (err u12))
(define-constant UNAUTHORIZED_PAIR_ADJUSTMENT (err u15))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTRACT CONSTANTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-constant CONTRACT_OWNER 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-constant CONTRACT_ADDRESS 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v4)
(define-constant FEE_TO_ADDRESS 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.fee-escrow)
(define-constant INIT_BH block-height)
(define-constant MAX_REWARD_CYCLES u100)
(define-constant REWARD_CYCLE_INDEXES (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100))
(define-constant CYCLE_LENGTH u144)
(define-constant FEE_ON_SWAPS u6)
(define-constant A_COEF u100)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CONTRACT  VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-map pairs-data-map
  {
    token-x: principal,
    token-y: principal,
  }
  {
    shares-total: uint,
    balance-x: uint,
    balance-y: uint,
    fee-balance-x: uint,
    fee-balance-y: uint,
    fee-to-address: (optional principal), 
    name: (string-ascii 32),
  }
)

;; used to update UserStakingData everytime a principal stakes more LP tokens
(define-map cycle-staking
  { id: principal }
  { num-cycles: uint}
)

;; ;; cycle fee data
(define-map CycleFeeData 
  { 
    token-x: principal, 
    token-y: principal, 
    cycleNum: uint,
  }
  {
    token-x-bal: uint,
    token-y-bal: uint,
  }
)

(define-map TotalStakingData
  {
    token-x: principal,
    token-y: principal,
    cycleNum: uint
  }
  { total-lp-staked: uint }
)

(define-map UserStakingData
  {
    token-x: principal,
    token-y: principal,
    rewardCycle: uint,
    who: principal
  }
  {
    lp-staked: uint,
    reward-claimed: bool
  }
)

(define-map TotalBitflowEscrow 
  { cycle: uint } 
  { amount: uint }
)

(define-map UserBitflowEscrow 
  { who: principal,
    cycle: uint
  } 
  { amount: uint }
)

(define-map ApprovedPairs
  {token-x-contract: principal,
  token-y-contract: principal}
  {approval: bool}
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; READ ONLY FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-read-only (get-pair-data (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
    )
    (ok pair)
  )
)

(define-read-only (get-name (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
    )
    (ok (get name pair))
  )
)


;; returns both token balances for a given pool
(define-read-only (get-token-balances (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (balance-x (get balance-x pair))
      (balance-y (get balance-y pair))
    )
    (ok (list balance-x balance-y))
  )
)

(define-read-only (get-total-supply-x (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (balance-x (get balance-x pair))
    )
    (ok balance-x)
  )
)

(define-read-only (get-total-supply-y (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (balance-y (get balance-y pair))
    )
    (ok balance-y)
  )
)

(define-read-only (get-current-cycle)
  (let 
    (
      (diff (- block-height INIT_BH))
      (cycle (/ diff CYCLE_LENGTH))
    ) 
    (ok cycle)
  )
)

;; grabs the total amount of fees collected in token-x and in token-y by cycle
;; number of token-x and token-y goes up with every trade
(define-read-only (get-total-cycle-fees (token-x principal) (token-y principal) (cycleNum uint))
 (default-to
    {token-x-bal: u0, token-y-bal: u0} 
    (map-get? CycleFeeData 
      {
        token-x: token-x,
        token-y: token-y,
        cycleNum: cycleNum
      }
    )
  )
)

(define-read-only (get-total-lp-staked-at-cycle (token-x principal) (token-y principal) (rewardCycle uint))
 (default-to
    {total-lp-staked: u0} 
      (map-get? TotalStakingData 
      {
        token-x: token-x,
        token-y: token-y,
        cycleNum: rewardCycle,
      }
    )
  )
)

(define-read-only (get-lp-staked-by-user-at-cycle (token-x principal) (token-y principal) (rewardCycle uint) (who principal))
 (default-to
    {lp-staked: u0, reward-claimed: false} 
      (map-get? UserStakingData 
      {
        token-x: token-x,
        token-y: token-y,
        rewardCycle: rewardCycle,
        who: who
      }
    )
  )
)

(define-read-only (get-total-xbtc-escrowed-at-cycle (cycleNum uint))
 (default-to
    {amount: u0} 
    (map-get? TotalBitflowEscrow 
      {
        cycle: cycleNum
      }
    )
  )
)

(define-read-only (get-user-xbtc-escrowed-at-cycle (who principal) (cycleNum uint))
 (default-to
    {amount: u0} 
    (map-get? UserBitflowEscrow 
      {
        who: who,
        cycle: cycleNum
      }
    )
  )
)



(define-read-only (get-pct-xbtc-escrow-at-cycle (who principal) (cycleNum uint))
  (let (
      (user-amount (get amount (get-user-xbtc-escrowed-at-cycle who cycleNum)))
      (total-amount (get amount (get-total-xbtc-escrowed-at-cycle cycleNum)))
      (pct (/ (* u100 user-amount) total-amount))
    )
    (if (> total-amount u0) 
      (/ (* u100 user-amount) total-amount)
      u0
    )
  )
)

(define-read-only (verify-approved-pair (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>))
 (default-to
    {approval: false} 
    (map-get? ApprovedPairs 
      {
        token-x-contract: (contract-of token-x-trait),
        token-y-contract: (contract-of token-y-trait)
      }
    )
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PRIVATE FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-private (stake-lp-at-cycle (who principal) (amt uint) (cycle-num uint) (token-x principal) (token-y principal)) 
  (as-contract (set-lp-staked-by-user-at-cycle token-x token-y cycle-num who amt))
)

(define-private (set-lp-staked-by-user-at-cycle (token-x principal) (token-y principal) (rewardCycle uint) (who principal) (amount uint))
  (let 
    (
    (totalStakingData (get-total-lp-staked-at-cycle token-x token-y rewardCycle))
    (totalAmountStaked (get total-lp-staked totalStakingData))
    (userStakingData (get-lp-staked-by-user-at-cycle token-x token-y rewardCycle who))
    (claimed (get reward-claimed userStakingData))
    (user-staked (get lp-staked userStakingData))
    )
    (begin 
      (map-set TotalStakingData
        {
          token-x: token-x,
          token-y: token-y,
          cycleNum: rewardCycle
        }
        {
          total-lp-staked: (+ totalAmountStaked amount),
        }
      )
      (map-set UserStakingData
        {
          token-x: token-x,
          token-y: token-y,
          rewardCycle: rewardCycle,
          who: who
        }
        {
          lp-staked: (+ user-staked amount),
          reward-claimed: claimed
        }
      )
    )
    (ok true)
  )
)

(define-private (update-user-staking-data (cycle uint) (user-info {token-x: principal, token-y: principal, amt: uint, who: principal}))
  (let (
    (token-x (get token-x user-info))
    (token-y (get token-y user-info))
    (amt (get amt user-info))
    (who (get who user-info))
    ) 
    (if (is-ok (stake-lp-at-cycle who amt cycle token-x token-y))
      user-info
      user-info ;; should return something else here to showcase that stake-lp-at-cycle threw an error
    )
  )
)

(define-private (verify-upcoming-cycle (cycle-num uint))
  (let (
    (user-max-cycles-staking (get num-cycles (unwrap-panic (map-get? cycle-staking {id: tx-sender})))) ;;avoid unwrap-panic if possible
    (valid-cycle (<= cycle-num user-max-cycles-staking)) 
    ) 
    valid-cycle
  )
)

(define-private (get-list-of-staking-cycles (user-max-cycles-staking uint))
  (begin 
    (filter verify-upcoming-cycle REWARD_CYCLE_INDEXES)
  )
)


(define-private (shift-verified-cycles-to-current (cycle-num uint))
  (let (
    (shift-amount (unwrap-panic (get-current-cycle)))
    (valid-cycle-num (+ cycle-num shift-amount))
    ) 
    valid-cycle-num
  )
)


(define-private (escrow-xbtc-at-cycle (who principal) (amt uint) (cycle-num uint)) 
  (as-contract (set-xbtc-escrowed-by-user-at-cycle cycle-num who amt))
)

(define-private (update-user-escrow-data (cycle uint) (user-info {amt: uint, who: principal}))
  (let (
    (amt (get amt user-info))
    (who (get who user-info))
    ) 
    (if (is-ok (escrow-xbtc-at-cycle who amt cycle))
      user-info
      user-info ;; should return something else here to showcase that stake-lp-at-cycle threw an error
    )
  )
)

(define-private (set-xbtc-escrowed-by-user-at-cycle (rewardCycle uint) (who principal) (amount uint))
  (let 
    (
    (user-xbtc-escrowed (get amount (get-user-xbtc-escrowed-at-cycle who rewardCycle)))     
    (total-xbtc-escrowed (get amount (get-total-xbtc-escrowed-at-cycle rewardCycle)))     

    )
    (begin 
      (map-set UserBitflowEscrow
        {
          who: who,
          cycle: rewardCycle
        }
        { amount: (+ user-xbtc-escrowed amount) }
      )
      (map-set TotalBitflowEscrow
        { cycle: rewardCycle }
        { amount: (+ total-xbtc-escrowed amount) }
      )
    )
    (ok true)
  )
)

(define-private (max-of (i1 uint) (i2 uint))
  (if (> i1 i2)
      i1
      i2
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; PUBLIC FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-public (create-pair (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (pair-name (string-ascii 32)) (x uint) (y uint))
  (let
    (
      (name-x (unwrap-panic (contract-call? token-x-trait get-name)))
      (name-y (unwrap-panic (contract-call? token-y-trait get-name)))
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair-data {
        shares-total: u0,
        balance-x: u0,
        balance-y: u0,
        fee-balance-x: u0,
        fee-balance-y: u0,
        fee-to-address: (some FEE_TO_ADDRESS),
        name: pair-name,
      })
      (is-approved-pair (get approval (verify-approved-pair token-x-trait token-y-trait)))
    )
    ;; ensure that malicious actors cannot add bad pairs to remove tokens from the contract. adding a pair should require governance approval.
    (asserts! is-approved-pair UNAUTHORIZED_PAIR_ADJUSTMENT)

    ;; for tokens X and Y, trying to create a pair Y-X will fail if X-Y already exists. and vice versa
    (asserts!
      (and
        (is-none (map-get? pairs-data-map { token-x: token-x, token-y: token-y }))
        (is-none (map-get? pairs-data-map { token-x: token-y, token-y: token-x }))
      )
      PAIR_ALREADY_EXISTS_ERR
    )

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-data)

    (try! (add-to-position token-x-trait token-y-trait x y))
    (print { object: "pair", action: "created", data: pair-data })
    (ok true)
  )
)

;; add tokens to a liquidity pool and receive LP tokens in return
(define-public (add-to-position (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (x uint) (y uint))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap-panic (map-get? pairs-data-map { token-x: token-x, token-y: token-y })))
      (is-approved-pair (get approval (verify-approved-pair token-x-trait token-y-trait)))
      (contract-address (as-contract tx-sender))
      (recipient-address tx-sender)
      (balance-x (get balance-x pair))
      (balance-y (get balance-y pair))
      (who tx-sender)

      (new-y
        (if (is-eq (get shares-total pair) u0)
          y
          (/ (* x balance-y) balance-x)
        )
      )
      (new-shares
        (if (is-eq (get shares-total pair) u0)
          (sqrti (* (+ balance-x x) (+ balance-y new-y)))
          (- (sqrti (* (+ balance-x x) (+ balance-y new-y))) (get shares-total pair))
        )
      )
      (pair-updated (merge pair {
        shares-total: (+ new-shares (get shares-total pair)),
        balance-x: (+ balance-x x),
        balance-y: (+ balance-y new-y)
      }))
      (new-amounts 
        {
            x-amount: x,
            y-amount: new-y
        }
      )
    )

    (asserts! is-approved-pair UNAUTHORIZED_PAIR_ADJUSTMENT)    
    (asserts! (is-ok (as-contract (contract-call? .usd-lp mint new-shares who))) (err u1110))
    (asserts! (is-ok (contract-call? token-x-trait transfer x tx-sender contract-address none)) TRANSFER_X_FAILED_ERR)
    (asserts! (is-ok (contract-call? token-y-trait transfer new-y tx-sender contract-address none)) TRANSFER_Y_FAILED_ERR)

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (print { object: "pair", action: "liquidity-added", data: pair-updated })
    (ok true)
  )
)

;; ;; convert lp tokens back to the underlying tokens in the liquidity pool: burn lp tokens, send withdrawal of token-x and token-y to user
(define-public (reduce-position (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (percent uint))
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (is-approved-pair (get approval (verify-approved-pair token-x-trait token-y-trait)))
      (fee-balance-x (get fee-balance-x pair))
      (fee-balance-y (get fee-balance-y pair))
      (balance-x (- (get balance-x pair) fee-balance-x))
      (balance-y (- (get balance-y pair) fee-balance-y))
      (shares (unwrap! (contract-call? .usd-lp get-balance tx-sender) (err u1110)))
      (shares-total (get shares-total pair))
      (contract-address (as-contract tx-sender))
      (sender tx-sender)
      (withdrawal (/ (* shares percent) u100))
      (withdrawal-x (/ (* withdrawal balance-x) shares-total))
      (withdrawal-y (/ (* withdrawal balance-y) shares-total))
      (pair-updated
        (merge pair
          {
            shares-total: (- shares-total withdrawal),
            balance-x: (- (get balance-x pair) withdrawal-x),
            balance-y: (- (get balance-y pair) withdrawal-y)
          }
        )
      )

    )

    (asserts! is-approved-pair UNAUTHORIZED_PAIR_ADJUSTMENT)
    (asserts! (<= percent u100) VALUE_OUT_OF_RANGE_ERR)
    (asserts! (is-ok (contract-call? .usd-lp burn tx-sender withdrawal)) (err u1110))
    (asserts! (is-ok (as-contract (contract-call? token-x-trait transfer withdrawal-x contract-address sender none))) TRANSFER_X_FAILED_ERR)
    (asserts! (is-ok (as-contract (contract-call? token-y-trait transfer withdrawal-y contract-address sender none))) TRANSFER_Y_FAILED_ERR)

    ;; (unwrap-panic (decrease-shares token-x token-y tx-sender withdrawal)) ;; should never fail, you know...
    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (print { object: "pair", action: "liquidity-removed", data: pair-updated })
    (ok (list withdrawal-x withdrawal-y))
  )
)


;; swap dx of token-x for some amount dy of token-y based on current liquidity pool, returns (dx dy)
;; swap will fail when slippage is too high (trader doesn't get at least min-dy in return)
(define-public (swap-x-for-y (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (dx uint) (min-dy uint))
  ;; calculate dy
  ;; calculate fee on dx
  ;; transfer
  ;; update balances
  (let
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (this-cycle (unwrap-panic (get-current-cycle)))
      (cycleFeeData (get-total-cycle-fees token-x token-y this-cycle))
      (total-x-rewards (get token-x-bal cycleFeeData))
      (total-y-rewards (get token-y-bal cycleFeeData))

      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (is-approved-pair (get approval (verify-approved-pair token-x-trait token-y-trait)))

      ;; (balance-x (get balance-x pair))
      ;; (balance-y (get balance-y pair))
      (contract-address (as-contract tx-sender))
      (sender tx-sender)
      (fee (/ (* FEE_ON_SWAPS dx) u10000)) ;; 6 basis points
      (dxlf (- dx fee)) ;;dx less fees
      ;; (dy (/ (* u1000 balance-y dxlf) (+ (* u1000 balance-x) (* u1000 dxlf))))
      (dy (unwrap! (get-dy token-x-trait token-y-trait dx) PANIC_ERR)) ;; gets dy using stableswap invariant
      (pair-updated
        (merge pair
          {
            balance-x: (+ (get balance-x pair) dxlf),
            balance-y: (- (get balance-y pair) dy),
            fee-balance-x: (if (is-some (get fee-to-address pair))  ;; only collect fee when fee-to-address is set
              (+ fee (get fee-balance-x pair))
              (get fee-balance-x pair))
          }
        )
      )
    )

    (asserts! (< min-dy dy) TOO_MUCH_SLIPPAGE_ERR)

    (asserts! is-approved-pair UNAUTHORIZED_PAIR_ADJUSTMENT)
    (asserts! (is-ok (contract-call? token-x-trait transfer dxlf sender contract-address none)) TRANSFER_X_FAILED_ERR)
    (asserts! (is-ok (contract-call? token-x-trait transfer fee sender FEE_TO_ADDRESS none)) TRANSFER_X_FAILED_ERR)
    (asserts! (is-ok (as-contract (contract-call? token-y-trait transfer dy contract-address sender none))) TRANSFER_Y_FAILED_ERR)

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (map-set CycleFeeData
      {
        token-x: token-x,
        token-y: token-y,
        cycleNum: this-cycle 
      }
      {
        token-x-bal: (+ fee total-x-rewards),
        token-y-bal: total-y-rewards
      }
    )
    (print { object: "pair", action: "swap-x-for-y", data: pair-updated })
    (ok (list dxlf dy))
  )
)

;; swap dy of token-y for some amount dx of token-x based on current liquidity pool, returns (dy dx)
;; swap will fail when slippage is too high (trader doesn't get at least min-dx in return)
(define-public (swap-y-for-x (token-y-trait <sip-010-trait>) (token-x-trait <sip-010-trait>) (dy uint) (min-dx uint))
  ;; calculate dx
  ;; calculate fee on dy
  ;; transfer
  ;; update balances
  (let ((token-x (contract-of token-x-trait))
        (token-y (contract-of token-y-trait))
        (this-cycle (unwrap-panic (get-current-cycle)))
        (cycleFeeData (get-total-cycle-fees token-x token-y this-cycle))
        (total-x-rewards (get token-x-bal cycleFeeData))
        (total-y-rewards (get token-y-bal cycleFeeData))
 
        (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
        (is-approved-pair (get approval (verify-approved-pair token-x-trait token-y-trait)))
        ;; (balance-x (get balance-x pair))
        ;; (balance-y (get balance-y pair))
        (contract-address (as-contract tx-sender))
        (sender tx-sender)
        ;; check formula, vs x-for-y???
        (fee (/ (* FEE_ON_SWAPS dy) u10000)) ;; 6 bp
        (dylf (- dy fee)) ;;dy less fees
        ;; (dx (/ (* u1000 balance-x dylf) (+ (* u1000 balance-y) (* u1000 dylf)))) ;; works for x*y=k
        (dx (unwrap! (get-dx token-y-trait token-x-trait dy) PANIC_ERR)) ;; gets dx using stableswap invariant
        (pair-updated (merge pair {
          balance-x: (- (get balance-x pair) dx),
          balance-y: (+ (get balance-y pair) dylf),
          fee-balance-y: (if (is-some (get fee-to-address pair))  ;; only collect fee when fee-to-address is set
            (+ fee (get fee-balance-y pair))
            (get fee-balance-y pair))
        })))

    (asserts! (< min-dx dx) TOO_MUCH_SLIPPAGE_ERR)

    (asserts! is-approved-pair UNAUTHORIZED_PAIR_ADJUSTMENT)
    (asserts! (is-ok (contract-call? token-y-trait transfer dylf sender contract-address none)) TRANSFER_Y_FAILED_ERR)
    (asserts! (is-ok (contract-call? token-y-trait transfer fee sender FEE_TO_ADDRESS none)) TRANSFER_Y_FAILED_ERR)
    (asserts! (is-ok (as-contract (contract-call? token-x-trait transfer dx contract-address sender none))) TRANSFER_X_FAILED_ERR)

    (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
    (map-set CycleFeeData
      {
        token-x: token-x,
        token-y: token-y,
        cycleNum: this-cycle 
      }
      {
        token-x-bal: total-x-rewards,
        token-y-bal: (+ fee total-y-rewards)
      }
    )
    (print { object: "pair", action: "swap-y-for-x", data: pair-updated })
    (ok (list dylf dx))
  )
)
 

;; TODO: need to find a consistent mapping for token-x and token-y. if order is swapped, the LP staked is tracked separately !!!
(define-public (stake-LP-tokens (lp-token <sip-010-trait>) (token-x <sip-010-trait>) (token-y <sip-010-trait>) (amount uint) (numCycles uint))
  (let (
      (cycle-preference-is-set (map-set cycle-staking {id: tx-sender} {num-cycles: numCycles}))
      (staking-cycles (get-list-of-staking-cycles numCycles))
      (valid-staking-cycles (map shift-verified-cycles-to-current staking-cycles))
      (txc (contract-of token-x))
      (tyc (contract-of token-y))
    ) 
    (begin 
      (asserts! (> numCycles u0) MIN_STAKING_LENGTH_ERR) ;; stake for at least one cycle
      (asserts! (<= numCycles MAX_REWARD_CYCLES) MAX_STAKING_LENGTH_ERR) ;; limited by length of the REWARD_CYCLES_INDEXES listed
      ;; ensure that the pair already exists 
      (asserts!
        (or
          (is-some (get name (map-get? pairs-data-map { token-x: txc, token-y: tyc })))
          (is-some (get name (map-get? pairs-data-map { token-x: tyc, token-y: txc })))
        )
        INVALID_PAIR_ERR
      )
      (print valid-staking-cycles)
      (asserts! (is-ok (contract-call? lp-token transfer amount tx-sender CONTRACT_ADDRESS none)) TRANSFER_LP_FAILED_ERR)
      (ok (fold update-user-staking-data valid-staking-cycles {token-x: txc, token-y: tyc, amt: amount, who: tx-sender}))
    )
  )
)

(define-public (escrow-xbtc (xbtc-token <sip-010-trait>) (amount uint) (numCycles uint))
    (let (
      (cycle-preference-is-set (map-set cycle-staking {id: tx-sender} {num-cycles: numCycles}))
      (staking-cycles (get-list-of-staking-cycles numCycles))
      (valid-staking-cycles (map shift-verified-cycles-to-current staking-cycles))
    ) 
    (begin 
      ;; todo: assert that the xbtc contract is correct. don't want to get credit for staking a bs token
      (asserts! (> numCycles u0) MIN_STAKING_LENGTH_ERR) ;; escrow for at least one cycle
      (asserts! (<= numCycles MAX_REWARD_CYCLES) MAX_STAKING_LENGTH_ERR) ;; limited by length of the REWARD_CYCLES_INDEXES listed
      (print valid-staking-cycles)
      (asserts! (is-ok (contract-call? xbtc-token transfer amount tx-sender CONTRACT_ADDRESS none)) TRANSFER_LP_FAILED_ERR)
      (ok (fold update-user-escrow-data valid-staking-cycles {amt: amount, who: tx-sender}))
    )
  )
)


(define-public (claim-rewards-many (reward-cycles (list 1000 uint)) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
    (let (
      (txt token-x-trait)
      (tyt token-y-trait)
      (lpt lp-token-trait)
      (btt xbtc-token-trait)
      (list-of-cycle-rewards 
        (map 
          claim-rewards-at-cycle
          reward-cycles
          (list txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt)
          (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt)
          (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
          (list btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt)        
        )
      )

    )
    (begin
      (ok list-of-cycle-rewards)
    )
  )
)

(define-public (claim-rewards-at-cycle (rewardCycle uint) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
  ;; todo: traits as inputs isn't secure for lp-token and xbtc. need to ensure can't be abused / find diff way to call in transfer function.
  ;; what happens if staking 50 btc for x cycles, and then 50 more for x cycles starting at x+1 (cycle following prev lockup). can't claim xbtc or lptokens using current logic.
  (let 
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (fee-balance-x (get fee-balance-x pair))
      (fee-balance-y (get fee-balance-y pair))
      (cycleFeeData (get-total-cycle-fees token-x token-y rewardCycle))
      (total-x-rewards (get token-x-bal cycleFeeData))
      (total-y-rewards (get token-y-bal cycleFeeData))
      (totalStakingData (get-total-lp-staked-at-cycle token-x token-y rewardCycle))
      (userStakingData (get-lp-staked-by-user-at-cycle token-x token-y rewardCycle tx-sender))
      (total-amount-staked (get total-lp-staked totalStakingData))
      (user-amount-staked (get lp-staked userStakingData))
      (claimed (get reward-claimed userStakingData))
      (user-rewards-pct 
        (if (> total-amount-staked u0) 
          (/ (* u100 user-amount-staked) total-amount-staked)
          u0
        )     
      )
      (user-x-rewards (/ (* user-rewards-pct total-x-rewards) u100))
      (user-y-rewards (/ (* user-rewards-pct total-y-rewards) u100))
      (pool-balance-x (- (get balance-x pair) user-x-rewards))
      (pool-balance-y (- (get balance-y pair) user-y-rewards))
      (claimer tx-sender)
      (contract-address (as-contract tx-sender))
      (this-cycle (unwrap-panic (get-current-cycle))) ;; cycle when calling function
      (reward-cycle rewardCycle) ;; cycle claiming rewards from
      (following-cycle (+ u1 reward-cycle)) ;; cycle after the one claiming rewards from
      (user-lp-staked-following-cycle (get lp-staked (get-lp-staked-by-user-at-cycle token-x token-y following-cycle tx-sender)))
      (lp-claim
        (if (> user-amount-staked user-lp-staked-following-cycle)
              (- user-amount-staked user-lp-staked-following-cycle)
              u0
              ))
      (user-xbtc-escrowed (get amount (get-user-xbtc-escrowed-at-cycle tx-sender reward-cycle)))     
      (user-xbtc-escrowed-following-cycle (get amount (get-user-xbtc-escrowed-at-cycle tx-sender following-cycle)))
      (xbtc-claim
        (if (> user-xbtc-escrowed user-xbtc-escrowed-following-cycle)
              (- user-xbtc-escrowed user-xbtc-escrowed-following-cycle)
              u0
              ))
      (pair-updated
        (merge pair
          {
            ;; balance-x: (max-of (- (get balance-x pair) user-x-rewards) u0),
            fee-balance-x: (if (is-some (get fee-to-address pair))  ;; only collect fee when fee-to-address is set
              (- (get fee-balance-x pair) user-x-rewards)
              (get fee-balance-x pair)),

            ;; balance-y: (max-of (- (get balance-y pair) user-y-rewards) u0),  
            fee-balance-y: (if (is-some (get fee-to-address pair))  ;; only collect fee when fee-to-address is set
              (- (get fee-balance-y pair) user-y-rewards)
              (get fee-balance-y pair))
          }
        )
      )
      (is-lp (> user-amount-staked u0))
      (uses-bitflow-escrow (> user-xbtc-escrowed u0))
      (is-both (and is-lp uses-bitflow-escrow))
      (available-bps FEE_ON_SWAPS) ;; 5 for lps and xbtc escrow'ers. 1 for foundation.
      (earned-bps (if is-both
                      u5 
                      (if is-lp 
                        u3 
                        (if uses-bitflow-escrow
                          u1 
                          u0)))
      )
      (user-x-rewards-proportional (/ (* earned-bps user-x-rewards ) available-bps))
      (user-y-rewards-proportional (/ (* earned-bps user-y-rewards ) available-bps))

    )
    (begin 

      (print {user-amt-lp: user-amount-staked, total-amt-lp: total-amount-staked, uxr: user-x-rewards, uyr: user-y-rewards, txr: total-x-rewards, tyr: total-y-rewards})
      (asserts! (is-eq claimed false) ALREADY_CLAIMED_ERR)
      (asserts! (> this-cycle rewardCycle) CLAIM_TOO_EARLY_ERR)
      (if (> user-x-rewards u0) 
          ;; (asserts! (is-ok (as-contract (contract-call? token-x-trait transfer user-x-rewards contract-address sender none))) TRANSFER_X_FAILED_ERR)
          
          (asserts! (is-ok (as-contract (contract-call? .fee-escrow claim-token-rewards-from-escrow token-x-trait claimer user-x-rewards-proportional))) TRANSFER_X_FAILED_ERR)
          (asserts! (is-ok (ok true)) (err u123412341))
      )
      (if (> user-y-rewards u0) 
          (asserts! (is-ok (as-contract (contract-call? .fee-escrow claim-token-rewards-from-escrow token-y-trait claimer user-y-rewards-proportional))) TRANSFER_Y_FAILED_ERR)
          (asserts! (is-ok (ok true)) (err u123412342))
      )

      (if (> lp-claim u0) 
          (asserts! (is-ok (as-contract (contract-call? lp-token-trait transfer lp-claim CONTRACT_ADDRESS claimer none))) TRANSFER_LP_FAILED_ERR)
          (asserts! (is-ok (ok true)) (err u123412343))
      )
      
      (if (> xbtc-claim u0) 
          (asserts! (is-ok (as-contract (contract-call? xbtc-token-trait transfer xbtc-claim CONTRACT_ADDRESS claimer none))) TRANSFER_LP_FAILED_ERR)
          (asserts! (is-ok (ok true)) (err u123412344))
      )
      (map-set pairs-data-map { token-x: token-x, token-y: token-y } pair-updated)
      (map-set UserStakingData
        {
          token-x: token-x,
          token-y: token-y,
          rewardCycle: rewardCycle,
          who: tx-sender
        }
        {
          lp-staked: user-amount-staked,
          reward-claimed: true
        }
      )
    )
    (ok (list user-x-rewards-proportional user-y-rewards-proportional lp-claim xbtc-claim))
  )
) 



(define-read-only (get-rewards-at-cycle (rewardCycle uint) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
  ;; todo: traits as inputs isn't secure for lp-token and xbtc. need to ensure can't be abused / find diff way to call in transfer function.
  ;; what happens if staking 50 btc for x cycles, and then 50 more for x cycles starting at x+1 (cycle following prev lockup). can't claim xbtc or lptokens using current logic.
  (let 
    (
      (token-x (contract-of token-x-trait))
      (token-y (contract-of token-y-trait))
      (pair (unwrap! (map-get? pairs-data-map { token-x: token-x, token-y: token-y }) INVALID_PAIR_ERR))
      (fee-balance-x (get fee-balance-x pair))
      (fee-balance-y (get fee-balance-y pair))
      (cycleFeeData (get-total-cycle-fees token-x token-y rewardCycle))
      (total-x-rewards (get token-x-bal cycleFeeData))
      (total-y-rewards (get token-y-bal cycleFeeData))
      (totalStakingData (get-total-lp-staked-at-cycle token-x token-y rewardCycle))
      (userStakingData (get-lp-staked-by-user-at-cycle token-x token-y rewardCycle who))
      (total-amount-staked (get total-lp-staked totalStakingData))
      (user-amount-staked (get lp-staked userStakingData))
      (claimed (get reward-claimed userStakingData))
      (user-rewards-pct 
        (if (> total-amount-staked u0) 
          (/ (* u100 user-amount-staked) total-amount-staked)
          u0
        )     
      )
      (user-x-rewards (/ (* user-rewards-pct total-x-rewards) u100))
      (user-y-rewards (/ (* user-rewards-pct total-y-rewards) u100))
      (pool-balance-x (- (get balance-x pair) user-x-rewards))
      (pool-balance-y (- (get balance-y pair) user-y-rewards))
      (claimer who)
      (this-cycle (unwrap-panic (get-current-cycle))) ;; cycle when calling function
      (reward-cycle rewardCycle) ;; cycle claiming rewards from
      (following-cycle (+ u1 reward-cycle)) ;; cycle after the one claiming rewards from
      (user-lp-staked-following-cycle (get lp-staked (get-lp-staked-by-user-at-cycle token-x token-y following-cycle who)))
      (lp-claim
        (if (> user-amount-staked user-lp-staked-following-cycle)
              (- user-amount-staked user-lp-staked-following-cycle)
              u0
              ))
      (user-xbtc-escrowed (get amount (get-user-xbtc-escrowed-at-cycle who reward-cycle)))     
      (user-xbtc-escrowed-following-cycle (get amount (get-user-xbtc-escrowed-at-cycle who following-cycle)))
      (xbtc-claim
        (if (> user-xbtc-escrowed user-xbtc-escrowed-following-cycle)
              (- user-xbtc-escrowed user-xbtc-escrowed-following-cycle)
              u0
        )
      )

      (is-lp (> user-amount-staked u0))
      (uses-bitflow-escrow (> user-xbtc-escrowed u0))
      (is-both (and is-lp uses-bitflow-escrow))
      (available-bps FEE_ON_SWAPS) ;; 5 for lps and xbtc escrow'ers. 1 for foundation.
      (earned-bps (if is-both
                      u5 
                      (if is-lp 
                        u3 
                        (if uses-bitflow-escrow
                          u1 
                          u0)))
      )
      (user-x-rewards-proportional (/ (* earned-bps user-x-rewards ) available-bps))
      (user-y-rewards-proportional (/ (* earned-bps user-y-rewards ) available-bps))

    )
    (begin 

      (print {user-amt-lp: user-amount-staked, total-amt-lp: total-amount-staked, uxr: user-x-rewards, uyr: user-y-rewards, txr: total-x-rewards, tyr: total-y-rewards})
      ;; (asserts! (is-eq claimed false) ALREADY_CLAIMED_ERR)
      ;; (asserts! (> this-cycle rewardCycle) CLAIM_TOO_EARLY_ERR)
    )
    (ok (list user-x-rewards-proportional user-y-rewards-proportional lp-claim xbtc-claim))
    ;; (ok (list user-x-rewards-proportional))
  )
) 

(define-private (get-user-reward-data (cycle uint) (pool-info {who: principal, token-x-trait: <sip-010-trait>, token-y-trait: <sip-010-trait>, lp-token-trait: <sip-010-trait>, xbtc-token-trait: <sip-010-trait>}))
  (let (
    (who (get who pool-info))
    (txt (get token-x-trait pool-info))
    (tyt (get token-y-trait pool-info))
    (lptt (get lp-token-trait pool-info))
    (xbtctt (get xbtc-token-trait pool-info))
    (reward-list (get-rewards-at-cycle cycle who txt tyt lptt xbtctt))


    ) 
    (if (is-ok (get-rewards-at-cycle cycle who txt tyt lptt xbtctt))
      pool-info
      pool-info ;; should return something else here to showcase that stake-lp-at-cycle threw an error
    )
  )
)

(define-read-only (get-rewards-and-principal-many-cycles (list-of-cycles (list 1000 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
    (let (
      (txt token-x-trait)
      (tyt token-y-trait)
      (lpt lp-token-trait)
      (btt xbtc-token-trait)
      (list-of-cycle-rewards 
        (map 
          get-rewards-at-cycle
          list-of-cycles
          (list who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who)
          (list txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt)
          (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt)
          (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
          (list btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt)        
        )
      )

    )
    (begin
      (ok list-of-cycle-rewards)
    )
  )
)

;; (define-read-only (get-rewards-and-principal-sum (reward-cycles (list 10 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
;;     (let (
;;       (list-of-cycle-rewards 
;;         (map 
;;           get-rewards-at-cycle
;;           reward-cycles
;;           (list who who who who who who who who who who)
;;           (list token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait token-x-trait)
;;           (list token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait token-y-trait)
;;           (list lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait lp-token-trait) 
;;           (list xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait xbtc-token-trait)        
;;         )
;;       )
;;       (list0 (unwrap! (unwrap! (element-at list-of-cycle-rewards u0) PANIC_ERR) PANIC_ERR))
;;       (list1 (unwrap! (unwrap! (element-at list-of-cycle-rewards u1) PANIC_ERR) PANIC_ERR))
;;       (list2 (unwrap! (unwrap! (element-at list-of-cycle-rewards u2) PANIC_ERR) PANIC_ERR))
;;       (list3 (unwrap! (unwrap! (element-at list-of-cycle-rewards u3) PANIC_ERR) PANIC_ERR))
;;       (list4 (unwrap! (unwrap! (element-at list-of-cycle-rewards u4) PANIC_ERR) PANIC_ERR))
;;       (list5 (unwrap! (unwrap! (element-at list-of-cycle-rewards u5) PANIC_ERR) PANIC_ERR))
;;       (list6 (unwrap! (unwrap! (element-at list-of-cycle-rewards u6) PANIC_ERR) PANIC_ERR))
;;       (list7 (unwrap! (unwrap! (element-at list-of-cycle-rewards u7) PANIC_ERR) PANIC_ERR))
;;       (list8 (unwrap! (unwrap! (element-at list-of-cycle-rewards u8) PANIC_ERR) PANIC_ERR))
;;       (list9 (unwrap! (unwrap! (element-at list-of-cycle-rewards u9) PANIC_ERR) PANIC_ERR))

;;       (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 list9))

;;     )
;;     (begin 
;;       (ok added)
;;     )
;;   )
;; )



;; TODO 
;; - write read-only function to calculate proportional rewards for xBTC escrow + LP staker per pair


;;SEE LINE 430 HERE: https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy
(define-read-only (get-dy (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (dx uint)) 
;; i: Index value of the token to send.

;; j: Index value of the token to receive.

;; dx: The amount of i being exchanged.

;; min_dy: The minimum amount of j to receive. If the swap would result in less, the transaction will revert.
    (let (
      (txt token-x-trait)
      (tyt token-y-trait)
      (rates FEE_ON_SWAPS) ;; on curve, rates = list of rates for N_COINS
      (old_balances (unwrap! (get-token-balances txt tyt) PANIC_ERR))
      (fee (/ (* FEE_ON_SWAPS dx) u10000)) ;; 6 basis points
      (dxlf (- dx fee)) ;;dx less fees

      (old_x (unwrap! (element-at old_balances u0) (err u13)))
      (old_y (unwrap! (element-at old_balances u1) (err u14)))
      (x (+ old_x dxlf))
      ;; (x (+ old_x dx))
      (y (get-y x old_x old_y))
      (dy (- old_y y))
      ;; (dy (get-y x old_x old_y))
      ;; (y (- old_y dy))
 
      (price (/ (* u100 dy) dx))
      

      )
      ;; (begin
      ;;   (asserts! (not (is-eq txt tyt)) INVALID_PAIR_ERR) ;; prevents swapping for same token
      ;;   ;; (print old_balances)
      ;;   ;; (ok (list x old_x y old_y))
      ;;   (ok )
      ;; )
      (print price)
      (ok dy)
    )
)

;; make private
(define-read-only (get-y (x-bal uint) (old-x-bal uint) (old-y-bal uint))

    (let (
      (rates FEE_ON_SWAPS) ;; on curve, rates = list of rates for N_COINS
      (amp A_COEF)
      (num-coins u2)
      (Ann (* amp num-coins)) ;; = amp * N_COINS
      (D (get-D old-x-bal old-y-bal amp))
      
      ;; (S (* u2 x-bal)) ;; lines 374 - 381
      (S x-bal)

      (c_0 (* u1000000 D))
      (c_1 (/ (* c_0 D) (* num-coins x-bal)))
      ;; (c_2 (/ (* c_1 D) (* num-coins x-bal))) ;; not y-bal according to for loop logic in 374 - 380
      (c_3 (/ (* c_1 D) (* num-coins Ann)))
      (c (/ c_3 u1000000))
      (b (+ S (/ D Ann)))


      (y_prev u0)
      (new_y D)
      ;; (new_y old-y-bal)
      (iterations (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120 u121 u122 u123 u124 u125 u126 u127 u128 u129 u130 u131 u132 u133 u134 u135 u136 u137 u138 u139 u140 u141 u142 u143 u144 u145 u146 u147 u148 u149 u150 u151 u152 u153 u154 u155 u156 u157 u158 u159 u160 u161 u162 u163 u164 u165 u166 u167 u168 u169 u170 u171 u172 u173 u174 u175 u176 u177 u178 u179 u180 u181 u182 u183 u184 u185 u186 u187 u188 u189 u190 u191 u192 u193 u194 u195 u196 u197 u198 u199 u200 u201 u202 u203 u204 u205 u206 u207 u208 u209 u210 u211 u212 u213 u214 u215 u216 u217 u218 u219 u220 u221 u222 u223 u224 u225 u226 u227 u228 u229 u230 u231 u232 u233 u234 u235 u236 u237 u238 u239 u240 u241 u242 u243 u244 u245 u246 u247 u248 u249 u250 u251 u252 u253 u254 u255))
      (y-info {y-prev: y_prev, y: new_y, c: c, b: b, D: D})
      (y_output (get y (fold y-for-loop iterations y-info)))
      
      )
      y_output
    )
)

;; lines 387 - 397 https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy
;; TODO: implement clarity version of break where same y-info map is returned
;; make private
(define-read-only (y-for-loop (n uint) (y-info {y-prev: uint, y: uint, c: uint, b: uint, D: uint}))
    ;; """
    ;; Calculate x[i] if one reduces D from being calculated for xp to D
    ;; Done by solving quadratic equation iteratively.
    ;; x_1**2 + x1 * (sum' - (A*n**n - 1) * D / (A * n**n)) = D ** (n + 1) / (n ** (2 * n) * prod' * A)
    ;; x_1**2 + b*x_1 = c
    ;; x_1 = (x_1**2 + c) / (2*x_1 + b)
    ;; """
  (let (
      (c (get c y-info))
      (b (get b y-info))
      (D (get D y-info))
      (y_prev (get y-prev y-info))
      (y (get y y-info))
      (new_y_numerator (+ (* y y) c)) ;; (y*y + c)
      (new_y_denominator (- (+ (* u2 y) b) D)) ;; (2 * y + b - D)
      (new_y (/ new_y_numerator new_y_denominator))
      
      ;; (y-info-updated 
      ;;   (merge y-info {
      ;;     y-prev: y,
      ;;     y: new_y
      ;;   })
      ;; )
      (bigger-y (> new_y y))
      (small-diff (is-eq new_y y)) ;;y - y-prev <= 1, but dealing w/ uint so checking if equal. runtime error if y = u0 OR (2 * y + b - D) < 0
      ;; (converged (or bigger-y small-diff))
      (converged (and bigger-y small-diff))

      (y-info-updated (if converged 
          y-info ;; if small-diff, don't update
          (merge y-info {
            y-prev: y,
            y: new_y
          })
        )
      )
    ) 
    y-info-updated
  )
)

;;make private
(define-read-only (get-D (old-x-bal uint) (old-y-bal uint) (amp uint))
  (let (
      (num-coins u2)
      (S (+ old-x-bal old-y-bal))
      (D_prev u0)
      (D_P S)
      (D S)
      (Ann (* num-coins amp))
      (iterations (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120 u121 u122 u123 u124 u125 u126 u127 u128 u129 u130 u131 u132 u133 u134 u135 u136 u137 u138 u139 u140 u141 u142 u143 u144 u145 u146 u147 u148 u149 u150 u151 u152 u153 u154 u155 u156 u157 u158 u159 u160 u161 u162 u163 u164 u165 u166 u167 u168 u169 u170 u171 u172 u173 u174 u175 u176 u177 u178 u179 u180 u181 u182 u183 u184 u185 u186 u187 u188 u189 u190 u191 u192 u193 u194 u195 u196 u197 u198 u199 u200 u201 u202 u203 u204 u205 u206 u207 u208 u209 u210 u211 u212 u213 u214 u215 u216 u217 u218 u219 u220 u221 u222 u223 u224 u225 u226 u227 u228 u229 u230 u231 u232 u233 u234 u235 u236 u237 u238 u239 u240 u241 u242 u243 u244 u245 u246 u247 u248 u249 u250 u251 u252 u253 u254 u255))
      ;; (y-info {y-prev: y_prev, y: y, c: c, b: b, D: D})
      ;; (y_output (get y (fold y-for-loop iterations y-info)))
      (D-info {D_P: D_P, D: D, old-x-bal: old-x-bal, old-y-bal: old-y-bal, Ann: Ann, S: S})
      (D_output (get D (fold D-for-loop iterations D-info)))
    ) 
    D_output
  )
)

;; lines 205 - 218 https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy
;; make private
(define-read-only (D-for-loop (n uint) (D-info {D_P: uint, D: uint, old-x-bal: uint, old-y-bal: uint, Ann: uint, S: uint}))
  (let (
      (num-coins u2)
      (old-x-bal (get old-x-bal D-info))
      (old-y-bal (get old-y-bal D-info))
      (Ann (get Ann D-info))
      (S (get S D-info))
      (D_P (get D D-info))
      ;; (D_P (get D_P D-info ))
      (D (get D D-info))

      ;; for t in [x,y]:
      ;;   D_P = D_P * D / (t * N_COINS)
      (new_D_P (/ (* D_P (* D D)) (* u4 (* old-x-bal old-y-bal))))

      (new_D_numerator (* (+ (* Ann S) (* new_D_P num-coins)) D)) ;; D = (Ann * S + D_P * N_COINS) * D 
      (new_D_denominator (+ (* (- Ann u1) D) (* (+ num-coins u1) new_D_P))) ;;((Ann - 1) * D + (N_COINS + 1) * D_P)
      (new_D (/ new_D_numerator new_D_denominator))


      (bigger-D (> new_D D))
      (small-diff (is-eq new_D D))
      (converged (and bigger-D small-diff))

      (D-info-updated (if converged 
          D-info
          (merge D-info {
            D_P: new_D_P,
            D: new_D
          })
        )
      )
    ) 
    D-info-updated
  )
)

;; same as get-dy, but solving for dx pair
;;SEE LINE 430 HERE: https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy
(define-read-only (get-dx (token-y-trait <sip-010-trait>) (token-x-trait <sip-010-trait>)  (dy uint)) 
    (let (
      (txt token-x-trait)
      (tyt token-y-trait)
      (rates FEE_ON_SWAPS) ;; on curve, rates = list of rates for N_COINS
      (old_balances (unwrap! (get-token-balances txt tyt) PANIC_ERR))
      (fee (/ (* FEE_ON_SWAPS dy) u10000)) ;; 6 basis points
      (dylf (- dy fee)) ;;dx less fees

      (old_x (unwrap! (element-at old_balances u0) (err u13)))
      (old_y (unwrap! (element-at old_balances u1) (err u14)))
      (y (+ old_y dylf))
      (x (get-x y old_x old_y))
      (dx (- old_x x))
      )
      (ok dx)
    )
)

;; make private
(define-read-only (get-x (y-bal uint) (old-x-bal uint) (old-y-bal uint))

    (let (
      (rates FEE_ON_SWAPS) ;; on curve, rates = list of rates for N_COINS
      (amp A_COEF)
      (num-coins u2)
      (Ann (* amp num-coins)) ;; = amp * N_COINS
      (D (get-D old-x-bal old-y-bal amp))
      
      ;; (S (* u2 x-bal)) ;; lines 374 - 381
      (S y-bal)

      (c_0 (* u1000000 D))
      (c_1 (/ (* c_0 D) (* num-coins y-bal)))
      ;; (c_2 (/ (* c_1 D) (* num-coins x-bal))) ;; not y-bal according to for loop logic in 374 - 380
      (c_3 (/ (* c_1 D) (* num-coins Ann)))
      (c (/ c_3 u1000000))
      (b (+ S (/ D Ann)))


      (x_prev u0)
      (new_x D)
      ;; (new_y old-y-bal)
      (iterations (list u1 u2 u3 u4 u5 u6 u7 u8 u9 u10 u11 u12 u13 u14 u15 u16 u17 u18 u19 u20 u21 u22 u23 u24 u25 u26 u27 u28 u29 u30 u31 u32 u33 u34 u35 u36 u37 u38 u39 u40 u41 u42 u43 u44 u45 u46 u47 u48 u49 u50 u51 u52 u53 u54 u55 u56 u57 u58 u59 u60 u61 u62 u63 u64 u65 u66 u67 u68 u69 u70 u71 u72 u73 u74 u75 u76 u77 u78 u79 u80 u81 u82 u83 u84 u85 u86 u87 u88 u89 u90 u91 u92 u93 u94 u95 u96 u97 u98 u99 u100 u101 u102 u103 u104 u105 u106 u107 u108 u109 u110 u111 u112 u113 u114 u115 u116 u117 u118 u119 u120 u121 u122 u123 u124 u125 u126 u127 u128 u129 u130 u131 u132 u133 u134 u135 u136 u137 u138 u139 u140 u141 u142 u143 u144 u145 u146 u147 u148 u149 u150 u151 u152 u153 u154 u155 u156 u157 u158 u159 u160 u161 u162 u163 u164 u165 u166 u167 u168 u169 u170 u171 u172 u173 u174 u175 u176 u177 u178 u179 u180 u181 u182 u183 u184 u185 u186 u187 u188 u189 u190 u191 u192 u193 u194 u195 u196 u197 u198 u199 u200 u201 u202 u203 u204 u205 u206 u207 u208 u209 u210 u211 u212 u213 u214 u215 u216 u217 u218 u219 u220 u221 u222 u223 u224 u225 u226 u227 u228 u229 u230 u231 u232 u233 u234 u235 u236 u237 u238 u239 u240 u241 u242 u243 u244 u245 u246 u247 u248 u249 u250 u251 u252 u253 u254 u255))
      (x-info {x-prev: x_prev, x: new_x, c: c, b: b, D: D})
      (x_output (get x (fold x-for-loop iterations x-info)))
      
      )
      x_output
    )
)

;; lines 387 - 397 https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy
;; TODO: implement clarity version of break where same y-info map is returned
;; make private
(define-read-only (x-for-loop (n uint) (x-info {x-prev: uint, x: uint, c: uint, b: uint, D: uint}))
    ;; """
    ;; Calculate x[i] if one reduces D from being calculated for xp to D
    ;; Done by solving quadratic equation iteratively.
    ;; x_1**2 + x1 * (sum' - (A*n**n - 1) * D / (A * n**n)) = D ** (n + 1) / (n ** (2 * n) * prod' * A)
    ;; x_1**2 + b*x_1 = c
    ;; x_1 = (x_1**2 + c) / (2*x_1 + b)
    ;; """
  (let (
      (c (get c x-info))
      (b (get b x-info))
      (D (get D x-info))
      (x_prev (get x-prev x-info))
      (x (get x x-info))
      (new_x_numerator (+ (* x x) c)) ;; (y*y + c)
      (new_x_denominator (- (+ (* u2 x) b) D)) ;; (2 * y + b - D)
      (new_x (/ new_x_numerator new_x_denominator))
      
      (bigger-x (> new_x x))
      (small-diff (is-eq new_x x)) ;;x - x-prev <= 1, but dealing w/ uint so checking if equal. runtime error if x = u0 OR (2 * x + b - D) < 0
      (converged (and bigger-x small-diff))

      (x-info-updated (if converged 
          x-info ;; if small-diff, don't update
          (merge x-info {
            x-prev: x,
            x: new_x
          })
        )
      )
    ) 
    x-info-updated
  )
)

;; should be subject to a governance vote
;; for now, only contract owner can do this
;; should only be allowed to set to true? what if gov wants to vote on stopping a trading pair?
(define-public (set-pair-approval (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (tradeable bool))
  (let (
    (x-contract (contract-of token-x-trait))
    (y-contract (contract-of token-y-trait))
    (who tx-sender)
    ) 
    (begin 
      (asserts! (is-eq who CONTRACT_OWNER) UNAUTHORIZED_PAIR_ADJUSTMENT)
      (map-set ApprovedPairs 
        {token-x-contract: x-contract, token-y-contract: y-contract}
        {approval: tradeable}
      )
      (ok tradeable)
    )
  )
)