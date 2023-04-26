;; usd-lp

;;;;;;;;;;;;;;;;;;;;; SIP 010 ;;;;;;;;;;;;;;;;;;;;;;
(impl-trait .bitflow-sip-010.bitflow-lp-trait)


(define-fungible-token usd-lp)


(define-constant CONTRACT-OWNER 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-constant ERR-UNAUTHORIZED-MINT (err u100))
(define-constant ERR-ZERO-MINT (err u101))
(define-constant ERR-NOT-AUTHORIZED (err u102))

;;vars
(define-data-var token-uri (string-utf8 256) u"")
(define-data-var approved-minter principal 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.stableswap-v0-0-1)


;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) ERR-NOT-AUTHORIZED)

    (match (ft-transfer? usd-lp amount sender recipient)
      response (begin
        (print memo)
        (ok response)
      )
      error (err error)
    )
  )
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

(define-read-only (get-total-supply)
  (ok (ft-get-supply usd-lp))
)


(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (mint (who principal) (amount uint))
  (begin
    (asserts! (is-eq tx-sender (var-get approved-minter)) ERR-UNAUTHORIZED-MINT)
    (asserts! (> amount u0) ERR-ZERO-MINT)
    ;; amount & who are unchecked, but we let the contract owner mint to whoever they like for convenience
    ;; #[allow(unchecked_data)]
    (ft-mint? usd-lp amount who)
  )
  ;; (ft-mint? usd-lp amount who)
)


(define-public (burn (burner principal) (amount uint))
  (begin
    (asserts! (is-eq tx-sender burner) ERR-NOT-AUTHORIZED)
    ;; amount & who are unchecked, but we let the contract owner mint to whoever they like for convenience
    ;; #[allow(unchecked_data)]
    (ft-mint? usd-lp amount burner)
  )
)

;; Change the minter to any other principal, can only be called the current minter
(define-public (set-minter (who principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-NOT-AUTHORIZED)
    ;; who is unchecked, we allow the owner to make whoever they like the new minter
    ;; #[allow(unchecked_data)]
    (ok (var-set approved-minter who))
  )
)