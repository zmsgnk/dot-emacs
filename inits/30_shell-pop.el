;;----------------------------------------------------------------------
;;
;; shell-pop
;; http://rubikitch.com/2015/06/16/shell-pop/
;;
;;----------------------------------------------------------------------
(setq shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))
(setq shell-pop-window-height 50)
(global-set-key (kbd "C-c s") 'shell-pop)
