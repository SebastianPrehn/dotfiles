;;; og-roam.el --- Org-Roam settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org-roam
  :init
  (setq org-roam-directory (file-truename "~/org/roam"))
  (setq org-roam-dailies-directory "daily/")
  (setq org-roam-dailies-capture-tremplates
        '(("d" "default" entry
           "* %?"
           :target (file+head "%<Y-%m-%d>.org"
                              "#+title: %<Y-%m%d>\n"))))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n c" . org-roam-dailies-capture-today)
         ("C-c n r" . org-roam-node-random)
         ("C-c n d" . org-roam-dailies-find-today)
         (:map org-mode-map
               (("C-c n i" . org-roam-node-insert)
                ("C-c n b" . org-insert-link)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add)
                ("C-c n l" . org-roam-buffer-toggle))))
  :config
  (org-roam-db-autosync-mode))

(use-package org-roam-ui)

(use-package org-ref)
(use-package org-roam-bibtex
  :after org-roam
  :config
  (org-roam-bibtex-mode)
  (require 'org-ref))

(provide 'og-roam)
;;; og-roam.el ends here
