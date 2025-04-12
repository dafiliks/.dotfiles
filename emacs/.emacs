(setq custom-file "~/.emacs.custom.el")

(add-to-list 'default-frame-alist `(font . "Iosevka-20"))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)

(use-package smex
  :ensure t
  :init
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  :config
  (smex-initialize)
  :bind (("M-x" . smex)
        ("M-X" . smex-major-mode-commands)
        ("C-c C-c M-x" . execute-extended-command)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

(defun duplicate-line-or-region()
  (interactive)
  (let (beg end (orig-point (point)) col)
    (if (use-region-p)
        (setq beg (region-beginning)
              end (region-end))
        (setq beg (line-beginning-position)
              end (line-end-position)))
    (setq col (current-column))
    (let ((text (buffer-substring beg end)))
      (goto-char end)
      (newline)
      (insert text)
      (forward-line 1)
      (move-to-column col)
      (goto-char orig-point))))

(global-set-key (kbd "C-,") 'duplicate-line-or-region)

(setq backup-directory-alist `((".*" . "~/.emacs-files/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs-files/auto-saves/" t)))

(setq default-directory "~/Documents/Programming")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq c-basic-indent 4)

(global-whitespace-mode 1)
(setq whitespace-style '(face tabs spaces newlines space-mark))

(load-file custom-file)
