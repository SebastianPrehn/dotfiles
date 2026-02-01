(use-package jinx
  :ensure t
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jing-languages)))

(use-package flycheck
  :ensure t
  :hook ((text-mode org-mode markdown-mode) . flycheck-mode))

;; Custom Vale checker instead of flycheck-vale package
(flycheck-define-checker vale
  "A checker for prose using Vale"
  :command ("vale" "--output" "line" source)
  :standard-input nil
  :error-patterns
  ((error line-start (file-name) ":" line ":" column ":" (id (one-or-more (not (any ":")))) ":" (message) line-end))
  :modes (markdown-mode org-mode text-mode))

(add-to-list 'flycheck-checkers 'vale 'append)

(provide 'slp-spellcheck)
