;;; def-copilot.el --- Configuration of GitHub Copilot for Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package copilot
  :elpaca (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el")))

(provide 'dev-copilot)
;;; dev-copilot.el ends here
