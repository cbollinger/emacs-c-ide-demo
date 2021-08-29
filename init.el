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
