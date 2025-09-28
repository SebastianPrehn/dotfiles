;;; dev-projectile.el --- Setup Projectile -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package projectile
  :defer t
  :bind (("C-c p" . projectile-command-map))
  :config
  (add-to-list 'projectile-project-search-path "~/Documents/University/")
  (add-to-list 'projectile-project-search-path "~/Sandbox")
  :init
  (projectile-mode))

(provide 'dev-projectile)
;;; dev-projectile.el ends here
