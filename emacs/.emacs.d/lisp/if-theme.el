;;; if-theme.el --- Setup themes -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package solaire-mode
  :config
  (solaire-global-mode +1))

(use-package doom-themes
  :config
  ;; Global settings
  (setq doom-themes-enable-bolt t ; if nil, bold is universally disabled
        doom-themes-enableitalic t)

  (load-theme 'doom-wilmersdorf t)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) Org-mode's native fontification
  (doom-themes-org-config))

(provide 'if-theme)
;;; if-theme.el ends here
