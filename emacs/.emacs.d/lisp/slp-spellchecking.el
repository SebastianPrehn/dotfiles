;;; slp-spellchecking.el --- Configure spell-checking in Emacs -*- lexical-binding: t -*-

;;; Commentary:

;; This file configures the ispell and flyspell packages which
;; helps me spell-check my prose.

;; https://github.com/hrs/dotfiles/blob/main/emacs/.config/emacs/configuration.org

;;; Code:

;; TODO add mu4e-compose-mode when mu4e is setup
(defvar prose-modes
  '(gfm-mode
    git-commit-mode
    markdown-mode
    message-mode
    org-mode
    text-mode))

(defvar prose-mode-hooks
  (mapcar (lambda (mode) (intern (format "%s-hook" mode)))
          prose-modes))

(use-package flyspell :elpaca nil
  :ensure-system-package ispell
  :config
  (setq ispell-personal-dictionary "~/.spell_words")
  (dolist (hook prose-mode-hooks)
    (add-hook hook 'flyspell-mode)))

(flycheck-define-checker vale
  "A checker for prose"
  :command ("vale" "--output" "line"
            source)
  :standard-input nil
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (id (one-or-more (not (any ":")))) ":" (message) line-end))
  :modes prose-modes)

(add-to-list 'flycheck-checkers 'vale 'append)

(provide 'slp-spellchecking)
;;; slp-spellchecking.el ends here
