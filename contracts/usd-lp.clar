
;; usd-lp

;;;;;;;;;;;;;;;;;;;;; SIP 010 ;;;;;;;;;;;;;;;;;;;;;;
(impl-trait .sip-010-trait-ft-standard.sip-010-trait)



(define-fungible-token usd-lp)

(define-data-var token-uri (string-utf8 256) u"")

(define-constant CONTRACT-OWNER 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-constant ERR-UNAUTHORIZED-MINT (err u100))
(define-constant ERR-ZERO-MINT (err u101))
(define-data-var allowed-minter principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)



;; errors
(define-constant ERR-NOT-AUTHORIZED u14401)

;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-read-only (get-total-supply)
  (ok (ft-get-supply usd-lp))
)

(define-read-only (get-name)
  (ok "USD-LP")
)

(define-read-only (get-symbol)
  (ok "USD-LP")
)

(define-read-only (get-decimals)
  (ok u6)
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance usd-lp account))
)

(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))

    (match (ft-transfer? usd-lp amount sender recipient)
      response (begin
        (print memo)
        (ok response)
      )
      error (err error)
    )
  )
)

;; Change the minter to any other principal, can only be called the current minter
(define-public (set-minter (who principal))
  (begin
    (asserts! (is-eq tx-sender (var-get allowed-minter)) ERR-UNAUTHORIZED-MINT)
    ;; who is unchecked, we allow the minter to make whoever they like the new minter
    ;; #[allow(unchecked_data)]
    (ok (var-set allowed-minter who))
  )
)

(define-public (mint (amount uint) (who principal))
  (begin
    ;; (asserts! (is-eq tx-sender (var-get allowed-minter)) ERR-UNAUTHORIZED-MINT)
    (asserts! (> amount u0) ERR-ZERO-MINT)
    ;; amount, who are unchecked, but we let the contract owner mint to whoever they like for convenience
    ;; #[allow(unchecked_data)]
    (ft-mint? usd-lp amount who)
  )
)


(define-public (burn (burner principal) (amount uint))
  (begin
    ;; (asserts! (is-eq tx-sender (var-get allowed-minter)) ERR-UNAUTHORIZED-MINT)
    (ft-burn? usd-lp amount burner)
  )
)