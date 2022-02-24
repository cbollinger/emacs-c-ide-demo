;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 150)
(defvar efs/default-variable-font-size 150)

;; Make frame transparency overridable
(defvar efs/frame-transparency '(100 . 100))

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
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")t)
(add-to-list 'package-archives '("org-contrib" . "https://elpa.nongnu.org/nongnu/")t)
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


(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))
(require 'yasnippet)

(unless (package-installed-p 'yasnippet-snippets)
  (package-install 'yasnippet-snippets))
(require 'yasnippet-snippets)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/elpa/yasnippet-snippets-20210910.1959/snippets"
        ))
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-doome-style)
(require 'setup-lsp)
(require 'setup-general)
(require 'setup-ivy-counsel)
(require 'setup-magit-completion)
(require 'setup-editing)
(require 'setup-literate)
(require 'setup-latex)
(require 'setup-org)
(require 'setup-org-presentation)
(require 'setup-xwidget-menu)
;; (require 'setup-docker)
(require 'setup-nodejs)

(use-package elfeed
  :ensure t
  :defer t
  :commands (elfeed)
  :config
  (setq elfeed-feeds
        '(("http://nullprogram.com/feed/" program)
          ("http://herbsutter.com/feed/" cpp)
          ("http://planet.scipy.org/rss20.xml" python)
          ("https://planet.emacslife.com/atom.xml" emacs)
          ("http://planet.emacsen.org/atom.xml" emacs)
          ("https://www.srf.ch/news/bnf/rss/1646" news)
          ("https://www.srf.ch/news/bnf/rss/1890" schweiz)
          ("https://www.srf.ch/news/bnf/rss/1922" international)
          ("https://www.srf.ch/news/bnf/rss/1926" wirtschaft)
          ("https://www.srf.ch/news/bnf/rss/1646" sport)
          ))
  )


(use-package tramp
  :defer t
  :config
  (setf tramp-persistency-file-name
        (concat temporary-file-directory "tramp-" (user-login-name))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(org-superstar ox-taskjuggler zygospore yasnippet-snippets xref-js2 which-key wgrep vterm use-package undo-tree typescript-mode sourcemap sly slime rainbow-delimiters pyvenv python-mode ob-ipython no-littering lsp-ui lsp-ivy ivy-rich ivy-prescient ivy-hydra indium iedit helpful gnuplot general forge flyspell-correct-ivy flx eterm-256color eshell-git-prompt elfeed doom-themes doom-modeline dired-single dired-open dired-hide-dotfiles dap-mode counsel-projectile company-box ccls auto-package-update auto-dictionary all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doom-modeline-buffer-file ((t (:inherit (mode-line-buffer-id bold) :foreground "yellow"))))
 '(hl-line ((t (:extend t :background "dark slate gray"))))
 '(mode-line ((t (:background "navy")))))
