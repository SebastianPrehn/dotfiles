;;; Setup package manager archives
(add-to-list 'package-archives
             '("melpa" . "https://stable.melpa.org/#/") t)
(package-initialize)

(dolist (dir '("modules"))
  (let ((path (locate-user-emacs-file dir)))
    (when (file-directory-p path)
      (add-to-list 'load-path path))))

(require 'slp-completion)
(require 'slp-org)
(require 'slp-interface)
(require 'slp-programming)
(require 'slp-dired)
(require 'slp-spellcheck)
(require 'slp-vc)

(setq-default indent-tabs-mode nil)

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-language-environment "English")

(setq column-number-mode 1)
(setq use-dialog-box nil)
(setq frame-resize-pixelwise t)
(setq default-frame-alist '((undecorated . t)))

(use-package exec-path-from-shell
  :ensure t
  :config
  ((dolist (var '("SSH_AUTH_SOCK" "SSH_AGENT_PID" "GPG_AGENT_INFO"))
  (add-to-list 'exec-path-from-shell-variables var))))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(delete-selection-mode 1) ; Delete selection when typing
(global-auto-revert-mode 1) ; Auto update buffer when file changes outside of Emacs (vc etc.)
(setq vc-follow-symlinks t) ; Follow symlinks without prompting
(setq-default tab-width 4) ; Reasonable default tab width most languages will override
(setq yes-or-no-p #'y-or-n-p) ; Use y/n instead of yes/no

(setq make-backup-files nil)
(setq create-lockfiles nil)

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)

(when (eq system-type 'darwin)
      (setq mac-command-modifier 'meta
            mac-option-modifier nil
            mac-control-modifier 'control
            mac-right-command-modifier 'super
            mac-right-control-modifier 'hyper))
