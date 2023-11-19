;;; init-straight.el --- bootstraps and sets up straight.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; straight use-package
(straight-use-package 'use-package)

;; Automatically install all mentioned packages without the need to add :straight t
(setq straight-use-package-by-default t)

(provide 'init-straight)
;;; init-straight.el ends here
