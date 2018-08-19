;;------------------------------------------------------
;;
;; 見た目の設定
;;
;;------------------------------------------------------
;; (require 'hl-line)
;; (defun global-hl-line-timer-function ()
;;   (global-hl-line-unhighlight-all)
;;   (let ((global-hl-line-mode t))
;;     (global-hl-line-highlight)))
;; (setq global-hl-line-timer
;;       (run-with-idle-timer 0.01 t 'global-hl-line-timer-function))

(column-number-mode t)

;; color-theme
(load-theme 'gotham t)

;; フレームタイトルにバッファ名かファイル名を表示
(setq frame-title-format
      (if (buffer-file-name)
          (format "%%f - Emacs")
        (format "%%b - Emacs")))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; フォント
(when window-system
  (set-face-attribute 'default nil :family "Migu 1M" :height 110)
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    (font-spec :family "Migu 1M")))
				   
