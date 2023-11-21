;;; slp-org.el --- Configuration of Org-mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org :elpaca nil
  :after python
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t))))

(provide 'slp-org)
;;; slp-org.el ends here


