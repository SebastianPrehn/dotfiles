;;; slp-startup.el --- Set some initial startup settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default
 inhibit-startup-screen t            ; Disable start-up screen.
 inhibit-startup-message t           ; Disable start-up message.
 inhibit-startup-echo-area-message t ; Disable initial echo message.
 initial-scratch-message "")         ; Set an empty *Scratch* buffer.

(setq-default indent-tabs-mode nil)
(scroll-bar-mode -1)
(show-paren-mode t)

;; Encoding

(set-default-coding-systems 'utf-8)  ; Default to utf-8 encoding.
(prefer-coding-system       'utf-8)  ; Add utf-8 at the front for automatic detection.
(set-terminal-coding-system 'utf-8)  ; Sets coding system for terminal output.
(set-keyboard-coding-system 'utf-8)  ; Sets coding system for keyboard input on TERMINAL.
(set-language-environment "English") ; Sets English as standard language envrionment.

(setq package-gnupghome-dir "~/.gnupg")

(add-to-list 'default-frame-alist     '(fullscreen . maximized))

(dolist (mode
         '(tool-bar-mode       ;; Remove toolbar
           scroll-bar-mode     ;; Remove scollbars
           menu-bar-mode       ;; Remove menu bar
           blink-cursor-mode)) ;; Solid cursor, not blinking
  (funcall mode 0))

(set-fringe-mode 10)                          ;; Set fringe width to 10
(setq-default fringes-outside-margins nil)
(setq-default indicate-buffer-boundaries nil) ;; Otherwise shows a corner icon on the edge
(setq-default indicate-empty-lines nil)       ;; Otherwise there are weird fringes on blank lines
(set-face-attribute 'header-line t :inherit 'default)

(provide 'slp-startup)
;;; slp-startup.el ends here
