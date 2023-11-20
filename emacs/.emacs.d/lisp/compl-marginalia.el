;;; compl-marginalia.el --- Setup Marginalia -*- lexical-binding: t -*-
;;; Commentary:

;; Marginalia is a minibuffer completion framework

;;; Code:

(use-package marginalia
  :after vertico
  :general
  (:keymaps 'minibuffer-local-map
            "M-A" 'marginalia-cycle)
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(provide 'compl-marginalia)
;;; compl-marginalia.el ends here
