;;; compl-vertico.el --- Setup Vertico -*- lexical-binding: t -*-
;;; Commentary:

;; This package installs and sets up Vertico for use with other packages

;;; Code:

(use-package vertico
  :init
  (vertico-mode)
  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Amount of candidates
  (setq vertico-count 13)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next´ and `vertico-previous´
  (setq vertico-cycle t))

;; History persist over restarts
(use-package savehist :elpaca nil
  :init
  (savehist-mode))

(use-package emacs :elpaca nil
  :init
  ;; Add prompt indicator to `completing-read-multiple´
  ;; We display [CRM<seperator>] e.g. [CRM,] if the seperator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(provide 'compl-vertico)
;;; compl-vertico.el ends here
