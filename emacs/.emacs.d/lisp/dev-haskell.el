;;; dev-haskell.el --- Configuration for Haskell -*- lexical-binding: t -*-
;;; Commentary:

;; http://h2.jaguarpaw.co.uk/posts/how-i-use-dante/

;;; Code:

(use-package haskell-mode
  :hook (haskell-mode . (lambda ()
                          (haskell-doc-mode)
                          (turn-on-haskell-indent))))

(use-package attrap)

(use-package dante
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  :config
  (flycheck-add-next-checker 'haskell-dante '(info . haskell-hlint))
  )

(provide 'dev-haskell)
;;; dev-haskell.el ends here
