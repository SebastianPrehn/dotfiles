;;; early-init.el --- Emacs 27+ pre-initialization config -*- lexical-binding: t -*-

;;; Commentary:

;; Emacs 27+ loads this file before calling
;; `package-initialize'. We use this file to supress that automatic
;; behavior so that startup is consistent across Emacs versions.

;;; Code:

(setq package-enable-at-statup nil)
(setenv "LSP_USE_PLISTS" "true")

;; So we can detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here
