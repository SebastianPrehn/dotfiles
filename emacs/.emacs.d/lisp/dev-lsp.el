;;; dev-lsp.el --- Setup LSP -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :defer t
  :init
  (setq lsp-use-plists t)
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (haskell-mode . lsp-deferred)
         (python-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :bind (:map lsp-mode-map
              ("M-<return>" . lsp-execute-code-action)
              ("C-M-."      . lsp-find-references)
              ("C-c r"      . lsp-rename))
  :config
  (setq lsp-diagnostics-provider :flycheck
        lsp-completion-provider :none)
  (setq lsp-modeline-code-actions-enable t
        lsp-modeline-code-action-fallback-icon "+"

        ;; limit raising of the echo area to show docs
        lsp-signature-doc-lines 3)
  (setq lsp-file-watch-threshold 1500)
  (setq lsp-format-buffer-on-save nil)
  :commands lsp lsp-deferred)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Debugger
(use-package dap-mode)

(provide 'dev-lsp)
;;; dev-lsp.el ends here
