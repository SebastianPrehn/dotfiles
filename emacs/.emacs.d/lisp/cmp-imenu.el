;;; cmp-imenu.el --- Setup imenu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package imenu-list
  :defer t
  :bind (:map custom-bindings-map
              ("M-g i" . imenu-list-smart-toggle)))

(provide 'cmp-imenu)
;;; cmp-imenu.el ends here
