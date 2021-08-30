(require 'ox-latex)
;; Latex search path
(setq exec-path (append exec-path '("/usr/share/texmf")))

(with-eval-after-load 'tex
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))

;;Allow reference to figures e.g. [@fig:label]
(setq org-latex-prefer-user-labels t)

;; Make org aware of the tex enginge
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode %f"
        "xelatex -shell-escape -interaction nonstopmode %f"
        "xelatex -shell-escape -interaction nonstopmode %f"))

;; (setq org-latex-pdf-process
;;       '("lualatex -shell-escape -interaction nonstopmode %f"
;;         "lualatex -shell-escape -interaction nonstopmode %f"))

;; (setq org-latex-pdf-process
;;    '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;      "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


'(org-preview-latex-process-alist
  (quote
   (
    (dvipng      :programs ("lualatex" "dvipng")
                 :description "dvi > png"
                 :message "you need to install the programs: latex and dvipng."
                 :image-input-type "dvi"
                 :image-output-type "png"
                 :image-size-adjust (1.0 . 1.0)
                 :latex-compiler ("lualatex -output-format dvi -interaction nonstopmode -output-directory %o %f")
                 :image-converter ("dvipng -fg %F -bg %B -D %D -T tight -o %O %f"))

    (dvisvgm     :programs ("latex" "dvisvgm")
                 :description "dvi > svg"
                 :message "you need to install the programs: latex and dvisvgm."
                 :use-xcolor t
                 :image-input-type "xdv"
                 :image-output-type "svg"
                 :image-size-adjust (1.7 . 1.5)
                 :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                 :image-converter ("dvisvgm %f -n -b min -c %S -o %O"))

    (imagemagick :programs ("latex" "convert")
                 :description "pdf > png"
                 :message "you need to install the programs: latex and imagemagick."
                 :use-xcolor t
                 :image-input-type "pdf"
                 :image-output-type "png"
                 :image-size-adjust (1.0 . 1.0)
                 :latex-compiler ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
                 :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O")))))


(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("koma-article" "\\documentclass{scrartcl}
       "
                 ("\\section{%s}" . "\\section{%s}")
                 ("\\subsection{%s}" . "\\subsection{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection{%s}")
                 ("\\paragraph{%s}" . "\\paragraph{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph{%s}"))))


(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
               '("dg_public" "\\documentclass{duagon_public}
       "
                 ("\\section{%s}" . "\\section{%s}")
                 ("\\subsection{%s}" . "\\subsection{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection{%s}")
                 ("\\paragraph{%s}" . "\\paragraph{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph{%s}"))))

(provide 'setup-latex)
