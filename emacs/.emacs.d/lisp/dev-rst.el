;;; dev-rst.el --- Configuration for ReStructuredText -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package rst :ensure nil
  :config
  (setq auto-mode-alist
        (append '(("\\.txt\\'" . rst-mode)
                  ("\\.rst\\'" . rst-mode)
                  ("\\.rest\\'" . rst-mode)) auto-mode-alist)))

(provide 'dev-rst)
;;; dev-rst.el ends here
