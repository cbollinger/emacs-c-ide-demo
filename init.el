;; Initialize Package Management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
	     '("org" . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(setq package-check-signature nil)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

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

(unless (package-installed-p 'company-c-headers)
  (package-install 'company-c-headers))
(require 'company-c-headers)

(unless (package-installed-p 'org-plus-contrib)
   (package-install 'org-plus-contrib))
(require 'ox-taskjuggler)

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
(require 'setup-cedet)
(require 'setup-c)
(require 'setup-editing)
(require 'setup-literate)
(require 'setup-latex)
(require 'setup-org)
(require 'setup-style)

;; Org Settings
(add-hook 'org-mode-hook
          (defun org-setting-enable ()
            (org-bullets-mode 1)
            (org-indent-mode 1)
            (auto-fill-mode 1)
            (setq fill-column 90)))

;; Set Application Paths
(setq org-reveal-root "file:///home/Christian/Data/git/reveal.js")
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(column-number-mode t)
;;  '(delete-selection-mode nil)
;;  '(menu-bar-mode nil)
;;  '(message-user-organization "Linux Private Site" t)
;;  '(org-agenda-files
;;    (quote
;;     ("~/Data/Duagon/DG_Projekte/Produktionalisierung/ionia_Production/MoM/mom_productionalisation.org" "~/org/todo.org" "~/org/reference.org")))
;;  '(org-agenda-loop-over-headlines-in-active-region nil)
;;  '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled) t)
;;  '(org-agenda-skip-scheduled-if-deadline-is-shown t t)
;;  '(org-agenda-sorting-strategy
;;    (quote
;;     ((agenda deadline-up priority-down)
;;      (todo priority-down category-keep)
;;      (tags priority-down category-keep)
;;      (search category-keep))) t)
;;  '(org-agenda-span (quote fortnight) t)
;;  '(org-agenda-tags-todo-honor-ignore-options t t)
;;  '(org-agenda-todo-ignore-deadlines (quote all) t)
;;  '(org-agenda-todo-ignore-scheduled (quote all) t)
;;  '(org-agenda-window-setup (quote current-window) t)
;;  '(org-babel-results-keyword "results")
;;  '(org-confirm-babel-evaluate nil)
;;  '(org-deadline-warning-days 7)
;;  '(org-ditaa-jar-path "~/java/ditaa.jar")
;;  '(org-fast-tag-selection-single-key (quote expert))
;;  '(org-latex-listings (quote minted))
;;  '(org-latex-pdf-process
;;    (quote
;;     ("xelatex -shell-escape -interaction nonstopmode %f" "xelatex -shell-escape -interaction nonstopmode %f")))
;;  '(org-latex-prefer-user-labels t)
;;  '(org-link-from-user-regexp "\\<Christian\\>")
;;  '(org-plantuml-jar-path "~/java/plantuml.jar")
;;  '(org-preview-latex-default-process (quote luasvg))
;;  '(org-priority-default 65)
;;  '(org-todo-keywords
;;    (quote
;;     ((sequence "TODO(t)" "ONGOING(g)" "REQUEST(n)" "|" "DONE(d)")
;;      (sequence "WAITING(w@/!)" "PAUSED(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
;;  '(package-selected-packages
;;    (quote
;;     (org-plus-contrib ox-taskjuggler iso-transl ob-ipython mu4e-overview json-mode sourcemap xref-js2 js2-mode indium zygospore yasnippet-snippets ws-butler volatile-highlights use-package undo-tree spacemacs-theme spaceline psgml ox-reveal org-bullets org-beautify-theme nodejs-repl md4rd iedit helm-swoop helm-projectile helm-gtags ggtags flow-js2-mode dtrt-indent direx diredful dired-subtree dired-k dired-filetype-face csv-mode csv company-c-headers comment-dwim-2 clean-aindent-mode anzu)))
;;  '(show-paren-mode t)
;;  '(spacemacs-theme-org-height nil)
;;  '(tool-bar-mode nil))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-agenda-column-dateline ((t (:inherit nil))))
;;  '(org-level-1 ((t (:foreground "#4f97d7" :weight normal :height 1.3))))
;;  '(org-level-2 ((t (:foreground "#2d9574" :weight normal :height 1.3))))
;;  '(org-level-3 ((t (:foreground "#67b11d" :weight normal :height 1.3))))
;;  '(org-level-4 ((t (:foreground "#b1951d" :height 1.3))))
;;  '(org-level-5 ((t (:foreground "#4f97d7" :weight normal :height 1.3))))
;;  '(org-level-6 ((t (:foreground "#2d9574" :weight normal :height 1.3))))
;;  '(org-level-7 ((t (:foreground "#67b11d"))))
;;  '(org-level-8 ((t (:foreground "#b1951d")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (zygospore yasnippet-snippets xref-js2 ws-butler volatile-highlights use-package undo-tree spacemacs-theme spaceline sourcemap psgml ox-reveal org-plus-contrib org-bullets org-beautify-theme ob-ipython nodejs-repl md4rd json-mode indium iedit helm-swoop helm-projectile helm-gtags ggtags flow-js2-mode dtrt-indent direx diredful dired-subtree dired-k dired-filetype-face csv-mode csv company-c-headers comment-dwim-2 clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
