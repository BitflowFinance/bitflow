;; lp-trait
(use-trait sip-010 .sip-010-trait-ft-standard.sip-010-trait)

(define-trait lp-trait
  (

    ;; Mint
    (mint (principal uint) (response bool uint))

    ;; Burn
    (burn (principal uint) (response bool uint))
  )
)
