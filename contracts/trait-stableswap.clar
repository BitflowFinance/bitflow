
;; trait-stableswap


;; this is an SIP-010 method with an additional functions used by swapr
;; as Clarity does not support "includes", copy the needed functions, and add new ones

(define-trait trait-stableswap
  (
    ;; Transfer from the caller to a new principal
    (transfer (uint principal principal) (response bool uint))

    ;; the human readable name of the token
    (get-name () (response (string-ascii 32) uint))

    ;; the ticker symbol, or empty if none
    (get-symbol () (response (string-ascii 32) uint))

    ;; the number of decimals used, e.g. 6 would mean 1_000_000 represents 1 token
    (get-decimals () (response uint uint))

    ;; the balance of the passed principal
    (get-balance-of (principal) (response uint uint))

    ;; the current total supply (which does not need to be a constant)
    (get-total-supply () (response uint uint))

    ;; an optional URI that represents metadata of this token
    (get-token-uri () (response (optional (string-utf8 256)) uint))

    ;; additional functions specific to swapr

    ;; mint function only swapr contract can call
    (mint (principal uint) (response bool uint))

    ;; burn function only swapr contract can call
    (burn (principal uint) (response bool uint))

    ;;
    (get-data (principal) (response {
      name: (string-ascii 32),
      symbol: (string-ascii 32),
      decimals: uint,
      uri: (optional (string-utf8 256)),
      supply: uint,
      balance: uint,
    } uint))
  )
)