;;; init-startup.el --- Set some initial startup settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default
 inhibit-startup-screen t             ; Disable start-up screen
 inhibit-startup-message t            ; Disable start-up message
 inhibit-startup-echo-area-message t  ; Disable initial echo message
 initial-scratch-message "")          ; Have an empty *scratch* buffer


(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default indent-tabs-mode nil)
(scroll-bar-mode -1)
(show-paren-mode t)

;; Encoding

(set-default-coding-systems 'utf-8)  ; Default to utf-8 encoding
(prefer-coding-system       'utf-8)  ; Add utf-8 at the front for automatic detection
(set-terminal-coding-system 'utf-8)  ; Sets coding system for terminal output
(set-keyboard-coding-system 'utf-8)  ; Sets coding system for keyboard input on TERMINAL
(set-language-environment "English") ; Sets English as standard language environment

(provide 'init-startup)
;;; init-startup.el ends here
