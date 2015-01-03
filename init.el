;;; init.el

;; Set root user-emacs-directory to the one containing this init.el file.
;; It allows emacs initialization from a custom directory with this command:
;; emacs -q -l /path/to/.emacs.d/init.el
(setq user-emacs-directory (file-name-directory load-file-name))

;;; Custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)


;;; Set visuals as early as possible to avoid momentary display.
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(load-theme 'zenburn t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'tooltip-mode) (tooltip-mode -1))
(if window-system
  (progn
    (if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
    (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
    )
  (progn
    (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
    (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
    )
  )

;; Stronger highlight of the current bar.
(set-face-attribute 'mode-line
  nil
  :foreground "gray80"
  :background "darkblue"
  :box '(:line-width 1 :style released-button))
;; (set-face-attribute 'mode-line-inactive
;;   nil
;;   :foreground "gray30"
;;   :background "gray25"
;;   :box '(:line-width 1 :style released-button))
(global-hl-line-mode 1)


;;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defun package-install-needed (packages)
  "Install needed packages unless already installed."
  (dolist
      (package packages)
    (unless (package-installed-p package)
      (package-install package)))
  )


;;; Keys
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; remap backwards delete word and char
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-h") 'delete-backward-char)
;; remap help command
(global-set-key (kbd "C-x ?") 'help-command)


;;; ido mode
(ido-mode t)
(setq ido-enable-flex-matching t)


;;; When you visit two files with the same name in different directories,
;;; the buffer names have the directory name prepended to them.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;;; When you visit a file, point goes to the last place
;;; where it was when you previously visited the same file.
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "saved-places"))


;;; Auto revert buffer.
(global-auto-revert-mode 1)


;;; Selection
(delete-selection-mode 1)


;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)


;;; Line truncating|wrapping and fill column
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)
(setq fill-column 80)


;;; Enable commands disabled by default
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


;;; Backups
;; (setq
;;    backup-by-copying t
;;    backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
;;    delete-old-versions t
;;    kept-new-versions 6
;;    kept-old-versions 2
;;    version-control t)
;; Disable backups and auto-save
(setq backup-inhibited t)
(setq auto-save-default nil)


;;; C
(setq-default c-basic-offset 4)


;;; Elpy
(package-install-needed '(elpy))
(elpy-enable)


;;; Find file in repository
(package-install-needed '(find-file-in-repository))
(global-set-key (kbd "C-x f") 'find-file-in-repository)


;;; Add vendor dir to load path
(add-to-list 'load-path (concat user-emacs-directory "vendor"))


;;; Auto-shell-command
(package-install-needed '(deferred popwin))
; (package-install-needed '(auto-shell-command))
(load "auto-shell-command.el")
(require 'auto-shell-command)


;;; Load local configuration.
(package-install-needed '(load-dir yasnippet))
(require 'load-dir)
(load-dir-one (concat user-emacs-directory "local"))
(require 'yasnippet)
(add-to-list 'yas-snippet-dirs (concat user-emacs-directory "local/snippets"))
(yas-reload-all)
