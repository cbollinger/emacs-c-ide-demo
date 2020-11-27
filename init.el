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
 '(delete-selection-mode nil)
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(company-irony irony zygospore yasnippet-snippets yasnippet-classic-snippets xref-js2 ws-butler volatile-highlights verilog-mode use-package undo-tree spacemacs-theme spaceline sourcemap ox-reveal org-superstar org-plus-contrib org-beautify-theme ob-ipython indium iedit helm-swoop helm-projectile helm-gtags helm-c-yasnippet ecb dtrt-indent direx diredful dired-subtree dired-k dired-filetype-face company-quickhelp company-c-headers comment-dwim-2 clean-aindent-mode auto-complete anzu))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant italic :weight normal :height 158 :width normal))))
 '(font-lock-comment-face ((t (:background "#292e34" :foreground "#2aa1ae" :slant italic)))))
