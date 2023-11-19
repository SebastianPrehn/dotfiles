;;; compl-orderless.el --- Setup Orderless -*- lexical-binding: t -*-
;;; Commentary:

;; This package installs and sets up the completion style Orderless
;; by Omar Antolín Camarena

;;; Code:

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

(provide 'compl-orderless)
;;; compl-orderless.el ends here
