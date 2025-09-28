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
  :bind
  ("C-c n f" . org-roam-node-find)
  ("C-c n c" . org-roam-dailies-capture-today)
  ("C-c n r" . org-roam-node-random)
  ("C-c n d" . org-roam-dailies-find-today)
  ("C-c n t" . org-roam-buffer-toggle)
  ("C-c n i" . org-roam-node-insert)
  ("C-c q" . org-roam-tag-add)
  :config
  (org-roam-db-autosync-mode)
  (org-roam-db-autosync-enable))

(use-package org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(use-package org-ref)
(use-package org-roam-bibtex
  :after org-roam
  :config
  (org-roam-bibtex-mode)
  (require 'org-ref))

(use-package toc-org
  :after org
  :config
  (add-hook 'org-mode-hook 'toc-org-mode)

  ;; enable in markdown, too
  (add-hook 'markdown-mode-hook 'toc-org-mode))


(provide 'og-roam)
;;; og-roam.el ends here
