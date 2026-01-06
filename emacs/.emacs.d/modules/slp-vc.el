(use-package diff-hl
  :after magit
  :ensure t
  :hook ((magit-pre-refresh . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode))

(use-package magit
  :ensure-system-package git
  :ensure t
  :bind (("M-g b" . magit-blame-addition)
         :map magit-mode-map
         ("C-M-f" . magit-section-forward)
         ("C-M-b" . magit-section-backward))
  :config
  (setq magit-mode-quit-window 'magit-restore-window-configuration
        magit-auto-revert-mode t))

(use-package forge
  :ensure t
  :after magit)

(use-package blamer
  :ensure t
  :after magit
  :bind (("C-c g i" . blamer-show-commit-info)
         ("C-c g b" . blamer-show-posframe-commit-info))
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 4)
  (blamer-max-commit-message-length 100)
  (blamer-datetime-formatter "[%s]")
  (blamer-commit-formatter " ● %s")
  :custom-face
  (blamer-face ((t :foreground "#7aa2cf"
                   :background nil
                   :height 1
                   :italic nil))))

(use-package git-link
  :ensure t
  :custom
  (git-link-use-commit t)
  (git-link-open-in-browser t))

(use-package git-timemachine
  :ensure t)

(provide 'slp-vc)
