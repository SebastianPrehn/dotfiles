;;; dev-latex.el --- Setup AUCTeX -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package auctex
  :hook
  (LaTeX-mode . turn-on-prettify-symbols-mode)
  (LaTeX-mode . reftex-mode)
  (LaTeX-mode . outline-minor-mode)
  (LaTeX-mode . olivetti-mode))

(setq reftex-toc-split-windows-horizontally t
	  reftex-toc-split-windows-fraction     0.2)

(provide 'dev-latex)
;;; dev-latex.el ends here
