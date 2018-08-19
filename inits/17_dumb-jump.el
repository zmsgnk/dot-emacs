(setq dumb-jump-mode t)
(setq dumb-jump-selector 'helm)
(setq dumb-jump-use-visible-window nil)
(define-key global-map [(super d)] 'dumb-jump-go) ;; go-to-definition!
(define-key global-map [(super shift d)] 'dumb-jump-back)
