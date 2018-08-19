;;-----------------------
;; org-mode
;;-----------------------
;; 画像をインラインで表示
(setq org-startup-with-inline-images t)

;; .orgファイルは自動的にorg-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; org-directory内のファイルすべてからagendaを作成する
(setq my-org-agenda-dir "~/org/")
(setq org-agenda-files (list my-org-agenda-dir))

; 見出しをインデントする
(setq org-startup-indented t)
;; 見出しをインデントした時にアスタリスクが減るのを防ぐ
(setq org-indent-mode-turns-on-hiding-stars nil)
;; インデントの幅を設定
(setq org-indent-indentation-per-level 4)
;; 見出しの初期状態（見出しだけ表示）
;; (setq org-startup-folded 'content)
(setq org-startup-folded 'showall)

(setq org-agenda-window-setup 'current-window) 

;; DONEの時刻を記録
(setq org-log-done 'time)

;; ショートカットキー
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
