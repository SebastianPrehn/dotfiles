;;; dev-blamer.el --- Setup Blamer -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package blamer
    :bind (("C-c g" . blamer-mode))
    :config
    (setq blamer-idle-time 0.3)
    (setq blamer-author-formatter "  ✎ %s ")
    (setq blamer-datetime-formatter "[%s]")
    (setq blamer-commit-formatter " ● %s")
    (setq blamer-min-offset 40)
    (setq blamer-type 'both)
    (setq blamer-max-lines 30)
    (setq setq-blamer-max-commit-message-length 100))


(provide 'dev-blamer)
;;; dev-blamer.el ends here
