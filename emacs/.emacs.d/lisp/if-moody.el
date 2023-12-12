;;; if-moody.el --- mode-line configuration -*- lexical-binding: t -*-

;;; Commentary:

;; This file configures the Moody package which adds tabs
;; and ribbons for the mode-line.

;; https://github.com/tarsius/moody

;;; Code:

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode)
  (moody-replace-eldoc-minibuffer-message-function)
  (display-time-mode 1))

(provide 'if-moody)
;;; if-moody.el ends here
