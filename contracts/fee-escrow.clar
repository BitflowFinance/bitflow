;; fee-escrow
;; a BitFlow smart contract to hold the stable swap fees reserved for LPs
(use-trait sip-010-trait .sip-010-trait-ft-standard.sip-010-trait)


;; constants
(define-constant CONTRACT-PUBLISHER 'ST38GBVK5HEJ0MBH4CRJ9HQEW86HX0H9AP3EJP4TW)
(define-constant unauthorized-claim (err u1))
(define-constant transfer-x-failed-err (err u2))
(define-constant transfer-y-failed-err (err u3))
(define-constant transfer-failed-err (err u4))

;;

;; data maps and vars
;;
(define-data-var CONTRACT-OWNER principal tx-sender)

;; private functions
;;

;; public functions
;;
(define-public (claim-pair-rewards-from-escrow (token-x-trait <sip-010-trait>) (token-y-trait <sip-010-trait>) (who principal) (dx uint) (dy uint))
    (begin 
        (print contract-caller)
        (print tx-sender)
        (print who)
        (print (is-eq contract-caller (var-get CONTRACT-OWNER)))
        (asserts! (is-eq contract-caller (var-get CONTRACT-OWNER)) unauthorized-claim)
        (asserts! (> dx u0) transfer-x-failed-err)        
        (asserts! (> dy u0) transfer-y-failed-err)
        (asserts! (is-ok (as-contract (contract-call? token-x-trait transfer dx tx-sender who none))) transfer-x-failed-err)
        (asserts! (is-ok (as-contract (contract-call? token-y-trait transfer dy tx-sender who none))) transfer-y-failed-err)
        (ok true)
    )
)

(define-public (claim-token-rewards-from-escrow (token-trait <sip-010-trait>) (who principal) (amount uint))
    (begin 
        (print contract-caller)
        (print tx-sender)
        (print who)
        (print (is-eq contract-caller (var-get CONTRACT-OWNER)))
        (asserts! (is-eq contract-caller (var-get CONTRACT-OWNER)) unauthorized-claim)
        (asserts! (is-ok (as-contract (contract-call? token-trait transfer amount tx-sender who none))) transfer-failed-err)
        (ok true)
    )
)

(define-public (set-contract-owner (who principal))
    (begin 
        (asserts! (is-eq tx-sender CONTRACT-PUBLISHER) (err u5))
        (var-set CONTRACT-OWNER who)
        (ok true)
    )
)