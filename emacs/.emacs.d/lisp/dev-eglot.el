;;; dev-eglot.el --- Configuration for Eglot -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :bind (:map eglot-mode-map
	      ("C-c d" . eldoc)
	      ("C-c a" . eglot-code-actions)
	      ("C-c f" . flymake-show-buffer-diagnostics)
	      ("C-c r" . eglot-rename)))

(provide 'dev-eglot)
;;; dev-eglot.el ends here
