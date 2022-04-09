;; .emacs
(package-initialize)

; Themes 
(load-theme 'afternoon t) ; afternoon-theme.el must be placed in ~/.emacs.d/

; Setup backup directory
(setq backup-directory-alist `(("." . "~/.saves")))

; Shortcuts
(progn (require 'comint)
       (define-key comint-mode-map (kbd "M-<up>") 'comint-previous-input)
       (define-key comint-mode-map (kbd "M-<down>") 'comint-next-input))

; Allow emacs to work with system copy paste
(setq x-select-enable-clipboard t)

; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 120 4)) ; Defaults tab to 4 spaces
 
; Line numbers
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode eshell-mode shell-mode term-mode ansi-term-mode) 
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")
(defun display-line-numbers--turn-on ()
  "turn on line numbers but exempting certain major modes defined in `display-line-numbers-exempt-modes'" 
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))
(global-display-line-numbers-mode)
(setq column-number-mode t)

; Set header to 80 characters
(setq-default header-line-format
              (list " " (make-string 79 ?-) "|"))

