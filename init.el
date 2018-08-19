;;---------------------------------------------------------------------
;;
;; package.el
;;
;;---------------------------------------------------------------------
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")
	("elpy" . "https://jorgenschaefer.github.io/packages/")))
;; (package-refresh-contents)

;; (global-flycheck-mode)

;;---------------------------------------------------------------------
;;
;; init-loader
;; http://emacs.rubikitch.com/init-loader/
;;
;;---------------------------------------------------------------------
(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-save-buffers-enhanced helm-etags-plus ctags-update pyenv-mode persp-mode ace-jump-mode ace-isearch helm-swoop ag prettier-js add-node-modules-path js-auto-format-mode dumb-jump all-the-icons markdown-mode yaml-mode fuzzy go-mode company-go tide tss speed-type sql-indent elpy magit exec-path-from-shell web-mode shell-pop multiple-cursors smartrep smart-newline smartparens ess neotree dirtree auto-complete helm gotham-theme use-package package-utils init-loader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;
;; python shell の warning対策
;; https://emacs.stackexchange.com/questions/30082/your-python-shell-interpreter-doesn-t-seem-to-support-readline
;;
(with-eval-after-load 'python
  (defun python-shell-completion-native-try ()
    "Return non-nil if can trigger native completion."
    (let ((python-shell-completion-native-enable t)
          (python-shell-completion-native-output-timeout
           python-shell-completion-native-try-output-timeout))
      (python-shell-completion-native-get-completions
       (get-buffer-process (current-buffer))
       nil "_"))))

;; エスケープシーケンスを処理
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(put 'erase-buffer 'disabled nil)
