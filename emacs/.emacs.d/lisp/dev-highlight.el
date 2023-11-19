;;; dev-highlight.el --- Minor mode for great indentation -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package highlight-indent-guides
  :hook (prog-mode-hook . highlight-indent-guides-mode)
  :config
  (highlight-indent-guides-method 'bitmap))
  
(provide 'dev-highlight)
;;; dev-highlight.el ends here
