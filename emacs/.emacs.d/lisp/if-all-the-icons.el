;;; if-all-the-icons.el --- Setup all-the-icons -*- lexical-binding: t -*-
;;; Commentary:

;; This file contains several all-the-icons packages in order to enhance
;; the UI experience by adding a greal deal of icons.

;; TODO Make the Marginalia hook dependent on whether compl-marginalia is available

;;; Code:

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :after all-the-icons
  :init
  (all-the-icons-completion-mode)
  ;; The following will make sure Marginalia and this works together
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

(use-package all-the-icons-dired
  :hook
  (dired-mode . all-the-icons-dired-mode))

(provide 'if-all-the-icons)
;;; if-all-the-icons.el ends here
