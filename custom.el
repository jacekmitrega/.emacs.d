;;; custom.el

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(blink-cursor-delay 0.3)
 '(blink-cursor-interval 0.3)
 '(column-number-mode t)
 '(global-auto-revert-mode t)
 '(indicate-empty-lines t)
 '(inhibit-startup-echo-area-message "ramirez")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(isearch-allow-scroll t)
 '(kill-do-not-save-duplicates t)
 '(lazy-highlight-initial-delay 0.125)
 '(mouse-yank-at-point t)
 '(ns-use-native-fullscreen t)
 '(save-interprogram-paste-before-kill t)
 '(scroll-preserve-screen-position 1)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(size-indication-mode t)
 '(tmm-completion-prompt nil)
 '(x-select-enable-clipboard t)
 '(x-select-enable-primary t)
 '(yank-pop-change-selection t))

(if (eq system-type 'windows-nt)
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
