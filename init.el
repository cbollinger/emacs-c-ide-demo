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
;; (unless (package-installed-p 'indium)
;;   (package-install 'indium))
;; (require 'indium)
;; (add-hook 'js-mode-hook #'indium-interaction-mode)


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
;;;; (require 'setup-spacemacs-style)
(require 'setup-xwidget-menu)
(require 'setup-docker)

;; Org Settings
(add-hook 'org-mode-hook
          (defun org-setting-enable ()
            (org-superstar-mode 1)
            (org-indent-mode 1)
            (auto-fill-mode 1)
            (setq fill-column 90)))
(load-theme 'org-beautify t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(delete-selection-mode nil)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(ffmpeg-player general wgrep prescient ivy-posframe tree-sitter-langs tree-sitter omnisharp zygospore yasnippet-snippets xwwp xref-js2 ws-butler which-key vterm volatile-highlights use-package undo-tree typescript-mode tramp-theme tramp spacemacs-theme spaceline sourcemap rainbow-delimiters python-mode ox-reveal org-tree-slide org-superstar org-plus-contrib org-beautify-theme ob-ipython no-littering lsp-ui lsp-ivy ivy-prescient indium iedit htmlize helpful helm-tramp helm-swoop helm-projectile helm-gtags helm-flyspell gnuplot forge flycheck eterm-256color eshell-git-prompt elpy dtrt-indent doom-themes doom-modeline docker-tramp direx diredful dired-subtree dired-single dired-open dired-k dired-hide-dotfiles dired-filetype-face dap-mode counsel-projectile company-irony company-c-headers company-box comment-dwim-2 clean-aindent-mode ccls auto-package-update auto-dictionary anzu all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
