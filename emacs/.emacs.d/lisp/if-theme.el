;;; if-theme.el --- Setup themes -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package solaire-mode
  :config
  (solaire-global-mode t))

(use-package doom-themes
  :config
  ;; Global settings
  (setq doom-themes-enable-bold t ; if nil, bold is universally disabled
        doom-themes-enableitalic t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) Org-mode's native fontification
  (doom-themes-org-config))

(use-package kaolin-themes
  :config
  (load-theme 'kaolin-dark t)
  (kaolin-treemacs-theme))

(provide 'if-theme)
;;; if-theme.el ends here
