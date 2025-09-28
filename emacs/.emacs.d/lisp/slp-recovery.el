;;; slp-recovery.el --- How Emacs handles recovery of files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  "This variable dictates where to put auto saves. It is set to a
  directory called autosaves located wherever `.emacs.d/' is
  located.")

;; Sets all files to be backed up and auto saved in a single directory.
(setq backup-directory-alist
      `((".*" . ,emacs-autosave-directory))
      auto-save-file-name-transforms
      `((".*" ,emacs-autosave-directory t)))

(provide 'slp-recovery)
;;; slp-recovery.el ends here
