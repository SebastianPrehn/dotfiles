;;; slp-org.el --- Setup Org mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package org :ensure nil
  :defer t
  :hook (org-mode . olivetti-mode)
  :config
  ;; Resize Org headings
  (custom-set-faces
   '(org-document-title ((t (:height 1.6))))
   '(outline-1          ((t (:height 1.25))))
   '(outline-2          ((t (:height 1.2))))
   '(outline-3          ((t (:height 1.2))))
   '(outline-4          ((t (:height 1.2))))
   '(outline-5          ((t (:height 1.2))))
   '(outline-6          ((t (:height 1.2))))
   '(outline-7          ((t (:height 1.2))))
   '(outline-8          ((t (:height 1.2))))
   '(outline-9          ((t (:height 1.2)))))
  (org-indent-mode -1)
  (setq org-startup-with-latex-preview t)
  (plist-put org-format-latex-options :scale 1.35)
  (let ((png (cdr (assoc 'dvipng org-preview-latex-process-alist))))
    (plist-put png :latex-compiler '("latex -interaction nonstopmode -output-directory %o %F"))
    (plist-put png :image-converter '("dvipng -D %D -T tight -o %O %F"))
    (plist-put png :transparent-image-converter '("dvipng -D %D -T tight -bg Transparent -o %O %F")))
  (setq org-startup-folded 'content)
  (setq org-adapt-indentation t
      org-hide-leading-stars t
      org-pretty-entities t
      org-ellipsis "  ·")
  ;; Source code block
  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0)
  ;; headers and TODO's
  (setq org-log-done t
        org-auto-align-tags t
        org-tags-column -80
        org-fold-catch-invisible-edits 'show-and-error
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t))


(use-package org-appear
   :commands (org-appear-mode)
   :hook (org-mode . org-appear-mode)                                                                                
   :config                                                                                                           
   (setq org-hide-emphasis-markers t)                                                                                
   (setq org-appear-autoemphasis t                                                                                   
         org-appear-autolinks t                                                                                      
         org-appear-autosubmarkers t))                                                                               
                                                                                                                     
 ;; Show inline images by default                                                                                    
 (setq org-startup-with-inline-images t)                                                                             
                                                                                                                     
 (use-package org-fragtog                                                                                            
   :after org                                                                                                        
   :hook (org-mode . org-fragtog-mode))                                                                              
                                                                                                                     
 (use-package org-superstar                                                                                          
   :after org                                                                                                        
   :config                                                                                                           
   (setq org-superstar-leading-bullet "")                                                                            
   (setq org-superstar-headline-bullets-list '(""))                                                                  
   (setq org-superstar-special-todo-items t)                                                                         
   (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)                                                           
                                           ("PROG" . 9744)                                                           
                                           ("NEXT" . 9744)                                                           
                                           ("WAIT" . 9744)                                                           
                                           ("DROP" . 9744)                                                           
                                           ("QUESTION" . 9744)                                                       
                                           ("DONE" . 9745)))                                                         
   :hook (org-mode . org-superstar-mode))                                                                            
                                                                                                                     
 (use-package svg-tag-mode                                                                                           
   :after org                                                                                                        
   :config                                                                                                           
   (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")                                                       
   (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")                                                                    
   (defconst day-re "[A-Za-z]\\{3\\}")                                                                               
   (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))                                             
                                                                                                                     
   (defun svg-progress-percent (value)                                                                               
 	(svg-image (svg-lib-concat                                                                                         
 				(svg-lib-progress-bar (/ (string-to-number value) 100.0)                                               
 			      nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)                                              
 				(svg-lib-tag (concat value "%")                                                                        
 				  nil :stroke 0 :margin 0)) :ascent 'center))
                                                                                                                     
   (defun svg-progress-count (value)                                                                                 
 	(let* ((seq (mapcar #'string-to-number (split-string value "/")))
            (count (float (car seq)))                                                                                
            (total (float (cadr seq))))                                                                              
 	  (svg-image (svg-lib-concat
 				  (svg-lib-progress-bar (/ count total) nil
 					:margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
 				  (svg-lib-tag value nil
 					:stroke 0 :margin 0)) :ascent 'center)))
   (setq svg-tag-tags                                                                                                
       `(;; Org tags                                                                                                 
         ;; (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))                                            
         ;; (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))                                                      
                                                                                                                     
         ;; Task priority                                                                                            
         ("\\[#[A-Z]\\]" . ( (lambda (tag)                                                                           
                               (svg-tag-make tag :face 'org-priority                                                 
                                             :beg 2 :end -1 :margin 0))))                                            
                                                                                                                     
         ;; Progress                                                                                                 
         ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)                                                             
           (svg-progress-percent (substring tag 1 -2)))))                                                            
         ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)                                                               
           (svg-progress-count (substring tag 1 -1)))))                                                              
                                                                                                                     
         ;; TODO / DONE                                                                                              
         ;; ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo                                            
 		;; 									           :inverse t :margin 0))))
         ;; ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))                              
                                                                                                                     
                                                                                                                     
         ;; Citation of the form [cite:@Knuth:1984]                                                                  
         ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)                                                               
                                           (svg-tag-make tag                                                         
                                                         :inverse t                                                  
                                                         :beg 7 :end -1                                              
                                                         :crop-right t))))                                           
         ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)                                                      
                                                 (svg-tag-make tag                                                   
                                                               :end -1                                               
                                                               :crop-left t))))                                      
                                                                                                                     
                                                                                                                     
         ;; Active date (with or without day name, with or without time)                                             
         (,(format "\\(<%s>\\)" date-re) .                                                                           
          ((lambda (tag)                                                                                             
             (svg-tag-make tag :beg 1 :end -1 :margin 0))))                                                          
         (,(format "\\(<%s \\)%s>" date-re day-time-re) .                                                            
          ((lambda (tag)                                                                                             
             (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))                                       
         (,(format "<%s \\(%s>\\)" date-re day-time-re) .                                                            
          ((lambda (tag)                                                                                             
             (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))                                         
                                                                                                                     
         ;; Inactive date  (with or without day name, with or without time)                                          
          (,(format "\\(\\[%s\\]\\)" date-re) .                                                                      
           ((lambda (tag)                                                                                            
              (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))                                         
          (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .                                                       
           ((lambda (tag)                                                                                            
              (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))                      
          (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .                                                       
           ((lambda (tag)                                                                                            
              (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date)))))))                     
                                                                                                                     
 (add-hook 'org-mode-hook 'svg-tag-mode)                                                                             
                                                                                                                     
 ;; Prettify Tags & Keywords                                                                                         
                                                                                                                     
 (defun slp/prettify-symbols-setup ()                                                                                
   "Beautify keywords."                                                                                              
   (interactive)                                                                                                     
   (setq prettify-symbols-alist                                                                                      
 		(mapcan (lambda (x)                                                                                            
                   (when (and (consp x) (stringp (car x)))                                                           
                     (list x (cons (upcase (car x)) (cdr x)))))                                                      
 				'(; Greek symbols                                                                                      
 				  ("lambda" . ?λ)                                                                                      
 				  ("delta"  . ?Δ)                                                                                      
 				  ("gamma"  . ?Γ)                                                                                      
 				  ("phi"    . ?φ)                                                                                      
 				  ("psi"    . ?ψ)                                                                                      
                   ; Org headers                                                                                     
 				  ("#+title:"  . ? )                                                                                   
 				  ("#+author:" . ? )                                                                                   
                   ("#+date:"   . ? )                                                                                
                   ; Checkboxes                                                                                      
 				  ("[ ]" . ?)                                                                                         
 				  ("[X]" . ?)                                                                                         
 				  ("[-]" . ?)                                                                                         
                   ; Misc                                                                                            
                   ("->" . ?➜)                                                                                       
                   ; Blocks                                                                                          
 				  ("#+begin_src"   . ?) ;                                                                            
 				  ("#+end_src"     . ?)                                                                               
 				  ("#+begin_QUOTE" . ?‟)                                                                               
 				  ("#+end_QUOTE"   . ?”)                                                                               
                   ; Drawers                                                                                         
 				  (":properties:" . ?)                                                                                
                   ; Agenda scheduling                                                                               
 				  ("SCHEDULED:"   . ?🕘)                                                                               
 				  ("DEADLINE:"    . ?⏰)                                                                               
                   ; Agenda tags                                                                                    
 				  (":@projects:"  . ?☕)                                                                               
 				  (":work:"       . ?🚀)                                                                               
 				  (":@inbox:"     . ?✉)                                                                                
 				  (":goal:"       . ?🎯)                                                                               
 				  (":task:"       . ?📋)                                                                               
 				  (":@thesis:"    . ?📝)                                                                               
 				  (":thesis:"     . ?📝)                                                                               
 				  (":emacs:"      . ?)                                                                                
 				  (":learn:"      . ?🌱)                                                                               
 				  (":code:"       . ?💻)                                                                               
 				  (":fix:"        . ?🛠)                                                                                
 				  (":bug:"        . ?🚩)                                                                               
 				  (":read:"       . ?📚)                                                                               
                   ; Roam tags                                                                                       
 				  ("#+filetags:"  . ?📎)                                                                               
 				  (":wip:"        . ?🏗)                                                                                
 				  (":ct:"         . ?➡)    ; Category Theory                                                           
                   (":verb:"       . ?🌐) ; HTTP Requests in Org mode                                                
                   )))                                                                                               
   (prettify-symbols-mode))                                                                                          
                                                                                                                     
 (add-hook 'org-mode-hook        #'slp/prettify-symbols-setup)                                                       
 (add-hook 'org-agenda-mode-hook #'slp/prettify-symbols-setup)                                                       
                                                                                                                     
 ;; Right-align Tags                                                                                                 
 (add-to-list 'font-lock-extra-managed-props 'display)                                                               
 (font-lock-add-keywords 'org-mode                                                                                   
                         `(("^.*?\\( \\)\\(:[[:alnum:]_@#%:]+:\\)$"                                                  
                            (1 `(face nil                                                                            
                                      display (space :align-to (- right ,(org-string-width (match-string 2)) 3)))    
                               prepend))) t)                                                                         

(use-package ox-hugo
  :ensure t
  :pin MELPA
  :after ox)

(provide 'slp-org)
;;; slp-org.el ends here
