;; Latex search path
(setq exec-path (append exec-path '("/usr/share/texmf")))

(with-eval-after-load 'tex
  (add-to-list 'safe-local-variable-values
               '(TeX-command-extra-options . "-shell-escape")))


(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(with-eval-after-load "ox-latex"
  (add-to-list 'org-latex-classes
    '("koma-article" "\\documentclass{scrartcl}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

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
    '("dg_article" "\\documentclass[draft=false,11pt,a4paper,ngerman]{scrartcl}
     \\usepackage{scrlayer}
     \\usepackage[ngerman,american]{babel}
     \\usepackage{eurosym}
     \\usepackage{xspace}
     \\usepackage{tikz}
     \\usepackage{lipsum}
     \\usepackage{enumitem}
     %% \\usepackage[usenames,dvipsnames]{xcolor}
     \\usepackage{xcolor}

     \\usepackage[left=6cm,top=4cm,right=2cm,bottom=4cm]{geometry}     %% define size
     \\usepackage[space]{grffile}                                      %% enable spaces in filenames of includegraphics
     %% \\usepackage\[protrusion=true,factor=900\]\{microtype\}

     \\usepackage{lastpage}                                            %% For getting page x of y
     \\usepackage{float}                                               %% Allows the figures to be positioned and formatted nicely
     \\floatstyle{boxed}                                                  %using this
     \\restylefloat{figure}                                               %and this command
     \\usepackage{url}                                                 %% Formatting of Urls

     %% Define Colors
     \\definecolor{DG_BLUE}{cmyk}{1,.72,0,.38}
     \\definecolor\{DG_YELLOW\}\{RGB\}\{255,200,46\}

     %% COLORFUL HEADINGS:
     \\renewcommand{\\headfont}{\\normalfont\\sffamily\\color{DG_YELLOW}}
     %% \\renewcommand{\\pnumfont}{\\normalfont\\sffamily\\color{DG_YELLOW}}  %% First Heading ?

     \\setlist\{noitemsep\}                                           %% kills the space between items
     \\makeatletter
       \\renewcommand\\section{%
         \\scr@startsection{section}%  name
         {1}%      level
         {-3cm}%    indent
         {6ex}%   beforeskip
         {.2ex}%   afterskip
         {\\color{DG_YELLOW}\\sffamily\\huge\\bfseries\\textbf}% style
       }
       \\renewcommand\\subsection{%
         \\scr@startsection{subsection}%  name
         {1}%      level
         {-3cm}%    indent
         {4ex}%   beforeskip
         {.2ex}%   afterskip
         {\\color{DG_YELLOW}\\sffamily\\Large\\bfseries\\textbf}% style
       }
       \\renewcommand\\subsubsection{%
         \\scr@startsection{subsubsection}%  name
         {1}%      level
         {-3cm}%    indent
         {2ex}%   beforeskip
         {.2ex}%   afterskip
         {\\color{DG_YELLOW}\\sffamily\\large\\bfseries\\textbf}% style
       }
   "
  ("\\section\{%s\}"       . "\\section*\{%s\}")
  ("\\subsection\{%s\}"    . "\\subsection*\{%s\}")
  ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")
  ("\\paragraph{%s}"       . "\\paragraph*{%s}")
  ("\\subparagraph{%s}"    . "\\subparagraph*{%s}"))))


(provide 'setup-latex)
