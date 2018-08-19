(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  ;; コメントのスタイル
  ;;   1:htmlのコメントスタイル(default)
  ;;   2:テンプレートエンジンのコメントスタイル
  ;;      (Ex. {# django comment #},{* smarty comment *},{{-- blade comment --}})
  (setq web-mode-comment-style 2)

  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)

  ;; (when (string-equal "tsx" (file-name-extension buffer-file-name))
  ;;   (setup-tide-mode))
  ;; (when (string-equal "jsx" (file-name-extension buffer-file-name))
  ;;   (setup-tide-mode))
)
(add-hook 'web-mode-hook  'web-mode-hook)

;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               (flycheck-add-mode 'javascript-eslint 'web-mode)
;;               (flycheck-mode))))

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "tsx")
;;               (flycheck-add-mode 'typescript-tslint 'web-mode)
;;               (flycheck-mode))))
