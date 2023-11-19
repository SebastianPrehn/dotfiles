;;; if-fonts.el --- Setup fonts -*- lexical-binding: t -*-
;;; Commentary:

;; Roboto Mono and Victor Mono needs to be installed seperately.

;;; Code:

(set-face-attribute 'default nil
                    :family "Roboto Mono"
                    :weight 'light
                    :height 140)

(set-face-attribute 'bold nil
                    :family "Roboto Mono"
                    :weight 'regular)

(set-face-attribute 'italic nil
                    :family "Victor Mono"
                    :weight 'semilight
                    :slant 'italic)

(provide 'if-fonts)
;;; if-fonts.el ends here
