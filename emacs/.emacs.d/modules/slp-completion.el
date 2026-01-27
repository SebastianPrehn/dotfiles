;;; Vertico
(use-package vertico
  :ensure t
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (orderless-ignore-case t))

(use-package consult
  :ensure t
  :bind (;; A recursive grep
	 ("M-s M-g" . consult-grep)
	 ;; Search for files names recursively
	 ("M-s M-f" . consult-find)
	 ;; Search through the outline (headings) of the file
	 ("M-s M-o" . consult-outline)
     ;; Search through the imenu entries
     ("M-g i" . consult-imenu)
	 ;; Search the current buffer
	 ("C-s" . consult-line) ; overrides I-search. TODO check back with this in a month 2026/01/03
     ;; Search backward
     ("C-r" . consult-line-backward)
	 ;; Switch to another buffer, or bookmarked file, or recently opened file
	 ("C-x b" . consult-buffer))) ; replaces default switch-to-buffer

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
	 :map minibuffer-local-map
	 ("C-c C-c" . embark-collect)
	 ("C-c C-e" . embark-export)))

(use-package embark-consult
  :after embark consult
  :ensure t)

(use-package wgrep
  :ensure t
  :bind ( :map grep-mode-map
	  ("e" . wgrep-change-to-wgrep-mode)
	  ("C-x C-q" . wgrep-change-to-wgrep-mode)
	  ("C-c C-c" . wgrep-finish-edit)))

;;; `savehist' (minibuffer and related histories)
(setq savehist-file (locate-user-emacs-file "savehist"))
(setq history-length 100)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history t)
(with-eval-after-load 'savehist
  (add-to-list 'savehist-additional-variables 'kill-ring))
(savehist-mode 1)

(recentf-mode 1)

(use-package corfu
  :ensure t
  :after orderless
  :custom
  (corfu-cycle t) ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t) ;; Enable auto completion
  (corfu-separator ?\s)
  (corfu-quit-at-boundary nil)
  (corfu-quit-no-match nil)
  :init
  (global-corfu-mode)
  (setq corfu-auto t))

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  (completion-cycle-threshold 4)
  ;; Enable indentation+completion using the TAB key
  (tab-always-indent 'complete)
  ;; Disable Ispell completion function to try cape-dict instead as an alternative
  (text-mode-ispell-word-completion nil)
  ;; Hide commands in M-x which do not apply to the current mode. This is not a corfu feature, but rather just a tip from Minad
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package cape
  :ensure t
  ;; Bind prefix keymap providing all Cape commands under one key. Press C-c p ? for help
  :bind ("C-c p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dict)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Use Company backends as Capfs
(when (require 'cape nil 'noerror)
  (setq-local completion-at-point-functions
              (mapcar #'cape-company-to-capf
                      (list #'company-files #'company-keywords #'company-dabbrev))))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer)
  :custom
  (ibuffer-expert nil) ; set to t once I've gotten used to IBuffer
  (ibuffer-display-summary nil)
  (ibuffer-use-other-window nil)
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-default-sorting-mode 'filename/process)
  (ibuffer-title-face 'font-lock-doc-face)
  (ibuffer-use-header-line t)
  (ibuffer-default-hrink-to-minimum-size nil)
  ;; IBuffer formats
  (ibuffer-formats
   '((mark modified read-only locked " "
           (name 30 30 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename)))
  ;; Saved filter groups
  (ibuffer-saved-filter-groups
   '(("Main"
      ("Directories" (mode . dired-mode))
      ("Python" (or
                 (mode . python-ts-mode)
                 (mode . python-mode)))
      ("Build" (or
                (mode . make-mode)
                (mode . makefile-gmake-mode)
                (name . "^Makefile$")
                (mode . change-log-mode)))
      ("Scripts" (or
                  (mode . shell-script-mode)
                  (mode . shell-mode)
                  (mode . sh-mode)
                  (mode . lua-mode)
                  (mode . bat-mode)))
      ("Config" (or
                 (mode . conf-mode)
                 (mode . conf-toml-mode)
                 (mode . toml-ts-mode)
                 (mode . conf-windows-mode)
                 (name . "^\\.clangd$")
                 (name . "^config\\.toml$")
                 (mode . yaml-mode)))
      ("Web" (or
              (mode . mhtml-mode)
              (mode . html-mode)
              (mode . web-mode)
              (mode . nxml-mode)))
      ("CSS" (or
              (mode . css-mode)
              (mode . sass-mode)))
      ("JS" (or
             (mode . js-mode)
             (mode . rjsx-mode)))
      ("Markup" (or
                 (mode . markdown-mode)
                 (mode . adoc-mode)))
      ("Org" (mode . org-mode))
      ("LaTeX" (name . "\\.tex$"))
      ("Magit" (or
              (mode . magit-blame-mode)
              (mode . magit-cherry-mode)
              (mode . magit-diff-mode)
              (mode . magit-log-mode)
              (mode . magit-process-mode)
              (mode . magit-status-mode)))
    ("Apps" (or
             (mode . elfeed-search-mode)
             (mode . elfeed-show-mode)))
    ("Fundamental" (or
                    (mode . fundamental-mode)
                    (mode . text-mode)))
    ("Emacs" (or
              (mode . emacs-lisp-mode)
              (name . "^\\*Help\\*$")
              (name . "^\\*Custom.*")
              (name . "^\\*Org Agenda\\*$")
              (name . "^\\*info\\*$")
              (name . "^\\*scratch\\*$")
              (name . "^\\*Backtrace\\*$")
              (name . "^\\*Messages\\*$"))))))
:hook
(ibuffer-mode . (lambda ()
                  (ibuffer-switch-to-saved-filter-groups "Main"))))

;;; Configure Tempel
(use-package tempel
  :ensure t
  :bind (("M-+" . tempel-complete) ;; Alternative tempel-expand
         ("M-*" . tempel-insert))
  :init
  ;; Setup completion at point
  (defun tempel-setup-capf ()
    ;; Add the Tempel Capf to `completion-at-point-functions'.
    ;; only triggers on exact matches. We add `tempel-expand' before the
    ;; main programming mode Capf, such that it will be tried first.
    (setq-local completion-at-point-functions
                (cons #'tempel-expand completion-at-point-functions)))
  (add-hook 'conf-mode-hook 'tempel-setup-capf)
  (add-hook 'prog-mode-hook 'tempel-setup-capf)
  (add-hook 'text-mode-hook 'tempel-setup-capf)
  :config
  (setq tempel-path (expand-file-name "templates" user-emacs-directory)))

(provide 'slp-completion)
