;;; dev-pdf-tools.el --- Configuration for pdf-tools -*- lexical-binding: t -*-
;;; Commentary:

;; https://github.com/vedang/pdf-tools

;;; Code:

(use-package pdf-tools
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page)
  (setq pdf-annot-activate-created-annotations t)
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  ;; turn off cua so copy works
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))
  ;; more fine-grained zooming
  (setq pdf-view-resize-factor 1.1)
  :bind (:map pdf-view-mode-map
              ("g" . pdf-view-first-page)
              ("G" . pdf-view-last-page)
              ("j" . pdf-view-next-page)
              ("k" . pdf-view-previous-page)
              ("e" . pdf-view-goto-page)
              ("u" . pdf-view-revert-buffer)
              ("al" . pdf-annot-list-annotations)
              ("i" . pdf-misc-display-metadata)
              ("s" . pdf-occur)))

(provide 'dev-pdf-tools)
;;; dev-pdf-tools.el ends here
