;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 180)
(defvar efs/default-variable-font-size 180)

;; Make frame transparency overridable
(defvar efs/frame-transparency '(90 . 90))

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'efs/display-startup-time)


;; Initialize Package Management
(require 'package)
;; Initialize Package Management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

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

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

(use-package general
:config
(general-evil-setup t)

(general-create-definer dw/leader-key-def
                        :keymaps '(normal insert visual emacs)
                        :prefix "SPC"
                        :global-prefix "C-SPC")

(general-create-definer dw/ctrl-c-keys
                        :prefix "C-c"))

;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))


(unless (package-installed-p 'ox-reveal)
  (package-install 'ox-reveal))
(require 'ox-reveal)
(setq ox-reveal-always-ensure t)
(setq org-reveal-root "file:/home/christian/Daten/reveal.js/")
(setq Org-Reveal-title-slide nil)


(unless (package-installed-p 'flyspell-correct-ivy)
  (package-install 'flyspell-correct-ivy))

(use-package flyspell-correct-ivy
  :bind ("C-M-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

;; Turn on auto dictionnary checker
(unless (package-installed-p 'auto-dictionary)
  (package-install 'auto-dictionary))
(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))

;; (unless (package-installed-p 'auto-complete)
;;   (package-install 'auto-complete))
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)

;; (unless (package-installed-p 'company)
;;   (package-install 'company))
;; (require 'company)

;; (unless (package-installed-p 'company-c-headers)
;;   (package-install 'company-c-headers))
;; (require 'company-c-headers)

(unless (package-installed-p 'org-plus-contrib)
  (package-install 'org-plus-contrib))
(require 'ox-taskjuggler)

(unless (package-installed-p 'ob-ipython)
  (package-install 'ob-ipython))


(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-doome-style)
(require 'setup-lsp)
(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-completion)
;; (require 'setup-helm)
;; (require 'setup-helm-gtags)
;; (require 'setup-ggtags)
;; (require 'setup-cedet)
;; (require 'setup-c) all in general
(require 'setup-editing)
(require 'setup-literate)
(require 'setup-latex)
(require 'setup-org)
(require 'setup-org-presentation)
;;;; (require 'setup-spacemacs-style)
(require 'setup-xwidget-menu)
(require 'setup-docker)
(require 'setup-nodejs)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#292D3E" "#ff5370" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(custom-safe-themes
   '("846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(delete-selection-mode nil)
 '(doom-modeline-enable-word-count t)
 '(doom-modeline-lsp nil)
 '(doom-modeline-major-mode-color-icon nil)
 '(exwm-floating-border-color "#232635")
 '(fci-rule-color "#676E95")
 '(highlight-tail-colors ((("#383f45") . 0) (("#323e51") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f2b" "#c792ea"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f2b" "#c3e88d"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f2b" "#676E95"))
 '(objed-cursor-color "#ff5370")
 '(org-agenda-files nil)
 '(org-startup-folded 'fold)
 '(package-selected-packages
   '(org-present org-tree-slides ffmpeg-player general wgrep prescient ivy-posframe tree-sitter-langs tree-sitter omnisharp zygospore yasnippet-snippets xwwp xref-js2 ws-butler which-key vterm volatile-highlights use-package undo-tree typescript-mode tramp-theme tramp spacemacs-theme spaceline sourcemap rainbow-delimiters python-mode ox-reveal org-tree-slide org-superstar org-plus-contrib org-beautify-theme ob-ipython no-littering lsp-ui lsp-ivy ivy-prescient indium iedit htmlize helpful helm-tramp helm-swoop helm-projectile helm-gtags helm-flyspell gnuplot forge flycheck eterm-256color eshell-git-prompt elpy dtrt-indent doom-themes doom-modeline docker-tramp direx diredful dired-subtree dired-single dired-open dired-k dired-hide-dotfiles dired-filetype-face dap-mode counsel-projectile company-irony company-c-headers company-box comment-dwim-2 clean-aindent-mode ccls auto-package-update auto-dictionary anzu all-the-icons-dired))
 '(pdf-view-midnight-colors (cons "#EEFFFF" "#292D3E"))
 '(rustic-ansi-faces
   ["#292D3E" "#ff5370" "#c3e88d" "#ffcb6b" "#82aaff" "#c792ea" "#89DDFF" "#EEFFFF"])
 '(vc-annotate-background "#292D3E")
 '(vc-annotate-color-map
   (list
    (cons 20 "#c3e88d")
    (cons 40 "#d7de81")
    (cons 60 "#ebd476")
    (cons 80 "#ffcb6b")
    (cons 100 "#fcb66b")
    (cons 120 "#f9a16b")
    (cons 140 "#f78c6c")
    (cons 160 "#e78e96")
    (cons 180 "#d690c0")
    (cons 200 "#c792ea")
    (cons 220 "#d97dc1")
    (cons 240 "#ec6898")
    (cons 260 "#ff5370")
    (cons 280 "#d95979")
    (cons 300 "#b36082")
    (cons 320 "#8d678b")
    (cons 340 "#676E95")
    (cons 360 "#676E95")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-column ((t (:background "lavender" :strike-through nil :underline nil :slant normal :weight normal :height 181 :family "Fira Code"))))
 '(org-column-title ((t (:underline t :weight bold :height 181))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch) :foreground "orange" :underline nil)))))
