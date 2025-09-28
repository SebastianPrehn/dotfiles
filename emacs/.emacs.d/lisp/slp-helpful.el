;;; slp-helpful.el --- Setup helpful -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package helpful
  :bind (("C-h f" . #'helpful-function)
         ("C-h v" . #'helpful-variable)
		 ("C-h k" . #'helpful-key)
		 ("C-h x" . #'helpful-command)
		 ("C-h d" . #'helpful-at-point)
		 ("C-h c" . #'helpful-callable)))

(provide 'slp-helpful)
;;; slp-helpful.el ends here
