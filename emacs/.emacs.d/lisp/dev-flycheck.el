;;; dev-flycheck.el --- Setup flycheck -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package flycheck
  :defer t
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function #'ignore)
  (unbind-key "C-c !" flycheck-mode-map)) ;; conflicts with org

(provide 'dev-flycheck)
;;; dev-flycheck.el ends here
