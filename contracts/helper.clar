(use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

(define-constant PANIC_ERR (err u12))


(define-read-only (get-rewards-at-cycle (rewardCycle uint) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
    (contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v5 get-rewards-at-cycle rewardCycle who token-x-trait token-y-trait lp-token-trait xbtc-token-trait)
)

(define-read-only (get-rewards-and-principal-sum (list-of-cycles (list 1000 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
    (let (
      (txt token-x-trait)
      (tyt token-y-trait)
      (lpt lp-token-trait)
      (btt xbtc-token-trait)
      (list-of-cycle-rewards 
        (map 
          get-rewards-at-cycle
          list-of-cycles
          (list who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who who who who who who who who 
          who who who who who who who who who who who)
          (list txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
           txt txt txt txt txt txt txt txt txt txt txt txt txt)
          (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
          tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt)
          (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
          lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
          (list btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
          btt btt btt btt btt btt btt btt btt btt btt btt btt)        
        )
      )

      (list0 (match (element-at list-of-cycle-rewards u0) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list1 (match (element-at list-of-cycle-rewards u1) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list2 (match (element-at list-of-cycle-rewards u2) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list3 (match (element-at list-of-cycle-rewards u3) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list4 (match (element-at list-of-cycle-rewards u4) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list5 (match (element-at list-of-cycle-rewards u5) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list6 (match (element-at list-of-cycle-rewards u6) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list7 (match (element-at list-of-cycle-rewards u7) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list8 (match (element-at list-of-cycle-rewards u8) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list9 (match (element-at list-of-cycle-rewards u9) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list10 (match (element-at list-of-cycle-rewards u10) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list11 (match (element-at list-of-cycle-rewards u11) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list12 (match (element-at list-of-cycle-rewards u12) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list13 (match (element-at list-of-cycle-rewards u13) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list14 (match (element-at list-of-cycle-rewards u14) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list15 (match (element-at list-of-cycle-rewards u15) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list16 (match (element-at list-of-cycle-rewards u16) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list17 (match (element-at list-of-cycle-rewards u17) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list18 (match (element-at list-of-cycle-rewards u18) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list19 (match (element-at list-of-cycle-rewards u19) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list20 (match (element-at list-of-cycle-rewards u20) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list21 (match (element-at list-of-cycle-rewards u21) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list22 (match (element-at list-of-cycle-rewards u22) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list23 (match (element-at list-of-cycle-rewards u23) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list24 (match (element-at list-of-cycle-rewards u24) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list25 (match (element-at list-of-cycle-rewards u25) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list26 (match (element-at list-of-cycle-rewards u26) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list27 (match (element-at list-of-cycle-rewards u27) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list28 (match (element-at list-of-cycle-rewards u28) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list29 (match (element-at list-of-cycle-rewards u29) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list30 (match (element-at list-of-cycle-rewards u30) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list31 (match (element-at list-of-cycle-rewards u31) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list32 (match (element-at list-of-cycle-rewards u32) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list33 (match (element-at list-of-cycle-rewards u33) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list34 (match (element-at list-of-cycle-rewards u34) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list35 (match (element-at list-of-cycle-rewards u35) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list36 (match (element-at list-of-cycle-rewards u36) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list37 (match (element-at list-of-cycle-rewards u37) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list38 (match (element-at list-of-cycle-rewards u38) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list39 (match (element-at list-of-cycle-rewards u39) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list40 (match (element-at list-of-cycle-rewards u40) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list41 (match (element-at list-of-cycle-rewards u41) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list42 (match (element-at list-of-cycle-rewards u42) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list43 (match (element-at list-of-cycle-rewards u43) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list44 (match (element-at list-of-cycle-rewards u44) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list45 (match (element-at list-of-cycle-rewards u45) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list46 (match (element-at list-of-cycle-rewards u46) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list47 (match (element-at list-of-cycle-rewards u47) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list48 (match (element-at list-of-cycle-rewards u48) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list49 (match (element-at list-of-cycle-rewards u49) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list50 (match (element-at list-of-cycle-rewards u50) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list51 (match (element-at list-of-cycle-rewards u51) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list52 (match (element-at list-of-cycle-rewards u52) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list53 (match (element-at list-of-cycle-rewards u53) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list54 (match (element-at list-of-cycle-rewards u54) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list55 (match (element-at list-of-cycle-rewards u55) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list56 (match (element-at list-of-cycle-rewards u56) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list57 (match (element-at list-of-cycle-rewards u57) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list58 (match (element-at list-of-cycle-rewards u58) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list59 (match (element-at list-of-cycle-rewards u59) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list60 (match (element-at list-of-cycle-rewards u60) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list61 (match (element-at list-of-cycle-rewards u61) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list62 (match (element-at list-of-cycle-rewards u62) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list63 (match (element-at list-of-cycle-rewards u63) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list64 (match (element-at list-of-cycle-rewards u64) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list65 (match (element-at list-of-cycle-rewards u65) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list66 (match (element-at list-of-cycle-rewards u66) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list67 (match (element-at list-of-cycle-rewards u67) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list68 (match (element-at list-of-cycle-rewards u68) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list69 (match (element-at list-of-cycle-rewards u69) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list70 (match (element-at list-of-cycle-rewards u70) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list71 (match (element-at list-of-cycle-rewards u71) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list72 (match (element-at list-of-cycle-rewards u72) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list73 (match (element-at list-of-cycle-rewards u73) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list74 (match (element-at list-of-cycle-rewards u74) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list75 (match (element-at list-of-cycle-rewards u75) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list76 (match (element-at list-of-cycle-rewards u76) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list77 (match (element-at list-of-cycle-rewards u77) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list78 (match (element-at list-of-cycle-rewards u78) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list79 (match (element-at list-of-cycle-rewards u79) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list80 (match (element-at list-of-cycle-rewards u80) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list81 (match (element-at list-of-cycle-rewards u81) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list82 (match (element-at list-of-cycle-rewards u82) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list83 (match (element-at list-of-cycle-rewards u83) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list84 (match (element-at list-of-cycle-rewards u84) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list85 (match (element-at list-of-cycle-rewards u85) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list86 (match (element-at list-of-cycle-rewards u86) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list87 (match (element-at list-of-cycle-rewards u87) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list88 (match (element-at list-of-cycle-rewards u88) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list89 (match (element-at list-of-cycle-rewards u89) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list90 (match (element-at list-of-cycle-rewards u90) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list91 (match (element-at list-of-cycle-rewards u91) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list92 (match (element-at list-of-cycle-rewards u92) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list93 (match (element-at list-of-cycle-rewards u93) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list94 (match (element-at list-of-cycle-rewards u94) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list95 (match (element-at list-of-cycle-rewards u95) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list96 (match (element-at list-of-cycle-rewards u96) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list97 (match (element-at list-of-cycle-rewards u97) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list98 (match (element-at list-of-cycle-rewards u98) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list99 (match (element-at list-of-cycle-rewards u99) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list100 (match (element-at list-of-cycle-rewards u100) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list101 (match (element-at list-of-cycle-rewards u101) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list102 (match (element-at list-of-cycle-rewards u102) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list103 (match (element-at list-of-cycle-rewards u103) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list104 (match (element-at list-of-cycle-rewards u104) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list105 (match (element-at list-of-cycle-rewards u105) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list106 (match (element-at list-of-cycle-rewards u106) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list107 (match (element-at list-of-cycle-rewards u107) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list108 (match (element-at list-of-cycle-rewards u108) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list109 (match (element-at list-of-cycle-rewards u109) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list110 (match (element-at list-of-cycle-rewards u110) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list111 (match (element-at list-of-cycle-rewards u111) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list112 (match (element-at list-of-cycle-rewards u112) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list113 (match (element-at list-of-cycle-rewards u113) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list114 (match (element-at list-of-cycle-rewards u114) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list115 (match (element-at list-of-cycle-rewards u115) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list116 (match (element-at list-of-cycle-rewards u116) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list117 (match (element-at list-of-cycle-rewards u117) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list118 (match (element-at list-of-cycle-rewards u118) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list119 (match (element-at list-of-cycle-rewards u119) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list120 (match (element-at list-of-cycle-rewards u120) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list121 (match (element-at list-of-cycle-rewards u121) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list122 (match (element-at list-of-cycle-rewards u122) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list123 (match (element-at list-of-cycle-rewards u123) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list124 (match (element-at list-of-cycle-rewards u124) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list125 (match (element-at list-of-cycle-rewards u125) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list126 (match (element-at list-of-cycle-rewards u126) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list127 (match (element-at list-of-cycle-rewards u127) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list128 (match (element-at list-of-cycle-rewards u128) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list129 (match (element-at list-of-cycle-rewards u129) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list130 (match (element-at list-of-cycle-rewards u130) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list131 (match (element-at list-of-cycle-rewards u131) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list132 (match (element-at list-of-cycle-rewards u132) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list133 (match (element-at list-of-cycle-rewards u133) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list134 (match (element-at list-of-cycle-rewards u134) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list135 (match (element-at list-of-cycle-rewards u135) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list136 (match (element-at list-of-cycle-rewards u136) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list137 (match (element-at list-of-cycle-rewards u137) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list138 (match (element-at list-of-cycle-rewards u138) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list139 (match (element-at list-of-cycle-rewards u139) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list140 (match (element-at list-of-cycle-rewards u140) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list141 (match (element-at list-of-cycle-rewards u141) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list142 (match (element-at list-of-cycle-rewards u142) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list143 (match (element-at list-of-cycle-rewards u143) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list144 (match (element-at list-of-cycle-rewards u144) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list145 (match (element-at list-of-cycle-rewards u145) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list146 (match (element-at list-of-cycle-rewards u146) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list147 (match (element-at list-of-cycle-rewards u147) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list148 (match (element-at list-of-cycle-rewards u148) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list149 (match (element-at list-of-cycle-rewards u149) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list150 (match (element-at list-of-cycle-rewards u150) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list151 (match (element-at list-of-cycle-rewards u151) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list152 (match (element-at list-of-cycle-rewards u152) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list153 (match (element-at list-of-cycle-rewards u153) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list154 (match (element-at list-of-cycle-rewards u154) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list155 (match (element-at list-of-cycle-rewards u155) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list156 (match (element-at list-of-cycle-rewards u156) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list157 (match (element-at list-of-cycle-rewards u157) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list158 (match (element-at list-of-cycle-rewards u158) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list159 (match (element-at list-of-cycle-rewards u159) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list160 (match (element-at list-of-cycle-rewards u160) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list161 (match (element-at list-of-cycle-rewards u161) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list162 (match (element-at list-of-cycle-rewards u162) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list163 (match (element-at list-of-cycle-rewards u163) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list164 (match (element-at list-of-cycle-rewards u164) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list165 (match (element-at list-of-cycle-rewards u165) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list166 (match (element-at list-of-cycle-rewards u166) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list167 (match (element-at list-of-cycle-rewards u167) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list168 (match (element-at list-of-cycle-rewards u168) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list169 (match (element-at list-of-cycle-rewards u169) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list170 (match (element-at list-of-cycle-rewards u170) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list171 (match (element-at list-of-cycle-rewards u171) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list172 (match (element-at list-of-cycle-rewards u172) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list173 (match (element-at list-of-cycle-rewards u173) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list174 (match (element-at list-of-cycle-rewards u174) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list175 (match (element-at list-of-cycle-rewards u175) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list176 (match (element-at list-of-cycle-rewards u176) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list177 (match (element-at list-of-cycle-rewards u177) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list178 (match (element-at list-of-cycle-rewards u178) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list179 (match (element-at list-of-cycle-rewards u179) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list180 (match (element-at list-of-cycle-rewards u180) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list181 (match (element-at list-of-cycle-rewards u181) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list182 (match (element-at list-of-cycle-rewards u182) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list183 (match (element-at list-of-cycle-rewards u183) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list184 (match (element-at list-of-cycle-rewards u184) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list185 (match (element-at list-of-cycle-rewards u185) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list186 (match (element-at list-of-cycle-rewards u186) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list187 (match (element-at list-of-cycle-rewards u187) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list188 (match (element-at list-of-cycle-rewards u188) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list189 (match (element-at list-of-cycle-rewards u189) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list190 (match (element-at list-of-cycle-rewards u190) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list191 (match (element-at list-of-cycle-rewards u191) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list192 (match (element-at list-of-cycle-rewards u192) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list193 (match (element-at list-of-cycle-rewards u193) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list194 (match (element-at list-of-cycle-rewards u194) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list195 (match (element-at list-of-cycle-rewards u195) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list196 (match (element-at list-of-cycle-rewards u196) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list197 (match (element-at list-of-cycle-rewards u197) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list198 (match (element-at list-of-cycle-rewards u198) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list199 (match (element-at list-of-cycle-rewards u199) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list200 (match (element-at list-of-cycle-rewards u200) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list201 (match (element-at list-of-cycle-rewards u201) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list202 (match (element-at list-of-cycle-rewards u202) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list203 (match (element-at list-of-cycle-rewards u203) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list204 (match (element-at list-of-cycle-rewards u204) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list205 (match (element-at list-of-cycle-rewards u205) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list206 (match (element-at list-of-cycle-rewards u206) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list207 (match (element-at list-of-cycle-rewards u207) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list208 (match (element-at list-of-cycle-rewards u208) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list209 (match (element-at list-of-cycle-rewards u209) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list210 (match (element-at list-of-cycle-rewards u210) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list211 (match (element-at list-of-cycle-rewards u211) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list212 (match (element-at list-of-cycle-rewards u212) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list213 (match (element-at list-of-cycle-rewards u213) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list214 (match (element-at list-of-cycle-rewards u214) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list215 (match (element-at list-of-cycle-rewards u215) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list216 (match (element-at list-of-cycle-rewards u216) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list217 (match (element-at list-of-cycle-rewards u217) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list218 (match (element-at list-of-cycle-rewards u218) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list219 (match (element-at list-of-cycle-rewards u219) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list220 (match (element-at list-of-cycle-rewards u220) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list221 (match (element-at list-of-cycle-rewards u221) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list222 (match (element-at list-of-cycle-rewards u222) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list223 (match (element-at list-of-cycle-rewards u223) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list224 (match (element-at list-of-cycle-rewards u224) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list225 (match (element-at list-of-cycle-rewards u225) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list226 (match (element-at list-of-cycle-rewards u226) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list227 (match (element-at list-of-cycle-rewards u227) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list228 (match (element-at list-of-cycle-rewards u228) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list229 (match (element-at list-of-cycle-rewards u229) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list230 (match (element-at list-of-cycle-rewards u230) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list231 (match (element-at list-of-cycle-rewards u231) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list232 (match (element-at list-of-cycle-rewards u232) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list233 (match (element-at list-of-cycle-rewards u233) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list234 (match (element-at list-of-cycle-rewards u234) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list235 (match (element-at list-of-cycle-rewards u235) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list236 (match (element-at list-of-cycle-rewards u236) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list237 (match (element-at list-of-cycle-rewards u237) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list238 (match (element-at list-of-cycle-rewards u238) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list239 (match (element-at list-of-cycle-rewards u239) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list240 (match (element-at list-of-cycle-rewards u240) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list241 (match (element-at list-of-cycle-rewards u241) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list242 (match (element-at list-of-cycle-rewards u242) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list243 (match (element-at list-of-cycle-rewards u243) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list244 (match (element-at list-of-cycle-rewards u244) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list245 (match (element-at list-of-cycle-rewards u245) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list246 (match (element-at list-of-cycle-rewards u246) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list247 (match (element-at list-of-cycle-rewards u247) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list248 (match (element-at list-of-cycle-rewards u248) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list249 (match (element-at list-of-cycle-rewards u249) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list250 (match (element-at list-of-cycle-rewards u250) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list251 (match (element-at list-of-cycle-rewards u251) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list252 (match (element-at list-of-cycle-rewards u252) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list253 (match (element-at list-of-cycle-rewards u253) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list254 (match (element-at list-of-cycle-rewards u254) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list255 (match (element-at list-of-cycle-rewards u255) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list256 (match (element-at list-of-cycle-rewards u256) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list257 (match (element-at list-of-cycle-rewards u257) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list258 (match (element-at list-of-cycle-rewards u258) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list259 (match (element-at list-of-cycle-rewards u259) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list260 (match (element-at list-of-cycle-rewards u260) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list261 (match (element-at list-of-cycle-rewards u261) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list262 (match (element-at list-of-cycle-rewards u262) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list263 (match (element-at list-of-cycle-rewards u263) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list264 (match (element-at list-of-cycle-rewards u264) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list265 (match (element-at list-of-cycle-rewards u265) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list266 (match (element-at list-of-cycle-rewards u266) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list267 (match (element-at list-of-cycle-rewards u267) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list268 (match (element-at list-of-cycle-rewards u268) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list269 (match (element-at list-of-cycle-rewards u269) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list270 (match (element-at list-of-cycle-rewards u270) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list271 (match (element-at list-of-cycle-rewards u271) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list272 (match (element-at list-of-cycle-rewards u272) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list273 (match (element-at list-of-cycle-rewards u273) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list274 (match (element-at list-of-cycle-rewards u274) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list275 (match (element-at list-of-cycle-rewards u275) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list276 (match (element-at list-of-cycle-rewards u276) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list277 (match (element-at list-of-cycle-rewards u277) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list278 (match (element-at list-of-cycle-rewards u278) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list279 (match (element-at list-of-cycle-rewards u279) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list280 (match (element-at list-of-cycle-rewards u280) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list281 (match (element-at list-of-cycle-rewards u281) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list282 (match (element-at list-of-cycle-rewards u282) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list283 (match (element-at list-of-cycle-rewards u283) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list284 (match (element-at list-of-cycle-rewards u284) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list285 (match (element-at list-of-cycle-rewards u285) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list286 (match (element-at list-of-cycle-rewards u286) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list287 (match (element-at list-of-cycle-rewards u287) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list288 (match (element-at list-of-cycle-rewards u288) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list289 (match (element-at list-of-cycle-rewards u289) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list290 (match (element-at list-of-cycle-rewards u290) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list291 (match (element-at list-of-cycle-rewards u291) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list292 (match (element-at list-of-cycle-rewards u292) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list293 (match (element-at list-of-cycle-rewards u293) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list294 (match (element-at list-of-cycle-rewards u294) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list295 (match (element-at list-of-cycle-rewards u295) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list296 (match (element-at list-of-cycle-rewards u296) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list297 (match (element-at list-of-cycle-rewards u297) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list298 (match (element-at list-of-cycle-rewards u298) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list299 (match (element-at list-of-cycle-rewards u299) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list300 (match (element-at list-of-cycle-rewards u300) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list301 (match (element-at list-of-cycle-rewards u301) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list302 (match (element-at list-of-cycle-rewards u302) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list303 (match (element-at list-of-cycle-rewards u303) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list304 (match (element-at list-of-cycle-rewards u304) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list305 (match (element-at list-of-cycle-rewards u305) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list306 (match (element-at list-of-cycle-rewards u306) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list307 (match (element-at list-of-cycle-rewards u307) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list308 (match (element-at list-of-cycle-rewards u308) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list309 (match (element-at list-of-cycle-rewards u309) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list310 (match (element-at list-of-cycle-rewards u310) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list311 (match (element-at list-of-cycle-rewards u311) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list312 (match (element-at list-of-cycle-rewards u312) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list313 (match (element-at list-of-cycle-rewards u313) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list314 (match (element-at list-of-cycle-rewards u314) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list315 (match (element-at list-of-cycle-rewards u315) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list316 (match (element-at list-of-cycle-rewards u316) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list317 (match (element-at list-of-cycle-rewards u317) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list318 (match (element-at list-of-cycle-rewards u318) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list319 (match (element-at list-of-cycle-rewards u319) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list320 (match (element-at list-of-cycle-rewards u320) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list321 (match (element-at list-of-cycle-rewards u321) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list322 (match (element-at list-of-cycle-rewards u322) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list323 (match (element-at list-of-cycle-rewards u323) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list324 (match (element-at list-of-cycle-rewards u324) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list325 (match (element-at list-of-cycle-rewards u325) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list326 (match (element-at list-of-cycle-rewards u326) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list327 (match (element-at list-of-cycle-rewards u327) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list328 (match (element-at list-of-cycle-rewards u328) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list329 (match (element-at list-of-cycle-rewards u329) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list330 (match (element-at list-of-cycle-rewards u330) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list331 (match (element-at list-of-cycle-rewards u331) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list332 (match (element-at list-of-cycle-rewards u332) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list333 (match (element-at list-of-cycle-rewards u333) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list334 (match (element-at list-of-cycle-rewards u334) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list335 (match (element-at list-of-cycle-rewards u335) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list336 (match (element-at list-of-cycle-rewards u336) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list337 (match (element-at list-of-cycle-rewards u337) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list338 (match (element-at list-of-cycle-rewards u338) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list339 (match (element-at list-of-cycle-rewards u339) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list340 (match (element-at list-of-cycle-rewards u340) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list341 (match (element-at list-of-cycle-rewards u341) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list342 (match (element-at list-of-cycle-rewards u342) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list343 (match (element-at list-of-cycle-rewards u343) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list344 (match (element-at list-of-cycle-rewards u344) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list345 (match (element-at list-of-cycle-rewards u345) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list346 (match (element-at list-of-cycle-rewards u346) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list347 (match (element-at list-of-cycle-rewards u347) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list348 (match (element-at list-of-cycle-rewards u348) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list349 (match (element-at list-of-cycle-rewards u349) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list350 (match (element-at list-of-cycle-rewards u350) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list351 (match (element-at list-of-cycle-rewards u351) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list352 (match (element-at list-of-cycle-rewards u352) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list353 (match (element-at list-of-cycle-rewards u353) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list354 (match (element-at list-of-cycle-rewards u354) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list355 (match (element-at list-of-cycle-rewards u355) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list356 (match (element-at list-of-cycle-rewards u356) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list357 (match (element-at list-of-cycle-rewards u357) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list358 (match (element-at list-of-cycle-rewards u358) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list359 (match (element-at list-of-cycle-rewards u359) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list360 (match (element-at list-of-cycle-rewards u360) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list361 (match (element-at list-of-cycle-rewards u361) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list362 (match (element-at list-of-cycle-rewards u362) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list363 (match (element-at list-of-cycle-rewards u363) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list364 (match (element-at list-of-cycle-rewards u364) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list365 (match (element-at list-of-cycle-rewards u365) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list366 (match (element-at list-of-cycle-rewards u366) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list367 (match (element-at list-of-cycle-rewards u367) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list368 (match (element-at list-of-cycle-rewards u368) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list369 (match (element-at list-of-cycle-rewards u369) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list370 (match (element-at list-of-cycle-rewards u370) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list371 (match (element-at list-of-cycle-rewards u371) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list372 (match (element-at list-of-cycle-rewards u372) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list373 (match (element-at list-of-cycle-rewards u373) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list374 (match (element-at list-of-cycle-rewards u374) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list375 (match (element-at list-of-cycle-rewards u375) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list376 (match (element-at list-of-cycle-rewards u376) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list377 (match (element-at list-of-cycle-rewards u377) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list378 (match (element-at list-of-cycle-rewards u378) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list379 (match (element-at list-of-cycle-rewards u379) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list380 (match (element-at list-of-cycle-rewards u380) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list381 (match (element-at list-of-cycle-rewards u381) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list382 (match (element-at list-of-cycle-rewards u382) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list383 (match (element-at list-of-cycle-rewards u383) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list384 (match (element-at list-of-cycle-rewards u384) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list385 (match (element-at list-of-cycle-rewards u385) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list386 (match (element-at list-of-cycle-rewards u386) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list387 (match (element-at list-of-cycle-rewards u387) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list388 (match (element-at list-of-cycle-rewards u388) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list389 (match (element-at list-of-cycle-rewards u389) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list390 (match (element-at list-of-cycle-rewards u390) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list391 (match (element-at list-of-cycle-rewards u391) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list392 (match (element-at list-of-cycle-rewards u392) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list393 (match (element-at list-of-cycle-rewards u393) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list394 (match (element-at list-of-cycle-rewards u394) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list395 (match (element-at list-of-cycle-rewards u395) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list396 (match (element-at list-of-cycle-rewards u396) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list397 (match (element-at list-of-cycle-rewards u397) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list398 (match (element-at list-of-cycle-rewards u398) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list399 (match (element-at list-of-cycle-rewards u399) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list400 (match (element-at list-of-cycle-rewards u400) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list401 (match (element-at list-of-cycle-rewards u401) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list402 (match (element-at list-of-cycle-rewards u402) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list403 (match (element-at list-of-cycle-rewards u403) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list404 (match (element-at list-of-cycle-rewards u404) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list405 (match (element-at list-of-cycle-rewards u405) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list406 (match (element-at list-of-cycle-rewards u406) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list407 (match (element-at list-of-cycle-rewards u407) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list408 (match (element-at list-of-cycle-rewards u408) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list409 (match (element-at list-of-cycle-rewards u409) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list410 (match (element-at list-of-cycle-rewards u410) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list411 (match (element-at list-of-cycle-rewards u411) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list412 (match (element-at list-of-cycle-rewards u412) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list413 (match (element-at list-of-cycle-rewards u413) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list414 (match (element-at list-of-cycle-rewards u414) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list415 (match (element-at list-of-cycle-rewards u415) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list416 (match (element-at list-of-cycle-rewards u416) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list417 (match (element-at list-of-cycle-rewards u417) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list418 (match (element-at list-of-cycle-rewards u418) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list419 (match (element-at list-of-cycle-rewards u419) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list420 (match (element-at list-of-cycle-rewards u420) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list421 (match (element-at list-of-cycle-rewards u421) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list422 (match (element-at list-of-cycle-rewards u422) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list423 (match (element-at list-of-cycle-rewards u423) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list424 (match (element-at list-of-cycle-rewards u424) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list425 (match (element-at list-of-cycle-rewards u425) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list426 (match (element-at list-of-cycle-rewards u426) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list427 (match (element-at list-of-cycle-rewards u427) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list428 (match (element-at list-of-cycle-rewards u428) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list429 (match (element-at list-of-cycle-rewards u429) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list430 (match (element-at list-of-cycle-rewards u430) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list431 (match (element-at list-of-cycle-rewards u431) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list432 (match (element-at list-of-cycle-rewards u432) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list433 (match (element-at list-of-cycle-rewards u433) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list434 (match (element-at list-of-cycle-rewards u434) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list435 (match (element-at list-of-cycle-rewards u435) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list436 (match (element-at list-of-cycle-rewards u436) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list437 (match (element-at list-of-cycle-rewards u437) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list438 (match (element-at list-of-cycle-rewards u438) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list439 (match (element-at list-of-cycle-rewards u439) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list440 (match (element-at list-of-cycle-rewards u440) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list441 (match (element-at list-of-cycle-rewards u441) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list442 (match (element-at list-of-cycle-rewards u442) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list443 (match (element-at list-of-cycle-rewards u443) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list444 (match (element-at list-of-cycle-rewards u444) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list445 (match (element-at list-of-cycle-rewards u445) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list446 (match (element-at list-of-cycle-rewards u446) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list447 (match (element-at list-of-cycle-rewards u447) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list448 (match (element-at list-of-cycle-rewards u448) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list449 (match (element-at list-of-cycle-rewards u449) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list450 (match (element-at list-of-cycle-rewards u450) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list451 (match (element-at list-of-cycle-rewards u451) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list452 (match (element-at list-of-cycle-rewards u452) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list453 (match (element-at list-of-cycle-rewards u453) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list454 (match (element-at list-of-cycle-rewards u454) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list455 (match (element-at list-of-cycle-rewards u455) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list456 (match (element-at list-of-cycle-rewards u456) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list457 (match (element-at list-of-cycle-rewards u457) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list458 (match (element-at list-of-cycle-rewards u458) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list459 (match (element-at list-of-cycle-rewards u459) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list460 (match (element-at list-of-cycle-rewards u460) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list461 (match (element-at list-of-cycle-rewards u461) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list462 (match (element-at list-of-cycle-rewards u462) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list463 (match (element-at list-of-cycle-rewards u463) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list464 (match (element-at list-of-cycle-rewards u464) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list465 (match (element-at list-of-cycle-rewards u465) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list466 (match (element-at list-of-cycle-rewards u466) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list467 (match (element-at list-of-cycle-rewards u467) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list468 (match (element-at list-of-cycle-rewards u468) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list469 (match (element-at list-of-cycle-rewards u469) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list470 (match (element-at list-of-cycle-rewards u470) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list471 (match (element-at list-of-cycle-rewards u471) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list472 (match (element-at list-of-cycle-rewards u472) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list473 (match (element-at list-of-cycle-rewards u473) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list474 (match (element-at list-of-cycle-rewards u474) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list475 (match (element-at list-of-cycle-rewards u475) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list476 (match (element-at list-of-cycle-rewards u476) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list477 (match (element-at list-of-cycle-rewards u477) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list478 (match (element-at list-of-cycle-rewards u478) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list479 (match (element-at list-of-cycle-rewards u479) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list480 (match (element-at list-of-cycle-rewards u480) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list481 (match (element-at list-of-cycle-rewards u481) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list482 (match (element-at list-of-cycle-rewards u482) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list483 (match (element-at list-of-cycle-rewards u483) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list484 (match (element-at list-of-cycle-rewards u484) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list485 (match (element-at list-of-cycle-rewards u485) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list486 (match (element-at list-of-cycle-rewards u486) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list487 (match (element-at list-of-cycle-rewards u487) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list488 (match (element-at list-of-cycle-rewards u488) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list489 (match (element-at list-of-cycle-rewards u489) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list490 (match (element-at list-of-cycle-rewards u490) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list491 (match (element-at list-of-cycle-rewards u491) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list492 (match (element-at list-of-cycle-rewards u492) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list493 (match (element-at list-of-cycle-rewards u493) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list494 (match (element-at list-of-cycle-rewards u494) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list495 (match (element-at list-of-cycle-rewards u495) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list496 (match (element-at list-of-cycle-rewards u496) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list497 (match (element-at list-of-cycle-rewards u497) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list498 (match (element-at list-of-cycle-rewards u498) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list499 (match (element-at list-of-cycle-rewards u499) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list500 (match (element-at list-of-cycle-rewards u500) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list501 (match (element-at list-of-cycle-rewards u501) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list502 (match (element-at list-of-cycle-rewards u502) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list503 (match (element-at list-of-cycle-rewards u503) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list504 (match (element-at list-of-cycle-rewards u504) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list505 (match (element-at list-of-cycle-rewards u505) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list506 (match (element-at list-of-cycle-rewards u506) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list507 (match (element-at list-of-cycle-rewards u507) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list508 (match (element-at list-of-cycle-rewards u508) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list509 (match (element-at list-of-cycle-rewards u509) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list510 (match (element-at list-of-cycle-rewards u510) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list511 (match (element-at list-of-cycle-rewards u511) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list512 (match (element-at list-of-cycle-rewards u512) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list513 (match (element-at list-of-cycle-rewards u513) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list514 (match (element-at list-of-cycle-rewards u514) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list515 (match (element-at list-of-cycle-rewards u515) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list516 (match (element-at list-of-cycle-rewards u516) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list517 (match (element-at list-of-cycle-rewards u517) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list518 (match (element-at list-of-cycle-rewards u518) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list519 (match (element-at list-of-cycle-rewards u519) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list520 (match (element-at list-of-cycle-rewards u520) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list521 (match (element-at list-of-cycle-rewards u521) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list522 (match (element-at list-of-cycle-rewards u522) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list523 (match (element-at list-of-cycle-rewards u523) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list524 (match (element-at list-of-cycle-rewards u524) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list525 (match (element-at list-of-cycle-rewards u525) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list526 (match (element-at list-of-cycle-rewards u526) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list527 (match (element-at list-of-cycle-rewards u527) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list528 (match (element-at list-of-cycle-rewards u528) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list529 (match (element-at list-of-cycle-rewards u529) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list530 (match (element-at list-of-cycle-rewards u530) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list531 (match (element-at list-of-cycle-rewards u531) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list532 (match (element-at list-of-cycle-rewards u532) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list533 (match (element-at list-of-cycle-rewards u533) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list534 (match (element-at list-of-cycle-rewards u534) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list535 (match (element-at list-of-cycle-rewards u535) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list536 (match (element-at list-of-cycle-rewards u536) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list537 (match (element-at list-of-cycle-rewards u537) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list538 (match (element-at list-of-cycle-rewards u538) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list539 (match (element-at list-of-cycle-rewards u539) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list540 (match (element-at list-of-cycle-rewards u540) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list541 (match (element-at list-of-cycle-rewards u541) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list542 (match (element-at list-of-cycle-rewards u542) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list543 (match (element-at list-of-cycle-rewards u543) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list544 (match (element-at list-of-cycle-rewards u544) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list545 (match (element-at list-of-cycle-rewards u545) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list546 (match (element-at list-of-cycle-rewards u546) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list547 (match (element-at list-of-cycle-rewards u547) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list548 (match (element-at list-of-cycle-rewards u548) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list549 (match (element-at list-of-cycle-rewards u549) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list550 (match (element-at list-of-cycle-rewards u550) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list551 (match (element-at list-of-cycle-rewards u551) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list552 (match (element-at list-of-cycle-rewards u552) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list553 (match (element-at list-of-cycle-rewards u553) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list554 (match (element-at list-of-cycle-rewards u554) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list555 (match (element-at list-of-cycle-rewards u555) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list556 (match (element-at list-of-cycle-rewards u556) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list557 (match (element-at list-of-cycle-rewards u557) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list558 (match (element-at list-of-cycle-rewards u558) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list559 (match (element-at list-of-cycle-rewards u559) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list560 (match (element-at list-of-cycle-rewards u560) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list561 (match (element-at list-of-cycle-rewards u561) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list562 (match (element-at list-of-cycle-rewards u562) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list563 (match (element-at list-of-cycle-rewards u563) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list564 (match (element-at list-of-cycle-rewards u564) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list565 (match (element-at list-of-cycle-rewards u565) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list566 (match (element-at list-of-cycle-rewards u566) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list567 (match (element-at list-of-cycle-rewards u567) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list568 (match (element-at list-of-cycle-rewards u568) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list569 (match (element-at list-of-cycle-rewards u569) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list570 (match (element-at list-of-cycle-rewards u570) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list571 (match (element-at list-of-cycle-rewards u571) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list572 (match (element-at list-of-cycle-rewards u572) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list573 (match (element-at list-of-cycle-rewards u573) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list574 (match (element-at list-of-cycle-rewards u574) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list575 (match (element-at list-of-cycle-rewards u575) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list576 (match (element-at list-of-cycle-rewards u576) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list577 (match (element-at list-of-cycle-rewards u577) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list578 (match (element-at list-of-cycle-rewards u578) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list579 (match (element-at list-of-cycle-rewards u579) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list580 (match (element-at list-of-cycle-rewards u580) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list581 (match (element-at list-of-cycle-rewards u581) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list582 (match (element-at list-of-cycle-rewards u582) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list583 (match (element-at list-of-cycle-rewards u583) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list584 (match (element-at list-of-cycle-rewards u584) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list585 (match (element-at list-of-cycle-rewards u585) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list586 (match (element-at list-of-cycle-rewards u586) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list587 (match (element-at list-of-cycle-rewards u587) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list588 (match (element-at list-of-cycle-rewards u588) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list589 (match (element-at list-of-cycle-rewards u589) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list590 (match (element-at list-of-cycle-rewards u590) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list591 (match (element-at list-of-cycle-rewards u591) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list592 (match (element-at list-of-cycle-rewards u592) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list593 (match (element-at list-of-cycle-rewards u593) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list594 (match (element-at list-of-cycle-rewards u594) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list595 (match (element-at list-of-cycle-rewards u595) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list596 (match (element-at list-of-cycle-rewards u596) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list597 (match (element-at list-of-cycle-rewards u597) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list598 (match (element-at list-of-cycle-rewards u598) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
      (list599 (match (element-at list-of-cycle-rewards u599) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))

      (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 
      list9 list10 list11 list12 list13 list14 list15 list16 list17 list18 
      list19 list20 list21 list22 list23 list24 list25 list26 list27 list28 
      list29 list30 list31 list32 list33 list34 list35 list36 list37 list38 
      list39 list40 list41 list42 list43 list44 list45 list46 list47 list48 
      list49 list50 list51 list52 list53 list54 list55 list56 list57 list58 
      list59 list60 list61 list62 list63 list64 list65 list66 list67 list68 
      list69 list70 list71 list72 list73 list74 list75 list76 list77 list78 
      list79 list80 list81 list82 list83 list84 list85 list86 list87 list88 
      list89 list90 list91 list92 list93 list94 list95 list96 list97 list98 
      list99 list100 list101 list102 list103 list104 list105 list106 list107 
      list108 list109 list110 list111 list112 list113 list114 list115 list116 
      list117 list118 list119 list120 list121 list122 list123 list124 list125 
      list126 list127 list128 list129 list130 list131 list132 list133 list134 
      list135 list136 list137 list138 list139 list140 list141 list142 list143 
      list144 list145 list146 list147 list148 list149 list150 list151 list152 
      list153 list154 list155 list156 list157 list158 list159 list160 list161 
      list162 list163 list164 list165 list166 list167 list168 list169 list170 
      list171 list172 list173 list174 list175 list176 list177 list178 list179 
      list180 list181 list182 list183 list184 list185 list186 list187 list188 
      list189 list190 list191 list192 list193 list194 list195 list196 list197 
      list198 list199 list200 list201 list202 list203 list204 list205 list206 
      list207 list208 list209 list210 list211 list212 list213 list214 list215 
      list216 list217 list218 list219 list220 list221 list222 list223 list224 
      list225 list226 list227 list228 list229 list230 list231 list232 list233 
      list234 list235 list236 list237 list238 list239 list240 list241 list242 
      list243 list244 list245 list246 list247 list248 list249 list250 list251 
      list252 list253 list254 list255 list256 list257 list258 list259 list260 
      list261 list262 list263 list264 list265 list266 list267 list268 list269 
      list270 list271 list272 list273 list274 list275 list276 list277 list278 
      list279 list280 list281 list282 list283 list284 list285 list286 list287 
      list288 list289 list290 list291 list292 list293 list294 list295 list296 
      list297 list298 list299 list300 list301 list302 list303 list304 list305 
      list306 list307 list308 list309 list310 list311 list312 list313 list314 
      list315 list316 list317 list318 list319 list320 list321 list322 list323 
      list324 list325 list326 list327 list328 list329 list330 list331 list332 
      list333 list334 list335 list336 list337 list338 list339 list340 list341 
      list342 list343 list344 list345 list346 list347 list348 list349 list350 
      list351 list352 list353 list354 list355 list356 list357 list358 list359 
      list360 list361 list362 list363 list364 list365 list366 list367 list368 
      list369 list370 list371 list372 list373 list374 list375 list376 list377 
      list378 list379 list380 list381 list382 list383 list384 list385 list386 
      list387 list388 list389 list390 list391 list392 list393 list394 list395 
      list396 list397 list398 list399 list400 list401 list402 list403 list404 
      list405 list406 list407 list408 list409 list410 list411 list412 list413 
      list414 list415 list416 list417 list418 list419 list420 list421 list422 
      list423 list424 list425 list426 list427 list428 list429 list430 list431 
      list432 list433 list434 list435 list436 list437 list438 list439 list440 
      list441 list442 list443 list444 list445 list446 list447 list448 list449 
      list450 list451 list452 list453 list454 list455 list456 list457 list458 
      list459 list460 list461 list462 list463 list464 list465 list466 list467 
      list468 list469 list470 list471 list472 list473 list474 list475 list476 
      list477 list478 list479 list480 list481 list482 list483 list484 list485 
      list486 list487 list488 list489 list490 list491 list492 list493 list494 
      list495 list496 list497 list498 list499 list500 list501 list502 list503 
      list504 list505 list506 list507 list508 list509 list510 list511 list512 
      list513 list514 list515 list516 list517 list518 list519 list520 list521 
      list522 list523 list524 list525 list526 list527 list528 list529 list530 
      list531 list532 list533 list534 list535 list536 list537 list538 list539 
      list540 list541 list542 list543 list544 list545 list546 list547 list548 
      list549 list550 list551 list552 list553 list554 list555 list556 list557 
      list558 list559 list560 list561 list562 list563 list564 list565 list566 
      list567 list568 list569 list570 list571 list572 list573 list574 list575 
      list576 list577 list578 list579 list580 list581 list582 list583 list584 
      list585 list586 list587 list588 list589 list590 list591 list592 list593 
      list594 list595 list596 list597 list598 list599)) 

    )
    (begin 
      (ok added)
    )
  )
)


;; (use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

;; ;; helper
;; ;; <add a description here>
;; (define-constant PANIC_ERR (err u12))


;; (define-read-only (get-rewards-at-cycle (rewardCycle uint) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
;;     (contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v4 get-rewards-at-cycle rewardCycle who token-x-trait token-y-trait lp-token-trait xbtc-token-trait)
;; )

;; (define-read-only (get-rewards-and-principal-sum (list-of-cycles (list 1000 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
;;     (let (
;;       (txt token-x-trait)
;;       (tyt token-y-trait)
;;       (lpt lp-token-trait)
;;       (btt xbtc-token-trait)
;;       (list-of-cycle-rewards 
;;         (map 
;;           get-rewards-at-cycle  ;;rewardCycle:uint who:principal token-x-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> token-y-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> lp-token-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> xbtc-token-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait>)
;;           list-of-cycles
;;           (list who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who who)
;;           (list txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt)
;;           (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt)
;;           (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
;;           (list btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt)        
;;         )
;;       )

;;       (list0 (match (element-at list-of-cycle-rewards u0) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list1 (match (element-at list-of-cycle-rewards u1) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list2 (match (element-at list-of-cycle-rewards u2) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list3 (match (element-at list-of-cycle-rewards u3) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list4 (match (element-at list-of-cycle-rewards u4) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list5 (match (element-at list-of-cycle-rewards u5) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list6 (match (element-at list-of-cycle-rewards u6) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list7 (match (element-at list-of-cycle-rewards u7) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list8 (match (element-at list-of-cycle-rewards u8) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list9 (match (element-at list-of-cycle-rewards u9) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list10 (match (element-at list-of-cycle-rewards u10) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list11 (match (element-at list-of-cycle-rewards u11) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list12 (match (element-at list-of-cycle-rewards u12) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list13 (match (element-at list-of-cycle-rewards u13) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list14 (match (element-at list-of-cycle-rewards u14) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list15 (match (element-at list-of-cycle-rewards u15) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list16 (match (element-at list-of-cycle-rewards u16) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list17 (match (element-at list-of-cycle-rewards u17) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list18 (match (element-at list-of-cycle-rewards u18) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list19 (match (element-at list-of-cycle-rewards u19) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list20 (match (element-at list-of-cycle-rewards u20) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list21 (match (element-at list-of-cycle-rewards u21) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list22 (match (element-at list-of-cycle-rewards u22) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list23 (match (element-at list-of-cycle-rewards u23) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list24 (match (element-at list-of-cycle-rewards u24) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list25 (match (element-at list-of-cycle-rewards u25) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list26 (match (element-at list-of-cycle-rewards u26) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list27 (match (element-at list-of-cycle-rewards u27) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list28 (match (element-at list-of-cycle-rewards u28) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list29 (match (element-at list-of-cycle-rewards u29) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list30 (match (element-at list-of-cycle-rewards u30) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list31 (match (element-at list-of-cycle-rewards u31) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list32 (match (element-at list-of-cycle-rewards u32) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list33 (match (element-at list-of-cycle-rewards u33) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list34 (match (element-at list-of-cycle-rewards u34) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list35 (match (element-at list-of-cycle-rewards u35) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list36 (match (element-at list-of-cycle-rewards u36) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list37 (match (element-at list-of-cycle-rewards u37) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list38 (match (element-at list-of-cycle-rewards u38) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list39 (match (element-at list-of-cycle-rewards u39) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list40 (match (element-at list-of-cycle-rewards u40) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list41 (match (element-at list-of-cycle-rewards u41) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list42 (match (element-at list-of-cycle-rewards u42) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list43 (match (element-at list-of-cycle-rewards u43) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list44 (match (element-at list-of-cycle-rewards u44) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list45 (match (element-at list-of-cycle-rewards u45) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list46 (match (element-at list-of-cycle-rewards u46) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list47 (match (element-at list-of-cycle-rewards u47) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list48 (match (element-at list-of-cycle-rewards u48) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list49 (match (element-at list-of-cycle-rewards u49) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list50 (match (element-at list-of-cycle-rewards u50) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list51 (match (element-at list-of-cycle-rewards u51) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list52 (match (element-at list-of-cycle-rewards u52) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list53 (match (element-at list-of-cycle-rewards u53) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list54 (match (element-at list-of-cycle-rewards u54) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list55 (match (element-at list-of-cycle-rewards u55) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list56 (match (element-at list-of-cycle-rewards u56) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list57 (match (element-at list-of-cycle-rewards u57) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list58 (match (element-at list-of-cycle-rewards u58) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list59 (match (element-at list-of-cycle-rewards u59) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list60 (match (element-at list-of-cycle-rewards u60) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list61 (match (element-at list-of-cycle-rewards u61) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list62 (match (element-at list-of-cycle-rewards u62) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list63 (match (element-at list-of-cycle-rewards u63) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list64 (match (element-at list-of-cycle-rewards u64) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list65 (match (element-at list-of-cycle-rewards u65) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list66 (match (element-at list-of-cycle-rewards u66) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list67 (match (element-at list-of-cycle-rewards u67) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list68 (match (element-at list-of-cycle-rewards u68) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list69 (match (element-at list-of-cycle-rewards u69) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list70 (match (element-at list-of-cycle-rewards u70) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list71 (match (element-at list-of-cycle-rewards u71) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list72 (match (element-at list-of-cycle-rewards u72) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list73 (match (element-at list-of-cycle-rewards u73) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list74 (match (element-at list-of-cycle-rewards u74) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list75 (match (element-at list-of-cycle-rewards u75) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list76 (match (element-at list-of-cycle-rewards u76) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list77 (match (element-at list-of-cycle-rewards u77) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list78 (match (element-at list-of-cycle-rewards u78) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list79 (match (element-at list-of-cycle-rewards u79) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list80 (match (element-at list-of-cycle-rewards u80) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list81 (match (element-at list-of-cycle-rewards u81) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list82 (match (element-at list-of-cycle-rewards u82) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list83 (match (element-at list-of-cycle-rewards u83) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list84 (match (element-at list-of-cycle-rewards u84) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list85 (match (element-at list-of-cycle-rewards u85) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list86 (match (element-at list-of-cycle-rewards u86) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list87 (match (element-at list-of-cycle-rewards u87) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list88 (match (element-at list-of-cycle-rewards u88) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list89 (match (element-at list-of-cycle-rewards u89) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list90 (match (element-at list-of-cycle-rewards u90) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list91 (match (element-at list-of-cycle-rewards u91) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list92 (match (element-at list-of-cycle-rewards u92) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list93 (match (element-at list-of-cycle-rewards u93) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list94 (match (element-at list-of-cycle-rewards u94) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list95 (match (element-at list-of-cycle-rewards u95) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list96 (match (element-at list-of-cycle-rewards u96) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list97 (match (element-at list-of-cycle-rewards u97) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list98 (match (element-at list-of-cycle-rewards u98) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list99 (match (element-at list-of-cycle-rewards u99) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list100 (match (element-at list-of-cycle-rewards u100) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list101 (match (element-at list-of-cycle-rewards u101) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list102 (match (element-at list-of-cycle-rewards u102) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list103 (match (element-at list-of-cycle-rewards u103) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list104 (match (element-at list-of-cycle-rewards u104) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list105 (match (element-at list-of-cycle-rewards u105) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list106 (match (element-at list-of-cycle-rewards u106) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list107 (match (element-at list-of-cycle-rewards u107) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list108 (match (element-at list-of-cycle-rewards u108) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list109 (match (element-at list-of-cycle-rewards u109) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list110 (match (element-at list-of-cycle-rewards u110) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list111 (match (element-at list-of-cycle-rewards u111) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list112 (match (element-at list-of-cycle-rewards u112) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list113 (match (element-at list-of-cycle-rewards u113) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list114 (match (element-at list-of-cycle-rewards u114) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list115 (match (element-at list-of-cycle-rewards u115) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list116 (match (element-at list-of-cycle-rewards u116) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list117 (match (element-at list-of-cycle-rewards u117) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list118 (match (element-at list-of-cycle-rewards u118) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list119 (match (element-at list-of-cycle-rewards u119) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list120 (match (element-at list-of-cycle-rewards u120) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list121 (match (element-at list-of-cycle-rewards u121) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list122 (match (element-at list-of-cycle-rewards u122) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list123 (match (element-at list-of-cycle-rewards u123) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list124 (match (element-at list-of-cycle-rewards u124) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list125 (match (element-at list-of-cycle-rewards u125) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list126 (match (element-at list-of-cycle-rewards u126) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list127 (match (element-at list-of-cycle-rewards u127) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list128 (match (element-at list-of-cycle-rewards u128) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list129 (match (element-at list-of-cycle-rewards u129) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list130 (match (element-at list-of-cycle-rewards u130) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list131 (match (element-at list-of-cycle-rewards u131) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list132 (match (element-at list-of-cycle-rewards u132) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list133 (match (element-at list-of-cycle-rewards u133) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list134 (match (element-at list-of-cycle-rewards u134) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list135 (match (element-at list-of-cycle-rewards u135) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list136 (match (element-at list-of-cycle-rewards u136) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list137 (match (element-at list-of-cycle-rewards u137) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list138 (match (element-at list-of-cycle-rewards u138) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list139 (match (element-at list-of-cycle-rewards u139) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list140 (match (element-at list-of-cycle-rewards u140) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list141 (match (element-at list-of-cycle-rewards u141) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list142 (match (element-at list-of-cycle-rewards u142) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list143 (match (element-at list-of-cycle-rewards u143) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list144 (match (element-at list-of-cycle-rewards u144) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list145 (match (element-at list-of-cycle-rewards u145) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list146 (match (element-at list-of-cycle-rewards u146) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list147 (match (element-at list-of-cycle-rewards u147) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list148 (match (element-at list-of-cycle-rewards u148) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list149 (match (element-at list-of-cycle-rewards u149) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list150 (match (element-at list-of-cycle-rewards u150) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list151 (match (element-at list-of-cycle-rewards u151) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list152 (match (element-at list-of-cycle-rewards u152) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list153 (match (element-at list-of-cycle-rewards u153) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list154 (match (element-at list-of-cycle-rewards u154) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list155 (match (element-at list-of-cycle-rewards u155) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list156 (match (element-at list-of-cycle-rewards u156) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list157 (match (element-at list-of-cycle-rewards u157) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list158 (match (element-at list-of-cycle-rewards u158) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list159 (match (element-at list-of-cycle-rewards u159) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list160 (match (element-at list-of-cycle-rewards u160) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list161 (match (element-at list-of-cycle-rewards u161) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list162 (match (element-at list-of-cycle-rewards u162) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list163 (match (element-at list-of-cycle-rewards u163) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list164 (match (element-at list-of-cycle-rewards u164) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list165 (match (element-at list-of-cycle-rewards u165) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list166 (match (element-at list-of-cycle-rewards u166) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list167 (match (element-at list-of-cycle-rewards u167) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list168 (match (element-at list-of-cycle-rewards u168) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list169 (match (element-at list-of-cycle-rewards u169) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list170 (match (element-at list-of-cycle-rewards u170) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list171 (match (element-at list-of-cycle-rewards u171) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list172 (match (element-at list-of-cycle-rewards u172) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list173 (match (element-at list-of-cycle-rewards u173) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list174 (match (element-at list-of-cycle-rewards u174) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list175 (match (element-at list-of-cycle-rewards u175) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list176 (match (element-at list-of-cycle-rewards u176) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list177 (match (element-at list-of-cycle-rewards u177) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list178 (match (element-at list-of-cycle-rewards u178) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list179 (match (element-at list-of-cycle-rewards u179) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list180 (match (element-at list-of-cycle-rewards u180) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list181 (match (element-at list-of-cycle-rewards u181) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list182 (match (element-at list-of-cycle-rewards u182) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list183 (match (element-at list-of-cycle-rewards u183) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list184 (match (element-at list-of-cycle-rewards u184) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list185 (match (element-at list-of-cycle-rewards u185) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list186 (match (element-at list-of-cycle-rewards u186) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list187 (match (element-at list-of-cycle-rewards u187) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list188 (match (element-at list-of-cycle-rewards u188) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list189 (match (element-at list-of-cycle-rewards u189) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list190 (match (element-at list-of-cycle-rewards u190) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list191 (match (element-at list-of-cycle-rewards u191) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list192 (match (element-at list-of-cycle-rewards u192) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list193 (match (element-at list-of-cycle-rewards u193) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list194 (match (element-at list-of-cycle-rewards u194) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list195 (match (element-at list-of-cycle-rewards u195) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list196 (match (element-at list-of-cycle-rewards u196) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list197 (match (element-at list-of-cycle-rewards u197) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list198 (match (element-at list-of-cycle-rewards u198) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list199 (match (element-at list-of-cycle-rewards u199) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list200 (match (element-at list-of-cycle-rewards u200) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list201 (match (element-at list-of-cycle-rewards u201) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list202 (match (element-at list-of-cycle-rewards u202) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list203 (match (element-at list-of-cycle-rewards u203) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list204 (match (element-at list-of-cycle-rewards u204) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list205 (match (element-at list-of-cycle-rewards u205) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list206 (match (element-at list-of-cycle-rewards u206) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list207 (match (element-at list-of-cycle-rewards u207) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list208 (match (element-at list-of-cycle-rewards u208) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list209 (match (element-at list-of-cycle-rewards u209) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list210 (match (element-at list-of-cycle-rewards u210) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list211 (match (element-at list-of-cycle-rewards u211) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list212 (match (element-at list-of-cycle-rewards u212) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list213 (match (element-at list-of-cycle-rewards u213) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list214 (match (element-at list-of-cycle-rewards u214) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list215 (match (element-at list-of-cycle-rewards u215) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list216 (match (element-at list-of-cycle-rewards u216) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list217 (match (element-at list-of-cycle-rewards u217) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list218 (match (element-at list-of-cycle-rewards u218) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list219 (match (element-at list-of-cycle-rewards u219) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list220 (match (element-at list-of-cycle-rewards u220) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list221 (match (element-at list-of-cycle-rewards u221) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list222 (match (element-at list-of-cycle-rewards u222) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list223 (match (element-at list-of-cycle-rewards u223) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list224 (match (element-at list-of-cycle-rewards u224) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list225 (match (element-at list-of-cycle-rewards u225) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list226 (match (element-at list-of-cycle-rewards u226) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list227 (match (element-at list-of-cycle-rewards u227) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list228 (match (element-at list-of-cycle-rewards u228) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list229 (match (element-at list-of-cycle-rewards u229) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list230 (match (element-at list-of-cycle-rewards u230) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list231 (match (element-at list-of-cycle-rewards u231) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list232 (match (element-at list-of-cycle-rewards u232) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list233 (match (element-at list-of-cycle-rewards u233) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list234 (match (element-at list-of-cycle-rewards u234) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list235 (match (element-at list-of-cycle-rewards u235) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list236 (match (element-at list-of-cycle-rewards u236) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list237 (match (element-at list-of-cycle-rewards u237) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list238 (match (element-at list-of-cycle-rewards u238) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list239 (match (element-at list-of-cycle-rewards u239) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list240 (match (element-at list-of-cycle-rewards u240) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list241 (match (element-at list-of-cycle-rewards u241) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list242 (match (element-at list-of-cycle-rewards u242) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list243 (match (element-at list-of-cycle-rewards u243) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list244 (match (element-at list-of-cycle-rewards u244) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list245 (match (element-at list-of-cycle-rewards u245) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list246 (match (element-at list-of-cycle-rewards u246) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list247 (match (element-at list-of-cycle-rewards u247) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list248 (match (element-at list-of-cycle-rewards u248) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list249 (match (element-at list-of-cycle-rewards u249) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list250 (match (element-at list-of-cycle-rewards u250) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list251 (match (element-at list-of-cycle-rewards u251) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list252 (match (element-at list-of-cycle-rewards u252) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list253 (match (element-at list-of-cycle-rewards u253) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list254 (match (element-at list-of-cycle-rewards u254) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list255 (match (element-at list-of-cycle-rewards u255) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list256 (match (element-at list-of-cycle-rewards u256) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list257 (match (element-at list-of-cycle-rewards u257) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list258 (match (element-at list-of-cycle-rewards u258) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list259 (match (element-at list-of-cycle-rewards u259) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list260 (match (element-at list-of-cycle-rewards u260) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list261 (match (element-at list-of-cycle-rewards u261) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list262 (match (element-at list-of-cycle-rewards u262) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list263 (match (element-at list-of-cycle-rewards u263) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list264 (match (element-at list-of-cycle-rewards u264) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list265 (match (element-at list-of-cycle-rewards u265) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list266 (match (element-at list-of-cycle-rewards u266) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list267 (match (element-at list-of-cycle-rewards u267) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list268 (match (element-at list-of-cycle-rewards u268) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list269 (match (element-at list-of-cycle-rewards u269) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list270 (match (element-at list-of-cycle-rewards u270) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list271 (match (element-at list-of-cycle-rewards u271) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list272 (match (element-at list-of-cycle-rewards u272) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list273 (match (element-at list-of-cycle-rewards u273) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list274 (match (element-at list-of-cycle-rewards u274) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list275 (match (element-at list-of-cycle-rewards u275) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list276 (match (element-at list-of-cycle-rewards u276) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list277 (match (element-at list-of-cycle-rewards u277) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list278 (match (element-at list-of-cycle-rewards u278) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list279 (match (element-at list-of-cycle-rewards u279) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list280 (match (element-at list-of-cycle-rewards u280) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list281 (match (element-at list-of-cycle-rewards u281) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list282 (match (element-at list-of-cycle-rewards u282) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list283 (match (element-at list-of-cycle-rewards u283) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list284 (match (element-at list-of-cycle-rewards u284) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list285 (match (element-at list-of-cycle-rewards u285) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list286 (match (element-at list-of-cycle-rewards u286) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list287 (match (element-at list-of-cycle-rewards u287) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list288 (match (element-at list-of-cycle-rewards u288) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list289 (match (element-at list-of-cycle-rewards u289) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list290 (match (element-at list-of-cycle-rewards u290) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list291 (match (element-at list-of-cycle-rewards u291) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list292 (match (element-at list-of-cycle-rewards u292) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list293 (match (element-at list-of-cycle-rewards u293) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list294 (match (element-at list-of-cycle-rewards u294) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list295 (match (element-at list-of-cycle-rewards u295) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list296 (match (element-at list-of-cycle-rewards u296) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list297 (match (element-at list-of-cycle-rewards u297) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list298 (match (element-at list-of-cycle-rewards u298) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list299 (match (element-at list-of-cycle-rewards u299) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list300 (match (element-at list-of-cycle-rewards u300) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list301 (match (element-at list-of-cycle-rewards u301) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list302 (match (element-at list-of-cycle-rewards u302) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list303 (match (element-at list-of-cycle-rewards u303) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list304 (match (element-at list-of-cycle-rewards u304) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list305 (match (element-at list-of-cycle-rewards u305) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list306 (match (element-at list-of-cycle-rewards u306) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list307 (match (element-at list-of-cycle-rewards u307) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list308 (match (element-at list-of-cycle-rewards u308) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list309 (match (element-at list-of-cycle-rewards u309) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list310 (match (element-at list-of-cycle-rewards u310) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list311 (match (element-at list-of-cycle-rewards u311) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list312 (match (element-at list-of-cycle-rewards u312) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list313 (match (element-at list-of-cycle-rewards u313) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list314 (match (element-at list-of-cycle-rewards u314) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list315 (match (element-at list-of-cycle-rewards u315) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list316 (match (element-at list-of-cycle-rewards u316) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list317 (match (element-at list-of-cycle-rewards u317) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list318 (match (element-at list-of-cycle-rewards u318) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list319 (match (element-at list-of-cycle-rewards u319) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list320 (match (element-at list-of-cycle-rewards u320) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list321 (match (element-at list-of-cycle-rewards u321) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list322 (match (element-at list-of-cycle-rewards u322) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list323 (match (element-at list-of-cycle-rewards u323) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list324 (match (element-at list-of-cycle-rewards u324) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list325 (match (element-at list-of-cycle-rewards u325) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list326 (match (element-at list-of-cycle-rewards u326) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list327 (match (element-at list-of-cycle-rewards u327) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list328 (match (element-at list-of-cycle-rewards u328) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list329 (match (element-at list-of-cycle-rewards u329) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list330 (match (element-at list-of-cycle-rewards u330) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list331 (match (element-at list-of-cycle-rewards u331) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list332 (match (element-at list-of-cycle-rewards u332) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list333 (match (element-at list-of-cycle-rewards u333) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list334 (match (element-at list-of-cycle-rewards u334) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list335 (match (element-at list-of-cycle-rewards u335) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list336 (match (element-at list-of-cycle-rewards u336) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list337 (match (element-at list-of-cycle-rewards u337) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list338 (match (element-at list-of-cycle-rewards u338) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list339 (match (element-at list-of-cycle-rewards u339) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list340 (match (element-at list-of-cycle-rewards u340) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list341 (match (element-at list-of-cycle-rewards u341) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list342 (match (element-at list-of-cycle-rewards u342) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list343 (match (element-at list-of-cycle-rewards u343) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list344 (match (element-at list-of-cycle-rewards u344) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list345 (match (element-at list-of-cycle-rewards u345) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list346 (match (element-at list-of-cycle-rewards u346) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list347 (match (element-at list-of-cycle-rewards u347) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list348 (match (element-at list-of-cycle-rewards u348) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list349 (match (element-at list-of-cycle-rewards u349) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list350 (match (element-at list-of-cycle-rewards u350) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list351 (match (element-at list-of-cycle-rewards u351) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list352 (match (element-at list-of-cycle-rewards u352) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list353 (match (element-at list-of-cycle-rewards u353) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list354 (match (element-at list-of-cycle-rewards u354) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list355 (match (element-at list-of-cycle-rewards u355) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list356 (match (element-at list-of-cycle-rewards u356) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list357 (match (element-at list-of-cycle-rewards u357) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list358 (match (element-at list-of-cycle-rewards u358) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list359 (match (element-at list-of-cycle-rewards u359) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list360 (match (element-at list-of-cycle-rewards u360) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list361 (match (element-at list-of-cycle-rewards u361) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list362 (match (element-at list-of-cycle-rewards u362) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list363 (match (element-at list-of-cycle-rewards u363) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list364 (match (element-at list-of-cycle-rewards u364) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list365 (match (element-at list-of-cycle-rewards u365) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list366 (match (element-at list-of-cycle-rewards u366) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list367 (match (element-at list-of-cycle-rewards u367) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list368 (match (element-at list-of-cycle-rewards u368) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list369 (match (element-at list-of-cycle-rewards u369) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list370 (match (element-at list-of-cycle-rewards u370) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list371 (match (element-at list-of-cycle-rewards u371) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list372 (match (element-at list-of-cycle-rewards u372) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list373 (match (element-at list-of-cycle-rewards u373) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list374 (match (element-at list-of-cycle-rewards u374) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list375 (match (element-at list-of-cycle-rewards u375) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list376 (match (element-at list-of-cycle-rewards u376) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list377 (match (element-at list-of-cycle-rewards u377) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list378 (match (element-at list-of-cycle-rewards u378) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list379 (match (element-at list-of-cycle-rewards u379) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list380 (match (element-at list-of-cycle-rewards u380) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list381 (match (element-at list-of-cycle-rewards u381) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list382 (match (element-at list-of-cycle-rewards u382) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list383 (match (element-at list-of-cycle-rewards u383) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list384 (match (element-at list-of-cycle-rewards u384) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list385 (match (element-at list-of-cycle-rewards u385) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list386 (match (element-at list-of-cycle-rewards u386) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list387 (match (element-at list-of-cycle-rewards u387) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list388 (match (element-at list-of-cycle-rewards u388) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list389 (match (element-at list-of-cycle-rewards u389) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list390 (match (element-at list-of-cycle-rewards u390) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list391 (match (element-at list-of-cycle-rewards u391) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list392 (match (element-at list-of-cycle-rewards u392) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list393 (match (element-at list-of-cycle-rewards u393) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list394 (match (element-at list-of-cycle-rewards u394) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list395 (match (element-at list-of-cycle-rewards u395) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list396 (match (element-at list-of-cycle-rewards u396) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list397 (match (element-at list-of-cycle-rewards u397) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list398 (match (element-at list-of-cycle-rewards u398) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list399 (match (element-at list-of-cycle-rewards u399) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list400 (match (element-at list-of-cycle-rewards u400) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list401 (match (element-at list-of-cycle-rewards u401) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list402 (match (element-at list-of-cycle-rewards u402) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list403 (match (element-at list-of-cycle-rewards u403) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list404 (match (element-at list-of-cycle-rewards u404) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list405 (match (element-at list-of-cycle-rewards u405) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list406 (match (element-at list-of-cycle-rewards u406) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list407 (match (element-at list-of-cycle-rewards u407) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list408 (match (element-at list-of-cycle-rewards u408) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list409 (match (element-at list-of-cycle-rewards u409) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list410 (match (element-at list-of-cycle-rewards u410) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list411 (match (element-at list-of-cycle-rewards u411) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list412 (match (element-at list-of-cycle-rewards u412) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list413 (match (element-at list-of-cycle-rewards u413) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list414 (match (element-at list-of-cycle-rewards u414) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list415 (match (element-at list-of-cycle-rewards u415) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list416 (match (element-at list-of-cycle-rewards u416) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list417 (match (element-at list-of-cycle-rewards u417) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list418 (match (element-at list-of-cycle-rewards u418) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list419 (match (element-at list-of-cycle-rewards u419) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list420 (match (element-at list-of-cycle-rewards u420) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list421 (match (element-at list-of-cycle-rewards u421) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list422 (match (element-at list-of-cycle-rewards u422) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list423 (match (element-at list-of-cycle-rewards u423) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list424 (match (element-at list-of-cycle-rewards u424) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list425 (match (element-at list-of-cycle-rewards u425) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list426 (match (element-at list-of-cycle-rewards u426) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list427 (match (element-at list-of-cycle-rewards u427) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list428 (match (element-at list-of-cycle-rewards u428) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list429 (match (element-at list-of-cycle-rewards u429) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list430 (match (element-at list-of-cycle-rewards u430) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list431 (match (element-at list-of-cycle-rewards u431) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list432 (match (element-at list-of-cycle-rewards u432) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list433 (match (element-at list-of-cycle-rewards u433) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list434 (match (element-at list-of-cycle-rewards u434) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list435 (match (element-at list-of-cycle-rewards u435) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list436 (match (element-at list-of-cycle-rewards u436) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list437 (match (element-at list-of-cycle-rewards u437) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list438 (match (element-at list-of-cycle-rewards u438) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list439 (match (element-at list-of-cycle-rewards u439) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list440 (match (element-at list-of-cycle-rewards u440) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list441 (match (element-at list-of-cycle-rewards u441) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list442 (match (element-at list-of-cycle-rewards u442) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list443 (match (element-at list-of-cycle-rewards u443) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list444 (match (element-at list-of-cycle-rewards u444) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list445 (match (element-at list-of-cycle-rewards u445) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list446 (match (element-at list-of-cycle-rewards u446) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list447 (match (element-at list-of-cycle-rewards u447) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list448 (match (element-at list-of-cycle-rewards u448) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list449 (match (element-at list-of-cycle-rewards u449) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list450 (match (element-at list-of-cycle-rewards u450) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list451 (match (element-at list-of-cycle-rewards u451) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list452 (match (element-at list-of-cycle-rewards u452) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list453 (match (element-at list-of-cycle-rewards u453) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list454 (match (element-at list-of-cycle-rewards u454) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list455 (match (element-at list-of-cycle-rewards u455) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list456 (match (element-at list-of-cycle-rewards u456) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list457 (match (element-at list-of-cycle-rewards u457) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list458 (match (element-at list-of-cycle-rewards u458) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list459 (match (element-at list-of-cycle-rewards u459) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list460 (match (element-at list-of-cycle-rewards u460) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list461 (match (element-at list-of-cycle-rewards u461) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list462 (match (element-at list-of-cycle-rewards u462) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list463 (match (element-at list-of-cycle-rewards u463) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list464 (match (element-at list-of-cycle-rewards u464) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list465 (match (element-at list-of-cycle-rewards u465) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list466 (match (element-at list-of-cycle-rewards u466) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list467 (match (element-at list-of-cycle-rewards u467) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list468 (match (element-at list-of-cycle-rewards u468) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list469 (match (element-at list-of-cycle-rewards u469) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list470 (match (element-at list-of-cycle-rewards u470) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list471 (match (element-at list-of-cycle-rewards u471) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list472 (match (element-at list-of-cycle-rewards u472) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list473 (match (element-at list-of-cycle-rewards u473) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list474 (match (element-at list-of-cycle-rewards u474) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list475 (match (element-at list-of-cycle-rewards u475) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list476 (match (element-at list-of-cycle-rewards u476) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list477 (match (element-at list-of-cycle-rewards u477) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list478 (match (element-at list-of-cycle-rewards u478) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list479 (match (element-at list-of-cycle-rewards u479) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list480 (match (element-at list-of-cycle-rewards u480) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list481 (match (element-at list-of-cycle-rewards u481) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list482 (match (element-at list-of-cycle-rewards u482) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list483 (match (element-at list-of-cycle-rewards u483) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list484 (match (element-at list-of-cycle-rewards u484) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list485 (match (element-at list-of-cycle-rewards u485) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list486 (match (element-at list-of-cycle-rewards u486) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list487 (match (element-at list-of-cycle-rewards u487) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list488 (match (element-at list-of-cycle-rewards u488) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list489 (match (element-at list-of-cycle-rewards u489) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list490 (match (element-at list-of-cycle-rewards u490) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list491 (match (element-at list-of-cycle-rewards u491) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list492 (match (element-at list-of-cycle-rewards u492) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list493 (match (element-at list-of-cycle-rewards u493) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list494 (match (element-at list-of-cycle-rewards u494) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list495 (match (element-at list-of-cycle-rewards u495) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list496 (match (element-at list-of-cycle-rewards u496) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list497 (match (element-at list-of-cycle-rewards u497) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list498 (match (element-at list-of-cycle-rewards u498) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list499 (match (element-at list-of-cycle-rewards u499) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list500 (match (element-at list-of-cycle-rewards u500) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list501 (match (element-at list-of-cycle-rewards u501) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list502 (match (element-at list-of-cycle-rewards u502) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list503 (match (element-at list-of-cycle-rewards u503) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list504 (match (element-at list-of-cycle-rewards u504) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list505 (match (element-at list-of-cycle-rewards u505) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list506 (match (element-at list-of-cycle-rewards u506) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list507 (match (element-at list-of-cycle-rewards u507) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list508 (match (element-at list-of-cycle-rewards u508) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list509 (match (element-at list-of-cycle-rewards u509) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list510 (match (element-at list-of-cycle-rewards u510) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list511 (match (element-at list-of-cycle-rewards u511) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list512 (match (element-at list-of-cycle-rewards u512) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list513 (match (element-at list-of-cycle-rewards u513) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list514 (match (element-at list-of-cycle-rewards u514) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list515 (match (element-at list-of-cycle-rewards u515) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list516 (match (element-at list-of-cycle-rewards u516) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list517 (match (element-at list-of-cycle-rewards u517) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list518 (match (element-at list-of-cycle-rewards u518) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list519 (match (element-at list-of-cycle-rewards u519) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list520 (match (element-at list-of-cycle-rewards u520) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list521 (match (element-at list-of-cycle-rewards u521) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list522 (match (element-at list-of-cycle-rewards u522) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list523 (match (element-at list-of-cycle-rewards u523) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list524 (match (element-at list-of-cycle-rewards u524) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list525 (match (element-at list-of-cycle-rewards u525) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list526 (match (element-at list-of-cycle-rewards u526) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list527 (match (element-at list-of-cycle-rewards u527) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list528 (match (element-at list-of-cycle-rewards u528) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list529 (match (element-at list-of-cycle-rewards u529) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list530 (match (element-at list-of-cycle-rewards u530) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list531 (match (element-at list-of-cycle-rewards u531) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list532 (match (element-at list-of-cycle-rewards u532) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list533 (match (element-at list-of-cycle-rewards u533) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list534 (match (element-at list-of-cycle-rewards u534) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list535 (match (element-at list-of-cycle-rewards u535) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list536 (match (element-at list-of-cycle-rewards u536) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list537 (match (element-at list-of-cycle-rewards u537) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list538 (match (element-at list-of-cycle-rewards u538) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list539 (match (element-at list-of-cycle-rewards u539) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list540 (match (element-at list-of-cycle-rewards u540) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list541 (match (element-at list-of-cycle-rewards u541) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list542 (match (element-at list-of-cycle-rewards u542) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list543 (match (element-at list-of-cycle-rewards u543) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list544 (match (element-at list-of-cycle-rewards u544) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list545 (match (element-at list-of-cycle-rewards u545) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list546 (match (element-at list-of-cycle-rewards u546) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list547 (match (element-at list-of-cycle-rewards u547) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list548 (match (element-at list-of-cycle-rewards u548) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list549 (match (element-at list-of-cycle-rewards u549) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list550 (match (element-at list-of-cycle-rewards u550) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list551 (match (element-at list-of-cycle-rewards u551) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list552 (match (element-at list-of-cycle-rewards u552) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list553 (match (element-at list-of-cycle-rewards u553) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list554 (match (element-at list-of-cycle-rewards u554) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list555 (match (element-at list-of-cycle-rewards u555) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list556 (match (element-at list-of-cycle-rewards u556) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list557 (match (element-at list-of-cycle-rewards u557) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list558 (match (element-at list-of-cycle-rewards u558) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list559 (match (element-at list-of-cycle-rewards u559) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list560 (match (element-at list-of-cycle-rewards u560) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list561 (match (element-at list-of-cycle-rewards u561) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list562 (match (element-at list-of-cycle-rewards u562) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list563 (match (element-at list-of-cycle-rewards u563) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list564 (match (element-at list-of-cycle-rewards u564) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list565 (match (element-at list-of-cycle-rewards u565) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list566 (match (element-at list-of-cycle-rewards u566) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list567 (match (element-at list-of-cycle-rewards u567) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list568 (match (element-at list-of-cycle-rewards u568) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list569 (match (element-at list-of-cycle-rewards u569) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list570 (match (element-at list-of-cycle-rewards u570) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list571 (match (element-at list-of-cycle-rewards u571) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list572 (match (element-at list-of-cycle-rewards u572) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list573 (match (element-at list-of-cycle-rewards u573) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list574 (match (element-at list-of-cycle-rewards u574) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list575 (match (element-at list-of-cycle-rewards u575) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list576 (match (element-at list-of-cycle-rewards u576) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list577 (match (element-at list-of-cycle-rewards u577) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list578 (match (element-at list-of-cycle-rewards u578) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list579 (match (element-at list-of-cycle-rewards u579) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list580 (match (element-at list-of-cycle-rewards u580) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list581 (match (element-at list-of-cycle-rewards u581) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list582 (match (element-at list-of-cycle-rewards u582) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list583 (match (element-at list-of-cycle-rewards u583) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list584 (match (element-at list-of-cycle-rewards u584) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list585 (match (element-at list-of-cycle-rewards u585) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list586 (match (element-at list-of-cycle-rewards u586) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list587 (match (element-at list-of-cycle-rewards u587) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list588 (match (element-at list-of-cycle-rewards u588) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list589 (match (element-at list-of-cycle-rewards u589) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list590 (match (element-at list-of-cycle-rewards u590) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list591 (match (element-at list-of-cycle-rewards u591) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list592 (match (element-at list-of-cycle-rewards u592) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list593 (match (element-at list-of-cycle-rewards u593) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list594 (match (element-at list-of-cycle-rewards u594) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list595 (match (element-at list-of-cycle-rewards u595) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list596 (match (element-at list-of-cycle-rewards u596) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list597 (match (element-at list-of-cycle-rewards u597) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list598 (match (element-at list-of-cycle-rewards u598) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list599 (match (element-at list-of-cycle-rewards u599) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list600 (match (element-at list-of-cycle-rewards u600) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list601 (match (element-at list-of-cycle-rewards u601) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list602 (match (element-at list-of-cycle-rewards u602) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list603 (match (element-at list-of-cycle-rewards u603) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list604 (match (element-at list-of-cycle-rewards u604) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list605 (match (element-at list-of-cycle-rewards u605) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list606 (match (element-at list-of-cycle-rewards u606) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list607 (match (element-at list-of-cycle-rewards u607) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list608 (match (element-at list-of-cycle-rewards u608) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list609 (match (element-at list-of-cycle-rewards u609) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list610 (match (element-at list-of-cycle-rewards u610) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list611 (match (element-at list-of-cycle-rewards u611) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list612 (match (element-at list-of-cycle-rewards u612) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list613 (match (element-at list-of-cycle-rewards u613) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list614 (match (element-at list-of-cycle-rewards u614) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list615 (match (element-at list-of-cycle-rewards u615) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list616 (match (element-at list-of-cycle-rewards u616) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list617 (match (element-at list-of-cycle-rewards u617) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list618 (match (element-at list-of-cycle-rewards u618) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list619 (match (element-at list-of-cycle-rewards u619) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list620 (match (element-at list-of-cycle-rewards u620) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list621 (match (element-at list-of-cycle-rewards u621) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list622 (match (element-at list-of-cycle-rewards u622) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list623 (match (element-at list-of-cycle-rewards u623) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list624 (match (element-at list-of-cycle-rewards u624) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list625 (match (element-at list-of-cycle-rewards u625) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list626 (match (element-at list-of-cycle-rewards u626) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list627 (match (element-at list-of-cycle-rewards u627) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list628 (match (element-at list-of-cycle-rewards u628) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list629 (match (element-at list-of-cycle-rewards u629) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list630 (match (element-at list-of-cycle-rewards u630) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list631 (match (element-at list-of-cycle-rewards u631) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list632 (match (element-at list-of-cycle-rewards u632) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list633 (match (element-at list-of-cycle-rewards u633) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list634 (match (element-at list-of-cycle-rewards u634) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list635 (match (element-at list-of-cycle-rewards u635) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list636 (match (element-at list-of-cycle-rewards u636) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list637 (match (element-at list-of-cycle-rewards u637) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list638 (match (element-at list-of-cycle-rewards u638) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list639 (match (element-at list-of-cycle-rewards u639) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list640 (match (element-at list-of-cycle-rewards u640) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list641 (match (element-at list-of-cycle-rewards u641) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list642 (match (element-at list-of-cycle-rewards u642) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list643 (match (element-at list-of-cycle-rewards u643) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list644 (match (element-at list-of-cycle-rewards u644) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list645 (match (element-at list-of-cycle-rewards u645) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list646 (match (element-at list-of-cycle-rewards u646) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list647 (match (element-at list-of-cycle-rewards u647) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list648 (match (element-at list-of-cycle-rewards u648) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list649 (match (element-at list-of-cycle-rewards u649) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list650 (match (element-at list-of-cycle-rewards u650) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list651 (match (element-at list-of-cycle-rewards u651) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list652 (match (element-at list-of-cycle-rewards u652) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list653 (match (element-at list-of-cycle-rewards u653) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list654 (match (element-at list-of-cycle-rewards u654) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list655 (match (element-at list-of-cycle-rewards u655) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list656 (match (element-at list-of-cycle-rewards u656) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list657 (match (element-at list-of-cycle-rewards u657) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list658 (match (element-at list-of-cycle-rewards u658) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list659 (match (element-at list-of-cycle-rewards u659) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list660 (match (element-at list-of-cycle-rewards u660) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list661 (match (element-at list-of-cycle-rewards u661) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list662 (match (element-at list-of-cycle-rewards u662) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list663 (match (element-at list-of-cycle-rewards u663) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list664 (match (element-at list-of-cycle-rewards u664) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list665 (match (element-at list-of-cycle-rewards u665) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list666 (match (element-at list-of-cycle-rewards u666) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list667 (match (element-at list-of-cycle-rewards u667) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list668 (match (element-at list-of-cycle-rewards u668) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list669 (match (element-at list-of-cycle-rewards u669) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list670 (match (element-at list-of-cycle-rewards u670) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list671 (match (element-at list-of-cycle-rewards u671) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list672 (match (element-at list-of-cycle-rewards u672) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list673 (match (element-at list-of-cycle-rewards u673) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list674 (match (element-at list-of-cycle-rewards u674) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list675 (match (element-at list-of-cycle-rewards u675) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list676 (match (element-at list-of-cycle-rewards u676) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list677 (match (element-at list-of-cycle-rewards u677) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list678 (match (element-at list-of-cycle-rewards u678) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list679 (match (element-at list-of-cycle-rewards u679) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list680 (match (element-at list-of-cycle-rewards u680) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list681 (match (element-at list-of-cycle-rewards u681) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list682 (match (element-at list-of-cycle-rewards u682) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list683 (match (element-at list-of-cycle-rewards u683) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list684 (match (element-at list-of-cycle-rewards u684) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list685 (match (element-at list-of-cycle-rewards u685) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list686 (match (element-at list-of-cycle-rewards u686) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list687 (match (element-at list-of-cycle-rewards u687) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list688 (match (element-at list-of-cycle-rewards u688) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list689 (match (element-at list-of-cycle-rewards u689) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list690 (match (element-at list-of-cycle-rewards u690) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list691 (match (element-at list-of-cycle-rewards u691) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list692 (match (element-at list-of-cycle-rewards u692) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list693 (match (element-at list-of-cycle-rewards u693) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list694 (match (element-at list-of-cycle-rewards u694) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list695 (match (element-at list-of-cycle-rewards u695) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list696 (match (element-at list-of-cycle-rewards u696) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list697 (match (element-at list-of-cycle-rewards u697) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list698 (match (element-at list-of-cycle-rewards u698) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list699 (match (element-at list-of-cycle-rewards u699) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list700 (match (element-at list-of-cycle-rewards u700) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list701 (match (element-at list-of-cycle-rewards u701) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list702 (match (element-at list-of-cycle-rewards u702) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list703 (match (element-at list-of-cycle-rewards u703) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list704 (match (element-at list-of-cycle-rewards u704) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list705 (match (element-at list-of-cycle-rewards u705) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list706 (match (element-at list-of-cycle-rewards u706) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list707 (match (element-at list-of-cycle-rewards u707) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list708 (match (element-at list-of-cycle-rewards u708) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list709 (match (element-at list-of-cycle-rewards u709) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list710 (match (element-at list-of-cycle-rewards u710) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list711 (match (element-at list-of-cycle-rewards u711) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list712 (match (element-at list-of-cycle-rewards u712) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list713 (match (element-at list-of-cycle-rewards u713) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list714 (match (element-at list-of-cycle-rewards u714) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list715 (match (element-at list-of-cycle-rewards u715) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list716 (match (element-at list-of-cycle-rewards u716) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list717 (match (element-at list-of-cycle-rewards u717) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list718 (match (element-at list-of-cycle-rewards u718) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list719 (match (element-at list-of-cycle-rewards u719) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list720 (match (element-at list-of-cycle-rewards u720) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list721 (match (element-at list-of-cycle-rewards u721) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list722 (match (element-at list-of-cycle-rewards u722) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list723 (match (element-at list-of-cycle-rewards u723) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list724 (match (element-at list-of-cycle-rewards u724) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list725 (match (element-at list-of-cycle-rewards u725) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list726 (match (element-at list-of-cycle-rewards u726) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list727 (match (element-at list-of-cycle-rewards u727) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list728 (match (element-at list-of-cycle-rewards u728) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list729 (match (element-at list-of-cycle-rewards u729) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list730 (match (element-at list-of-cycle-rewards u730) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list731 (match (element-at list-of-cycle-rewards u731) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list732 (match (element-at list-of-cycle-rewards u732) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list733 (match (element-at list-of-cycle-rewards u733) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list734 (match (element-at list-of-cycle-rewards u734) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list735 (match (element-at list-of-cycle-rewards u735) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list736 (match (element-at list-of-cycle-rewards u736) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list737 (match (element-at list-of-cycle-rewards u737) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list738 (match (element-at list-of-cycle-rewards u738) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list739 (match (element-at list-of-cycle-rewards u739) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list740 (match (element-at list-of-cycle-rewards u740) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list741 (match (element-at list-of-cycle-rewards u741) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list742 (match (element-at list-of-cycle-rewards u742) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list743 (match (element-at list-of-cycle-rewards u743) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list744 (match (element-at list-of-cycle-rewards u744) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list745 (match (element-at list-of-cycle-rewards u745) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list746 (match (element-at list-of-cycle-rewards u746) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list747 (match (element-at list-of-cycle-rewards u747) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list748 (match (element-at list-of-cycle-rewards u748) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list749 (match (element-at list-of-cycle-rewards u749) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list750 (match (element-at list-of-cycle-rewards u750) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list751 (match (element-at list-of-cycle-rewards u751) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list752 (match (element-at list-of-cycle-rewards u752) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list753 (match (element-at list-of-cycle-rewards u753) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list754 (match (element-at list-of-cycle-rewards u754) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list755 (match (element-at list-of-cycle-rewards u755) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list756 (match (element-at list-of-cycle-rewards u756) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list757 (match (element-at list-of-cycle-rewards u757) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list758 (match (element-at list-of-cycle-rewards u758) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list759 (match (element-at list-of-cycle-rewards u759) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list760 (match (element-at list-of-cycle-rewards u760) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list761 (match (element-at list-of-cycle-rewards u761) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list762 (match (element-at list-of-cycle-rewards u762) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list763 (match (element-at list-of-cycle-rewards u763) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list764 (match (element-at list-of-cycle-rewards u764) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list765 (match (element-at list-of-cycle-rewards u765) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list766 (match (element-at list-of-cycle-rewards u766) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list767 (match (element-at list-of-cycle-rewards u767) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list768 (match (element-at list-of-cycle-rewards u768) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list769 (match (element-at list-of-cycle-rewards u769) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list770 (match (element-at list-of-cycle-rewards u770) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list771 (match (element-at list-of-cycle-rewards u771) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list772 (match (element-at list-of-cycle-rewards u772) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list773 (match (element-at list-of-cycle-rewards u773) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list774 (match (element-at list-of-cycle-rewards u774) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list775 (match (element-at list-of-cycle-rewards u775) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list776 (match (element-at list-of-cycle-rewards u776) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list777 (match (element-at list-of-cycle-rewards u777) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list778 (match (element-at list-of-cycle-rewards u778) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list779 (match (element-at list-of-cycle-rewards u779) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list780 (match (element-at list-of-cycle-rewards u780) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list781 (match (element-at list-of-cycle-rewards u781) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list782 (match (element-at list-of-cycle-rewards u782) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list783 (match (element-at list-of-cycle-rewards u783) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list784 (match (element-at list-of-cycle-rewards u784) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list785 (match (element-at list-of-cycle-rewards u785) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list786 (match (element-at list-of-cycle-rewards u786) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list787 (match (element-at list-of-cycle-rewards u787) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list788 (match (element-at list-of-cycle-rewards u788) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list789 (match (element-at list-of-cycle-rewards u789) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list790 (match (element-at list-of-cycle-rewards u790) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list791 (match (element-at list-of-cycle-rewards u791) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list792 (match (element-at list-of-cycle-rewards u792) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list793 (match (element-at list-of-cycle-rewards u793) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list794 (match (element-at list-of-cycle-rewards u794) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list795 (match (element-at list-of-cycle-rewards u795) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list796 (match (element-at list-of-cycle-rewards u796) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list797 (match (element-at list-of-cycle-rewards u797) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list798 (match (element-at list-of-cycle-rewards u798) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list799 (match (element-at list-of-cycle-rewards u799) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list800 (match (element-at list-of-cycle-rewards u800) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list801 (match (element-at list-of-cycle-rewards u801) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list802 (match (element-at list-of-cycle-rewards u802) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list803 (match (element-at list-of-cycle-rewards u803) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list804 (match (element-at list-of-cycle-rewards u804) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list805 (match (element-at list-of-cycle-rewards u805) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list806 (match (element-at list-of-cycle-rewards u806) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list807 (match (element-at list-of-cycle-rewards u807) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list808 (match (element-at list-of-cycle-rewards u808) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list809 (match (element-at list-of-cycle-rewards u809) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list810 (match (element-at list-of-cycle-rewards u810) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list811 (match (element-at list-of-cycle-rewards u811) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list812 (match (element-at list-of-cycle-rewards u812) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list813 (match (element-at list-of-cycle-rewards u813) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list814 (match (element-at list-of-cycle-rewards u814) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list815 (match (element-at list-of-cycle-rewards u815) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list816 (match (element-at list-of-cycle-rewards u816) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list817 (match (element-at list-of-cycle-rewards u817) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list818 (match (element-at list-of-cycle-rewards u818) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list819 (match (element-at list-of-cycle-rewards u819) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list820 (match (element-at list-of-cycle-rewards u820) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list821 (match (element-at list-of-cycle-rewards u821) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list822 (match (element-at list-of-cycle-rewards u822) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list823 (match (element-at list-of-cycle-rewards u823) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list824 (match (element-at list-of-cycle-rewards u824) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list825 (match (element-at list-of-cycle-rewards u825) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list826 (match (element-at list-of-cycle-rewards u826) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list827 (match (element-at list-of-cycle-rewards u827) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list828 (match (element-at list-of-cycle-rewards u828) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list829 (match (element-at list-of-cycle-rewards u829) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list830 (match (element-at list-of-cycle-rewards u830) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list831 (match (element-at list-of-cycle-rewards u831) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list832 (match (element-at list-of-cycle-rewards u832) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list833 (match (element-at list-of-cycle-rewards u833) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list834 (match (element-at list-of-cycle-rewards u834) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list835 (match (element-at list-of-cycle-rewards u835) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list836 (match (element-at list-of-cycle-rewards u836) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list837 (match (element-at list-of-cycle-rewards u837) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list838 (match (element-at list-of-cycle-rewards u838) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list839 (match (element-at list-of-cycle-rewards u839) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list840 (match (element-at list-of-cycle-rewards u840) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list841 (match (element-at list-of-cycle-rewards u841) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list842 (match (element-at list-of-cycle-rewards u842) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list843 (match (element-at list-of-cycle-rewards u843) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list844 (match (element-at list-of-cycle-rewards u844) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list845 (match (element-at list-of-cycle-rewards u845) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list846 (match (element-at list-of-cycle-rewards u846) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list847 (match (element-at list-of-cycle-rewards u847) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list848 (match (element-at list-of-cycle-rewards u848) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list849 (match (element-at list-of-cycle-rewards u849) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list850 (match (element-at list-of-cycle-rewards u850) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list851 (match (element-at list-of-cycle-rewards u851) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list852 (match (element-at list-of-cycle-rewards u852) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list853 (match (element-at list-of-cycle-rewards u853) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list854 (match (element-at list-of-cycle-rewards u854) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list855 (match (element-at list-of-cycle-rewards u855) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list856 (match (element-at list-of-cycle-rewards u856) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list857 (match (element-at list-of-cycle-rewards u857) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list858 (match (element-at list-of-cycle-rewards u858) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list859 (match (element-at list-of-cycle-rewards u859) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list860 (match (element-at list-of-cycle-rewards u860) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list861 (match (element-at list-of-cycle-rewards u861) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list862 (match (element-at list-of-cycle-rewards u862) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list863 (match (element-at list-of-cycle-rewards u863) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list864 (match (element-at list-of-cycle-rewards u864) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list865 (match (element-at list-of-cycle-rewards u865) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list866 (match (element-at list-of-cycle-rewards u866) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list867 (match (element-at list-of-cycle-rewards u867) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list868 (match (element-at list-of-cycle-rewards u868) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list869 (match (element-at list-of-cycle-rewards u869) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list870 (match (element-at list-of-cycle-rewards u870) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list871 (match (element-at list-of-cycle-rewards u871) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list872 (match (element-at list-of-cycle-rewards u872) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list873 (match (element-at list-of-cycle-rewards u873) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list874 (match (element-at list-of-cycle-rewards u874) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list875 (match (element-at list-of-cycle-rewards u875) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list876 (match (element-at list-of-cycle-rewards u876) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list877 (match (element-at list-of-cycle-rewards u877) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list878 (match (element-at list-of-cycle-rewards u878) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list879 (match (element-at list-of-cycle-rewards u879) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list880 (match (element-at list-of-cycle-rewards u880) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list881 (match (element-at list-of-cycle-rewards u881) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list882 (match (element-at list-of-cycle-rewards u882) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list883 (match (element-at list-of-cycle-rewards u883) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list884 (match (element-at list-of-cycle-rewards u884) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list885 (match (element-at list-of-cycle-rewards u885) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list886 (match (element-at list-of-cycle-rewards u886) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list887 (match (element-at list-of-cycle-rewards u887) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list888 (match (element-at list-of-cycle-rewards u888) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list889 (match (element-at list-of-cycle-rewards u889) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list890 (match (element-at list-of-cycle-rewards u890) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list891 (match (element-at list-of-cycle-rewards u891) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list892 (match (element-at list-of-cycle-rewards u892) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list893 (match (element-at list-of-cycle-rewards u893) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list894 (match (element-at list-of-cycle-rewards u894) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list895 (match (element-at list-of-cycle-rewards u895) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list896 (match (element-at list-of-cycle-rewards u896) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list897 (match (element-at list-of-cycle-rewards u897) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list898 (match (element-at list-of-cycle-rewards u898) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list899 (match (element-at list-of-cycle-rewards u899) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list900 (match (element-at list-of-cycle-rewards u900) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list901 (match (element-at list-of-cycle-rewards u901) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list902 (match (element-at list-of-cycle-rewards u902) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list903 (match (element-at list-of-cycle-rewards u903) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list904 (match (element-at list-of-cycle-rewards u904) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list905 (match (element-at list-of-cycle-rewards u905) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list906 (match (element-at list-of-cycle-rewards u906) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list907 (match (element-at list-of-cycle-rewards u907) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list908 (match (element-at list-of-cycle-rewards u908) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list909 (match (element-at list-of-cycle-rewards u909) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list910 (match (element-at list-of-cycle-rewards u910) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list911 (match (element-at list-of-cycle-rewards u911) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list912 (match (element-at list-of-cycle-rewards u912) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list913 (match (element-at list-of-cycle-rewards u913) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list914 (match (element-at list-of-cycle-rewards u914) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list915 (match (element-at list-of-cycle-rewards u915) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list916 (match (element-at list-of-cycle-rewards u916) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list917 (match (element-at list-of-cycle-rewards u917) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list918 (match (element-at list-of-cycle-rewards u918) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list919 (match (element-at list-of-cycle-rewards u919) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list920 (match (element-at list-of-cycle-rewards u920) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list921 (match (element-at list-of-cycle-rewards u921) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list922 (match (element-at list-of-cycle-rewards u922) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list923 (match (element-at list-of-cycle-rewards u923) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list924 (match (element-at list-of-cycle-rewards u924) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list925 (match (element-at list-of-cycle-rewards u925) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list926 (match (element-at list-of-cycle-rewards u926) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list927 (match (element-at list-of-cycle-rewards u927) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list928 (match (element-at list-of-cycle-rewards u928) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list929 (match (element-at list-of-cycle-rewards u929) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list930 (match (element-at list-of-cycle-rewards u930) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list931 (match (element-at list-of-cycle-rewards u931) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list932 (match (element-at list-of-cycle-rewards u932) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list933 (match (element-at list-of-cycle-rewards u933) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list934 (match (element-at list-of-cycle-rewards u934) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list935 (match (element-at list-of-cycle-rewards u935) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list936 (match (element-at list-of-cycle-rewards u936) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list937 (match (element-at list-of-cycle-rewards u937) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list938 (match (element-at list-of-cycle-rewards u938) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list939 (match (element-at list-of-cycle-rewards u939) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list940 (match (element-at list-of-cycle-rewards u940) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list941 (match (element-at list-of-cycle-rewards u941) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list942 (match (element-at list-of-cycle-rewards u942) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list943 (match (element-at list-of-cycle-rewards u943) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list944 (match (element-at list-of-cycle-rewards u944) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list945 (match (element-at list-of-cycle-rewards u945) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list946 (match (element-at list-of-cycle-rewards u946) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list947 (match (element-at list-of-cycle-rewards u947) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list948 (match (element-at list-of-cycle-rewards u948) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list949 (match (element-at list-of-cycle-rewards u949) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list950 (match (element-at list-of-cycle-rewards u950) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list951 (match (element-at list-of-cycle-rewards u951) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list952 (match (element-at list-of-cycle-rewards u952) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list953 (match (element-at list-of-cycle-rewards u953) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list954 (match (element-at list-of-cycle-rewards u954) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list955 (match (element-at list-of-cycle-rewards u955) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list956 (match (element-at list-of-cycle-rewards u956) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list957 (match (element-at list-of-cycle-rewards u957) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list958 (match (element-at list-of-cycle-rewards u958) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list959 (match (element-at list-of-cycle-rewards u959) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list960 (match (element-at list-of-cycle-rewards u960) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list961 (match (element-at list-of-cycle-rewards u961) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list962 (match (element-at list-of-cycle-rewards u962) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list963 (match (element-at list-of-cycle-rewards u963) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list964 (match (element-at list-of-cycle-rewards u964) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list965 (match (element-at list-of-cycle-rewards u965) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list966 (match (element-at list-of-cycle-rewards u966) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list967 (match (element-at list-of-cycle-rewards u967) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list968 (match (element-at list-of-cycle-rewards u968) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list969 (match (element-at list-of-cycle-rewards u969) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list970 (match (element-at list-of-cycle-rewards u970) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list971 (match (element-at list-of-cycle-rewards u971) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list972 (match (element-at list-of-cycle-rewards u972) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list973 (match (element-at list-of-cycle-rewards u973) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list974 (match (element-at list-of-cycle-rewards u974) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list975 (match (element-at list-of-cycle-rewards u975) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list976 (match (element-at list-of-cycle-rewards u976) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list977 (match (element-at list-of-cycle-rewards u977) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list978 (match (element-at list-of-cycle-rewards u978) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list979 (match (element-at list-of-cycle-rewards u979) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list980 (match (element-at list-of-cycle-rewards u980) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list981 (match (element-at list-of-cycle-rewards u981) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list982 (match (element-at list-of-cycle-rewards u982) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list983 (match (element-at list-of-cycle-rewards u983) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list984 (match (element-at list-of-cycle-rewards u984) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list985 (match (element-at list-of-cycle-rewards u985) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list986 (match (element-at list-of-cycle-rewards u986) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list987 (match (element-at list-of-cycle-rewards u987) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list988 (match (element-at list-of-cycle-rewards u988) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list989 (match (element-at list-of-cycle-rewards u989) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list990 (match (element-at list-of-cycle-rewards u990) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list991 (match (element-at list-of-cycle-rewards u991) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list992 (match (element-at list-of-cycle-rewards u992) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list993 (match (element-at list-of-cycle-rewards u993) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list994 (match (element-at list-of-cycle-rewards u994) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list995 (match (element-at list-of-cycle-rewards u995) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list996 (match (element-at list-of-cycle-rewards u996) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list997 (match (element-at list-of-cycle-rewards u997) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list998 (match (element-at list-of-cycle-rewards u998) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list999 (match (element-at list-of-cycle-rewards u999) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))

;;       ;; (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 list9))
;;       (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 list9 list10 list11 list12 list13 list14 list15 list16 list17 list18 list19 list20 list21 list22 list23 list24 list25 list26 list27 list28 list29 list30 list31 list32 list33 list34 list35 list36 list37 list38 list39 list40 list41 list42 list43 list44 list45 list46 list47 list48 list49 list50 list51 list52 list53 list54 list55 list56 list57 list58 list59 list60 list61 list62 list63 list64 list65 list66 list67 list68 list69 list70 list71 list72 list73 list74 list75 list76 list77 list78 list79 list80 list81 list82 list83 list84 list85 list86 list87 list88 list89 list90 list91 list92 list93 list94 list95 list96 list97 list98 list99 list100 list101 list102 list103 list104 list105 list106 list107 list108 list109 list110 list111 list112 list113 list114 list115 list116 list117 list118 list119 list120 list121 list122 list123 list124 list125 list126 list127 list128 list129 list130 list131 list132 list133 list134 list135 list136 list137 list138 list139 list140 list141 list142 list143 list144 list145 list146 list147 list148 list149 list150 list151 list152 list153 list154 list155 list156 list157 list158 list159 list160 list161 list162 list163 list164 list165 list166 list167 list168 list169 list170 list171 list172 list173 list174 list175 list176 list177 list178 list179 list180 list181 list182 list183 list184 list185 list186 list187 list188 list189 list190 list191 list192 list193 list194 list195 list196 list197 list198 list199 list200 list201 list202 list203 list204 list205 list206 list207 list208 list209 list210 list211 list212 list213 list214 list215 list216 list217 list218 list219 list220 list221 list222 list223 list224 list225 list226 list227 list228 list229 list230 list231 list232 list233 list234 list235 list236 list237 list238 list239 list240 list241 list242 list243 list244 list245 list246 list247 list248 list249 list250 list251 list252 list253 list254 list255 list256 list257 list258 list259 list260 list261 list262 list263 list264 list265 list266 list267 list268 list269 list270 list271 list272 list273 list274 list275 list276 list277 list278 list279 list280 list281 list282 list283 list284 list285 list286 list287 list288 list289 list290 list291 list292 list293 list294 list295 list296 list297 list298 list299 list300 list301 list302 list303 list304 list305 list306 list307 list308 list309 list310 list311 list312 list313 list314 list315 list316 list317 list318 list319 list320 list321 list322 list323 list324 list325 list326 list327 list328 list329 list330 list331 list332 list333 list334 list335 list336 list337 list338 list339 list340 list341 list342 list343 list344 list345 list346 list347 list348 list349 list350 list351 list352 list353 list354 list355 list356 list357 list358 list359 list360 list361 list362 list363 list364 list365 list366 list367 list368 list369 list370 list371 list372 list373 list374 list375 list376 list377 list378 list379 list380 list381 list382 list383 list384 list385 list386 list387 list388 list389 list390 list391 list392 list393 list394 list395 list396 list397 list398 list399 list400 list401 list402 list403 list404 list405 list406 list407 list408 list409 list410 list411 list412 list413 list414 list415 list416 list417 list418 list419 list420 list421 list422 list423 list424 list425 list426 list427 list428 list429 list430 list431 list432 list433 list434 list435 list436 list437 list438 list439 list440 list441 list442 list443 list444 list445 list446 list447 list448 list449 list450 list451 list452 list453 list454 list455 list456 list457 list458 list459 list460 list461 list462 list463 list464 list465 list466 list467 list468 list469 list470 list471 list472 list473 list474 list475 list476 list477 list478 list479 list480 list481 list482 list483 list484 list485 list486 list487 list488 list489 list490 list491 list492 list493 list494 list495 list496 list497 list498 list499 list500 list501 list502 list503 list504 list505 list506 list507 list508 list509 list510 list511 list512 list513 list514 list515 list516 list517 list518 list519 list520 list521 list522 list523 list524 list525 list526 list527 list528 list529 list530 list531 list532 list533 list534 list535 list536 list537 list538 list539 list540 list541 list542 list543 list544 list545 list546 list547 list548 list549 list550 list551 list552 list553 list554 list555 list556 list557 list558 list559 list560 list561 list562 list563 list564 list565 list566 list567 list568 list569 list570 list571 list572 list573 list574 list575 list576 list577 list578 list579 list580 list581 list582 list583 list584 list585 list586 list587 list588 list589 list590 list591 list592 list593 list594 list595 list596 list597 list598 list599 list600 list601 list602 list603 list604 list605 list606 list607 list608 list609 list610 list611 list612 list613 list614 list615 list616 list617 list618 list619 list620 list621 list622 list623 list624 list625 list626 list627 list628 list629 list630 list631 list632 list633 list634 list635 list636 list637 list638 list639 list640 list641 list642 list643 list644 list645 list646 list647 list648 list649 list650 list651 list652 list653 list654 list655 list656 list657 list658 list659 list660 list661 list662 list663 list664 list665 list666 list667 list668 list669 list670 list671 list672 list673 list674 list675 list676 list677 list678 list679 list680 list681 list682 list683 list684 list685 list686 list687 list688 list689 list690 list691 list692 list693 list694 list695 list696 list697 list698 list699 list700 list701 list702 list703 list704 list705 list706 list707 list708 list709 list710 list711 list712 list713 list714 list715 list716 list717 list718 list719 list720 list721 list722 list723 list724 list725 list726 list727 list728 list729 list730 list731 list732 list733 list734 list735 list736 list737 list738 list739 list740 list741 list742 list743 list744 list745 list746 list747 list748 list749 list750 list751 list752 list753 list754 list755 list756 list757 list758 list759 list760 list761 list762 list763 list764 list765 list766 list767 list768 list769 list770 list771 list772 list773 list774 list775 list776 list777 list778 list779 list780 list781 list782 list783 list784 list785 list786 list787 list788 list789 list790 list791 list792 list793 list794 list795 list796 list797 list798 list799 list800 list801 list802 list803 list804 list805 list806 list807 list808 list809 list810 list811 list812 list813 list814 list815 list816 list817 list818 list819 list820 list821 list822 list823 list824 list825 list826 list827 list828 list829 list830 list831 list832 list833 list834 list835 list836 list837 list838 list839 list840 list841 list842 list843 list844 list845 list846 list847 list848 list849 list850 list851 list852 list853 list854 list855 list856 list857 list858 list859 list860 list861 list862 list863 list864 list865 list866 list867 list868 list869 list870 list871 list872 list873 list874 list875 list876 list877 list878 list879 list880 list881 list882 list883 list884 list885 list886 list887 list888 list889 list890 list891 list892 list893 list894 list895 list896 list897 list898 list899 list900 list901 list902 list903 list904 list905 list906 list907 list908 list909 list910 list911 list912 list913 list914 list915 list916 list917 list918 list919 list920 list921 list922 list923 list924 list925 list926 list927 list928 list929 list930 list931 list932 list933 list934 list935 list936 list937 list938 list939 list940 list941 list942 list943 list944 list945 list946 list947 list948 list949 list950 list951 list952 list953 list954 list955 list956 list957 list958 list959 list960 list961 list962 list963 list964 list965 list966 list967 list968 list969 list970 list971 list972 list973 list974 list975 list976 list977 list978 list979 list980 list981 list982 list983 list984 list985 list986 list987 list988 list989 list990 list991 list992 list993 list994 list995 list996 list997 list998 list999)) 

;;       ;; (rap-info {x-rewards: u0, y-rewards: u0, lp-principal: u0, xbtc-principal: u0, index: u0, idk: list-of-cycle-rewards})
;;       ;; (total-rewards (fold sum-up-rewards reward-cycles rap-info))

;;     )
;;     (begin 
;;       ;; (ok rap-info)
;;       (ok added)
;;     )
;;   )
;; )




;; (use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

;; ;; helper
;; ;; <add a description here>
;; (define-constant PANIC_ERR (err u12))


;; (define-read-only (get-rewards-at-cycle (rewardCycle uint) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
;;     (contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v4 get-rewards-at-cycle rewardCycle who token-x-trait token-y-trait lp-token-trait xbtc-token-trait)
;; )

;; (define-read-only (get-rewards-and-principal-sum (list-of-cycles (list 1000 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
;;     (let (
;;       (txt token-x-trait)
;;       (tyt token-y-trait)
;;       (lpt lp-token-trait)
;;       (btt xbtc-token-trait)
;;       (list-of-cycle-rewards 
;;         (map 
;;           get-rewards-at-cycle  ;;rewardCycle:uint who:principal token-x-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> token-y-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> lp-token-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait> xbtc-token-trait:<ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.sip-010-trait-ft-standard.sip-010-trait>)
;;           list-of-cycles
;;           (list who who who who who who who who who who) 
;;           (list txt txt txt txt txt txt txt txt txt txt)
;;           (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt) 
;;           (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
;;           (list btt btt btt btt btt btt btt btt btt btt)      
;;         )
;;       )

;;       (list0 (match (element-at list-of-cycle-rewards u0) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list1 (match (element-at list-of-cycle-rewards u1) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list2 (match (element-at list-of-cycle-rewards u2) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list3 (match (element-at list-of-cycle-rewards u3) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list4 (match (element-at list-of-cycle-rewards u4) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list5 (match (element-at list-of-cycle-rewards u5) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list6 (match (element-at list-of-cycle-rewards u6) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list7 (match (element-at list-of-cycle-rewards u7) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list8 (match (element-at list-of-cycle-rewards u8) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list9 (match (element-at list-of-cycle-rewards u9) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))

;;       (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 list9))

;;     )
;;     (begin 
;;       (ok added)
;;     )
;;   )
;; )



;; (use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)

;; (define-constant PANIC_ERR (err u12))


;; (define-read-only (get-rewards-at-cycle (rewardCycle uint) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>)) 
;;     (contract-call? 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v4 get-rewards-at-cycle rewardCycle who token-x-trait token-y-trait lp-token-trait xbtc-token-trait)
;; )

;; (define-read-only (get-rewards-and-principal-sum (list-of-cycles (list 1000 uint)) (who principal) (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (lp-token-trait <sip-010-trait>) (xbtc-token-trait <sip-010-trait>))
;;     (let (
;;       (txt token-x-trait)
;;       (tyt token-y-trait)
;;       (lpt lp-token-trait)
;;       (btt xbtc-token-trait)
;;       (list-of-cycle-rewards 
;;         (map 
;;           get-rewards-at-cycle
;;           list-of-cycles
;;           (list who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who who who who who who who 
;;           who who who who who who who who who who who who)
;;           (list txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt txt 
;;            txt txt txt txt txt txt txt txt txt txt txt txt txt txt)
;;           (list tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt 
;;           tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt tyt)
;;           (list lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt 
;;           lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt lpt) 
;;           (list btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt btt 
;;           btt btt btt btt btt btt btt btt btt btt btt btt btt btt)        
;;         )
;;       )

;;       (list0 (match (element-at list-of-cycle-rewards u0) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list1 (match (element-at list-of-cycle-rewards u1) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list2 (match (element-at list-of-cycle-rewards u2) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list3 (match (element-at list-of-cycle-rewards u3) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list4 (match (element-at list-of-cycle-rewards u4) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list5 (match (element-at list-of-cycle-rewards u5) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list6 (match (element-at list-of-cycle-rewards u6) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list7 (match (element-at list-of-cycle-rewards u7) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list8 (match (element-at list-of-cycle-rewards u8) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list9 (match (element-at list-of-cycle-rewards u9) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list10 (match (element-at list-of-cycle-rewards u10) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list11 (match (element-at list-of-cycle-rewards u11) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list12 (match (element-at list-of-cycle-rewards u12) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list13 (match (element-at list-of-cycle-rewards u13) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list14 (match (element-at list-of-cycle-rewards u14) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list15 (match (element-at list-of-cycle-rewards u15) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list16 (match (element-at list-of-cycle-rewards u16) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list17 (match (element-at list-of-cycle-rewards u17) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list18 (match (element-at list-of-cycle-rewards u18) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list19 (match (element-at list-of-cycle-rewards u19) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list20 (match (element-at list-of-cycle-rewards u20) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list21 (match (element-at list-of-cycle-rewards u21) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list22 (match (element-at list-of-cycle-rewards u22) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list23 (match (element-at list-of-cycle-rewards u23) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list24 (match (element-at list-of-cycle-rewards u24) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list25 (match (element-at list-of-cycle-rewards u25) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list26 (match (element-at list-of-cycle-rewards u26) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list27 (match (element-at list-of-cycle-rewards u27) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list28 (match (element-at list-of-cycle-rewards u28) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list29 (match (element-at list-of-cycle-rewards u29) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list30 (match (element-at list-of-cycle-rewards u30) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list31 (match (element-at list-of-cycle-rewards u31) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list32 (match (element-at list-of-cycle-rewards u32) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list33 (match (element-at list-of-cycle-rewards u33) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list34 (match (element-at list-of-cycle-rewards u34) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list35 (match (element-at list-of-cycle-rewards u35) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list36 (match (element-at list-of-cycle-rewards u36) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list37 (match (element-at list-of-cycle-rewards u37) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list38 (match (element-at list-of-cycle-rewards u38) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list39 (match (element-at list-of-cycle-rewards u39) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list40 (match (element-at list-of-cycle-rewards u40) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list41 (match (element-at list-of-cycle-rewards u41) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list42 (match (element-at list-of-cycle-rewards u42) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list43 (match (element-at list-of-cycle-rewards u43) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list44 (match (element-at list-of-cycle-rewards u44) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list45 (match (element-at list-of-cycle-rewards u45) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list46 (match (element-at list-of-cycle-rewards u46) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list47 (match (element-at list-of-cycle-rewards u47) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list48 (match (element-at list-of-cycle-rewards u48) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list49 (match (element-at list-of-cycle-rewards u49) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list50 (match (element-at list-of-cycle-rewards u50) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list51 (match (element-at list-of-cycle-rewards u51) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list52 (match (element-at list-of-cycle-rewards u52) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list53 (match (element-at list-of-cycle-rewards u53) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list54 (match (element-at list-of-cycle-rewards u54) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list55 (match (element-at list-of-cycle-rewards u55) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list56 (match (element-at list-of-cycle-rewards u56) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list57 (match (element-at list-of-cycle-rewards u57) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list58 (match (element-at list-of-cycle-rewards u58) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list59 (match (element-at list-of-cycle-rewards u59) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list60 (match (element-at list-of-cycle-rewards u60) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list61 (match (element-at list-of-cycle-rewards u61) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list62 (match (element-at list-of-cycle-rewards u62) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list63 (match (element-at list-of-cycle-rewards u63) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list64 (match (element-at list-of-cycle-rewards u64) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list65 (match (element-at list-of-cycle-rewards u65) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list66 (match (element-at list-of-cycle-rewards u66) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list67 (match (element-at list-of-cycle-rewards u67) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list68 (match (element-at list-of-cycle-rewards u68) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list69 (match (element-at list-of-cycle-rewards u69) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list70 (match (element-at list-of-cycle-rewards u70) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list71 (match (element-at list-of-cycle-rewards u71) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list72 (match (element-at list-of-cycle-rewards u72) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list73 (match (element-at list-of-cycle-rewards u73) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list74 (match (element-at list-of-cycle-rewards u74) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list75 (match (element-at list-of-cycle-rewards u75) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list76 (match (element-at list-of-cycle-rewards u76) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list77 (match (element-at list-of-cycle-rewards u77) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list78 (match (element-at list-of-cycle-rewards u78) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list79 (match (element-at list-of-cycle-rewards u79) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list80 (match (element-at list-of-cycle-rewards u80) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list81 (match (element-at list-of-cycle-rewards u81) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list82 (match (element-at list-of-cycle-rewards u82) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list83 (match (element-at list-of-cycle-rewards u83) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list84 (match (element-at list-of-cycle-rewards u84) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list85 (match (element-at list-of-cycle-rewards u85) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list86 (match (element-at list-of-cycle-rewards u86) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list87 (match (element-at list-of-cycle-rewards u87) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list88 (match (element-at list-of-cycle-rewards u88) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list89 (match (element-at list-of-cycle-rewards u89) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list90 (match (element-at list-of-cycle-rewards u90) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list91 (match (element-at list-of-cycle-rewards u91) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list92 (match (element-at list-of-cycle-rewards u92) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list93 (match (element-at list-of-cycle-rewards u93) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list94 (match (element-at list-of-cycle-rewards u94) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list95 (match (element-at list-of-cycle-rewards u95) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list96 (match (element-at list-of-cycle-rewards u96) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list97 (match (element-at list-of-cycle-rewards u97) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list98 (match (element-at list-of-cycle-rewards u98) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list99 (match (element-at list-of-cycle-rewards u99) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list100 (match (element-at list-of-cycle-rewards u100) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list101 (match (element-at list-of-cycle-rewards u101) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list102 (match (element-at list-of-cycle-rewards u102) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list103 (match (element-at list-of-cycle-rewards u103) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list104 (match (element-at list-of-cycle-rewards u104) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list105 (match (element-at list-of-cycle-rewards u105) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list106 (match (element-at list-of-cycle-rewards u106) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list107 (match (element-at list-of-cycle-rewards u107) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list108 (match (element-at list-of-cycle-rewards u108) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list109 (match (element-at list-of-cycle-rewards u109) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list110 (match (element-at list-of-cycle-rewards u110) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list111 (match (element-at list-of-cycle-rewards u111) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list112 (match (element-at list-of-cycle-rewards u112) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list113 (match (element-at list-of-cycle-rewards u113) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list114 (match (element-at list-of-cycle-rewards u114) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list115 (match (element-at list-of-cycle-rewards u115) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list116 (match (element-at list-of-cycle-rewards u116) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list117 (match (element-at list-of-cycle-rewards u117) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list118 (match (element-at list-of-cycle-rewards u118) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list119 (match (element-at list-of-cycle-rewards u119) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list120 (match (element-at list-of-cycle-rewards u120) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list121 (match (element-at list-of-cycle-rewards u121) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list122 (match (element-at list-of-cycle-rewards u122) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list123 (match (element-at list-of-cycle-rewards u123) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list124 (match (element-at list-of-cycle-rewards u124) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list125 (match (element-at list-of-cycle-rewards u125) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list126 (match (element-at list-of-cycle-rewards u126) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list127 (match (element-at list-of-cycle-rewards u127) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list128 (match (element-at list-of-cycle-rewards u128) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list129 (match (element-at list-of-cycle-rewards u129) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list130 (match (element-at list-of-cycle-rewards u130) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list131 (match (element-at list-of-cycle-rewards u131) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list132 (match (element-at list-of-cycle-rewards u132) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list133 (match (element-at list-of-cycle-rewards u133) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list134 (match (element-at list-of-cycle-rewards u134) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list135 (match (element-at list-of-cycle-rewards u135) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list136 (match (element-at list-of-cycle-rewards u136) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list137 (match (element-at list-of-cycle-rewards u137) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list138 (match (element-at list-of-cycle-rewards u138) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list139 (match (element-at list-of-cycle-rewards u139) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list140 (match (element-at list-of-cycle-rewards u140) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list141 (match (element-at list-of-cycle-rewards u141) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list142 (match (element-at list-of-cycle-rewards u142) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list143 (match (element-at list-of-cycle-rewards u143) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list144 (match (element-at list-of-cycle-rewards u144) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list145 (match (element-at list-of-cycle-rewards u145) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list146 (match (element-at list-of-cycle-rewards u146) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list147 (match (element-at list-of-cycle-rewards u147) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list148 (match (element-at list-of-cycle-rewards u148) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list149 (match (element-at list-of-cycle-rewards u149) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list150 (match (element-at list-of-cycle-rewards u150) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list151 (match (element-at list-of-cycle-rewards u151) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list152 (match (element-at list-of-cycle-rewards u152) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list153 (match (element-at list-of-cycle-rewards u153) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list154 (match (element-at list-of-cycle-rewards u154) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list155 (match (element-at list-of-cycle-rewards u155) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list156 (match (element-at list-of-cycle-rewards u156) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list157 (match (element-at list-of-cycle-rewards u157) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list158 (match (element-at list-of-cycle-rewards u158) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list159 (match (element-at list-of-cycle-rewards u159) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list160 (match (element-at list-of-cycle-rewards u160) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list161 (match (element-at list-of-cycle-rewards u161) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list162 (match (element-at list-of-cycle-rewards u162) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list163 (match (element-at list-of-cycle-rewards u163) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list164 (match (element-at list-of-cycle-rewards u164) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list165 (match (element-at list-of-cycle-rewards u165) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list166 (match (element-at list-of-cycle-rewards u166) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list167 (match (element-at list-of-cycle-rewards u167) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list168 (match (element-at list-of-cycle-rewards u168) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list169 (match (element-at list-of-cycle-rewards u169) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list170 (match (element-at list-of-cycle-rewards u170) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list171 (match (element-at list-of-cycle-rewards u171) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list172 (match (element-at list-of-cycle-rewards u172) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list173 (match (element-at list-of-cycle-rewards u173) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list174 (match (element-at list-of-cycle-rewards u174) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list175 (match (element-at list-of-cycle-rewards u175) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list176 (match (element-at list-of-cycle-rewards u176) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list177 (match (element-at list-of-cycle-rewards u177) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list178 (match (element-at list-of-cycle-rewards u178) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list179 (match (element-at list-of-cycle-rewards u179) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list180 (match (element-at list-of-cycle-rewards u180) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list181 (match (element-at list-of-cycle-rewards u181) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list182 (match (element-at list-of-cycle-rewards u182) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list183 (match (element-at list-of-cycle-rewards u183) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list184 (match (element-at list-of-cycle-rewards u184) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list185 (match (element-at list-of-cycle-rewards u185) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list186 (match (element-at list-of-cycle-rewards u186) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list187 (match (element-at list-of-cycle-rewards u187) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list188 (match (element-at list-of-cycle-rewards u188) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list189 (match (element-at list-of-cycle-rewards u189) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list190 (match (element-at list-of-cycle-rewards u190) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list191 (match (element-at list-of-cycle-rewards u191) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list192 (match (element-at list-of-cycle-rewards u192) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list193 (match (element-at list-of-cycle-rewards u193) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list194 (match (element-at list-of-cycle-rewards u194) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list195 (match (element-at list-of-cycle-rewards u195) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list196 (match (element-at list-of-cycle-rewards u196) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list197 (match (element-at list-of-cycle-rewards u197) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list198 (match (element-at list-of-cycle-rewards u198) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list199 (match (element-at list-of-cycle-rewards u199) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list200 (match (element-at list-of-cycle-rewards u200) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list201 (match (element-at list-of-cycle-rewards u201) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list202 (match (element-at list-of-cycle-rewards u202) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list203 (match (element-at list-of-cycle-rewards u203) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list204 (match (element-at list-of-cycle-rewards u204) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list205 (match (element-at list-of-cycle-rewards u205) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list206 (match (element-at list-of-cycle-rewards u206) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list207 (match (element-at list-of-cycle-rewards u207) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list208 (match (element-at list-of-cycle-rewards u208) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list209 (match (element-at list-of-cycle-rewards u209) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list210 (match (element-at list-of-cycle-rewards u210) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list211 (match (element-at list-of-cycle-rewards u211) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list212 (match (element-at list-of-cycle-rewards u212) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list213 (match (element-at list-of-cycle-rewards u213) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list214 (match (element-at list-of-cycle-rewards u214) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list215 (match (element-at list-of-cycle-rewards u215) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list216 (match (element-at list-of-cycle-rewards u216) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list217 (match (element-at list-of-cycle-rewards u217) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list218 (match (element-at list-of-cycle-rewards u218) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list219 (match (element-at list-of-cycle-rewards u219) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list220 (match (element-at list-of-cycle-rewards u220) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list221 (match (element-at list-of-cycle-rewards u221) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list222 (match (element-at list-of-cycle-rewards u222) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list223 (match (element-at list-of-cycle-rewards u223) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list224 (match (element-at list-of-cycle-rewards u224) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list225 (match (element-at list-of-cycle-rewards u225) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list226 (match (element-at list-of-cycle-rewards u226) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list227 (match (element-at list-of-cycle-rewards u227) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list228 (match (element-at list-of-cycle-rewards u228) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list229 (match (element-at list-of-cycle-rewards u229) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list230 (match (element-at list-of-cycle-rewards u230) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list231 (match (element-at list-of-cycle-rewards u231) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list232 (match (element-at list-of-cycle-rewards u232) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list233 (match (element-at list-of-cycle-rewards u233) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list234 (match (element-at list-of-cycle-rewards u234) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list235 (match (element-at list-of-cycle-rewards u235) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list236 (match (element-at list-of-cycle-rewards u236) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list237 (match (element-at list-of-cycle-rewards u237) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list238 (match (element-at list-of-cycle-rewards u238) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list239 (match (element-at list-of-cycle-rewards u239) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list240 (match (element-at list-of-cycle-rewards u240) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list241 (match (element-at list-of-cycle-rewards u241) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list242 (match (element-at list-of-cycle-rewards u242) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list243 (match (element-at list-of-cycle-rewards u243) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list244 (match (element-at list-of-cycle-rewards u244) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list245 (match (element-at list-of-cycle-rewards u245) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list246 (match (element-at list-of-cycle-rewards u246) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list247 (match (element-at list-of-cycle-rewards u247) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list248 (match (element-at list-of-cycle-rewards u248) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list249 (match (element-at list-of-cycle-rewards u249) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list250 (match (element-at list-of-cycle-rewards u250) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list251 (match (element-at list-of-cycle-rewards u251) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list252 (match (element-at list-of-cycle-rewards u252) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list253 (match (element-at list-of-cycle-rewards u253) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list254 (match (element-at list-of-cycle-rewards u254) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list255 (match (element-at list-of-cycle-rewards u255) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list256 (match (element-at list-of-cycle-rewards u256) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list257 (match (element-at list-of-cycle-rewards u257) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list258 (match (element-at list-of-cycle-rewards u258) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list259 (match (element-at list-of-cycle-rewards u259) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list260 (match (element-at list-of-cycle-rewards u260) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list261 (match (element-at list-of-cycle-rewards u261) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list262 (match (element-at list-of-cycle-rewards u262) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list263 (match (element-at list-of-cycle-rewards u263) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list264 (match (element-at list-of-cycle-rewards u264) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list265 (match (element-at list-of-cycle-rewards u265) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list266 (match (element-at list-of-cycle-rewards u266) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list267 (match (element-at list-of-cycle-rewards u267) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list268 (match (element-at list-of-cycle-rewards u268) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list269 (match (element-at list-of-cycle-rewards u269) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list270 (match (element-at list-of-cycle-rewards u270) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list271 (match (element-at list-of-cycle-rewards u271) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list272 (match (element-at list-of-cycle-rewards u272) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list273 (match (element-at list-of-cycle-rewards u273) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list274 (match (element-at list-of-cycle-rewards u274) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list275 (match (element-at list-of-cycle-rewards u275) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list276 (match (element-at list-of-cycle-rewards u276) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list277 (match (element-at list-of-cycle-rewards u277) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list278 (match (element-at list-of-cycle-rewards u278) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list279 (match (element-at list-of-cycle-rewards u279) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list280 (match (element-at list-of-cycle-rewards u280) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list281 (match (element-at list-of-cycle-rewards u281) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list282 (match (element-at list-of-cycle-rewards u282) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list283 (match (element-at list-of-cycle-rewards u283) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list284 (match (element-at list-of-cycle-rewards u284) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list285 (match (element-at list-of-cycle-rewards u285) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list286 (match (element-at list-of-cycle-rewards u286) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list287 (match (element-at list-of-cycle-rewards u287) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list288 (match (element-at list-of-cycle-rewards u288) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list289 (match (element-at list-of-cycle-rewards u289) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list290 (match (element-at list-of-cycle-rewards u290) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list291 (match (element-at list-of-cycle-rewards u291) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list292 (match (element-at list-of-cycle-rewards u292) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list293 (match (element-at list-of-cycle-rewards u293) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list294 (match (element-at list-of-cycle-rewards u294) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list295 (match (element-at list-of-cycle-rewards u295) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list296 (match (element-at list-of-cycle-rewards u296) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list297 (match (element-at list-of-cycle-rewards u297) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list298 (match (element-at list-of-cycle-rewards u298) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list299 (match (element-at list-of-cycle-rewards u299) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list300 (match (element-at list-of-cycle-rewards u300) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list301 (match (element-at list-of-cycle-rewards u301) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list302 (match (element-at list-of-cycle-rewards u302) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list303 (match (element-at list-of-cycle-rewards u303) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list304 (match (element-at list-of-cycle-rewards u304) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list305 (match (element-at list-of-cycle-rewards u305) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list306 (match (element-at list-of-cycle-rewards u306) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list307 (match (element-at list-of-cycle-rewards u307) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list308 (match (element-at list-of-cycle-rewards u308) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list309 (match (element-at list-of-cycle-rewards u309) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list310 (match (element-at list-of-cycle-rewards u310) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list311 (match (element-at list-of-cycle-rewards u311) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list312 (match (element-at list-of-cycle-rewards u312) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list313 (match (element-at list-of-cycle-rewards u313) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list314 (match (element-at list-of-cycle-rewards u314) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list315 (match (element-at list-of-cycle-rewards u315) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list316 (match (element-at list-of-cycle-rewards u316) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list317 (match (element-at list-of-cycle-rewards u317) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list318 (match (element-at list-of-cycle-rewards u318) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list319 (match (element-at list-of-cycle-rewards u319) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list320 (match (element-at list-of-cycle-rewards u320) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list321 (match (element-at list-of-cycle-rewards u321) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list322 (match (element-at list-of-cycle-rewards u322) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list323 (match (element-at list-of-cycle-rewards u323) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list324 (match (element-at list-of-cycle-rewards u324) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list325 (match (element-at list-of-cycle-rewards u325) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list326 (match (element-at list-of-cycle-rewards u326) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list327 (match (element-at list-of-cycle-rewards u327) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list328 (match (element-at list-of-cycle-rewards u328) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list329 (match (element-at list-of-cycle-rewards u329) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list330 (match (element-at list-of-cycle-rewards u330) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list331 (match (element-at list-of-cycle-rewards u331) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list332 (match (element-at list-of-cycle-rewards u332) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list333 (match (element-at list-of-cycle-rewards u333) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list334 (match (element-at list-of-cycle-rewards u334) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list335 (match (element-at list-of-cycle-rewards u335) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list336 (match (element-at list-of-cycle-rewards u336) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list337 (match (element-at list-of-cycle-rewards u337) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list338 (match (element-at list-of-cycle-rewards u338) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list339 (match (element-at list-of-cycle-rewards u339) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list340 (match (element-at list-of-cycle-rewards u340) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list341 (match (element-at list-of-cycle-rewards u341) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list342 (match (element-at list-of-cycle-rewards u342) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list343 (match (element-at list-of-cycle-rewards u343) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list344 (match (element-at list-of-cycle-rewards u344) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list345 (match (element-at list-of-cycle-rewards u345) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list346 (match (element-at list-of-cycle-rewards u346) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list347 (match (element-at list-of-cycle-rewards u347) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list348 (match (element-at list-of-cycle-rewards u348) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list349 (match (element-at list-of-cycle-rewards u349) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list350 (match (element-at list-of-cycle-rewards u350) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list351 (match (element-at list-of-cycle-rewards u351) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list352 (match (element-at list-of-cycle-rewards u352) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list353 (match (element-at list-of-cycle-rewards u353) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list354 (match (element-at list-of-cycle-rewards u354) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list355 (match (element-at list-of-cycle-rewards u355) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list356 (match (element-at list-of-cycle-rewards u356) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list357 (match (element-at list-of-cycle-rewards u357) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list358 (match (element-at list-of-cycle-rewards u358) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list359 (match (element-at list-of-cycle-rewards u359) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list360 (match (element-at list-of-cycle-rewards u360) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list361 (match (element-at list-of-cycle-rewards u361) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list362 (match (element-at list-of-cycle-rewards u362) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list363 (match (element-at list-of-cycle-rewards u363) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list364 (match (element-at list-of-cycle-rewards u364) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list365 (match (element-at list-of-cycle-rewards u365) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list366 (match (element-at list-of-cycle-rewards u366) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list367 (match (element-at list-of-cycle-rewards u367) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list368 (match (element-at list-of-cycle-rewards u368) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list369 (match (element-at list-of-cycle-rewards u369) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list370 (match (element-at list-of-cycle-rewards u370) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list371 (match (element-at list-of-cycle-rewards u371) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list372 (match (element-at list-of-cycle-rewards u372) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list373 (match (element-at list-of-cycle-rewards u373) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list374 (match (element-at list-of-cycle-rewards u374) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list375 (match (element-at list-of-cycle-rewards u375) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list376 (match (element-at list-of-cycle-rewards u376) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list377 (match (element-at list-of-cycle-rewards u377) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list378 (match (element-at list-of-cycle-rewards u378) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list379 (match (element-at list-of-cycle-rewards u379) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list380 (match (element-at list-of-cycle-rewards u380) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list381 (match (element-at list-of-cycle-rewards u381) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list382 (match (element-at list-of-cycle-rewards u382) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list383 (match (element-at list-of-cycle-rewards u383) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list384 (match (element-at list-of-cycle-rewards u384) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list385 (match (element-at list-of-cycle-rewards u385) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list386 (match (element-at list-of-cycle-rewards u386) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list387 (match (element-at list-of-cycle-rewards u387) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list388 (match (element-at list-of-cycle-rewards u388) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list389 (match (element-at list-of-cycle-rewards u389) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list390 (match (element-at list-of-cycle-rewards u390) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list391 (match (element-at list-of-cycle-rewards u391) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list392 (match (element-at list-of-cycle-rewards u392) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list393 (match (element-at list-of-cycle-rewards u393) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list394 (match (element-at list-of-cycle-rewards u394) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list395 (match (element-at list-of-cycle-rewards u395) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list396 (match (element-at list-of-cycle-rewards u396) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list397 (match (element-at list-of-cycle-rewards u397) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list398 (match (element-at list-of-cycle-rewards u398) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list399 (match (element-at list-of-cycle-rewards u399) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list400 (match (element-at list-of-cycle-rewards u400) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list401 (match (element-at list-of-cycle-rewards u401) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list402 (match (element-at list-of-cycle-rewards u402) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list403 (match (element-at list-of-cycle-rewards u403) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list404 (match (element-at list-of-cycle-rewards u404) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list405 (match (element-at list-of-cycle-rewards u405) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list406 (match (element-at list-of-cycle-rewards u406) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list407 (match (element-at list-of-cycle-rewards u407) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list408 (match (element-at list-of-cycle-rewards u408) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list409 (match (element-at list-of-cycle-rewards u409) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list410 (match (element-at list-of-cycle-rewards u410) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list411 (match (element-at list-of-cycle-rewards u411) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list412 (match (element-at list-of-cycle-rewards u412) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list413 (match (element-at list-of-cycle-rewards u413) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list414 (match (element-at list-of-cycle-rewards u414) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list415 (match (element-at list-of-cycle-rewards u415) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list416 (match (element-at list-of-cycle-rewards u416) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list417 (match (element-at list-of-cycle-rewards u417) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list418 (match (element-at list-of-cycle-rewards u418) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list419 (match (element-at list-of-cycle-rewards u419) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list420 (match (element-at list-of-cycle-rewards u420) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list421 (match (element-at list-of-cycle-rewards u421) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list422 (match (element-at list-of-cycle-rewards u422) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list423 (match (element-at list-of-cycle-rewards u423) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list424 (match (element-at list-of-cycle-rewards u424) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list425 (match (element-at list-of-cycle-rewards u425) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list426 (match (element-at list-of-cycle-rewards u426) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list427 (match (element-at list-of-cycle-rewards u427) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list428 (match (element-at list-of-cycle-rewards u428) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list429 (match (element-at list-of-cycle-rewards u429) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list430 (match (element-at list-of-cycle-rewards u430) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list431 (match (element-at list-of-cycle-rewards u431) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list432 (match (element-at list-of-cycle-rewards u432) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list433 (match (element-at list-of-cycle-rewards u433) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list434 (match (element-at list-of-cycle-rewards u434) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list435 (match (element-at list-of-cycle-rewards u435) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list436 (match (element-at list-of-cycle-rewards u436) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list437 (match (element-at list-of-cycle-rewards u437) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list438 (match (element-at list-of-cycle-rewards u438) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list439 (match (element-at list-of-cycle-rewards u439) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list440 (match (element-at list-of-cycle-rewards u440) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list441 (match (element-at list-of-cycle-rewards u441) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list442 (match (element-at list-of-cycle-rewards u442) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list443 (match (element-at list-of-cycle-rewards u443) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list444 (match (element-at list-of-cycle-rewards u444) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list445 (match (element-at list-of-cycle-rewards u445) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list446 (match (element-at list-of-cycle-rewards u446) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list447 (match (element-at list-of-cycle-rewards u447) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list448 (match (element-at list-of-cycle-rewards u448) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list449 (match (element-at list-of-cycle-rewards u449) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list450 (match (element-at list-of-cycle-rewards u450) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list451 (match (element-at list-of-cycle-rewards u451) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list452 (match (element-at list-of-cycle-rewards u452) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list453 (match (element-at list-of-cycle-rewards u453) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list454 (match (element-at list-of-cycle-rewards u454) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list455 (match (element-at list-of-cycle-rewards u455) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list456 (match (element-at list-of-cycle-rewards u456) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list457 (match (element-at list-of-cycle-rewards u457) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list458 (match (element-at list-of-cycle-rewards u458) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list459 (match (element-at list-of-cycle-rewards u459) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list460 (match (element-at list-of-cycle-rewards u460) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list461 (match (element-at list-of-cycle-rewards u461) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list462 (match (element-at list-of-cycle-rewards u462) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list463 (match (element-at list-of-cycle-rewards u463) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list464 (match (element-at list-of-cycle-rewards u464) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list465 (match (element-at list-of-cycle-rewards u465) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list466 (match (element-at list-of-cycle-rewards u466) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list467 (match (element-at list-of-cycle-rewards u467) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list468 (match (element-at list-of-cycle-rewards u468) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list469 (match (element-at list-of-cycle-rewards u469) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list470 (match (element-at list-of-cycle-rewards u470) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list471 (match (element-at list-of-cycle-rewards u471) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list472 (match (element-at list-of-cycle-rewards u472) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list473 (match (element-at list-of-cycle-rewards u473) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list474 (match (element-at list-of-cycle-rewards u474) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list475 (match (element-at list-of-cycle-rewards u475) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list476 (match (element-at list-of-cycle-rewards u476) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list477 (match (element-at list-of-cycle-rewards u477) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list478 (match (element-at list-of-cycle-rewards u478) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list479 (match (element-at list-of-cycle-rewards u479) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list480 (match (element-at list-of-cycle-rewards u480) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list481 (match (element-at list-of-cycle-rewards u481) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list482 (match (element-at list-of-cycle-rewards u482) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list483 (match (element-at list-of-cycle-rewards u483) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list484 (match (element-at list-of-cycle-rewards u484) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list485 (match (element-at list-of-cycle-rewards u485) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list486 (match (element-at list-of-cycle-rewards u486) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list487 (match (element-at list-of-cycle-rewards u487) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list488 (match (element-at list-of-cycle-rewards u488) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list489 (match (element-at list-of-cycle-rewards u489) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list490 (match (element-at list-of-cycle-rewards u490) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list491 (match (element-at list-of-cycle-rewards u491) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list492 (match (element-at list-of-cycle-rewards u492) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list493 (match (element-at list-of-cycle-rewards u493) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list494 (match (element-at list-of-cycle-rewards u494) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list495 (match (element-at list-of-cycle-rewards u495) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list496 (match (element-at list-of-cycle-rewards u496) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list497 (match (element-at list-of-cycle-rewards u497) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list498 (match (element-at list-of-cycle-rewards u498) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list499 (match (element-at list-of-cycle-rewards u499) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list500 (match (element-at list-of-cycle-rewards u500) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list501 (match (element-at list-of-cycle-rewards u501) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list502 (match (element-at list-of-cycle-rewards u502) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list503 (match (element-at list-of-cycle-rewards u503) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list504 (match (element-at list-of-cycle-rewards u504) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list505 (match (element-at list-of-cycle-rewards u505) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list506 (match (element-at list-of-cycle-rewards u506) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list507 (match (element-at list-of-cycle-rewards u507) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list508 (match (element-at list-of-cycle-rewards u508) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list509 (match (element-at list-of-cycle-rewards u509) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list510 (match (element-at list-of-cycle-rewards u510) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list511 (match (element-at list-of-cycle-rewards u511) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list512 (match (element-at list-of-cycle-rewards u512) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list513 (match (element-at list-of-cycle-rewards u513) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list514 (match (element-at list-of-cycle-rewards u514) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list515 (match (element-at list-of-cycle-rewards u515) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list516 (match (element-at list-of-cycle-rewards u516) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list517 (match (element-at list-of-cycle-rewards u517) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list518 (match (element-at list-of-cycle-rewards u518) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list519 (match (element-at list-of-cycle-rewards u519) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list520 (match (element-at list-of-cycle-rewards u520) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list521 (match (element-at list-of-cycle-rewards u521) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list522 (match (element-at list-of-cycle-rewards u522) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list523 (match (element-at list-of-cycle-rewards u523) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list524 (match (element-at list-of-cycle-rewards u524) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list525 (match (element-at list-of-cycle-rewards u525) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list526 (match (element-at list-of-cycle-rewards u526) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list527 (match (element-at list-of-cycle-rewards u527) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list528 (match (element-at list-of-cycle-rewards u528) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list529 (match (element-at list-of-cycle-rewards u529) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list530 (match (element-at list-of-cycle-rewards u530) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list531 (match (element-at list-of-cycle-rewards u531) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list532 (match (element-at list-of-cycle-rewards u532) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list533 (match (element-at list-of-cycle-rewards u533) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list534 (match (element-at list-of-cycle-rewards u534) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list535 (match (element-at list-of-cycle-rewards u535) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list536 (match (element-at list-of-cycle-rewards u536) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list537 (match (element-at list-of-cycle-rewards u537) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list538 (match (element-at list-of-cycle-rewards u538) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list539 (match (element-at list-of-cycle-rewards u539) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list540 (match (element-at list-of-cycle-rewards u540) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list541 (match (element-at list-of-cycle-rewards u541) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list542 (match (element-at list-of-cycle-rewards u542) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list543 (match (element-at list-of-cycle-rewards u543) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list544 (match (element-at list-of-cycle-rewards u544) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list545 (match (element-at list-of-cycle-rewards u545) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list546 (match (element-at list-of-cycle-rewards u546) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list547 (match (element-at list-of-cycle-rewards u547) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list548 (match (element-at list-of-cycle-rewards u548) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list549 (match (element-at list-of-cycle-rewards u549) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list550 (match (element-at list-of-cycle-rewards u550) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list551 (match (element-at list-of-cycle-rewards u551) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list552 (match (element-at list-of-cycle-rewards u552) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list553 (match (element-at list-of-cycle-rewards u553) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list554 (match (element-at list-of-cycle-rewards u554) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list555 (match (element-at list-of-cycle-rewards u555) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list556 (match (element-at list-of-cycle-rewards u556) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list557 (match (element-at list-of-cycle-rewards u557) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list558 (match (element-at list-of-cycle-rewards u558) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list559 (match (element-at list-of-cycle-rewards u559) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list560 (match (element-at list-of-cycle-rewards u560) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list561 (match (element-at list-of-cycle-rewards u561) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list562 (match (element-at list-of-cycle-rewards u562) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list563 (match (element-at list-of-cycle-rewards u563) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list564 (match (element-at list-of-cycle-rewards u564) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list565 (match (element-at list-of-cycle-rewards u565) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list566 (match (element-at list-of-cycle-rewards u566) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list567 (match (element-at list-of-cycle-rewards u567) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list568 (match (element-at list-of-cycle-rewards u568) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list569 (match (element-at list-of-cycle-rewards u569) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list570 (match (element-at list-of-cycle-rewards u570) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list571 (match (element-at list-of-cycle-rewards u571) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list572 (match (element-at list-of-cycle-rewards u572) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list573 (match (element-at list-of-cycle-rewards u573) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list574 (match (element-at list-of-cycle-rewards u574) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list575 (match (element-at list-of-cycle-rewards u575) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list576 (match (element-at list-of-cycle-rewards u576) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list577 (match (element-at list-of-cycle-rewards u577) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list578 (match (element-at list-of-cycle-rewards u578) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list579 (match (element-at list-of-cycle-rewards u579) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list580 (match (element-at list-of-cycle-rewards u580) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list581 (match (element-at list-of-cycle-rewards u581) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list582 (match (element-at list-of-cycle-rewards u582) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list583 (match (element-at list-of-cycle-rewards u583) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list584 (match (element-at list-of-cycle-rewards u584) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list585 (match (element-at list-of-cycle-rewards u585) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list586 (match (element-at list-of-cycle-rewards u586) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list587 (match (element-at list-of-cycle-rewards u587) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list588 (match (element-at list-of-cycle-rewards u588) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list589 (match (element-at list-of-cycle-rewards u589) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list590 (match (element-at list-of-cycle-rewards u590) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list591 (match (element-at list-of-cycle-rewards u591) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list592 (match (element-at list-of-cycle-rewards u592) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list593 (match (element-at list-of-cycle-rewards u593) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list594 (match (element-at list-of-cycle-rewards u594) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list595 (match (element-at list-of-cycle-rewards u595) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list596 (match (element-at list-of-cycle-rewards u596) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list597 (match (element-at list-of-cycle-rewards u597) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list598 (match (element-at list-of-cycle-rewards u598) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list599 (match (element-at list-of-cycle-rewards u599) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list600 (match (element-at list-of-cycle-rewards u600) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list601 (match (element-at list-of-cycle-rewards u601) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list602 (match (element-at list-of-cycle-rewards u602) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list603 (match (element-at list-of-cycle-rewards u603) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list604 (match (element-at list-of-cycle-rewards u604) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list605 (match (element-at list-of-cycle-rewards u605) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list606 (match (element-at list-of-cycle-rewards u606) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list607 (match (element-at list-of-cycle-rewards u607) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list608 (match (element-at list-of-cycle-rewards u608) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list609 (match (element-at list-of-cycle-rewards u609) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list610 (match (element-at list-of-cycle-rewards u610) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list611 (match (element-at list-of-cycle-rewards u611) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list612 (match (element-at list-of-cycle-rewards u612) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list613 (match (element-at list-of-cycle-rewards u613) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list614 (match (element-at list-of-cycle-rewards u614) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list615 (match (element-at list-of-cycle-rewards u615) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list616 (match (element-at list-of-cycle-rewards u616) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list617 (match (element-at list-of-cycle-rewards u617) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list618 (match (element-at list-of-cycle-rewards u618) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list619 (match (element-at list-of-cycle-rewards u619) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list620 (match (element-at list-of-cycle-rewards u620) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list621 (match (element-at list-of-cycle-rewards u621) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list622 (match (element-at list-of-cycle-rewards u622) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list623 (match (element-at list-of-cycle-rewards u623) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list624 (match (element-at list-of-cycle-rewards u624) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list625 (match (element-at list-of-cycle-rewards u625) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list626 (match (element-at list-of-cycle-rewards u626) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list627 (match (element-at list-of-cycle-rewards u627) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list628 (match (element-at list-of-cycle-rewards u628) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list629 (match (element-at list-of-cycle-rewards u629) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list630 (match (element-at list-of-cycle-rewards u630) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list631 (match (element-at list-of-cycle-rewards u631) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list632 (match (element-at list-of-cycle-rewards u632) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list633 (match (element-at list-of-cycle-rewards u633) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list634 (match (element-at list-of-cycle-rewards u634) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list635 (match (element-at list-of-cycle-rewards u635) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list636 (match (element-at list-of-cycle-rewards u636) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list637 (match (element-at list-of-cycle-rewards u637) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list638 (match (element-at list-of-cycle-rewards u638) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list639 (match (element-at list-of-cycle-rewards u639) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list640 (match (element-at list-of-cycle-rewards u640) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list641 (match (element-at list-of-cycle-rewards u641) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list642 (match (element-at list-of-cycle-rewards u642) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list643 (match (element-at list-of-cycle-rewards u643) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list644 (match (element-at list-of-cycle-rewards u644) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list645 (match (element-at list-of-cycle-rewards u645) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list646 (match (element-at list-of-cycle-rewards u646) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list647 (match (element-at list-of-cycle-rewards u647) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list648 (match (element-at list-of-cycle-rewards u648) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list649 (match (element-at list-of-cycle-rewards u649) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list650 (match (element-at list-of-cycle-rewards u650) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list651 (match (element-at list-of-cycle-rewards u651) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list652 (match (element-at list-of-cycle-rewards u652) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list653 (match (element-at list-of-cycle-rewards u653) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list654 (match (element-at list-of-cycle-rewards u654) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list655 (match (element-at list-of-cycle-rewards u655) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list656 (match (element-at list-of-cycle-rewards u656) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list657 (match (element-at list-of-cycle-rewards u657) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list658 (match (element-at list-of-cycle-rewards u658) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list659 (match (element-at list-of-cycle-rewards u659) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list660 (match (element-at list-of-cycle-rewards u660) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list661 (match (element-at list-of-cycle-rewards u661) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list662 (match (element-at list-of-cycle-rewards u662) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list663 (match (element-at list-of-cycle-rewards u663) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list664 (match (element-at list-of-cycle-rewards u664) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list665 (match (element-at list-of-cycle-rewards u665) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list666 (match (element-at list-of-cycle-rewards u666) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list667 (match (element-at list-of-cycle-rewards u667) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list668 (match (element-at list-of-cycle-rewards u668) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list669 (match (element-at list-of-cycle-rewards u669) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list670 (match (element-at list-of-cycle-rewards u670) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list671 (match (element-at list-of-cycle-rewards u671) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list672 (match (element-at list-of-cycle-rewards u672) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list673 (match (element-at list-of-cycle-rewards u673) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list674 (match (element-at list-of-cycle-rewards u674) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list675 (match (element-at list-of-cycle-rewards u675) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list676 (match (element-at list-of-cycle-rewards u676) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list677 (match (element-at list-of-cycle-rewards u677) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list678 (match (element-at list-of-cycle-rewards u678) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list679 (match (element-at list-of-cycle-rewards u679) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list680 (match (element-at list-of-cycle-rewards u680) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list681 (match (element-at list-of-cycle-rewards u681) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list682 (match (element-at list-of-cycle-rewards u682) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list683 (match (element-at list-of-cycle-rewards u683) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list684 (match (element-at list-of-cycle-rewards u684) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list685 (match (element-at list-of-cycle-rewards u685) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list686 (match (element-at list-of-cycle-rewards u686) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list687 (match (element-at list-of-cycle-rewards u687) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list688 (match (element-at list-of-cycle-rewards u688) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list689 (match (element-at list-of-cycle-rewards u689) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list690 (match (element-at list-of-cycle-rewards u690) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list691 (match (element-at list-of-cycle-rewards u691) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list692 (match (element-at list-of-cycle-rewards u692) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list693 (match (element-at list-of-cycle-rewards u693) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list694 (match (element-at list-of-cycle-rewards u694) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list695 (match (element-at list-of-cycle-rewards u695) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list696 (match (element-at list-of-cycle-rewards u696) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list697 (match (element-at list-of-cycle-rewards u697) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list698 (match (element-at list-of-cycle-rewards u698) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list699 (match (element-at list-of-cycle-rewards u699) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list700 (match (element-at list-of-cycle-rewards u700) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list701 (match (element-at list-of-cycle-rewards u701) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list702 (match (element-at list-of-cycle-rewards u702) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list703 (match (element-at list-of-cycle-rewards u703) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list704 (match (element-at list-of-cycle-rewards u704) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list705 (match (element-at list-of-cycle-rewards u705) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list706 (match (element-at list-of-cycle-rewards u706) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list707 (match (element-at list-of-cycle-rewards u707) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list708 (match (element-at list-of-cycle-rewards u708) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list709 (match (element-at list-of-cycle-rewards u709) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list710 (match (element-at list-of-cycle-rewards u710) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list711 (match (element-at list-of-cycle-rewards u711) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list712 (match (element-at list-of-cycle-rewards u712) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list713 (match (element-at list-of-cycle-rewards u713) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list714 (match (element-at list-of-cycle-rewards u714) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list715 (match (element-at list-of-cycle-rewards u715) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list716 (match (element-at list-of-cycle-rewards u716) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list717 (match (element-at list-of-cycle-rewards u717) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list718 (match (element-at list-of-cycle-rewards u718) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list719 (match (element-at list-of-cycle-rewards u719) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list720 (match (element-at list-of-cycle-rewards u720) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list721 (match (element-at list-of-cycle-rewards u721) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list722 (match (element-at list-of-cycle-rewards u722) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list723 (match (element-at list-of-cycle-rewards u723) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list724 (match (element-at list-of-cycle-rewards u724) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list725 (match (element-at list-of-cycle-rewards u725) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list726 (match (element-at list-of-cycle-rewards u726) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list727 (match (element-at list-of-cycle-rewards u727) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list728 (match (element-at list-of-cycle-rewards u728) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list729 (match (element-at list-of-cycle-rewards u729) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list730 (match (element-at list-of-cycle-rewards u730) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list731 (match (element-at list-of-cycle-rewards u731) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list732 (match (element-at list-of-cycle-rewards u732) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list733 (match (element-at list-of-cycle-rewards u733) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list734 (match (element-at list-of-cycle-rewards u734) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list735 (match (element-at list-of-cycle-rewards u735) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list736 (match (element-at list-of-cycle-rewards u736) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list737 (match (element-at list-of-cycle-rewards u737) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list738 (match (element-at list-of-cycle-rewards u738) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list739 (match (element-at list-of-cycle-rewards u739) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list740 (match (element-at list-of-cycle-rewards u740) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list741 (match (element-at list-of-cycle-rewards u741) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list742 (match (element-at list-of-cycle-rewards u742) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list743 (match (element-at list-of-cycle-rewards u743) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list744 (match (element-at list-of-cycle-rewards u744) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list745 (match (element-at list-of-cycle-rewards u745) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list746 (match (element-at list-of-cycle-rewards u746) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list747 (match (element-at list-of-cycle-rewards u747) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list748 (match (element-at list-of-cycle-rewards u748) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list749 (match (element-at list-of-cycle-rewards u749) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list750 (match (element-at list-of-cycle-rewards u750) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list751 (match (element-at list-of-cycle-rewards u751) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list752 (match (element-at list-of-cycle-rewards u752) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list753 (match (element-at list-of-cycle-rewards u753) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list754 (match (element-at list-of-cycle-rewards u754) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list755 (match (element-at list-of-cycle-rewards u755) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list756 (match (element-at list-of-cycle-rewards u756) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list757 (match (element-at list-of-cycle-rewards u757) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list758 (match (element-at list-of-cycle-rewards u758) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list759 (match (element-at list-of-cycle-rewards u759) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list760 (match (element-at list-of-cycle-rewards u760) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list761 (match (element-at list-of-cycle-rewards u761) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list762 (match (element-at list-of-cycle-rewards u762) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list763 (match (element-at list-of-cycle-rewards u763) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list764 (match (element-at list-of-cycle-rewards u764) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list765 (match (element-at list-of-cycle-rewards u765) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list766 (match (element-at list-of-cycle-rewards u766) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list767 (match (element-at list-of-cycle-rewards u767) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list768 (match (element-at list-of-cycle-rewards u768) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list769 (match (element-at list-of-cycle-rewards u769) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list770 (match (element-at list-of-cycle-rewards u770) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list771 (match (element-at list-of-cycle-rewards u771) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list772 (match (element-at list-of-cycle-rewards u772) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list773 (match (element-at list-of-cycle-rewards u773) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list774 (match (element-at list-of-cycle-rewards u774) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list775 (match (element-at list-of-cycle-rewards u775) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list776 (match (element-at list-of-cycle-rewards u776) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list777 (match (element-at list-of-cycle-rewards u777) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list778 (match (element-at list-of-cycle-rewards u778) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list779 (match (element-at list-of-cycle-rewards u779) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list780 (match (element-at list-of-cycle-rewards u780) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list781 (match (element-at list-of-cycle-rewards u781) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list782 (match (element-at list-of-cycle-rewards u782) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list783 (match (element-at list-of-cycle-rewards u783) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list784 (match (element-at list-of-cycle-rewards u784) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list785 (match (element-at list-of-cycle-rewards u785) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list786 (match (element-at list-of-cycle-rewards u786) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list787 (match (element-at list-of-cycle-rewards u787) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list788 (match (element-at list-of-cycle-rewards u788) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list789 (match (element-at list-of-cycle-rewards u789) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list790 (match (element-at list-of-cycle-rewards u790) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list791 (match (element-at list-of-cycle-rewards u791) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list792 (match (element-at list-of-cycle-rewards u792) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list793 (match (element-at list-of-cycle-rewards u793) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list794 (match (element-at list-of-cycle-rewards u794) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list795 (match (element-at list-of-cycle-rewards u795) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list796 (match (element-at list-of-cycle-rewards u796) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list797 (match (element-at list-of-cycle-rewards u797) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list798 (match (element-at list-of-cycle-rewards u798) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list799 (match (element-at list-of-cycle-rewards u799) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list800 (match (element-at list-of-cycle-rewards u800) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list801 (match (element-at list-of-cycle-rewards u801) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list802 (match (element-at list-of-cycle-rewards u802) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list803 (match (element-at list-of-cycle-rewards u803) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list804 (match (element-at list-of-cycle-rewards u804) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list805 (match (element-at list-of-cycle-rewards u805) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list806 (match (element-at list-of-cycle-rewards u806) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list807 (match (element-at list-of-cycle-rewards u807) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list808 (match (element-at list-of-cycle-rewards u808) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list809 (match (element-at list-of-cycle-rewards u809) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list810 (match (element-at list-of-cycle-rewards u810) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list811 (match (element-at list-of-cycle-rewards u811) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list812 (match (element-at list-of-cycle-rewards u812) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list813 (match (element-at list-of-cycle-rewards u813) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list814 (match (element-at list-of-cycle-rewards u814) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list815 (match (element-at list-of-cycle-rewards u815) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list816 (match (element-at list-of-cycle-rewards u816) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list817 (match (element-at list-of-cycle-rewards u817) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list818 (match (element-at list-of-cycle-rewards u818) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list819 (match (element-at list-of-cycle-rewards u819) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list820 (match (element-at list-of-cycle-rewards u820) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list821 (match (element-at list-of-cycle-rewards u821) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list822 (match (element-at list-of-cycle-rewards u822) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list823 (match (element-at list-of-cycle-rewards u823) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list824 (match (element-at list-of-cycle-rewards u824) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list825 (match (element-at list-of-cycle-rewards u825) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list826 (match (element-at list-of-cycle-rewards u826) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list827 (match (element-at list-of-cycle-rewards u827) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list828 (match (element-at list-of-cycle-rewards u828) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list829 (match (element-at list-of-cycle-rewards u829) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list830 (match (element-at list-of-cycle-rewards u830) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list831 (match (element-at list-of-cycle-rewards u831) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list832 (match (element-at list-of-cycle-rewards u832) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list833 (match (element-at list-of-cycle-rewards u833) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list834 (match (element-at list-of-cycle-rewards u834) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list835 (match (element-at list-of-cycle-rewards u835) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list836 (match (element-at list-of-cycle-rewards u836) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list837 (match (element-at list-of-cycle-rewards u837) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list838 (match (element-at list-of-cycle-rewards u838) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list839 (match (element-at list-of-cycle-rewards u839) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list840 (match (element-at list-of-cycle-rewards u840) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list841 (match (element-at list-of-cycle-rewards u841) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list842 (match (element-at list-of-cycle-rewards u842) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list843 (match (element-at list-of-cycle-rewards u843) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list844 (match (element-at list-of-cycle-rewards u844) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list845 (match (element-at list-of-cycle-rewards u845) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list846 (match (element-at list-of-cycle-rewards u846) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list847 (match (element-at list-of-cycle-rewards u847) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list848 (match (element-at list-of-cycle-rewards u848) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list849 (match (element-at list-of-cycle-rewards u849) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list850 (match (element-at list-of-cycle-rewards u850) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list851 (match (element-at list-of-cycle-rewards u851) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list852 (match (element-at list-of-cycle-rewards u852) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list853 (match (element-at list-of-cycle-rewards u853) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list854 (match (element-at list-of-cycle-rewards u854) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list855 (match (element-at list-of-cycle-rewards u855) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list856 (match (element-at list-of-cycle-rewards u856) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list857 (match (element-at list-of-cycle-rewards u857) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list858 (match (element-at list-of-cycle-rewards u858) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list859 (match (element-at list-of-cycle-rewards u859) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list860 (match (element-at list-of-cycle-rewards u860) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list861 (match (element-at list-of-cycle-rewards u861) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list862 (match (element-at list-of-cycle-rewards u862) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list863 (match (element-at list-of-cycle-rewards u863) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list864 (match (element-at list-of-cycle-rewards u864) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list865 (match (element-at list-of-cycle-rewards u865) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list866 (match (element-at list-of-cycle-rewards u866) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list867 (match (element-at list-of-cycle-rewards u867) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list868 (match (element-at list-of-cycle-rewards u868) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list869 (match (element-at list-of-cycle-rewards u869) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list870 (match (element-at list-of-cycle-rewards u870) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list871 (match (element-at list-of-cycle-rewards u871) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list872 (match (element-at list-of-cycle-rewards u872) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list873 (match (element-at list-of-cycle-rewards u873) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list874 (match (element-at list-of-cycle-rewards u874) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list875 (match (element-at list-of-cycle-rewards u875) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list876 (match (element-at list-of-cycle-rewards u876) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list877 (match (element-at list-of-cycle-rewards u877) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list878 (match (element-at list-of-cycle-rewards u878) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list879 (match (element-at list-of-cycle-rewards u879) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list880 (match (element-at list-of-cycle-rewards u880) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list881 (match (element-at list-of-cycle-rewards u881) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list882 (match (element-at list-of-cycle-rewards u882) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list883 (match (element-at list-of-cycle-rewards u883) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list884 (match (element-at list-of-cycle-rewards u884) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list885 (match (element-at list-of-cycle-rewards u885) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list886 (match (element-at list-of-cycle-rewards u886) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list887 (match (element-at list-of-cycle-rewards u887) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list888 (match (element-at list-of-cycle-rewards u888) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list889 (match (element-at list-of-cycle-rewards u889) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list890 (match (element-at list-of-cycle-rewards u890) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list891 (match (element-at list-of-cycle-rewards u891) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list892 (match (element-at list-of-cycle-rewards u892) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list893 (match (element-at list-of-cycle-rewards u893) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list894 (match (element-at list-of-cycle-rewards u894) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list895 (match (element-at list-of-cycle-rewards u895) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list896 (match (element-at list-of-cycle-rewards u896) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list897 (match (element-at list-of-cycle-rewards u897) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list898 (match (element-at list-of-cycle-rewards u898) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list899 (match (element-at list-of-cycle-rewards u899) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list900 (match (element-at list-of-cycle-rewards u900) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list901 (match (element-at list-of-cycle-rewards u901) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list902 (match (element-at list-of-cycle-rewards u902) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list903 (match (element-at list-of-cycle-rewards u903) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list904 (match (element-at list-of-cycle-rewards u904) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list905 (match (element-at list-of-cycle-rewards u905) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list906 (match (element-at list-of-cycle-rewards u906) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list907 (match (element-at list-of-cycle-rewards u907) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list908 (match (element-at list-of-cycle-rewards u908) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list909 (match (element-at list-of-cycle-rewards u909) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list910 (match (element-at list-of-cycle-rewards u910) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list911 (match (element-at list-of-cycle-rewards u911) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list912 (match (element-at list-of-cycle-rewards u912) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list913 (match (element-at list-of-cycle-rewards u913) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list914 (match (element-at list-of-cycle-rewards u914) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list915 (match (element-at list-of-cycle-rewards u915) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list916 (match (element-at list-of-cycle-rewards u916) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list917 (match (element-at list-of-cycle-rewards u917) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list918 (match (element-at list-of-cycle-rewards u918) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list919 (match (element-at list-of-cycle-rewards u919) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list920 (match (element-at list-of-cycle-rewards u920) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list921 (match (element-at list-of-cycle-rewards u921) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list922 (match (element-at list-of-cycle-rewards u922) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list923 (match (element-at list-of-cycle-rewards u923) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list924 (match (element-at list-of-cycle-rewards u924) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list925 (match (element-at list-of-cycle-rewards u925) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list926 (match (element-at list-of-cycle-rewards u926) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list927 (match (element-at list-of-cycle-rewards u927) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list928 (match (element-at list-of-cycle-rewards u928) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list929 (match (element-at list-of-cycle-rewards u929) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list930 (match (element-at list-of-cycle-rewards u930) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list931 (match (element-at list-of-cycle-rewards u931) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list932 (match (element-at list-of-cycle-rewards u932) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list933 (match (element-at list-of-cycle-rewards u933) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list934 (match (element-at list-of-cycle-rewards u934) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list935 (match (element-at list-of-cycle-rewards u935) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list936 (match (element-at list-of-cycle-rewards u936) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list937 (match (element-at list-of-cycle-rewards u937) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list938 (match (element-at list-of-cycle-rewards u938) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list939 (match (element-at list-of-cycle-rewards u939) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list940 (match (element-at list-of-cycle-rewards u940) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list941 (match (element-at list-of-cycle-rewards u941) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list942 (match (element-at list-of-cycle-rewards u942) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list943 (match (element-at list-of-cycle-rewards u943) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list944 (match (element-at list-of-cycle-rewards u944) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list945 (match (element-at list-of-cycle-rewards u945) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list946 (match (element-at list-of-cycle-rewards u946) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list947 (match (element-at list-of-cycle-rewards u947) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list948 (match (element-at list-of-cycle-rewards u948) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list949 (match (element-at list-of-cycle-rewards u949) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list950 (match (element-at list-of-cycle-rewards u950) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list951 (match (element-at list-of-cycle-rewards u951) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list952 (match (element-at list-of-cycle-rewards u952) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list953 (match (element-at list-of-cycle-rewards u953) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list954 (match (element-at list-of-cycle-rewards u954) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list955 (match (element-at list-of-cycle-rewards u955) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list956 (match (element-at list-of-cycle-rewards u956) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list957 (match (element-at list-of-cycle-rewards u957) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list958 (match (element-at list-of-cycle-rewards u958) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list959 (match (element-at list-of-cycle-rewards u959) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list960 (match (element-at list-of-cycle-rewards u960) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list961 (match (element-at list-of-cycle-rewards u961) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list962 (match (element-at list-of-cycle-rewards u962) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list963 (match (element-at list-of-cycle-rewards u963) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list964 (match (element-at list-of-cycle-rewards u964) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list965 (match (element-at list-of-cycle-rewards u965) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list966 (match (element-at list-of-cycle-rewards u966) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list967 (match (element-at list-of-cycle-rewards u967) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list968 (match (element-at list-of-cycle-rewards u968) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list969 (match (element-at list-of-cycle-rewards u969) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list970 (match (element-at list-of-cycle-rewards u970) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list971 (match (element-at list-of-cycle-rewards u971) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list972 (match (element-at list-of-cycle-rewards u972) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list973 (match (element-at list-of-cycle-rewards u973) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list974 (match (element-at list-of-cycle-rewards u974) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list975 (match (element-at list-of-cycle-rewards u975) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list976 (match (element-at list-of-cycle-rewards u976) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list977 (match (element-at list-of-cycle-rewards u977) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list978 (match (element-at list-of-cycle-rewards u978) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list979 (match (element-at list-of-cycle-rewards u979) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list980 (match (element-at list-of-cycle-rewards u980) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list981 (match (element-at list-of-cycle-rewards u981) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list982 (match (element-at list-of-cycle-rewards u982) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list983 (match (element-at list-of-cycle-rewards u983) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list984 (match (element-at list-of-cycle-rewards u984) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list985 (match (element-at list-of-cycle-rewards u985) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list986 (match (element-at list-of-cycle-rewards u986) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list987 (match (element-at list-of-cycle-rewards u987) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list988 (match (element-at list-of-cycle-rewards u988) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list989 (match (element-at list-of-cycle-rewards u989) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list990 (match (element-at list-of-cycle-rewards u990) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list991 (match (element-at list-of-cycle-rewards u991) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list992 (match (element-at list-of-cycle-rewards u992) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list993 (match (element-at list-of-cycle-rewards u993) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list994 (match (element-at list-of-cycle-rewards u994) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list995 (match (element-at list-of-cycle-rewards u995) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list996 (match (element-at list-of-cycle-rewards u996) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list997 (match (element-at list-of-cycle-rewards u997) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list998 (match (element-at list-of-cycle-rewards u998) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))
;;       (list999 (match (element-at list-of-cycle-rewards u999) values (unwrap! values PANIC_ERR) (list u0 u0 u0 u0)))

;;       (added (map + list0 list1 list2 list3 list4 list5 list6 list7 list8 
;;       list9 list10 list11 list12 list13 list14 list15 list16 list17 list18 
;;       list19 list20 list21 list22 list23 list24 list25 list26 list27 list28 
;;       list29 list30 list31 list32 list33 list34 list35 list36 list37 list38 
;;       list39 list40 list41 list42 list43 list44 list45 list46 list47 list48 
;;       list49 list50 list51 list52 list53 list54 list55 list56 list57 list58 
;;       list59 list60 list61 list62 list63 list64 list65 list66 list67 list68 
;;       list69 list70 list71 list72 list73 list74 list75 list76 list77 list78 
;;       list79 list80 list81 list82 list83 list84 list85 list86 list87 list88 
;;       list89 list90 list91 list92 list93 list94 list95 list96 list97 list98 
;;       list99 list100 list101 list102 list103 list104 list105 list106 list107 
;;       list108 list109 list110 list111 list112 list113 list114 list115 list116 
;;       list117 list118 list119 list120 list121 list122 list123 list124 list125 
;;       list126 list127 list128 list129 list130 list131 list132 list133 list134 
;;       list135 list136 list137 list138 list139 list140 list141 list142 list143 
;;       list144 list145 list146 list147 list148 list149 list150 list151 list152 
;;       list153 list154 list155 list156 list157 list158 list159 list160 list161 
;;       list162 list163 list164 list165 list166 list167 list168 list169 list170 
;;       list171 list172 list173 list174 list175 list176 list177 list178 list179 
;;       list180 list181 list182 list183 list184 list185 list186 list187 list188 
;;       list189 list190 list191 list192 list193 list194 list195 list196 list197 
;;       list198 list199 list200 list201 list202 list203 list204 list205 list206 
;;       list207 list208 list209 list210 list211 list212 list213 list214 list215 
;;       list216 list217 list218 list219 list220 list221 list222 list223 list224 
;;       list225 list226 list227 list228 list229 list230 list231 list232 list233 
;;       list234 list235 list236 list237 list238 list239 list240 list241 list242 
;;       list243 list244 list245 list246 list247 list248 list249 list250 list251 
;;       list252 list253 list254 list255 list256 list257 list258 list259 list260 
;;       list261 list262 list263 list264 list265 list266 list267 list268 list269 
;;       list270 list271 list272 list273 list274 list275 list276 list277 list278 
;;       list279 list280 list281 list282 list283 list284 list285 list286 list287 
;;       list288 list289 list290 list291 list292 list293 list294 list295 list296 
;;       list297 list298 list299 list300 list301 list302 list303 list304 list305 
;;       list306 list307 list308 list309 list310 list311 list312 list313 list314 
;;       list315 list316 list317 list318 list319 list320 list321 list322 list323 
;;       list324 list325 list326 list327 list328 list329 list330 list331 list332 
;;       list333 list334 list335 list336 list337 list338 list339 list340 list341 
;;       list342 list343 list344 list345 list346 list347 list348 list349 list350 
;;       list351 list352 list353 list354 list355 list356 list357 list358 list359 
;;       list360 list361 list362 list363 list364 list365 list366 list367 list368 
;;       list369 list370 list371 list372 list373 list374 list375 list376 list377 
;;       list378 list379 list380 list381 list382 list383 list384 list385 list386 
;;       list387 list388 list389 list390 list391 list392 list393 list394 list395 
;;       list396 list397 list398 list399 list400 list401 list402 list403 list404 
;;       list405 list406 list407 list408 list409 list410 list411 list412 list413 
;;       list414 list415 list416 list417 list418 list419 list420 list421 list422 
;;       list423 list424 list425 list426 list427 list428 list429 list430 list431 
;;       list432 list433 list434 list435 list436 list437 list438 list439 list440 
;;       list441 list442 list443 list444 list445 list446 list447 list448 list449 
;;       list450 list451 list452 list453 list454 list455 list456 list457 list458 
;;       list459 list460 list461 list462 list463 list464 list465 list466 list467 
;;       list468 list469 list470 list471 list472 list473 list474 list475 list476 
;;       list477 list478 list479 list480 list481 list482 list483 list484 list485 
;;       list486 list487 list488 list489 list490 list491 list492 list493 list494 
;;       list495 list496 list497 list498 list499 list500 list501 list502 list503 
;;       list504 list505 list506 list507 list508 list509 list510 list511 list512 
;;       list513 list514 list515 list516 list517 list518 list519 list520 list521 
;;       list522 list523 list524 list525 list526 list527 list528 list529 list530 
;;       list531 list532 list533 list534 list535 list536 list537 list538 list539 
;;       list540 list541 list542 list543 list544 list545 list546 list547 list548 
;;       list549 list550 list551 list552 list553 list554 list555 list556 list557 
;;       list558 list559 list560 list561 list562 list563 list564 list565 list566 
;;       list567 list568 list569 list570 list571 list572 list573 list574 list575 
;;       list576 list577 list578 list579 list580 list581 list582 list583 list584 
;;       list585 list586 list587 list588 list589 list590 list591 list592 list593 
;;       list594 list595 list596 list597 list598 list599 list600 list601 list602 
;;       list603 list604 list605 list606 list607 list608 list609 list610 list611 
;;       list612 list613 list614 list615 list616 list617 list618 list619 list620 
;;       list621 list622 list623 list624 list625 list626 list627 list628 list629 
;;       list630 list631 list632 list633 list634 list635 list636 list637 list638 
;;       list639 list640 list641 list642 list643 list644 list645 list646 list647 
;;       list648 list649 list650 list651 list652 list653 list654 list655 list656 
;;       list657 list658 list659 list660 list661 list662 list663 list664 list665 
;;       list666 list667 list668 list669 list670 list671 list672 list673 list674 
;;       list675 list676 list677 list678 list679 list680 list681 list682 list683 
;;       list684 list685 list686 list687 list688 list689 list690 list691 list692 
;;       list693 list694 list695 list696 list697 list698 list699 list700 list701 
;;       list702 list703 list704 list705 list706 list707 list708 list709 list710 
;;       list711 list712 list713 list714 list715 list716 list717 list718 list719 
;;       list720 list721 list722 list723 list724 list725 list726 list727 list728 
;;       list729 list730 list731 list732 list733 list734 list735 list736 list737 
;;       list738 list739 list740 list741 list742 list743 list744 list745 list746 
;;       list747 list748 list749 list750 list751 list752 list753 list754 list755 
;;       list756 list757 list758 list759 list760 list761 list762 list763 list764 
;;       list765 list766 list767 list768 list769 list770 list771 list772 list773 
;;       list774 list775 list776 list777 list778 list779 list780 list781 list782 
;;       list783 list784 list785 list786 list787 list788 list789 list790 list791 
;;       list792 list793 list794 list795 list796 list797 list798 list799 list800 
;;       list801 list802 list803 list804 list805 list806 list807 list808 list809 
;;       list810 list811 list812 list813 list814 list815 list816 list817 list818 
;;       list819 list820 list821 list822 list823 list824 list825 list826 list827 
;;       list828 list829 list830 list831 list832 list833 list834 list835 list836 
;;       list837 list838 list839 list840 list841 list842 list843 list844 list845 
;;       list846 list847 list848 list849 list850 list851 list852 list853 list854 
;;       list855 list856 list857 list858 list859 list860 list861 list862 list863 
;;       list864 list865 list866 list867 list868 list869 list870 list871 list872 
;;       list873 list874 list875 list876 list877 list878 list879 list880 list881 
;;       list882 list883 list884 list885 list886 list887 list888 list889 list890 
;;       list891 list892 list893 list894 list895 list896 list897 list898 list899 
;;       list900 list901 list902 list903 list904 list905 list906 list907 list908 
;;       list909 list910 list911 list912 list913 list914 list915 list916 list917 
;;       list918 list919 list920 list921 list922 list923 list924 list925 list926 
;;       list927 list928 list929 list930 list931 list932 list933 list934 list935 
;;       list936 list937 list938 list939 list940 list941 list942 list943 list944 
;;       list945 list946 list947 list948 list949 list950 list951 list952 list953 
;;       list954 list955 list956 list957 list958 list959 list960 list961 list962 
;;       list963 list964 list965 list966 list967 list968 list969 list970 list971 
;;       list972 list973 list974 list975 list976 list977 list978 list979 list980 
;;       list981 list982 list983 list984 list985 list986 list987 list988 list989 
;;       list990 list991 list992 list993 list994 list995 list996 list997 list998 
;;       list999)) 

;;     )
;;     (begin 
;;       (ok added)
;;     )
;;   )
;; )