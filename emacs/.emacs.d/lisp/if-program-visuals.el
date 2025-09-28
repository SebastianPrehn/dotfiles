;;; if-program-visuals.el --- Settings for general interface visuals -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default cursor-type 'bar)


;; Parentheses
(use-package rainbow-delimiters
  :hook (prog-mode-hook . rainbow-delimiters-mode))

(show-paren-mode t) ;; Highlight matching parentheses

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(column-number-mode t) ;; Show current column number in mode line

;; Uniquify buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-to-list 'default-frame-alist '(undecorated-round . t))

(use-package olivetti
  :defer t
  :config
  (setq olivetti-style t))

(provide 'if-program-visuals)
;;; if-program-visuals.el ends here
