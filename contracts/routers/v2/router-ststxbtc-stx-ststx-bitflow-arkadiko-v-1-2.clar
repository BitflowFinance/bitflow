;; router-ststxbtc-stx-ststx-bitflow-arkadiko-v-1-2

(use-trait ft-trait 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait)
(use-trait ststx-ststxbtc-reserve-trait 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.reserve-trait-v1.reserve-trait)

(define-public (swap-helper-a
    (amount uint) (min-received uint) (provider (optional principal))
    (token-x-trait <ft-trait>) (token-y-trait <ft-trait>)
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (swap-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (swap-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-arkadiko-v-1-2 swap-helper-a
            amount min-received provider token-x-trait token-y-trait))
    ))
    (swap-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-arkadiko-v-1-2 swap-helper-a
            swap-a min-received provider token-x-trait token-y-trait))
      (try! (swap-ststx-ststxbtc swap-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok swap-b)
  )
)

(define-public (swap-helper-b
    (amount uint) (min-received uint) (provider (optional principal))
    (token-x-trait <ft-trait>) (token-y-trait <ft-trait>)
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (swap-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (swap-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-arkadiko-v-1-2 swap-helper-b
            amount min-received provider token-x-trait token-y-trait))
    ))
    (swap-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-arkadiko-v-1-2 swap-helper-b
            swap-a min-received provider token-x-trait token-y-trait))
      (try! (swap-ststx-ststxbtc swap-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok swap-b)
  )
)

(define-private (swap-ststx-ststxbtc (amount uint) (reserve <ststx-ststxbtc-reserve-trait>) (reversed bool))
  (ok (if (is-eq reversed false)
      (try! (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.swap-ststx-ststxbtc-v1 swap-ststx-for-ststxbtc amount reserve))
      (try! (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.swap-ststx-ststxbtc-v1 swap-ststxbtc-for-ststx amount reserve))
  ))
)