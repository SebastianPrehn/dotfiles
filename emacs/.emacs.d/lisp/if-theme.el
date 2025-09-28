;;; if-theme.el --- Configuration for themes -*- lexical-binding: t -*-
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

(use-package south-theme
  :vc (:url "https://github.com/SophieBosio/south"
       :rev :newest
       :branch "main"))

(setq custom-safe-themes t)

(defvar slp/default-dark-theme  'doom-nord)
(defvar slp/default-light-theme 'south)

(defvar slp/default-dark-accent-colour  "SkyBlue4")
(defvar slp/default-light-accent-colour "#D9EDFC")

(load-theme slp/default-dark-theme t)

(use-package autothemer
  :defer t)

(use-package auto-dark
  :ensure t
  :hook ((auto-dark-dark-mode
          .
          (lambda ()
            (interactive)
            (progn
              (custom-set-faces
               `(eval-sexp-fu-flash
                 ((t (:background
                      ,slp/default-dark-accent-colour)))))
              `(load-theme ,slp/default-dark-theme t))))
         (auto-dark-light-mode
          .
          (lambda ()
            (interactive)
            (progn
              (custom-set-faces
               `(eval-sexp-fu-flash
                 ((t (:background
                      ,slp/default-light-accent-colour)))))
              `(load-theme ,slp/default-light-theme t)))))
  :custom
  (auto-dark-themes                   `((,slp/default-dark-theme) (,slp/default-light-theme)))
  (auto-dark-polling-interval-seconds 5)
  (auto-dark-allow-osascript          t)
  :init (auto-dark-mode t))

(provide 'if-theme)
;;; if-theme.el ends here
