;;; init-osx-keys.el --- Configure keys specific to macOS -*- lexical-binding: t -*-
;;; Commentary:

;; macOS has some annoyances for Emacs.
;; This file makes ~command~ the ~meta~ key in macOS.
;; Disable the option (aka alt) key.  Keep control as ctrl.
;; Right commands turns into super (s-),
;; and right control becomes hyper (H-).

;;; Code:

(when *is-a-mac*
  (setq mac-command-modifier 'meta
	mac-option-modifier nil
	mac-control-modifier 'control
	mac-right-command-modifier 'super
	mac-right-control-modifier 'hyper))

(provide 'slp-osx-keys)
;;; init-osx.keys.el ends here
