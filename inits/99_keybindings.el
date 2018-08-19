;;-----------------------------------------------------------
;;
;; keybindings
;;
;;-----------------------------------------------------------
;; (global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)

(global-set-key "\M-h" 'help)
(global-set-key (kbd "\C-c ;") 'comment-or-uncomment-region)
(define-key global-map (kbd "C-z") 'undo)

(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)


;;-----------------------------------------------------------
;;
;; 04_ctags.el
;;
;;-----------------------------------------------------------
(global-set-key (kbd "\M-.") 'helm-etags-plus-select)
;;list all visited tags
(global-set-key (kbd "\M-*") 'helm-etags-plus-history)
;;go back directly
(global-set-key (kbd "\M-,") 'helm-etags-plus-history-go-back)
;;go forward directly
(global-set-key (kbd "\M-/") 'helm-etags-plus-history-go-forward)
;; (global-set-key (kbd "\C-cE") 'ctags-update)

;; elpy用
;; go-to-definitionとかぶるため無効にする
(define-key elpy-mode-map (kbd "M-.") nil)
