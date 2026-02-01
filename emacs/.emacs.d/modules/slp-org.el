;;; General org settings
(use-package org
  :ensure nil ; org is built-in
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c l" . org-store-link))
  :custom
  (org-directory (expand-file-name "~/Documents/org/"))
  (org-imenu-depth 7)
  (org-ellipsis " ▼")
  (org-special-ctrl-a/e nil)
  (org-special-ctrl-k nil)
  (org-M-RET-may-split-line '((default . nil)))
  (org-hide-emphasis-markers nil)
  (org-hide-macro-markers nil)
  (org-hide-leading-stars nil)
  (org-cycle-separator-lines 0)
  (org-fold-catch-invisible-edits 'show)
  (org-return-follows-link nil)
  (org-loop-over-headlines-in-active-region 'start-level)
  (org-insert-heading-respect-content t)
  (org-read-date-prefer-future 'time)
  (org-highlight-latex-and-related nil) ; other options affect elisp regexp in src blocks
  (org-fontify-quote-and-verse-blocks t)
  (org-fontify-whole-block-delimiter-line t)
  (org-track-ordered-property-with-tag t)
  (org-structure-template-alist
   '(("s" . "src")
	 ("e" . "src emacs-lisp")
	 ("E" . "src emacs-lisp :results value code :lexical t")
	 ("t" . "src emacs-lisp :tangle FILENAME")
	 ("T" . "src emacs-lisp :tangle FILENAME :mkdirp yes")
	 ("x" . "example")
	 ("X" . "export")
	 ("q" . "quote")))

  :config
  (defvar slp/deep-work-file
    (expand-file-name "deep-work.org" org-directory)
    "Path to deep work org file.")

  (defvar slp/journal-file
    (expand-file-name "journal.org" org-directory)
    "Path to journal org file.")

  (setq org-agenda-files (list slp/deep-work-file))

  (setq org-capture-templates
    `(("w" "Work Task"
       entry
       (file+headline ,slp/deep-work-file "Tasks")
       "* TODO %^{Task description}\nSCHEDULED: %^t\n:PROPERTIES:\n:WORK_TYPE: %^{Work type|deep|shallow}\n:EFFORT: %^{Effort|2:00|1:30|0:30|0:15}\n:BEST_TIME: %^{Best time|morning|afternoon|evening|anytime}\n:END:\n%U\n"
       :empty-lines 1)
      
      ;; Keep specialized ones if you want quick access to common patterns
      ("d" "Deep Work (quick)" 
       entry
       (file+headline ,slp/deep-work-file "Tasks")
       "* TODO %^{Task description}\nSCHEDULED: %^t\n:PROPERTIES:\n:WORK_TYPE: deep\n:EFFORT: 2:00\n:BEST_TIME: morning\n:END:\n%U\n"
       :empty-lines 1)
      
      ("q" "Quick Shallow (quick)"
       entry
       (file+headline ,slp/deep-work-file "Tasks")
       "* TODO %^{Task description}\n:PROPERTIES:\n:WORK_TYPE: shallow\n:EFFORT: 0:15\n:BEST_TIME: anytime\n:END:\n"
       :empty-lines 1)

      ("j" "Journal Entry"
       entry
       (file+datetree ,slp/journal-file)
       "* %<%H:%M> %^{Title}\n%?\n"
       :empty-lines 1)))

  ;; Custom agenda commands
  (setq org-agenda-custom-commands
    '(("d" "Deep Work Queue"
       tags-todo "WORK_TYPE=\"deep\""
       ((org-agenda-overriding-header "🧠 Deep Work Sessions Available")
        (org-agenda-prefix-format " %i %-12:c [%e] ")
        (org-agenda-sorting-strategy '(priority-down effort-down))))
      
      ("s" "Shallow Work Queue"
       tags-todo "WORK_TYPE=\"shallow\""
       ((org-agenda-overriding-header "📋 Shallow Work Tasks")
        (org-agenda-prefix-format " %i %-12:c [%e] ")
        (org-agenda-sorting-strategy '(priority-down effort-up))))
      
      ("w" "Work Type Overview"
       ((tags-todo "WORK_TYPE=\"deep\""
                   ((org-agenda-overriding-header "🧠 Deep Work (Uninterrupted Focus)")
                    (org-agenda-prefix-format " %i %-12:c [%e] ")))
        (tags-todo "WORK_TYPE=\"shallow\""
                   ((org-agenda-overriding-header "📋 Shallow Work (Administrative)")
                    (org-agenda-prefix-format " %i %-12:c [%e] "))))
       ((org-agenda-sorting-strategy '(priority-down effort-down))))
      
      ;; Additional useful views
      ("t" "Today's Schedule"
       agenda ""
       ((org-agenda-span 'day)
        (org-agenda-overriding-header "📅 Today's Schedule")))
      
      ("n" "Next 7 Days"
       agenda ""
       ((org-agenda-span 7)
        (org-agenda-overriding-header "📆 Week Ahead"))))))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (expand-file-name "roam/" org-directory))
  (org-roam-completion-anywhere t)
  (org-roam-dailies-directory "daily/")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today)
         ("C-c n d" . org-roam-dailies-goto-today)
         ("C-c n y" . org-roam-dailies-goto-yesterday)
         ("C-c n t" . org-roam-dailies-goto-tomorrow)
         ("C-c n g" . org-roam-graph))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (org-roam-db-autosync-mode) ; Initialize database
  ;; Daily node templates
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* %<%H:%M> %?"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d %A>\n\n"))))
  ;; Node capture templates
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+date: %U\n\n")
           :unnarrowed t)
          
          ("p" "project" plain
           "* Goals\n\n%?\n\n* Tasks\n\n** TODO \n\n* Dates\n\n* Notes\n\n"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+category: project\n#+date: %U\n\n")
           :unnarrowed t)
          
          ("r" "reference/paper" plain
           "* Source\n\n%^{citekey}p\n\n* Summary\n\n%?\n\n* Key Points\n\n* Notes\n\n* Related\n\n"
           :target (file+head "references/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+roam_key: cite:${citekey}\n#+category: reference\n#+date: %U\n\n")
           :unnarrowed t)
          
          ("b" "bibliography note" plain
           "* Bibliographic Information\n\n%^{citekey}p\n\n* Summary\n\n%?\n\n* Key Arguments\n\n* Methodology\n\n* Conclusions\n\n* Personal Notes\n\n* Related Papers\n\n"
           :target (file+head "references/%<%Y%m%d%H%M%S>-${slug}.org"
                              "#+title: ${title}\n#+roam_key: cite:${citekey}\n#+date: %U\n\n")
           :unnarrowed t))))

;;; Bibliography and citation management
(use-package org-ref
  :ensure t
  :after org
  :custom
  ;; Bibliography files
  (org-ref-default-bibliography 
   (list (expand-file-name "references/bibliography.bib" org-directory)))
  (org-ref-pdf-directory 
   (expand-file-name "references/pdfs/" org-directory))
  (org-ref-notes-directory 
   (expand-file-name "roam/references/" org-directory))

  ;; Use Org Roam for notes
  (org-ref-notes-function 'org-ref-notes-function-many-files)

  ;; Citation format
  (org-ref-default-citation-link "cite")

  :config
  ;; Make org-ref work with Org Roam notes
  (defun slp/org-ref-notes-function (key)
    "Open or create an Org Roam note for citation KEY."
    (let* ((title (org-ref-get-bibtex-key-and-file key))
           (node (org-roam-node-from-title-or-alias 
                  (format "@%s" key))))
      (if node
          (org-roam-node-visit node)
        (org-roam-capture-
         :node (org-roam-node-create :title (format "@%s" key))
         :templates
         '(("r" "reference" plain
            "* Source\n\nCitekey: %^{citekey}\n\n* Summary\n\n%?\n\n* Notes\n\n"
            :target (file+head "references/${citekey}.org"
                               "#+title: @${citekey}\n#+roam_key: cite:${citekey}\n#+date: %U\n\n")
            :unnarrowed t))))))
  
  (setq org-ref-notes-function 'slp/org-ref-notes-function))

(provide 'slp-org)
