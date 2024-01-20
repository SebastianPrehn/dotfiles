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


(use-package nord-theme
  :config
  (load-theme 'nord t))

(provide 'if-theme)
;;; if-theme.el ends here
