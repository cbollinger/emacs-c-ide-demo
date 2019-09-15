;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (require 'package)
;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org") t) ; Org-mode's repository

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
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

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
  ;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-c)
(require 'setup-editing)
(require 'setup-literate)
(require 'setup-latex)

(use-package org-beautify-theme :init)

;; Load Reveal
(setq org-reveal-root "file:///home/Christian/Data/git/reveal.js")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" default)))
 '(delete-selection-mode nil)
 '(package-selected-packages
   (quote
    (org-beautify-theme iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights ecb stickyfunc-enhance helm-gtags helm-projectile helm-swoop helm zygospore projectile company-c-headers company ox-reveal use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
