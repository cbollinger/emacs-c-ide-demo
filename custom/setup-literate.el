(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")
(add-to-list 'exec-path "/usr/bin/magick")


;; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

;; Do not ask when evaluating source code blocks
(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;;; Highlight coloring export of source code block export
(require 'org)
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(setq org-src-fontify-natively t)

; Color (shade) source code blocks in emacs
(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 3))

(setq org-src-block-faces '(("emacs-lisp" (:background "seashell4" :foreground "yellow"))
                            ("org" (:background "seashell4" :foreground "yellow"))
                            ("C++" (:background "seashell4" :foreground "yellow"))
                            ("latex" (:background "seashell4" :foreground "yellow"))
                            ("bclogo" (:background "seashell4" :foreground "yellow"))
                            ("gnuplot" (:background "seashell4" :foreground "yellow"))
                            ("octave" (:background "seashell4" :foreground "yellow"))
                            ("sh" (:background "seashell4" :foreground "yellow"))))




; Set languages for babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)       ; this line activates ditaa
   (C . t)           ; this line activates C, C++, D
   (latex . t)       ; this line activates C, C++, D
   (octave . t)       ; this line activates C, C++, D
   (gnuplot . t)
   (plantuml . t)))  ; this line activate plantuml


;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;;                                         ; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

(provide 'setup-literate)
