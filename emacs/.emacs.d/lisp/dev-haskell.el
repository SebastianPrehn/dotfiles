;;; dev-haskell.el --- Configuration for Haskell -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package haskell-mode
  :hook (haskell-mode . (lambda ()
                          (haskell-doc-mode)
                          (turn-on-haskell-indent)))
  :config
  (define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t)
  '(haskell-process-suggest-remove-import-lines t)
  )

(use-package ormolu
  :hook (haskell-mode . ormolu-format-on-save-mode))

(provide 'dev-haskell)
;;; dev-haskell.el ends here
