;;; dev-magit.el --- Setup Magit -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package transient)

(use-package magit
  :ensure-system-package git)

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(use-package git-timemachine)

(provide 'dev-magit)
;;; dev-magit.el ends here
