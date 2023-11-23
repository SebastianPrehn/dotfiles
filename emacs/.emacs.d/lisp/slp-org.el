;;; slp-org.el --- Configuration of Org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org :elpaca nil
  :config
  (setq org-ellipsis " ▼"
        org-hide-emphasis-markers t
        org-pretty-entities t))

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(provide 'slp-org)
;;; slp-org.el ends here


