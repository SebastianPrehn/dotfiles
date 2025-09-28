;;; init-benchmarking.el --- Measure startup and require times -*- lexical-binding: t -*-
;;; Commentary:
;; Taken from Purcell's Emacs config:
;; https://github.com/purcell/emacs.d/blob/master/lisp/init-benchmarking.el

;;; Code:

(defun slp/time-subtract-millis (b a)
  "Return the difference between times B and A in milliseconds."
  (* 1000.0 (float-time (time-subtract b a))))

(defvar slp/require-times nil
  "A list of (FEATURE LOAD-START-TIME LOAD-DURATION).
LOAD-DURATION is the time taken in milliseconds to load FEATURE.")

(defun slp/require-times-wrapper (orig feature &rest args)
  "Advice around `require' to measure laod time of FEATURE.

ORIG is the original `require' function.
FEATURE is the feature being required.
ARGS are additional arguments passed to `require'.

Appends an entry to `slp-require-times' when a new feature is loaded,
in the form (FEATURE START-TIME MILLIS)."
  (let* ((already-loaded (memq feature features))
         (require-start-time (and (not already-loaded) (current-time))))
    (prog1
        (apply orig feature args)
      (when (and (not already-loaded) (memq feature features))
        (let ((time (slp/time-subtract-millis (current-time) require-start-time)))
          (add-to-list 'slp/require-times
                       (list feature require-start-time time)
                       t))))))

(advice-add 'require :around 'slp/require-times-wrapper)

(define-derived-mode slp/require-times-mode tabulated-list-mode "Require-Times"
  "Show times taken to `require' packages."
  (setq tabulated-list-format
        [("Start time (ms)" 20 slp/require-times-sort-by-start-time-pred)
         ("Feature" 30 t)
         ("Time (ms)" 12 slp/require-times-sort-by-load-time-pred)])
  (setq tabulated-list-sort-key (cons "Start time (ms)" nil))
  ;; (setq tabulated-list-padding 2)
  (setq tabulated-list-entries #'slp/require-times-tabulated-list-entries)
  (tabulated-list-init-header)
  (when (fboundp 'tablist-minor-mode)
    (tablist-minor-mode)))

(defun slp/require-times-sort-by-start-time-pred (entry1 entry2)
  "Return non-nil if ENTRY1 started before ENTRY2."
  (< (string-to-number (elt (nth 1 entry1) 0))
     (string-to-number (elt (nth 1 entry2) 0))))

(defun slp/require-times-sort-by-load-time-pred (entry1 entry2)
  "Return non-nil if ENTRY1 took longer to load than ENTRY2."
  (> (string-to-number (elt (nth 1 entry1) 2))
     (string-to-number (elt (nth 1 entry2) 2))))

(defun slp/require-times-tabulated-list-entries ()
  "Return tabulated list entries for displaying `slp/require-times'."
  (cl-loop for (feature start-time millis) in slp/require-times
           with order = 0
           do (cl-incf order)
           collect (list order
                         (vector
                          (format "%.3f" (slp/time-subtract-millis start-time before-init time))
                          (symbol-name feature)
                          (format "%.3f" millis)))))

(defun slp/require-times ()
  "Show a tabular view of how long various libraries took to load."
  (interactive)
  (with-current-buffer (get-buffer-create "*Require Times*")
    (slp/require-times-mode)
    (tabulated-list-revert)
    (display-buffer (current-buffer))))

(defun slp/show-init-time ()
  "Display a message showing how long Emacs took to start up."
  (message "init completed in %.2fms"
           (slp/time-subtract-millis after-init-time before-init-time)))

(add-hook 'after-init-hook 'slp/show-init-time)

(provide 'init-benchmarking)
;;; init-benchmarking.el ends here
