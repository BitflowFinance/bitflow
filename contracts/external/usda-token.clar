;; usda-token
;; <add a description here>

;;;;;;;;;;;;;;;;;;;;; SIP 010 ;;;;;;;;;;;;;;;;;;;;;;
(impl-trait .sip-010-trait-ft-standard.sip-010-trait)


;; Defines the USDA Stablecoin according to the SIP-010 Standard
(define-fungible-token usda)

(define-data-var token-uri (string-utf8 256) u"")

(define-constant CONTRACT-OWNER 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
(define-constant ERR-UNAUTHORIZED-MINT (err u100))



;; errors
(define-constant ERR-NOT-AUTHORIZED u14401)

;; ---------------------------------------------------------
;; SIP-10 Functions
;; ---------------------------------------------------------

(define-read-only (get-total-supply)
  (ok (ft-get-supply usda))
)

(define-read-only (get-name)
  (ok "USDA")
)

(define-read-only (get-symbol)
  (ok "USDA")
)

(define-read-only (get-decimals)
  (ok u6)
)

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance usda account))
)

(define-read-only (get-balance-simple (account principal))
  (ft-get-balance usda account)
)


;; (define-public (set-token-uri (value (string-utf8 256)))
;;   (if (is-eq tx-sender (contract-call? .arkadiko-dao get-dao-owner))
;;     (ok (var-set token-uri value))
;;     (err ERR-NOT-AUTHORIZED)
;;   )
;; )

(define-read-only (get-token-uri)
  (ok (some (var-get token-uri)))
)

(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
  (begin
    (asserts! (is-eq tx-sender sender) (err ERR-NOT-AUTHORIZED))

    (match (ft-transfer? usda amount sender recipient)
      response (begin
        (print memo)
        (ok response)
      )
      error (err error)
    )
  )
)

;; ---------------------------------------------------------
;; DAO token trait
;; ---------------------------------------------------------

;; ;; Mint method for DAO
;; (define-public (mint-for-dao (amount uint) (recipient principal))
;;   (begin
;;     (asserts! (is-eq contract-caller .arkadiko-dao) (err ERR-NOT-AUTHORIZED))
;;     (ft-mint? usda amount recipient)
;;   )
;; )

;; ;; Burn method for DAO
;; (define-public (burn-for-dao (amount uint) (sender principal))
;;   (begin
;;     (asserts! (is-eq contract-caller .arkadiko-dao) (err ERR-NOT-AUTHORIZED))
;;     (ft-burn? usda amount sender)
;;   )
;; )

(define-public (mint (amount uint) (recipient principal))
  (begin
    ;; (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
    (asserts! (is-eq tx-sender recipient) ERR-UNAUTHORIZED-MINT)
    (ft-mint? usda amount recipient)
  )
)

(define-public (burn (burner principal) (amount uint))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
    (ft-burn? usda amount burner)
  )
)



;; (begin
;;   ;; (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-UNAUTHORIZED-MINT)
;;   (try! (ft-mint? usda u1000000000000 tx-sender))
;;   (try! (ft-mint? usda u1000000000000 'ST1SJ3DTE5DN7X54YDH5D64R3BCB6A2AG2ZQ8YPD5))
;;   (try! (ft-mint? usda u1000000000000 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG))
;;   (try! (ft-mint? usda u1000000000000 'ST2JHG361ZXG51QTKY2NQCVBPPRRE2KZB1HR05NNC))
;;   (try! (ft-mint? usda u1000000000000 'ST2NEB84ASENDXKYGJPQW86YXQCEFEX2ZQPG87ND))
;;   (try! (ft-mint? usda u1000000000000 'ST2REHHS5J3CERCRBEPMGH7921Q6PYKAADT7JP2VB))
;;   (try! (ft-mint? usda u1000000000000 'ST3AM1A56AK2C1XAFJ4115ZSV26EB49BVQ10MGCS0))
;;   (try! (ft-mint? usda u1000000000000 'ST3NBRSFKX28FQ2ZJ1MAKX58HKHSDGNV5N7R21XCP))
;;   (try! (ft-mint? usda u1000000000000 'ST3PF13W7Z0RRM42A8VZRVFQ75SV1K26RXEP8YGKJ))
;;   (try! (ft-mint? usda u1000000000000 'STNHKEPYEPJ8ET55ZZ0M5A34J0R3N5FM2CMMMAZ6))
;; )
