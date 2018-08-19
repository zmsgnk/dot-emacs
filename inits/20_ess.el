(defun ess-site-after-load ()
  ;; 起動時にワーキングディレクトリを尋ねられないようにする
  (setq ess-ask-for-ess-directory nil)
  ;; アンダースコアの入力が " <- " にならないようにする
  (ess-toggle-underscore nil)
  ;; # の数によってコメントのインデントの挙動が変わるのを無効にする
  (setq ess-fancy-comments nil)
  ;; キャレットがシンボル上にある場合にもエコーエリアにヘルプを表示する
  (setq ess-eldoc-show-on-symbol t)
  ;; anything/helm を使いたいので IDO は無効化
  (setq ess-use-ido nil) )


(defun R-mode-init ()
  (ess-set-style 'RStudio)
  ;; comment-region のコメントアウトに # を使う（デフォルト##）
  (set (make-local-variable 'comment-add) 0)
  ;; *.R と R のプロセスを結びつける
  ;; プロセスを結びつけることでプロセスに定義されている変数などの補完ができるようになる
  (let ((window-conf (current-window-configuration)))
    (ess-force-buffer-current)
    ;; 勝手に *R* バッファを開くので元に戻す
    (set-window-configuration window-conf))
  (local-set-key (kbd "C-c C-j") 'ess-eval-region-or-line-and-step))


(eval-after-load "ess-site" '(ess-site-after-load))
(add-hook 'R-mode-hook 'R-mode-init)

(load "~/.emacs.d/elpa/ess-20170206.310/lisp/ess-site")
;; (setq inferior-julia-program-name "/Applications/Julia-0.4.6.app/Contents/Resources/julia/bin/julia")
;; (setq ess-use-auto-complete t)
