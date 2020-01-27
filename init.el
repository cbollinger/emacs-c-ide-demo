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


(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


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
 '(TeX-engine (quote luatex))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(async-bytecomp-package-mode t)
 '(custom-enabled-themes (quote (atom-one-dark)))
 '(custom-safe-themes
   (quote
    ("2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "c5ad91387427abc66af38b8d6ea74cade4e3734129cbcb0c34cc90985d06dcb3" "1a1cdd9b407ceb299b73e4afd1b63d01bbf2e056ec47a9d95901f4198a0d2428" "f11e219c9d043cbd5f4b2e01713c2c24a948a98bed48828dc670bd64ae771aa1" "174502267725776b47bdd2d220f035cae2c00c818765b138fea376b2cdc15eb6" "669e02142a56f63861288cc585bee81643ded48a19e36bfdf02b66d745bcc626" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "4639288d273cbd3dc880992e6032f9c817f17c4a91f00f3872009a099f5b3f84" default)))
 '(delete-selection-mode nil)
 '(ecb-options-version "2.50")
 '(ecb-source-path (quote (("/" "/"))))
 '(ede-project-directories (quote ("/home/duagon/ionia_yocto/packages/remoteIOd")))
 '(menu-bar-mode nil)
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
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (cyberpunk-theme cyberpunk-2019-theme moe-theme espresso-theme clues-theme yasnippet-snippets yasnippet-classic-snippets atomic-chrome csv-mode csv org-ac lorem-ipsum org-bullets auctex json-mode docker dockerfile-mode atom-dark-theme atom-one-dark-theme badwolf-theme abyss-theme afternoon-theme ahungry-theme ample-theme tramp-theme org-beautify-theme iedit anzu comment-dwim-2 ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights ecb stickyfunc-enhance helm-gtags helm-projectile helm-swoop helm zygospore projectile company-c-headers company ox-reveal use-package)))
 '(split-width-threshold 160)
 '(split-window-preferred-function (quote split-window-sensibly))
 '(tool-bar-mode nil)
 '(use-package-always-ensure t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(header-line ((t (:background "medium blue" :foreground "deep sky blue"))))
 '(org-indent ((t (:inherit org-hide :underline nil)))))
