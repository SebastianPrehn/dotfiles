;;; ed-multicursor.el --- Setup multiple cursors in Emacs -*- lexical-binding: t -*-
;;; Commentary:

;; Taken from Sophie Bosio

;;; Code:

(use-package multiple-cursors
  :defer t
  :functions
  mc/remove-fake-cursors
  mc/save-excursion
  mc/create-fake-cursor-at-point
  mc/maybe-multiple-cursors-mode
  :bind (:map custom-bindings-map
              ("M-n" . mc/mark-next-like-this)
              ("M-p" . mc/mark-previous-like-this))
  :config
  (setq mc/always-run-for-all t))

(provide 'ed-multicursor)
;;; ed-multicursor.el ends here
