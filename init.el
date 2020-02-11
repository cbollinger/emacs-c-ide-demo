;; INITIALIZE PACKAGE MANAGEMENT
;;============================================================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org") t) ; Org-mode's repository

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; INSTALL PACKAGES
;;============================================================================
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
  (eval-when-compile (require 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; (unless (package-installed-p 'ox-reveal)
;;   (package-install 'ox-reveal))
;; (require 'ox-reveal)
;; (setq ox-reveal-always-ensure t)

;; (unless (package-installed-p 'org)
;;   (package-install 'org))
(require 'org)
(setq org-always-ensure t)

(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'load-path
             "~/.emacs.d/snippets/org-mode")

;; LOAD CUSTOM SETTINGS
;;============================================================================
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-general)

;; (if (version< emacs-version "24.4")
;;     (require 'setup-ivy-counsel)
;;   (require 'setup-helm)
;;   (require 'setup-helm-gtags))

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
(setq org-ditaa-jar-path "~/java/ditaa.jar")
(setq org-reveal-root "file:///home/Christian/Data/git/reveal.js")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(async-bytecomp-package-mode t)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c5ad91387427abc66af38b8d6ea74cade4e3734129cbcb0c34cc90985d06dcb3" default)))
 '(delete-selection-mode nil)
 '(fci-rule-color "#3E4451")
 '(menu-bar-mode nil)
 '(message-user-organization "Linux Private Site")
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(org-babel-results-keyword "results")
 '(org-confirm-babel-evaluate nil)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . default))))
 '(org-from-is-user-regexp "\\<Christian\\>")
 '(org-latex-compiler "xelatex")
 '(org-latex-default-packages-alist
   (quote
    (("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil))))
 '(org-latex-listings (quote minted))
 '(org-latex-pdf-process
   (quote
    ("xelatex -shell-escape -interaction nonstopmode %f" "xelatex -shell-escape -interaction nonstopmode %f")))
 '(org-plantuml-jar-path "~/java/plantuml.jar")
 '(org-preview-latex-default-process (quote luamagick))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets sr-speedbar direx dired-k diredful dired-filetype-face dired-subtree spaceline spacemacs-theme org-bullets tabbar helm-ispell auctex json-mode docker dockerfile-mode atom-dark-theme atom-one-dark-theme badwolf-theme abyss-theme afternoon-theme ahungry-theme ample-theme tramp-theme org-beautify-theme iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode undo-tree volatile-highlights ecb stickyfunc-enhance helm-gtags helm-projectile helm-swoop helm zygospore projectile company-c-headers company ox-reveal use-package)))
 '(show-paren-mode t)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(use-package-always-ensure t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "cyan4" :foreground "deep sky blue" :box nil))))
 '(org-indent ((t (:inherit org-hide :underline nil)))))
