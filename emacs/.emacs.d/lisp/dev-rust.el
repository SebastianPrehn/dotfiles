;;; dev-rust.el --- Rust lang configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode)
  :config (setq rustic-lsp-client 'eglot))

(provide 'dev-rust)
;;; dev-rust.el ends here
