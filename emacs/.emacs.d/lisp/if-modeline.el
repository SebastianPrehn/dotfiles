;;; if-modeline.el --- Setup modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Use nerd-icons for VC logo
(use-package nerd-icons)

(defvar lsp-modeline--code-actions-string nil)

(setq-default mode-line-format
  '("%e"
	(:propertize " " display (raise +0.4)) ;; Top padding
	(:propertize " " display (raise -0.4)) ;; Bottom padding

	(:propertize "λ " face font-lock-comment-face)
	mode-line-frame-identification
	mode-line-buffer-identification

	;; Version control info
	(:eval (when-let (vc vc-mode)
			 ;; Use a pretty branch symbol in front of the branch name
			 (list (propertize "   " 'face 'font-lock-comment-face)
                   ;; Truncate branch name to 50 characters
				   (propertize (truncate-string-to-width
                                (substring vc 5) 50)
							   'face 'font-lock-comment-face))))

	;; Add space to align to the right
	(:eval (propertize
			 " " 'display
			 `((space :align-to
					  (-  (+ right right-fringe right-margin)
						 ,(+ 3
                             (string-width (or lsp-modeline--code-actions-string ""))
                             (string-width "%4l:3%c")))))))

    ;; LSP code actions
    (:eval (or lsp-modeline--code-actions-string ""))
	
	;; Line and column numbers
	(:propertize "%4l:%c" face mode-line-buffer-id)))

(provide 'if-modeline)
;;; if-modeline.el ends here
