;;; compl-corfu.el --- Setup Corfu -*- lexical-binding: t -*-
;;; Commentary:

;; This package installs and sets up Corfu for use with other packages

;;; Code:

(use-package corfu :ensure (:host github :repo "minad/corfu" :files (:defaults "extensions/*"))
  :custom
  (corfu-auto t) ;; Enable auto-completion
  :bind
  ;; Another key binding can be used, such as S-SPC.
  ;; (:map corfu-map ("M-SPC" . corfu-insert-separator))
  :config
  (setq corfu-popupinfo-delay 0)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package kind-icon
  :after corfu
  :custom
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil)  ; Use midpoint color between foreground and background colors ("blended")?
  (kind-icon-blend-frac 0.08))

(provide 'compl-corfu)
;;; compl-corfu.el ends here
