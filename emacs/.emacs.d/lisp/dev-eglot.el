;;; dev-eglot.el --- Configuration for Eglot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eglot :ensure nil
  :bind (:map eglot-mode-map
	      ("C-c d" . eldoc)
	      ("C-c a" . eglot-code-actions)
	      ("C-c f" . flymake-show-buffer-diagnostics)
	      ("C-c r" . eglot-rename))
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil))

(provide 'dev-eglot)
;;; dev-eglot.el ends here
