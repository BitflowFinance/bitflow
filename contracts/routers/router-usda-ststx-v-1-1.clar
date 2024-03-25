(define-constant ERR_NOT_AUTHORIZED (err u1001))
(define-constant ERR_INVALID_AMOUNT (err u1002))
(define-constant ERR_CALL_A (err u1003))
(define-constant ERR_CALL_B (err u1004))
(define-constant ERR_ROUTER_STATUS (err u1005))
(define-constant ERR_MINIMUM_OUTPUT (err u1006))

(define-data-var contract-owner principal tx-sender)
(define-data-var router-status bool true)

(define-read-only (get-contract-owner)
  (ok (var-get contract-owner))
)

(define-read-only (get-router-status)
  (ok (var-get router-status))
)

(define-read-only (get-route-a-output (amount uint))
  (let (
    (stxAmount (unwrap-panic (contract-call? 
       'SPEXN2X0M0CJ55K8GAJZEEH3A0JP64ZE7XD9XMKY.industrial-purple-falcon get-dx
       'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token
       'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token
       amount)))
    (stStxAmount (unwrap-panic (contract-call?
        'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 get-dy
        'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token
        'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2
        stxAmount)))
  )
    (ok stStxAmount)
  )
)

(define-read-only (get-route-b-output (amount uint))
  (let (
    (stStxAmount (unwrap-panic (contract-call?
        'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 get-dx
        'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token
        'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2
        amount)))
    (usdaAmount (unwrap-panic (contract-call? 
       'SPEXN2X0M0CJ55K8GAJZEEH3A0JP64ZE7XD9XMKY.industrial-purple-falcon get-dy
       'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token
       'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token
       stStxAmount)))
  )
    (ok usdaAmount)
  )
)

(define-public (swap-route-a (amount uint) (min-output uint))
  (let (
    (a (unwrap! (arkadiko-a amount) ERR_CALL_A))
    (b (unwrap! (bitflow-a a) ERR_CALL_B))
  )
    (begin
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (asserts! (is-eq (var-get router-status) true) ERR_ROUTER_STATUS)
      (asserts! (>= b min-output) ERR_MINIMUM_OUTPUT)
      (print {action: "swap-route-a", sender: tx-sender, amount: amount, output: b, min-output: min-output})
      (ok b)
    )
  )
)

(define-public (swap-route-b (amount uint) (min-output uint))
  (let (
    (a (unwrap! (bitflow-b amount) ERR_CALL_A))
    (b (unwrap! (arkadiko-b a) ERR_CALL_B))
  )
    (begin
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (asserts! (is-eq (var-get router-status) true) ERR_ROUTER_STATUS)
      (asserts! (>= b min-output) ERR_MINIMUM_OUTPUT)
      (print {action: "swap-route-b", sender: tx-sender, amount: amount, output: b, min-output: min-output})
      (ok b)
    )
  )
)

(define-public (set-router-status (status bool))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) ERR_NOT_AUTHORIZED)
    (ok (var-set router-status status))
  )
)

(define-public (set-contract-owner (address principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) ERR_NOT_AUTHORIZED)
    (ok (var-set contract-owner address))
  )
)

(define-private (bitflow-a (amount uint))
  (let (
    (bitflowSwapResult (try! (contract-call?
          'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 swap-x-for-y
          'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token
          'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2
          amount u0)))
  )
    (ok bitflowSwapResult)
  )
)

(define-private (bitflow-b (amount uint))
  (let (
    (bitflowSwapResult (try! (contract-call?
          'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stableswap-stx-ststx-v-1-2 swap-y-for-x
          'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.ststx-token
          'SPQC38PW542EQJ5M11CR25P7BS1CA6QT4TBXGB3M.stx-ststx-lp-token-v-1-2
          amount u0)))
  )
    (ok bitflowSwapResult)
  )
)

(define-private (arkadiko-a (amount uint))
  (let (
    (arkadikoSwapResult (try! (contract-call?
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-y-for-x
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token
          amount u0)))
  )
    (ok arkadikoSwapResult)
  )
)

(define-private (arkadiko-b (amount uint))
  (let (
    (arkadikoSwapResult (try! (contract-call?
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.arkadiko-swap-v2-1 swap-x-for-y
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.wrapped-stx-token
          'SP2C2YFP12AJZB4MABJBAJ55XECVS7E4PMMZ89YZR.usda-token
          amount u0)))
  )
    (ok arkadikoSwapResult)
  )
)
