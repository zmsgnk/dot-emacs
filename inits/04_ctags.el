(require 'helm-etags-plus)

(ctags-global-auto-update-mode)
;you need manually create TAGS in your project 
(setq ctags-update-prompt-create-tags nil)
 
;if you want to update (create) TAGS manually
(autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
