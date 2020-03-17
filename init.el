;; INITIALIZE PACKAGE MANAGEMENT
;;============================================================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ;; Org-mode's repository
(setq package-check-signature nil)

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

(unless (package-installed-p 'org)
  (package-install 'org))
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



;; (add-to-list 'load-path "~/.emacs.d/org-mode/lisp/" t)
;; (add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)


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

;; SET APPLICATION PATH
;;==============================================================================
(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar")
(setq org-reveal-root "file:///home/Christian/Data/git/reveal.js")

(defun node-repl () (interactive)
       (setenv "NODE_NO_READLINE" "1") ;avoid fancy terminal codes
       (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))
(node-repl)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" default)))
 '(delete-selection-mode nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(package-selected-packages
   (quote
    (psgml flow-js2-mode js2-mode nodejs-repl org-bullets org-beautify-theme dired-subtree zygospore yasnippet-snippets ws-butler volatile-highlights use-package undo-tree spacemacs-theme spaceline iedit helm-swoop helm-projectile helm-gtags dtrt-indent company comment-dwim-2 clean-aindent-mode anzu)))
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
