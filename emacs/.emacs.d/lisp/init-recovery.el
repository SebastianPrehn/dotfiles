;;; init-recovery.el --- How Emacs handles recovery of files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Auto-save
(setq auto-save-list-file-prefix ; prefix for generation auto-save-list-file-name
      (expand-file-name ".auto-save-list/.saves-" user-emacs-directory)
      auto-save-default t
      auto-save-timeout 200
      auto-save-interval 200)

;; Backups
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory)))
      make-backup-files t
      vc-make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-old-versions 5
      kept-new-versions 5)

(provide 'init-recovery)
;;; init-recovery.el ends here
