(pyenv-mode)
(elpy-enable)
;; (elpy-use-ipython)
;; (setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt --pprint")
(setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt")
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")
(setq elpy-rpc-backend "jedi")
;; (add-hook 'elpy-mode-hook 'py-yapf-enable-on-save)


(defun python-shell-send-region (start end)
  "Send the region delimited by START and END to inferior Python process."
  (interactive "r")
  (python-shell-send-string
   (buffer-substring start end)
   ;; No need to send blank lines in ipython? 2013-12-22
   ;; (concat
   ;;  (let ((line-num (line-number-at-pos start)))
   ;;    ;; When sending a region, add blank lines for non sent code so
   ;;    ;; backtraces remain correct.
   ;;    (make-string (1- line-num) ?\n))
   ;;  (buffer-substring start end))
   nil t))


(defun my-python-eval ()
  (interactive)
  (if (and transient-mark-mode mark-active)			; Check if selection is present
      (python-shell-send-region (point) (mark))			; If selected, send region
    ;; If not selected, do all the following
    (beginning-of-line)						; Move to the beginning of line
    (if (looking-at "def")					; Check if the first word is def (function def)
	(progn							; If it is def
	  (python-shell-send-defun ())				; Send whole def
	  (python-nav-end-of-defun)				; Move to the end of def
	  (python-nav-forward-statement)			; Move to the next statement
	  )
      ;; If it is not def, do all the following
      (python-shell-send-region (point-at-bol) (point-at-eol))	; Send the current line
      (python-nav-forward-statement)				; Move to the next statement
      )
    ;; Activate shell window, and switch back
    (progn
      (setq w-script (selected-window))				; Remeber the script window
      (python-shell-switch-to-shell)				; Switch to the shell
      (select-window w-script)					; Switch back to the script window
      )
    ))
;; 
;;
;; Define hooks 
(add-hook 'python-mode-hook		; For Python script
          '(lambda()
	     ;; (local-set-key (kbd "<S-return>") 'my-python-eval)
	     ;; (local-set-key (kbd "<C-return>") 'my-python-eval)
	     (local-set-key (kbd "C-c C-j") 'my-python-eval)
	     ))
