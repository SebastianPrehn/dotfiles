;;; dev-company.el --- Company setup file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package company
  :config
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1))

(provide 'dev-company)
;;; dev-company.el ends here
