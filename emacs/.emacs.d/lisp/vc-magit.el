;;; vc-magit.el --- Setup Magit and other VC tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package magit
  :ensure-system-package git
  :defer t
  :bind (:map magit-mode-map
              ("C-M-f" . magit-section-forward)
              ("C-M-b" . magit-section-backward))
  :bind ("M-g b" . magit-blame-addition)
  :hook
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (setq magit-mode-quit-window 'magit-restore-window-configuration
        magit-auto-revert-mode t))

(use-package forge
  :after magit)

(use-package blamer
  :after magit
  :bind (("C-c g i" . blamer-show-commit-info)
         ("C-c g b" . blamer-show-posframe-commit-info))
  :defer 20
  :custom
  (blamer-idle-time                 0.3)
  (blamer-min-offset                4)
  (blamer-max-commit-message-length 100)
  (blamer-datetime-formatter        "[%s]")
  (blamer-commit-formatter          " ● %s")
  :custom-face
  (blamer-face ((t :foreground "#7aa2cf"
                    :background nil
                    :height 1
                    :italic nil))))

(use-package git-link
  :defer t
  :init
  (setq git-link-use-commit t
        git-link-open-in-browser t))

(use-package git-timemachine
  :defer t)

(provide 'vc-magit)
;;; vc-magit.el ends here
