;;; cmp-orderless.el --- Setup Orderless for Corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic partial-completion)
        completion-category-overrides '((file (styles basic partial-completion)))))

(provide 'cmp-orderless)
;;; cmp-orderless.el ends here
