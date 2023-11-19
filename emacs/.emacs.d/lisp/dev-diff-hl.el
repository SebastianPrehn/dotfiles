;;; dev-diff-hl.el --- Setup diff-hl -*- lexical-binding: t -*-

;;; Commentary:

;; This file configures the diff-hl package which
;; highlights uncommitted changes on the left side

;; https://github.com/dgutov/diff-hl

;;; Code:

(use-package diff-hl
  :config
  :hook ((text-mode prog-mode vc-dir-mode) . turn-on-diff-hl-mode))


(provide 'dev-diff-hl)
;;; dev-diff-hl.el ends here
