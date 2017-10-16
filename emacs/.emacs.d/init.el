;; Set up repositories
(require 'package)
(setq-default
 load-prefer-newer t
 package-enable-at-startup-nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Dependencies
(unless (and (package-installed-p 'delight)
	     (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'delight t)
  (package-install 'use-package t))
(setq-default
 use-package-always-defer t
 use-package-always-ensure t)

;; Set up defaults
(setq-default
 ad-redefinition-action 'accept                ; Silence warnings before redefinitions
 confirm-kill-emacs 'yes-or-no-p               ; Confirm before exiting emacs
 cursor-in-non-selected-windows t              ; Hide the cursor in inactive windows
 delete-by-moving-to-trash t                   ; Delete files to trash
 display-time-default-load-average nil         ; Don't display load average
 display-time-format "%H:%M"                   ; Format the time string
 fill-column 80                                ; Set width for automatic line breaks
 help-window-select t                          ; Focus new help windows when opened
 indent-tabs-mode nil                          ; Stop using tabs to indent
 inhibit-startup-screen t                      ; Disable start-up screen
 initial-scratch-message ""                    ; Empty the initial *scratch* buffer
 left-margin-width 1                           ; Left margin
 right-margin-width 1                          ; Right margin
 mode-require-final-newline 'visit             ; Add a newline at EOF on visit
 mouse-yank-at-point t                         ; Yank at point rather than pointer
 ns-use-srgb-colorspace nil                    ; Don't use sRGB colors
 recenter-positions '(5 top bottom)            ; Set re-centering positions
 scroll-conservatively most-positive-fixnum    ; Always scroll by one line
 scroll-margin 10                              ; Add a margin when scrolling vertically
 select-enable-clipboard t                     ; Merge system's and Emacs clipboard
 sentence-and-double-space nil                 ; End a sentence after a dot and a space
 show-trailing-whitespace nil                  ; Display trailing whitespaces
 split-height-threshold nil                    ; Disable vertical window splitting
 split-width-threshold nil                     ; Disable horizontal window splitting
 tab-width 4                                   ; Set width for tabs
 uniquify-buffer-name-style 'forward           ; Uniquify buffer names
 window-combination-resize t                   ; Resize windows proportionally
 x-stretch-cursor t)                           ; Stretch cursor to the glyph width

(delete-selection-mode)                        ; Replace region when inserting text
(display-time-mode)                            ; Enable time in the mode-line
(fringe-mode 0)                                ; Hide fringes
(fset 'yes-or-no-p 'y-or-n-p)                  ; Replace yes/no prompts with y/n
(global-hl-line-mode)                          ; Hightlight current line
(global-subword-mode)                          ; Iterate through CamelCase words
(menu-bar-mode 0)                              ; Disable the menu bar
(mouse-avoidance-mode 'banish)                 ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)           ; Enable downcase-region
(put 'upcase-region 'disabled nil)             ; Enable upcase-region

(add-hook 'focus-out-hook #'garbage-collect)

(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Docker
(use-package dockerfile-mode
  :delight dockerfile-mode "Dockerfile"
  :mode "Dockerfile\\'")

;; Markdown
(use-package markdown-mode
  :delight markdown-mode "Markdown"
  :mode
  ("INSTALL\\'"
   "CONTRIBUTORS\\'"
   "LICENSE\\'"
   "README\\'"
   "\\.markdown\\'"
   "\\.md\\'")
  :config
  (unbind-key "M-<down>" markdown-mode-map)
  (unbind-key "M-<up>" markdown-mode-map)
  (setq-default
   markdown-assymetric-header t
   markdown-split-window-direction 'right))

;; Org
(use-package org
  :delight org-mode "Org")

(use-package ox-pandoc)
