
;; xbtc-token
;; dummy contract representing xbtc

;;;;;;;;;;;;;;;;;;;;; SIP 010 ;;;;;;;;;;;;;;;;;;;;;;
(impl-trait .sip-010-trait-ft-standard.sip-010-trait)


(define-fungible-token xbtc)

(define-data-var token-uri (string-utf8 256) u"")

(define-constant CONTRACT-OWNER 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-constant ERR-UNAUTHORIZED-MINT (err u100))



;; errors
(define-constant ERR-NOT-AUTHORIZED u14401)

;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-read-only (get-total-supply)
  (ok (ft-get-supply xbtc))
)

(define-read-only (get-name)
  (ok "xBTC")
)

(define-read-only (get-symbol)
  (ok "xBTC")
)

(define-read-only (get-decimals)
  (ok u0)
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance xbtc account))
)

(define-read-only (get-balance-simple (account principal))
  (ft-get-balance xbtc account)
)


(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))

    (match (ft-transfer? xbtc amount sender recipient)
      response (begin
        (print memo)
        (ok response)
      )
      error (err error)
    )
  )
)


(define-public (mint (amount uint) (recipient principal))
  (begin
    ;; (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
    (asserts! (is-eq tx-sender recipient) ERR-UNAUTHORIZED-MINT)
    (ft-mint? xbtc amount recipient)
  )
)

(define-public (burn (burner principal) (amount uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
    (ft-burn? xbtc amount burner)
  )
)
