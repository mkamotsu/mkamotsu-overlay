(add-to-list 'load-path "@SITELISP@")
(add-to-list 'auto-mode-alist '("//.rs$" . rust-mode))
(autoload 'rust-mode "rust-mode" t)
