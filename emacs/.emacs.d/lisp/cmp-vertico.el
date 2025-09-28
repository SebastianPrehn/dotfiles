;;; cmp-vertico --- Setup Vertico -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; My whole completion framework is based on Sophie Bosio's setup: https://github.com/SophieBosio/.emacs.d/

(defun slp/take-me-home ()
  (interactive)
  (if (looking-back "/" nil)
      (progn (call-interactively 'delete-minibuffer-contents) (insert "~/"))
    (call-interactively 'self-insert-command)))

(use-package vertico
  :defer t
  :bind (:map vertico-map ("~" . slp/take-me-home))
  :config
  (vertico-mode)
  (vertico-multiform-mode)
  (setq read-extended-command-predicate       'command-completion-default-include-p
        vertico-count                         32  ; Show more candidates
        read-file-name-completion-ignore-case t   ; Ignore case of file names
        read-buffer-completion-ignore-case    t   ; Ignore case in buffer completion
        completion-ignore-case                t)) ; Ignore case in completion


(use-package vertico-posframe
  :init
  (setq vertico-posframe-parameters   '((left-fringe  . 12)    ;; Fringes
                                        (right-fringe . 12)
                                        (undecorated  . nil))) ;; Rounded frame
  :config
  (vertico-posframe-mode 1)
  (setq vertico-posframe-width        96                       ;; Narrow frame
        vertico-posframe-height       vertico-count            ;; Default height
        ;; Don't create posframe for these commands
        vertico-multiform-commands    '((consult-line    (:not posframe))
                                        (consult-ripgrep (:not posframe)))))


(provide 'cmp-vertico)
;;; cmp-vertico.el ends here
