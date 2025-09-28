;;; init.el --- Sebastian's personal GNU Emacs configuration -*- lexical-binding: t -*-
;; Author: Sebastian Larsen Prehn

;; First written in November 2023, to replace a literate configuration file as I grew
;; apathetic to it as a way to configure files, even if I have nothing but love for Org Mode.

;;; Commentary:

;; Bootstrap Emacs configuration. Most of the setup is split across
;; files under `lisp/' for clarity and modularity.

;;; Code:

;; Produce backtraces when errors occur; can be helpful to diagnose startup issues
(defun slp/toggle-debug-on-error ()
  "Toggle whether Emacs shows backtraces when errors occur."
  (interactive)
  (setq debug-on-error (not debug-on-error))
  (message "Debug on error: %s" debug-on-error))
(global-set-key (kbd "C-c d") #'slp/toggle-debug-on-error)



(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time (taken from Purcell)

(defconst *is-a-mac* (eq system-type 'darwin))

;; Garbage collection
;; https://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/

(defun slp-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun slp-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'slp-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'slp-minibuffer-exit-hook)

;; Bootstrap config
(setq custom-file (locate-user-emacs-file "custom.el"))
(require 'slp-package)
(require 'slp-startup)
(require 'slp-recovery)
(require 'slp-terminal)

;; Interface
(require 'if-fonts)
(require 'if-modeline)
(require 'if-program-visuals)
(require 'if-theme)


;; General editing
(require 'ed-general)
(require 'ed-multicursor)

;; Keymaps
(require 'kb-osx-keys)


;; Completion
(require 'cmp-vertico)
(require 'cmp-corfu)
(require 'cmp-orderless)
(require 'cmp-imenu)
(require 'cmp-marginalia)
(require 'cmp-consult)

;; Version control
(require 'vc-magit)

;; Progrogramming

;; LSP booster
(defun lsp-booster--advice-json-parse (old-fn &rest args)
  "Try to parse bytecode instead of json."
  (or
   (when (equal (following-char) ?#)
     (let ((bytecode (read (current-buffer))))
       (when (byte-code-function-p bytecode)
         (funcall bytecode))))
   (apply old-fn args)))
(advice-add (if (progn (require 'json)
                       (fboundp 'json-parse-buffer))
                'json-parse-buffer
              'json-read)
            :around
            #'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
  "Prepend emacs-lsp-booster command to lsp CMD."
  (let ((orig-result (funcall old-fn cmd test?)))
    (if (and (not test?)                             ;; for check lsp-server-present?
             (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
             lsp-use-plists
             (not (functionp 'json-rpc-connection))  ;; native json-rpc
             (executable-find "emacs-lsp-booster"))
        (progn
          (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
            (setcar orig-result command-from-exec-path))
          (message "Using emacs-lsp-booster for %s!" orig-result)
          (cons "emacs-lsp-booster" orig-result))
      orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)


(require 'dev-flycheck)
(require 'dev-projectile)
(require 'dev-lsp)
(require 'dev-haskell)
(require 'dev-latex)
(require 'dev-markdown)

;; Org
(require 'slp-org)
(require 'og-roam)


;; Misc packages
(require 'slp-which-key)
(require 'slp-helpful)
(require 'slp-pdf)
(require 'slp-elfeed)


(provide 'init)
;;; init.el ends here
