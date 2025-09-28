;;; dev-haskell.el --- Setup Haskell and LSP for Haskell -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package haskell-mode
  :defer t
  :hook (haskell-mode . haskell-doc-mode)
  :config
  (setq haskell-hoogle-command "hoogle"
        haskell-compile-stack-build-command "stack build"
        haskell-compile-stack-build-alt-command "stack build --pedantic"
        haskell-compile-command "stack build")
  :bind (:map haskell-mode-map
              ("C-c C-h" . haskell-hoogle)
              ("C-c C-c" . haskell-compile)))

(use-package lsp-haskell)

(use-package attrap
  :defer t
  :bind ("C-c C-f" . attrap-attrap))

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(provide 'dev-haskell)
;;; dev-haskell.el ends here
