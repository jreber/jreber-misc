(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)



;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)



;; Themes found on https://emacsthemes.com/
;(load-theme 'material t)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(comment
 (defvar my-packages '(paredit
		       clojure-mode
		       cider
		       cider-eval-sexp-fu
		       company
		       find-file-in-project
		       magit
		       restclient
		       material-theme
		       web-mode))

 (dolist (p my-packages)
   (unless (package-installed-p p)
     (package-install p))))

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)

; Disable the tool and menu bars
(tool-bar-mode -1)
(menu-bar-mode 0)
(toggle-scroll-bar -1)
(global-hl-line-mode +1)
(global-linum-mode)

; Disable start splash screen
(setq inhibit-splash-screen t)

; Goto line
(global-set-key (kbd "M-g") 'goto-line)

; Activate ido for buffer switching and other things
(require 'ido)
(ido-mode t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq-default indent-tabs-mode nil)
(setq global-linum-mode t)
(setq projectile-project-search-path '("~/projects/" "~/work/"))
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))


; Set C-x C-b to ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq line-number-mode t)
(setq column-number-mode t)
(delete-selection-mode 1)

;; Use Shift + Arrow Key to move between multiple windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Clojure stuff
(show-paren-mode 1)
(add-hook 'clojure-mode-hook #'paredit-mode)
;(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
;(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

(comment
 (add-to-list 'company-backends 'company-restclient))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(line-number-mode nil)
 '(package-selected-packages
   (quote
    (cider-eval-sexp-fu restclient auto-complete clojure-mode web-mode json-reformat find-file-in-project company company-statistics which-key magit cider rainbow-delimiters paredit material-theme markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)
