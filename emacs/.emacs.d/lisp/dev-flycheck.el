;;; dev-flycheck.el --- Configure flycheck -*- lexical-binding: t -*-

;;; Commentary:

;; This file configures the Flycheck package which
;; is a modern syntax checker.

;; https://www.flycheck.org/en/latest/

;;; Code:

(use-package flycheck
  :config
  (unbind-key "C-c !" flycheck-mode-map) ;; conflicts with org
  (global-flycheck-mode))

(provide 'dev-flycheck)
;;; dev-flycheck.el ends here
