;;; init.el

;;; Custom
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)


;;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
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


;;; Selection
(delete-selection-mode 1)


;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)


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
