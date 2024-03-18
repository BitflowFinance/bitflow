;; Contract that calculates the estimated output for a swap via:
;; SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1

(define-constant ERR_PAIR_EXTERNAL (err "err-pair-external"))
(define-constant ERR_BALANCE_X (err "err-balance-x"))
(define-constant ERR_BALANCE_Y (err "err-balance-y"))

(define-read-only (get-dy (token-x principal) (token-y principal) (dx uint))
  (let (
    (pair-external (unwrap! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details token-x token-y) ERR_PAIR_EXTERNAL))
    (balance-x (unwrap! (get balance-x pair-external) ERR_BALANCE_X))
    (balance-y (unwrap! (get balance-y pair-external) ERR_BALANCE_Y))
    (dx-with-fees (/ (* u997 dx) u1000))
    (dy (/ (* balance-y dx-with-fees) (+ balance-x dx-with-fees)))
  )
    (ok dy)
  )
)

(define-read-only (get-dx (token-x principal) (token-y principal) (dy uint))
  (let (
    (pair-external (unwrap! (contract-call? 'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 get-pair-details token-x token-y) ERR_PAIR_EXTERNAL))
    (balance-x (unwrap! (get balance-x pair-external) ERR_BALANCE_X))
    (balance-y (unwrap! (get balance-y pair-external) ERR_BALANCE_Y))
    (dy-with-fees (/ (* u997 dy) u1000))
    (dx (/ (* balance-x dy-with-fees) (+ balance-y dy-with-fees)))
  )
    (ok dx)
  )
)
