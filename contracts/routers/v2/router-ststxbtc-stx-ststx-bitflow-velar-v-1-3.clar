;; router-ststxbtc-stx-ststx-bitflow-velar-v-1-3

(use-trait ft-trait 'SP2AKWJYC7BNY18W1XXKPGP0YVEK63QJG4793Z2D4.sip-010-trait-ft-standard.sip-010-trait)
(use-trait share-fee-to-trait 'SP1Y5YSTAHZ88XYK1VPDH24GY0HPX5J4JECTMY4A1.univ2-share-fee-to-trait.share-fee-to-trait)
(use-trait ststx-ststxbtc-reserve-trait 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.reserve-trait-v1.reserve-trait)

(define-constant BPS u1000000)

(define-public (get-quote-a
    (amount uint) (provider (optional principal))
    (id uint) (reversed bool)
    (swap-fee (tuple (num uint) (den uint)))
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (quote-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (quote-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 get-quote-a
            amount provider id reversed swap-fee))
    ))
    (quote-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 get-quote-a
            quote-a provider id reversed swap-fee))
      (try! (quote-ststx-ststxbtc quote-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok quote-b)
  )
)

(define-public (get-quote-b
    (amount uint) (provider (optional principal))
    (id uint) (reversed bool)
    (swap-fee (tuple (num uint) (den uint)))
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (quote-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (quote-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 get-quote-b
            amount provider id reversed swap-fee))
    ))
    (quote-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 get-quote-b
            quote-a provider id reversed swap-fee))
      (try! (quote-ststx-ststxbtc quote-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok quote-b)
  )
)

(define-public (swap-helper-a
    (amount uint) (min-received uint) (provider (optional principal))
    (id uint)
    (token0 <ft-trait>) (token1 <ft-trait>)
    (token-in <ft-trait>) (token-out <ft-trait>)
    (share-fee-to <share-fee-to-trait>)
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (swap-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (swap-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 swap-helper-a
            amount min-received provider id token0 token1 token-in token-out share-fee-to))
    ))
    (swap-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 swap-helper-a
            swap-a min-received provider id token0 token1 token-in token-out share-fee-to))
      (try! (swap-ststx-ststxbtc swap-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok swap-b)
  )
)

(define-public (swap-helper-b
    (amount uint) (min-received uint) (provider (optional principal))
    (id uint)
    (token0 <ft-trait>) (token1 <ft-trait>)
    (token-in <ft-trait>) (token-out <ft-trait>)
    (share-fee-to <share-fee-to-trait>)
    (ststx-ststxbtc-path-reversed bool) (ststx-ststxbtc-calls-reversed bool) (ststx-ststxbtc-reserve <ststx-ststxbtc-reserve-trait>)
  )
  (let (
    (swap-a (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (swap-ststx-ststxbtc amount ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 swap-helper-b
            amount min-received provider id token0 token1 token-in token-out share-fee-to))
    ))
    (swap-b (if (is-eq ststx-ststxbtc-calls-reversed false)
      (try! (contract-call? .router-stx-ststx-bitflow-velar-v-1-3 swap-helper-b
            swap-a min-received provider id token0 token1 token-in token-out share-fee-to))
      (try! (swap-ststx-ststxbtc swap-a ststx-ststxbtc-reserve ststx-ststxbtc-path-reversed))
    ))
  )
    (ok swap-b)
  )
)

(define-private (quote-ststx-ststxbtc (amount uint) (reserve <ststx-ststxbtc-reserve-trait>) (reversed bool))
  (let (
    (stx-ststx (try! (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.data-core-v2 get-stx-per-ststx
                     reserve)))
    (quote-a (if (is-eq reversed false)
                 (/ (* amount stx-ststx) BPS)
                 (/ (* amount BPS) stx-ststx)))
  )
    (ok quote-a)
  )
)

(define-private (swap-ststx-ststxbtc (amount uint) (reserve <ststx-ststxbtc-reserve-trait>) (reversed bool))
  (ok (if (is-eq reversed false)
      (try! (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.swap-ststx-ststxbtc-v1 swap-ststx-for-ststxbtc amount reserve))
      (try! (contract-call? 'SP4SZE494VC2YC5JYG7AYFQ44F5Q4PYV7DVMDPBG.swap-ststx-ststxbtc-v1 swap-ststxbtc-for-ststx amount reserve))
  ))
)