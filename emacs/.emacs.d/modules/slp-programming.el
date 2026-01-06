;;; Eglot
(use-package eglot
  :ensure nil) ;; built-in

(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust")
        (zig "https://github.com/tree-sitter/zig-tree-sitter")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx")
        (markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown")))

;;; Prefer tree-sitter modes when available
(setq major-mode-remap-alist
      '((rust-mode . rust-ts-mode)
        (zig-mode . zig-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (js-mode . js-ts-mode)
        (markdown-mode . markdown-ts-mode)))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init
  (setq markdown-command "pandoc")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do))
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package zig-mode
  :ensure t
  :hook (zig-ts-mode . eglot-ensure))

(use-package rust-ts-mode
  :ensure nil ; built-in
  :hook ((rust-ts-mode . eglot-ensure)))

(defun slp/rust-format-on-save ()
  "Enable formatting on save once Eglot is managing the buffer."
  (when (eglot-managed-p)
    (add-hook 'before-save-hook #'eglot-format-buffer nil t)))

(add-hook 'eglot-managed-mode-hook #'slp/rust-format-on-save)
(add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(rust-ts-mode . ("rust-analyzer"))))

(setq eglot-workspace-configuration
      '((:rust-analyzer
         (:check (:command "clippy")))))

(setq project-vc-extra-root-markers '("Cargo.toml"))

(use-package typescript-mode
  :ensure t
  :hook ((typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)))

(use-package futhark-mode
  :ensure t
  :hook ((futhark-mode . eglot-ensure)
         (futhark-mode . futhark-fmt-on-save-mode)))

(provide 'slp-programming)
