;;; slp-which-key --- Which-key setup -*- lexical-binding: t -*-
;;; Commentary:

;; https://github.com/justbur/emacs-which-key

;;; Code:

(use-package which-key
  :diminish which-key-mode
  :init
  (which-key-mode)
  (which-key-setup-minibuffer)
  :config
  (setq which-key-idle-delay 0.3)
  (setq which-key-prefix-prefix "• ")
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-min-display-lines 3
	which-key-max-display-columns nil))

(provide 'slp-which-key)
;;; slp-which-key.el ends here
