(require 'org)
(require 'color)
(require 'ob-js)
(require 'ox-latex)

(setq org-ditaa-jar-path "~/java/ditaa.jar")
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
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-src-fontify-natively t)

; Color (shade) source code blocks in emacs
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 3))

(setq org-src-block-faces '(("emacs-lisp" (:background "dark blue" :foreground "yellow"))
                            ("js"         (:background "dark blue" :foreground "yellow"))
                            ("org"        (:background "dark blue" :foreground "yellow"))
                            ("C++"        (:background "dark blue" :foreground "yellow"))
                            ("lisp"       (:background "dark blue" :foreground "yellow"))
                            ("latex"      (:background "dark blue" :foreground "yellow"))
                            ("bclogo"     (:background "dark blue" :foreground "yellow"))
                            ("gnuplot"    (:background "dark blue" :foreground "yellow"))
                            ("octave"     (:background "dark blue" :foreground "yellow"))
                            ("python"     (:background "dark blue" :foreground "yellow"))
                            ("sh"         (:background "dark blue" :foreground "yellow"))))

; Set languages for babel
(org-babel-do-load-languages 'org-babel-load-languages
  '((C       . t)    ; C, C++, D
   (js       . t)    ; JavaScript
   (ditaa    . t)    ; ditaa
   (shell    . t)    ; shell, bash
   (lisp    . t)    ; latex
   (latex    . t)    ; latex
   (octave   . t)    ; octave
   (gnuplot  . t)    ; gnuplot
   (python   . t)    ; pyhon
   (ipython  . t)    ; iron python notebook
   (plantuml . t)))  ; this line activate plantuml

(setq python-shell-interpreter "python3")
(add-to-list 'org-latex-minted-langs '(ipython "python"))  ; Use python lexer for ipython blocks

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

(provide 'setup-literate)
