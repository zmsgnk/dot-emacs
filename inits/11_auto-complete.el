;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (ac-config-default)
;; (add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
;; (add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
;; (add-to-list 'ac-modes 'org-mode)
;; (ac-set-trigger-key "TAB")
;; (setq ac-use-menu-map t)       ;; 補完メニュー表示時にC-n/C-pで補完候補選択
;; (setq ac-use-fuzzy t)          ;; 曖昧マッチ
;; (setq ac-auto-start 3)  ;; n文字以上の単語の時に補完を開始
;; (setq ac-delay 0.5)  ;; n秒後に補完開始
;; (setq ac-use-comphist t)  ;; 補完推測機能有効
;; (setq ac-auto-show-menu 0.3)  ;; n秒後に補完メニューを表示
;; (setq ac-quick-help-delay 0.5)  ;; n秒後にクイックヘルプを表示
;; (setq ac-ignore-case nil)  ;; 大文字・小文字を区別する
