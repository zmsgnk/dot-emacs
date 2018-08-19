;;--------------------------------------------------------------
;;
;; basic settings
;;
;;--------------------------------------------------------------
(setq load-prefer-newer t)

;; (exec-path-from-shell-initialize)

(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-locale-environment "utf-8")
(setenv "LANG" "ja_JP.UTF-8")

;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
(setq auto-save-default nil)

;; スクロールは1行ごと
(setq scroll-conservatively 1)

;; カーソル位置の保存
(when (require 'saveplace nil t)
  (setq-default save-place t)
  (setq save-place-file "~/.emacs.d/saved-places"))

;; 括弧の対応関係をハイライト表示
(show-paren-mode t)
;; ツールバーを非表示
(tool-bar-mode -1)
;; スクロールバーを非表示
;; (scroll-bar-mode -1)
;; スタートアップ画面を非表示
(setq inhibit-startup-message t)
;; 行間
(when window-system
  (setq-default line-spacing 3))
;; 警告音と画面フラッシュを無効化
(setq ring-bell-function 'ignore)

;; erase-buffer のときにプロンプトを出さない
(put 'erase-buffer 'disabled nil)

;; マークテキストの設定
(delete-selection-mode t)
(transient-mark-mode t)


;;----------------------------------------------------------------
;;
;; 100文字を超えるとハイライト
;; http://qiita.com/awakia/items/b836e7792be0a7c65fd4
;;
;;----------------------------------------------------------------
;; (add-hook 'python-mode-hook
;;   (lambda ()
;;     (font-lock-add-keywords nil
;;       '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
;; (add-hook 'R-mode-hook
;;   (lambda ()
;;     (font-lock-add-keywords nil
;;       '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))))


;;--------------------------------------------------
;;
;; 分割したウィンドウのサイズを変える
;; hを押すと境界線が左に、jを押すと下に、kを押すと上に、lを押すと右に移動します。
;;
;;--------------------------------------------------
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
	(current-width (window-width))
	(current-height (window-height))
	(dx (if (= (nth 0 (window-edges)) 0) 1
	      -1))
	(dy (if (= (nth 1 (window-edges)) 0) 1
	      -1))
	action c)
    (catch 'end-flag
      (while t
	(setq action
	      (read-key-sequence-vector (format "size[%dx%d]"
						(window-width)
						(window-height))))
	(setq c (aref action 0))
	(cond ((= c ?l)
	       (enlarge-window-horizontally dx))
	      ((= c ?h)
	       (shrink-window-horizontally dx))
	      ((= c ?j)
	       (enlarge-window dy))
	      ((= c ?k)
	       (shrink-window dy))
	      ;; otherwise
	      (t
	       (let ((last-command-char (aref action 0))
		     (command (key-binding action)))
		 (when command
		   (call-interactively command)))
	       (message "Quit")
	                      (throw 'end-flag t)))))))


;;-----------------------------------------------------------------------
;;
;; window分割したときに分割した側がアクティブになるようにする
;;
;;-----------------------------------------------------------------------
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))


;;-----------------------------------------------------------------------
;;
;; 自動保存
;;
;;-----------------------------------------------------------------------
(require 'auto-save-buffers-enhanced)
;;; 1秒後に保存
;; (setq auto-save-buffers-enhanced-interval 1)
(auto-save-buffers-enhanced t)
;;; Wroteのメッセージを抑制
;;(setq auto-save-buffers-enhanced-quiet-save-p t)
(setq auto-save-buffers-enhanced-exclude-regexps '("\\.ts$" "\\.tsx$"))
;;; 有効無効のトグル
(global-set-key [f2] 'auto-save-buffers-enhanced-toggle-activity)
