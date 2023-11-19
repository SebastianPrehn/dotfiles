;;; early-init.el --- Emacs 27+ pre-initialisation config

;;; Commentary:

;; Emacs 27+ loads this file before calling `package-initialize'.
;; We use this file to supress that automatic behavior to use `elpaca.el'.

;;; Code:

(setq
 package-enable-at-startup nil
 site-run-file nil
 inhibit-default-init t)

(setq native-comp-eln-load-path
      (list (expand-file-name "eln-cache" user-emacs-directory)))

;; Native Compilation
(customize-set-variable 'native-comp-async-report-warnings-errors nil)

;; Detect this having been loaded
(provide 'early-init)

;;; early-init.el ends here
