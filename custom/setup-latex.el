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
        "xelatex -shell-escape -interaction nonstopmode %f")) ;; for multiple passes

;; (setq org-latex-pdf-process
;;       '("lualatex -shell-escape -interaction nonstopmode %f"
;;         "lualatex -shell-escape -interaction nonstopmode %f"))

;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


;; PDF Preview with luamagick
(setq luamagick '(luamagick :programs ("lualatex" "convert")
                            :description "pdf > png"
                            :message "you need to install lualatex and imagemagick."
                            :use-xcolor t
                            :image-input-type "pdf"
                            :image-output-type "png"
                            :image-size-adjust (1.0 . 1.0)
                            :latex-compiler ("lualatex -interaction nonstopmode -output-directory %o %f")
                            :image-converter ("convert -density %D -trim -antialias %f -quality 100 %O")))

(add-to-list 'org-preview-latex-process-alist luamagick)
(setq org-preview-latex-default-process 'luamagick)


(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
    '("koma-article" "\\documentclass{scrartcl}"
      ("\\section{%s}" . "\\section{%s}")
      ("\\subsection{%s}" . "\\subsection{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph{%s}"))))


(with-eval-after-load "ox-latex"
(add-to-list 'org-latex-classes
  '("artikel" "\\documentclass{article}
       \\usepackage{xcolor}
       \\definecolor{myblue}{cmyk}{1,.72,0,.38}
       \\makeatletter
       \\renewcommand\\section{%
         \\@startsection{section}%  name
         {1}%      level
         {0mm}%    indent
         {.2ex}%   beforeskip
         {.2ex}%   afterskip
         {\\color{myblue}\\sffamily\\huge\\bfseries\\textbf}% style
       }
       \\renewcommand\\subsection{%
         \\@startsection{subsection}%  name
         {2}% level
         {0em}% indent
         {-1ex plus 0.1ex minus -0.05ex}% beforeskip
         {-1em plus 0.2em}% afterskip
         {\\scshape}% style
     }
    "
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}")
   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
   ("\\paragraph{%s}" . "\\paragraph*{%s}")
   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


(with-eval-after-load "ox-latex"
(add-to-list 'org-latex-classes
    '("dg_article" "\\documentclass[draft=false,9pt,a4paper,ngerman]{scrartcl}
     \\usepackage{scrlayer}
     \\usepackage[ngerman]{babel}
     \\usepackage{fontspec}
     \\usepackage{eurosym}
     \\usepackage{xspace}
     \\usepackage{lipsum}
     \\usepackage{enumitem}
     \\usepackage[table]{xcolor}
     \\usepackage[yyyymmdd]{datetime}
     \\usepackage{tikz}
     \\usepackage[left=65mm,top=40mm,right=25mm,bottom=40mm]{geometry}     %% define size
     \\usepackage{lastpage}                                            %% For getting page x of y
     \\usepackage{float}                                               %% Allows the figures to be positioned and formatted nicely
     \\floatstyle{boxed}                                                  %using this
     \\restylefloat{figure}                                               %and this command
     \\usepackage{url}                                                 %% Formatting of Urls

     \\usepackage{titlesec}                                           %% Forredefining paragraph
     \\setcounter{secnumdepth}{4}                                         %% set section number counter to 4


     %% Define Colors
     \\definecolor\{DG_BLUE\}\{cmyk\}\{1,.72,0,.38\}
     \\definecolor\{DG_YELLOW\}\{RGB\}\{255,200,46\}
     \\definecolor\{black1\}\{\RGB\}\{22,20,19\}
     \\definecolor\{bluePantone281C\}\{RGB\}\{0,38,99\}
     \\definecolor\{Pantone123C}{RGB}{255,200,46}
     \\definecolor\{n1}{RGB}{183,212,233}
     \\definecolor\{n3}{RGB}{113,112,100}
     \\definecolor\{n4}{RGB}{191,182,159}
     \\definecolor\{grau10}{RGB}{230,230,230}
     \\definecolor\{grau30}{RGB}{179,179,179}
     \\definecolor\{blau5}{RGB}{230,230,255}

     %%Date
     \\renewcommand{\\dateseparator}{-}

     %% COLORFUL HEADINGS:
     \\renewcommand{\\headfont}{\\normalfont\\sffamily\\color{Pantone123C}}
     %% \\renewcommand{\\pnumfont}{\\normalfont\\sffamily\\color{Pantone123C}}  %% First Heading ?

     %% \\setlist\{noitemsep\}                                           %% kills the space between items
     \\setmainfont{Myriad Pro}                                        %% Set duagon font
     \\setsansfont{Museo}                                        %% Set duagon font

     \\makeatletter
       \\renewcommand\\section{%
         \\scr@startsection{section}%  name
         {1}%      level
         {-32mm}%    indent
         {6ex}%   beforeskip
         {6ex}%   afterskip
         {\\color{Pantone123C}\\sffamily\\Huge\\bfseries\\textbf}% style
       }
       \\renewcommand\\subsection{%
         \\scr@startsection{subsection}%  name
         {1}%      level
         {-32mm}%    indent
         {4ex}%   beforeskip
         {6ex}%   afterskip
         {\\color{Pantone123C}\\sffamily\\huge\\bfseries\\textbf}% style
       }
       \\renewcommand\\subsubsection{%
         \\scr@startsection{subsubsection}%  name
         {1}%      level
         {-32mm}%    indent
         {2ex}%   beforeskip
         {2ex}%   afterskip
         {\\color{Pantone123C}\\sffamily\\Large\\bfseries\\textbf}% style
       }

       %% Tables
       \\newcolumntype{L}[1]{>{\\raggedright\\let\\newline\\\\arraybackslash\\hspace{0pt}}p{#1}}
       \\newcolumntype{C}[1]{>{\\centering\\let\\newline\\\\arraybackslash\\hspace{0pt}}p{#1}}

       \\newcolumntype{$}{>{\\global\\let\\currentrowstyle\\relax}}
       \\newcolumntype{^}{>{\\currentrowstyle}}
       \\newcommand{\\rowstyle}[1]{\\gdef\\currentrowstyle{#1}%
         #1\\ignorespaces
       }
       \\newcolumntype{x}[1]{>{\\centering\\arraybackslash\\hspace{0pt}}m{#1}}

       \\setlength{\\arrayrulewidth}{1pt}
       \\arrayrulecolor{n4}

       \\renewcommand{\\arraystretch}{1.4}

       \\setlength{\\tabcolsep}{0.1cm} % set left and right margin in tables as fraction of cm (not pt), so it is easier to align tables
   "
  ("\\section\{%s\}"       . "\\section*\{%s\}")
  ("\\subsection\{%s\}"    . "\\subsection*\{%s\}")
  ("\\subsubsection*\{%s\}" . "\\subsubsection*\{%s\}")
  ("\\paragraph{%s}"       . "\\paragraph*{%s}")
  ("\\subparagraph{%s}"    . "\\subparagraph*{%s}"))))


(provide 'setup-latex)
