;;; init.el --- Sebastian's config file -*- lexical-binding: t -*-
;; Author: Sebastian Larsen Prehn

;; First written in November 2023, to replace a literate configuration file as I grew
;; apathetic to it as a way to configure files, even if I have nothing but love for Org Mode.

;;; Commentary:

;; This file bootstraps my configuration, with much of the configuration divided out
;; into other files as an attempt to make my configuration more "modular".

;; TODO make more packages deferred in order to speed up load and minimize mindless loading.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;; (setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;; Bootstrap config
(require 'init-elpaca)
(require 'init-startup)
(require 'init-recovery) ;; Handles auto-save and backups

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-hook 'elpaca-after-init-hook (lambda () (load custom-file 'noerror)))


;; Interface
(require 'if-fonts)
(require 'if-all-the-icons)
(require 'if-moody)
(require 'if-theme)
(require 'if-hl-todo)

;; Keymaps
(require 'slp-osx-keys)
(require 'slp-which-key)
(use-package general :demand t)
(elpaca-wait)

;; Completion
(require 'compl-vertico)
(require 'compl-orderless)
(require 'compl-marginalia)
(require 'compl-corfu)

;; Programming
(require 'dev-magit)
(require 'dev-blamer)
(require 'dev-diff-hl) ;; Highlight changed-and-uncommitted lines when programming
(require 'dev-flycheck)
(require 'dev-projectile)
(require 'dev-eglot) ;; Eglot
(require 'dev-treesitter) ;; treesitter
(require 'dev-python) ; python
(require 'dev-latex)
(require 'dev-rst) ;; ReStructuredText support
(require 'dev-haskell)
(require 'dev-pdf-tools)
(require 'dev-nix)
(require 'dev-copilot)
;(require 'init-highlight) ;; highlights indentation
(require 'dev-rust) ;; rust (not working)
(require 'dev-nodejs)

;; Org mode
(require 'slp-org)

(elpaca-wait)
(require 'slp-identity) ;; Identity file
(require 'slp-spellchecking) ;; Spell checking
(require 'slp-dired) ;; Dired
;;; init.el ends here
