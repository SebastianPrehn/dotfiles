;;; cmp-corfu.el --- Setup Corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :defer t
  :custom
  (corfu-auto          t)
  (corfu-auto-delay    0.1)
  (corfu-auto-prefix   1)
  (corfu-cycle         t)
  (corfu-quit-no-match 'separator)
  :bind (:map corfu-map
              (" " . corfu-insert-separator)) ;; Option + Space on Norwegian Mac
  :init
  (global-corfu-mode))

(setq tab-always-indent 'complete)

(provide 'cmp-corfu)
;;; cmp-corfu.el ends here
