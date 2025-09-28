;;; slp-pdf.el --- Set up PDF tools and friends -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package pdf-tools
  :defer t
  :init (pdf-loader-install)
  :hook ((pdf-view-mode . (lambda () (auto-revert-mode -1)))
         (pdf-view-mode . (lambda () (company-mode -1))))
  :bind (:map pdf-view-mode-map
              ("C-s"   . isearch-forward)
              ("C-M-s" . pdf-occur)))

(use-package doc-view
  :hook (doc-view-mode . (lambda ()
                           (display-warning
                            emacs
                            "Oops, using DocView instead of PDF Tools!"
                            :warning))))

(use-package pdf-view-restore
  :after pdf-tools
  :config
  (add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode))

(use-package nov
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(provide 'slp-pdf)
;;; slp-pdf.el ends here
