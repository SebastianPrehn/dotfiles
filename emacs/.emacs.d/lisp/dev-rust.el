;;; dev-rust.el --- Rust lang configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package rust-ts-mode
  :hook ((rust-ts-mode . eglot-ensure)
	 (rust-ts-mode . company-mode))
  :mode (("\\.rs\\'" . rust-ts-mode))
  :config
  (add-to-list 'exec-path "/Users/vpz655/.cargo/bin")
  (setenv "PATH" (concat (getenv "PATH") ":/Users/vpz655/.cargo/bin")))

(provide 'dev-rust)
;;; dev-rust.el ends here
