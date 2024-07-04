;;; dev-latex.el --- Configuration for LaTeX -*- lexical-binding: t -*-
;;; Commentary:

;; https://github.com/progfolio/elpaca/issues/191

;;; Code:

(use-package auctex
  :ensure (auctex :pre-build (("./autogen.sh")
                              ("./configure" "--without-texmf-dir" "--with-lispdir=.")
                              ("make")))
  :mode (("\\.tex\\'" . LaTeX-mode)))

(provide 'dev-latex)
;;; dev-latex.el ends here
