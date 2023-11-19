;;; compl-marginalia.el --- Setup Marginalia -*- lexical-binding: t -*-
;;; Commentary:

;; Marginalia is a minibuffer completion framework

;;; Code:

(use-package marginalia
  :after vertico
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(provide 'compl-marginalia)
;;; compl-marginalia.el ends here
