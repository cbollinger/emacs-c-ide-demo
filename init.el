;; Initialize Package Management
(require 'package)
;; Initialize Package Management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
              '("org" . "http://orgmode.org/elpa/") t)
(setq package-check-signature nil)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; Supresses Warning 'Package cl is deprecated'
(setq byte-compile-warnings '(cl-functions))

;; Install Packages
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
  (eval-when-compile (require 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(unless (package-installed-p 'ox-reveal)
  (package-install 'ox-reveal))
(require 'ox-reveal)
(setq ox-reveal-always-ensure t)

(unless (package-installed-p 'org)
  (package-install 'org))
(require 'org)
(setq org-always-ensure t)

(unless (package-installed-p 'org-superstar)
  (package-install 'org-superstar))
(require 'org-superstar)

(unless (package-installed-p 'org-beautify-theme)
  (package-install 'org-beautify-theme))
(require 'org-beautify-theme)


;; (unless (package-installed-p 'auto-complete)
;;   (package-install 'auto-complete))
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)

(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)

(unless (package-installed-p 'company-c-headers)
  (package-install 'company-c-headers))
(require 'company-c-headers)

(unless (package-installed-p 'org-plus-contrib)
  (package-install 'org-plus-contrib))
(require 'ox-taskjuggler)

(unless (package-installed-p 'ob-ipython)
  (package-install 'ob-ipython))


;;; JavaScript
;; JavaScript: MinorMode
(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))
(require 'js2-mode)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; ;; Better imenu
;; (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; JavaScript: Refactor Package
(unless (package-installed-p 'js2-refactor)
  (package-install 'js2-refactor))
(require 'js2-refactor)
(unless (package-installed-p 'xfef-js2)
  (package-install 'xref-js2))

;; JavaScript: Jumping to function definitions
(require 'xref-js2)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; JavaScript: Debugging aid
(unless (package-installed-p 'sourcemap)
  (package-install 'sourcemap))
(require 'sourcemap)
(setq coffee-args-compile '("-c" "-m")) ;; generating sourcemap file
(add-hook 'coffee-after-compile-hook 'sourcemap-goto-corresponding-point)


;; JavaScript: Debugging Mode and REPL
(unless (package-installed-p 'indium)
  (package-install 'indium))
(require 'indium)
(add-hook 'js-mode-hook #'indium-interaction-mode)


(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-general)
(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-cedet)
;; (require 'setup-c) all in general
(require 'setup-editing)
(require 'setup-literate)
(require 'setup-latex)
(require 'setup-org)
(require 'setup-style)

;; Org Settings
(add-hook 'org-mode-hook
          (defun org-setting-enable ()
            (org-superstar-mode 1)
            (org-indent-mode 1)
            (auto-fill-mode 1)
            (setq fill-column 90)))
(load-theme 'org-beautify t)

;; Set Application Paths
(setq org-reveal-root "file:///home/Christian/Data/git/reveal.js")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(org-beautify spacemacs-dark use-package))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9685cefcb4efd32520b899a34925c476e7920725c8d1f660e7336f37d6d95764" default))
 '(delete-selection-mode nil)
 '(global-display-line-numbers-mode t)
 '(inferior-octave-startup-args '("-i" "--line-editing"))
 '(menu-bar-mode nil)
 '(org-agenda-files
   '("~/Daten/Duagon/DG_Projekte/02-D522/D522-Bombardier/05-todo/d522_bombardier.org" "~/Daten/Duagon/DG_Projekte/01-D521/D521-Generic/04-Todo/d521_generic.org" "~/Dokumente/Administration/98 Diverses/todo/my_todos.org" "~/Daten/Duagon/DG_Projekte/01-D521/D521-Alstom_PDM/05-PM/todo/d521_alstom_pdm.org" "~/Daten/learning/Digital-Signal-Processing/sp4comm/orgmode/week1/week1.org" "~/Daten/Duagon/DG_Projekte/02-D522/D522-AlstomNL/02-Support/todo/d522_alstom_NLD.org" "~/org/todo.org" "~/Daten/Duagon/DG_ORG/todo/DG_TodoList.org"))
 '(org-format-latex-options
   '(:foreground default :background default :scale 2.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(org-latex-caption-above '(table))
 '(package-selected-packages
   '(magit org company-irony irony zygospore yasnippet-snippets xref-js2 ws-butler volatile-highlights verilog-mode use-package undo-tree spacemacs-theme spaceline sourcemap ox-reveal org-superstar org-plus-contrib org-beautify-theme ob-ipython indium iedit helm-swoop helm-projectile helm-gtags helm-c-yasnippet ecb dtrt-indent direx diredful dired-subtree dired-k dired-filetype-face company-quickhelp company-c-headers comment-dwim-2 clean-aindent-mode auto-complete anzu))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant italic :weight normal :height 158 :width normal :foundry "SRC" :family "Hack"))))
 '(font-lock-comment-face ((t (:background "#292e34" :foreground "#2aa1ae" :slant italic))))
 '(org-column ((t (:background "#444155" :height 160))))
 '(org-level-1 ((t (:inherit default :extend nil :foreground "#b2b2b2" :box (:line-width 5 :color "#292b2e") :weight bold :height 1.5 :family "Sans Serif"))))
 '(org-scheduled-today ((t (:foreground "#bc6ec5" :height 160)))))
