
;; xusd-token

;;;;;;;;;;;;;;;;;;;;; SIP 010 ;;;;;;;;;;;;;;;;;;;;;;
(impl-trait .sip-010-trait-ft-standard.sip-010-trait)



;; Defines the xusd Stablecoin according to the SIP-010 Standard
(define-fungible-token xusd)

(define-data-var token-uri (string-utf8 256) u"")

(define-constant CONTRACT-OWNER 'ST38GBVK5HEJ0MBH4CRJ9HQEW86HX0H9AP3EJP4TW)
(define-constant ERR-UNAUTHORIZED-MINT (err u100))



;; errors
(define-constant ERR-NOT-AUTHORIZED u14401)

;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-read-only (get-total-supply)
  (ok (ft-get-supply xusd))
)

(define-read-only (get-name)
  (ok "xUSD")
)

(define-read-only (get-symbol)
  (ok "xUSD")
)

(define-read-only (get-decimals)
  (ok u6)
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance xusd account))
)


(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))

    (match (ft-transfer? xusd amount sender recipient)
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
    (asserts! (is-eq tx-sender recipient) ERR-UNAUTHORIZED-MINT)
    (ft-mint? xusd amount recipient)
  )
)

(define-public (burn (burner principal) (amount uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
    (ft-burn? xusd amount burner)
  )
)


