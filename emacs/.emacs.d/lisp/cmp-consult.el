;;; cmp-consult.el --- Setup Consult -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Search utilities
(use-package ripgrep
  :defer t)

(use-package rg
  :defer t)

(use-package ag
  :defer t)

(use-package wgrep
  :defer t)

(use-package consult
  :bind (("C-s"     . consult-line)
         ("C-M-s"   . consult-ripgrep)
         ("C-x b"   . consult-buffer)
         ("C-x C-b" . consult-buffer)
         ("M-g g"   . consult-goto-line)
         ("M-g t"   . consult-imenu)
         ("M-g a"   . consult-imenu-multi)))

(provide 'cmp-consult)
;;; cmp-consult.el ends here
