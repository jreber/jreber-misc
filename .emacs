;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "http://stable.melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;(package-refresh-contents)
(defvar my-packages '(paredit
		      projectile
		      clojure-mode
		      cider
		      ac-cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

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

; Disable start splash screen
(setq inhibit-splash-screen t)

; Goto line
(global-set-key (kbd "M-g") 'goto-line)

; Activate ido for buffer switching and other things
(require 'ido)
(ido-mode t)

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
;(paredit-mode 1)
;(add-hook 'cider-repl-mode-hook #'paredit-mode)
;;(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)

;; ac-cider
;(require 'ac-cider)
;(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;(add-hook 'cider-mode-hook 'ac-cider-setup)
;(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;(eval-after-load "auto-complete"
;  '(progn
;     (add-to-list 'ac-modes 'cider-mode)
;     (add-to-list 'ac-modes 'cider-repl-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-time-24hr-format t)
 '(display-time-day-and-date t)
 '(nrepl-sync-request-timeout 100)
 '(package-selected-packages
   (quote
    (clojure-cheatsheet clojure-mode json-reformat markdown-mode projectile paredit ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(cider-auto-test-mode 1)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
