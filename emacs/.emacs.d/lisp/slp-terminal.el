;;; slp-terminal.el --- Settings and helpers for terminals in Emacs  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(dirtrack-mode t)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :init
  (exec-path-from-shell-initialize))

(use-package dwim-shell-command
  :defer t
  :init (require 'dwim-shell-commands))

(add-to-list 'exec-path "/Library/TeX/texbin")
(setenv "PATH" (concat "/Library/TeX/texbin:" (getenv "PATH")))


(provide 'slp-terminal)
;;; slp-terminal.el ends here
