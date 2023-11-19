;;; dev-python.el --- Support for Python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package python
  :bind (:map python-ts-mode-map
	      ("<f5>" . recompile)
	      ("<f6>" . eglot-format))
  :hook ((python-ts-mode . eglot-ensure)
	 (python-ts-mode . company-mode))
  :mode (("\\.py\\'" . python-ts-mode)))

(provide 'dev-python)
;;; dev-python.el ends here
