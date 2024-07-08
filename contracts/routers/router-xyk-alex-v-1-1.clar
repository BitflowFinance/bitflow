;; router-xyk-alex-v-1-1

(use-trait xyk-ft-trait 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait)
(use-trait alex-ft-trait 'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.trait-sip-010.sip-010-trait)
(use-trait xyk-pool-trait 'SM1793C4R5PZ4NS4VQ4WMP7SKKYVH8JZEWSZ9HCCR.xyk-pool-trait-v-1-1.xyk-pool-trait)

(define-constant ERR_NOT_AUTHORIZED (err u1001))
(define-constant ERR_INVALID_AMOUNT (err u1002))
(define-constant ERR_INVALID_PRINCIPAL (err u1003))
(define-constant ERR_ALREADY_ADMIN (err u2001))
(define-constant ERR_ADMIN_LIMIT_REACHED (err u2002))
(define-constant ERR_ADMIN_NOT_IN_LIST (err u2003))
(define-constant ERR_CANNOT_REMOVE_CONTRACT_DEPLOYER (err u2004))
(define-constant ERR_SWAP_STATUS (err u4001))
(define-constant ERR_MINIMUM_RECEIVED (err u4002))
(define-constant ERR_SWAP_A (err u5001))
(define-constant ERR_SWAP_B (err u5002))

(define-constant CONTRACT_DEPLOYER tx-sender)

(define-data-var admins (list 5 principal) (list tx-sender))
(define-data-var admin-helper principal tx-sender)

(define-data-var swap-status bool true)

(define-read-only (get-admins)
  (ok (var-get admins))
)

(define-read-only (get-admin-helper)
  (ok (var-get admin-helper))
)

(define-read-only (get-swap-status)
  (ok (var-get swap-status))
)

(define-public (get-quote-a
    (amount uint)
    (pool-trait <xyk-pool-trait>)
    (xyk-reversed bool)
    (token-x principal) (token-y principal)
    (factor uint)
  )
  (let (
    (quote-a (if (is-eq xyk-reversed false)
                 (try! (contract-call? pool-trait get-dy amount))
                 (try! (contract-call? pool-trait get-dx amount))))
    (quote-b (unwrap-panic (contract-call?
                           'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 get-helper
                           token-x token-y
                           (* factor u1000000)
                           (* quote-a factor))))
  )
    (ok (/ quote-b factor))
  )
)

(define-public (get-quote-b
    (amount uint)
    (pool-trait <xyk-pool-trait>)
    (xyk-reversed bool)
    (token-x principal) (token-y principal)
    (factor uint)
  )
  (let (
    (quote-a (unwrap-panic (contract-call?
                           'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 get-helper
                           token-x token-y
                           (* factor u1000000)
                           (* amount factor))))
    (quote-b (if (is-eq xyk-reversed false)
                 (try! (contract-call? pool-trait get-dy (/ quote-a factor)))
                 (try! (contract-call? pool-trait get-dx (/ quote-a factor)))))
  )
    (ok quote-b)
  )
)

(define-public (set-swap-status (status bool))
  (let (
    (admins-list (var-get admins))
    (caller tx-sender)
  )
    (begin
      (asserts! (is-some (index-of admins-list caller)) ERR_NOT_AUTHORIZED)
      (var-set swap-status status)
      (print {action: "set-swap-status", caller: caller, data: {status: status}})
      (ok true)
    )
  )
)

(define-public (add-admin (admin principal))
  (let (
    (admins-list (var-get admins))
    (caller tx-sender)
  )
    (asserts! (is-some (index-of admins-list caller)) ERR_NOT_AUTHORIZED)
    (asserts! (is-none (index-of admins-list admin)) ERR_ALREADY_ADMIN)
    (asserts! (is-standard admin) ERR_INVALID_PRINCIPAL)
    (var-set admins (unwrap! (as-max-len? (append admins-list admin) u5) ERR_ADMIN_LIMIT_REACHED))
    (print {action: "add-admin", caller: caller, data: {admin: admin}})
    (ok true)
  )
)

(define-public (remove-admin (admin principal))
  (let (
    (admins-list (var-get admins))
    (caller-in-list (index-of admins-list tx-sender))
    (admin-to-remove-in-list (index-of admins-list admin))
    (caller tx-sender)
  )
    (asserts! (is-some caller-in-list) ERR_NOT_AUTHORIZED)
    (asserts! (is-some admin-to-remove-in-list) ERR_ADMIN_NOT_IN_LIST)
    (asserts! (not (is-eq admin CONTRACT_DEPLOYER)) ERR_CANNOT_REMOVE_CONTRACT_DEPLOYER)
    (asserts! (is-standard admin) ERR_INVALID_PRINCIPAL)
    (var-set admin-helper admin)
    (var-set admins (filter admin-not-removeable admins-list))
    (print {action: "remove-admin", caller: caller, data: {admin: admin}})
    (ok true)
  )
)

(define-public (swap-helper-a
    (amount uint) (min-received uint)
    (pool-trait <xyk-pool-trait>)
    (x-token-trait <xyk-ft-trait>) (y-token-trait <xyk-ft-trait>)
    (xyk-reversed bool)
    (token-x-trait <alex-ft-trait>) (token-y-trait <alex-ft-trait>)
    (factor uint)
  )
  (let (
    (swap-a (if (is-eq xyk-reversed false)
                (unwrap! (xyk-a pool-trait x-token-trait y-token-trait amount) ERR_SWAP_A)
                (unwrap! (xyk-b pool-trait x-token-trait y-token-trait amount) ERR_SWAP_A)))
    (swap-b (unwrap! (alex-a token-x-trait token-y-trait factor swap-a) ERR_SWAP_B))
    (caller tx-sender)
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (asserts! (> factor u0) ERR_INVALID_AMOUNT)
      (asserts! (>= swap-b min-received) ERR_MINIMUM_RECEIVED)
      (print {
        action: "swap-helper-a",
        caller: caller, 
        data: {
          amount: amount,
          min-received: min-received,
          received: swap-b,
          pool-trait: (contract-of pool-trait),
          x-token-trait: (contract-of x-token-trait),
          y-token-trait: (contract-of y-token-trait),
          xyk-reversed: xyk-reversed,
          token-x-trait: (contract-of token-x-trait),
          token-y-trait: (contract-of token-y-trait),
          factor: factor
        }
      })
      (ok swap-b)
    )
  )
)

(define-public (swap-helper-b
    (amount uint) (min-received uint)
    (pool-trait <xyk-pool-trait>)
    (x-token-trait <xyk-ft-trait>) (y-token-trait <xyk-ft-trait>)
    (xyk-reversed bool)
    (token-x-trait <alex-ft-trait>) (token-y-trait <alex-ft-trait>)
    (factor uint)
  )
  (let (
    (swap-a (unwrap! (alex-a token-x-trait token-y-trait factor amount) ERR_SWAP_A))
    (swap-b (if (is-eq xyk-reversed false)
                (unwrap! (xyk-a pool-trait x-token-trait y-token-trait swap-a) ERR_SWAP_B)
                (unwrap! (xyk-b pool-trait x-token-trait y-token-trait swap-a) ERR_SWAP_B)))
    (caller tx-sender)
  )
    (begin
      (asserts! (is-eq (var-get swap-status) true) ERR_SWAP_STATUS)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (asserts! (> factor u0) ERR_INVALID_AMOUNT)
      (asserts! (>= swap-b min-received) ERR_MINIMUM_RECEIVED)
      (print {
        action: "swap-helper-b",
        caller: caller, 
        data: {
          amount: amount,
          min-received: min-received,
          received: swap-b,
          pool-trait: (contract-of pool-trait),
          x-token-trait: (contract-of x-token-trait),
          y-token-trait: (contract-of y-token-trait),
          xyk-reversed: xyk-reversed,
          token-x-trait: (contract-of token-x-trait),
          token-y-trait: (contract-of token-y-trait),
          factor: factor
        }
      })
      (ok swap-b)
    )
  )
)

(define-private (xyk-a
    (pool-trait <xyk-pool-trait>)
    (x-token-trait <xyk-ft-trait>) (y-token-trait <xyk-ft-trait>)
    (x-amount uint)
  )
  (let (
    (swap-a (try! (contract-call?
                  'SM1793C4R5PZ4NS4VQ4WMP7SKKYVH8JZEWSZ9HCCR.xyk-core-v-1-1 swap-x-for-y
                  pool-trait
                  x-token-trait y-token-trait
                  x-amount u1)))
  )
    (ok swap-a)
  )
)

(define-private (xyk-b
    (pool-trait <xyk-pool-trait>)
    (x-token-trait <xyk-ft-trait>) (y-token-trait <xyk-ft-trait>)
    (y-amount uint)
  )
  (let (
    (swap-a (try! (contract-call?
                  'SM1793C4R5PZ4NS4VQ4WMP7SKKYVH8JZEWSZ9HCCR.xyk-core-v-1-1 swap-y-for-x
                  pool-trait
                  x-token-trait y-token-trait
                  y-amount u1)))
  )
    (ok swap-a)
  )
)

(define-private (alex-a
    (token-x-trait <alex-ft-trait>) (token-y-trait <alex-ft-trait>)
    (factor uint)
    (dx uint)
  )
  (let (
    (swap-a (try! (contract-call?
                  'SP102V8P0F7JX67ARQ77WEA3D3CFB5XW39REDT0AM.amm-pool-v2-01 swap-helper
                  token-x-trait token-y-trait
                  (* factor u1000000)
                  (* dx factor) (some u1))))
  )
    (ok (/ swap-a factor))
  )
)

(define-private (admin-not-removeable (admin principal))
  (not (is-eq admin (var-get admin-helper)))
)
