;;; slp-dired.el --- Configuration of Dired -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package dired :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
  (setq insert-directory-program "gls" dired-use-ls-dired t)
  (setq-default dired-listing-switches
                (combine-and-quote-strings '("-l"
                                             "-v"
                                             "-g"
                                             "--no-group"
                                             "--human-readable"
                                             "--time-style=+%Y-%m-%d"
                                             "--almost-all")))
  (setq dired-clean-up-buffers-too t
        dired-dwim-target t
        dired-recursive-copies 'always
        dired-recursive-deletes 'top
        global-auto-revert-non-file-buffers t
        auto-revert-verbose nil))

(provide 'slp-dired)
;;; slp-dired.el ends here
