;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; -------------------------asciidoc-------------------------------
     ;; Enable asciidoc layer for editing asciidoc content
     ;; Useful for docs.cider.mx editing
     ;; ----------------------------------------------------------------
     asciidoc

     ;; -------------------------auto-completion------------------------
     ;; Add tool tips to show doc string of functions
     ;; Show snippets in the autocompletion popup
     ;; Show suggestions by most commonly used
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t
                      ;; To have auto-completion on as soon as you start typing
                      ;; (auto-completion :variables auto-completion-idle-delay nil)
                      )

     ;; better-defaults

     ;; ------------------------------c-c++-----------------------------
     ;; 
     ;; ----------------------------------------------------------------
     c-c++

     ;; -----------------------------clojure----------------------------
     ;; Enable clj-refactor tools
     ;; ----------------------------------------------------------------
     (clojure :variables
              clojure-enable-linters 'clj-kondo
              ;; To add the sayid debugger, include the following as a variable above
              ;; clojure-enable-sayid t
              )

     ;; ----------------------------------------------------------------
     ;; Nyan cat tells you where you are in your file
     ;; ----------------------------------------------------------------
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)

     ;; ---------------------------command-log--------------------------
     ;; Show commands as you type in a separate buffer
     ;; ----------------------------------------------------------------
     command-log

     csv

     dm1

     emacs-lisp

     emoji

     erlang

     ;; -------------------------------git------------------------------
     ;; Open Magit git client full screen (quit restores previous layout)
     ;; Add github support (using magithub)
     ;; Highlight working copy changes
     ;; ----------------------------------------------------------------
     (git :variables
          ;; git-magit-status-fullscreen t
          git-enable-github-support t
          )

     ;; -----------------------------github-----------------------------
     ;; mangage GitHub repositories and Gists
     ;; ----------------------------------------------------------------
     github

     graphviz

     helm
     ;; (helm :variables
     ;;       helm-enable-auto-resize t
     ;;       helm-position 'top  ; top, bottom, left, right
     ;;       helm-use-frame-when-more-than-two-windows nil)

     html

     javascript

     markdown

     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support nil)

     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)

     python

     (ranger :variables
             ranger-show-preview t
             ranger-show-hidden t
             ranger-cleanup-eagerly t
             ranger-cleanup-on-disable t
             ranger-ignored-extensions '("mkv" "flv" "iso" "mp4")
             )

     spell-checking

     (syntax-checking :variables
                      syntax-checking-use-original-bitmaps t
                      )

     themes-megapack

     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)

     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(alect-themes ox-reveal)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)cyberpunk
   dotspacemacs-themes '(
                         ;; spacemacs-dark
                         bubbleberry
                         gotham
                         granger
                         fogus
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   git

   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq initial-frame-alist '((top . 0) (left . 0) (width . 90) (height . 52)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'cl)
  (require 'dash)
  (require 'helm-bookmark)
  (require 'org)
  (require 'org-crypt)
  (require 'ob)
  (org-sbe "~/.spacemacs.d/useful.org:code")
  ;; (setq powerline-default-separator 'wave)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Shell configuration
  ;;
  ;; Use zsh for default multi-term shell
  ;; (setq multi-term-program "/usr/bin/zsh")
  ;;
  ;; End of Shell configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Spell checking
  ;; merged into Spacemacs `develop'
  ;;
  ;; Add keybinding to correct current word under the cursor
  ;; to the existing spelling menu, `S'
  ;; (spacemacs/set-leader-keys "Ss" 'flyspell-correct-at-point)
  ;;
  ;; Or in the user-binding menu
  ;; (spacemacs/set-leader-keys "os" 'flyspell-correct-at-point)
  ;;
  ;; Documentation:
  ;; http://develop.spacemacs.org/doc/DOCUMENTATION.html#binding-keys
  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Version Control configuration - Git, etc
  ;;
  ;; diff-hl - diff hightlights in right gutter as you type
  (diff-hl-flydiff-mode)
  ;;
  ;; Load in magithub features after magit package has loaded
  ;; (use-package magithub
  ;;   :after magit
  ;;   :config (magithub-feature-autoinject t))
  ;;
  ;; Use Spacemacs as the $EDITOR (or $GIT_EDITOR) for git commits messages
  ;; when using git commit on the command line
  (global-git-commit-mode t)
  ;;
  ;; Set locations of all your Git repositories
  ;; with a number to define how many sub-directories to search
  ;; `SPC g L' - list all Git repositories in the defined paths,
  (setq magit-repository-directories
        '(("~/.emacs.d"  . 0)
          ("~/projects/" . 2)))
  ;;
  ;; end of version control configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Org-mode configuration
  ;;
  ;; I should write a toggle function to show descriptive or literate links in Org-mode
  ;;(setq org-descriptive-links nil)
  ;;
  ;; Org-reveal - define were reveal.js files can be found
  ;; (I place reveal.js files in same directory as I write the org files)
  (setq org-reveal-root "")
  ;;
  ;; Define the location of the file to hold tasks
  (with-eval-after-load 'org
    (setq org-default-notes-file "~/Dropbox/todo-list.org"))
  ;;
  ;; Define a kanban style set of stages for todo tasks
  (with-eval-after-load 'org
    (setq org-todo-keywords
         '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED"))))
  ;;
  ;; The default keywords all use the same colour.
  ;; Make the states easier to distinguish by using different colours
  ;; Using X11 colour names from: https://en.wikipedia.org/wiki/Web_colors
  ;; Setting colours (faces) using the `org-todo-keyword-faces' defcustom function
  ;; https://github.com/tkf/org-mode/blob/master/lisp/org-faces.el#L376
  ;; Using `with-eval-after-load' as a hook to call this setting when org-mode is run
  (with-eval-after-load 'org
    (setq org-todo-keyword-faces
         '(("todo" . "SlateGray")
           ("doing" . "DarkOrchid")
           ("blocked" . "Firebrick")
           ("review" . "Teal")
           ("done" . "ForestGreen")
           ("archived" .  "SlateBlue"))))
  ;;
  ;; Progress Logging
  ;; When a TODO item enters DONE, add a CLOSED: property with current date-time stamp
  (with-eval-after-load 'org
    (setq org-log-done 'time))
  ;;

  ;; customize org-mode's checkboxes with unicode symbols
  (add-hook
   'org-mode-hook
   (lambda ()
     "Beautify Org Checkbox Symbol"
     (push '("[ ]" .  "☐") prettify-symbols-alist)
     (push '("[X]" . "☑" ) prettify-symbols-alist)
     (push '("[-]" . "❍" ) prettify-symbols-alist)
     (prettify-symbols-mode)))

  ;; Markdown mode hook for orgtbl-mode minor mode
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)
  ;;
  ;; Turn on visual-line-mode for Org-mode only
  ;; (add-hook 'org-mode-hook 'turn-on-visual-line-mode)
  ;;
  ;; use org-re-reveal instead of org-reveal
  ;; (which hasnt been updated in ages and breaks org-mode 9.2)
  ;; (use-package org-re-reveal :after org)
  ;;
  ;; End of Org-mode Configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Clojure configurations
  ;;
  ;;
  ;; CIDER 0.23 Lima release options
  ;; Configure the position of evaluation result
  ;; By default the result displays at the end of the current line
  ;; Set cider-result-overlay-position to `at-point' to display results right after the expression evaluated
  ;;
  (setq cider-result-overlay-position 'at-point)
  ;;
  ;;
  ;; disable the new enhanced ClojureScript code completion
  ;; Use the ClojureScript completion from earlier versions of CIDER if enhanced cljs completion is causing issues
  ;;
  ;; (setq cider-enhanced-cljs-completion-p nil)
  ;;
  ;; End of CIDER 0.23 Lima release options
  ;;
  ;;
  ;; In clojure-mode, treat hyphenated words as a single word.
  ;; (add-hook 'clojure-mode-hook #'(lambda () (modify-syntax-entry ?- "w")))
  ;;
  ;; enable safe structural editing in evil (clojure layer - evil-cleverparens)
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hook-clojure-mode)
  ;;
  ;; Pretty print in Clojure to use the Fast Idiomatic Pretty-Printer. This is approximately 5-10x faster than clojure.core/pprint
  (setq cider-pprint-fn 'fipp)
  ;;
  ;;
  ;; Indentation of function forms
  ;; https://github.com/clojure-emacs/clojure-mode#indentation-of-function-forms
  (setq clojure-indent-style 'align-arguments)
  ;;
  ;; Vertically align s-expressions
  ;; https://github.com/clojure-emacs/clojure-mode#vertical-alignment
  (setq clojure-align-forms-automatically t)
  ;;
  ;; Auto-indent code automatically
  ;; https://emacsredux.com/blog/2016/02/07/auto-indent-your-code-with-aggressive-indent-mode/
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  ;;
  ;; Enabling CamelCase support for editing commands
  ;; https://cider.readthedocs.io/en/latest/additional_packages/#subword-mode
  ;; (add-hook 'cider-repl-mode-hook #'subword-mode)
  ;;
  ;;
  ;; Linting with clj-kondo
  ;; https://github.com/borkdude/clj-kondo/blob/master/doc/editor-integration.md#spacemacs
  ;;
  ;; Using clj-kondo by itself
  ;; (use-package clojure-mode
  ;;   :ensure t
  ;;   :config
  ;;   (require 'flycheck-clj-kondo))

  ;; Using clj-kondo with joker
  ;; (use-package clojure-mode
  ;;   :ensure t
  ;;   :config
  ;;   (require 'flycheck-joker)
  ;;   (require 'flycheck-clj-kondo)
  ;;   (dolist (checker '(clj-kondo-clj clj-kondo-cljs clj-kondo-cljc clj-kondo-edn))
  ;;     (setq flycheck-checkers (cons checker (delq checker flycheck-checkers))))
  ;;   (dolist (checkers '((clj-kondo-clj . clojure-joker)
  ;;                       (clj-kondo-cljs . clojurescript-joker)
  ;;                       (clj-kondo-cljc . clojure-joker)
  ;;                       (clj-kondo-edn . edn-joker)))
  ;;     (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers)))))



  ;; Merged into develop
  ;; (spacemacs/set-leader-keys-for-major-mode 'clojure "ei" 'cider-interrupt)

  ;; Experiment: Turn on all font locking options for Clojure
  ;; (setq cider-font-lock-dynamically t)
  ;;
  ;; configure clojurescript-jack-in to use the helper functions provided by lein-figwheel template
  ;; https://github.com/bhauman/lein-figwheel
  ;; fig-start will start figwheel and compile the clojurescript application
  ;; cljs-repl will connect emacs buffer to clojurescript repl created by figwheel
  ;;
  ;;
  ;; TODO: review this binding - CIDER takes care of this now
  ;; without this configuration, emacs command clojurescript-jack-in defaults to jvm rhino repl
  ;; if using a different clojurescript template you may require different function calls in the do expression
  ;; alternatively: set via m-x customize-variable cider-cljs-lein-repl
  ;; TODO: Is cider-cljs-lein-repl still required to be set?
  ;; Or is this just specific to those projects that have a user/fig-start and user/cljs-repl functions
  ;; (setq cider-cljs-lein-repl
  ;;      "(do
  ;;         (user/fig-start)
  ;;         (user/cljs-repl))")
  ;;
  ;; if you are not using figwheel template to configure funcitons in dev/core.clj
  ;; then use the full function calls
  ;; (setq cider-cljs-lein-repl
  ;;       "(do (require 'figwheel-sidecar.repl-api)
  ;;          (figwheel-sidecar.repl-api/start-figwheel!)
  ;;          (figwheel-sidecar.repl-api/cljs-repl))")
  ;;
  ;; TODO: review this binding - gives poor user experience
  ;; Multi-line editing in the REPL buffer
  ;; `RTN` creates a new line, `C-RTN` evaluates the code
  ;; Multi-line editing in the REPL buffer
  ;; (add-hook 'cider-repl-mode-hook
  ;;           '(lambda ()
  ;;              (define-key cider-repl-mode-map (kbd "RET") #'cider-repl-newline-and-indent)
  ;;              (define-key cider-repl-mode-map (kbd "C-<return>") #'cider-repl-return)))
  ;;
  ;; TODO: Spacemacs pull request with these keybindings, updating REPL intro text with details
  ;; You can remove this message with the <M-x cider-repl-clear-help-banner> command.
  ;; You can disable it from appearing on start by setting
  ;; ‘cider-repl-display-help-banner’ to nil.
  ;;
  ;; TODO: review this binding
  ;; repl history keybindings - not used - use s-<up> and s-<down> which are the defaults
  ;; (add-hook 'cider-repl-mode-hook
  ;;           '(lambda ()
  ;;              (define-key cider-repl-mode-map (kbd "<up>") 'cider-repl-previous-input)
  ;;              (define-key cider-repl-mode-map (kbd "<down>") 'cider-repl-next-input)))
  ;;
  ;;
  ;; hook for command-line-mode - shows keybindings & commands in separate buffer
  ;; load command-line-mode when opening a clojure file
  ;; (add-hook 'clojure-mode-hook 'command-log-mode)
  ;;
  ;; turn on command-log-mode when opening a source code or text file
  ;; (add-hook 'prog-mode-hook 'command-log-mode)
  ;; (add-hook 'text-mode-hook 'command-log-mode)
  ;;
  ;; toggle reader macro sexp comment
  ;; toggles the #_ characters at the start of an expression
  (defun clojure-toggle-reader-comment-sexp ()
    (interactive)
    (let* ((point-pos1 (point)))
      (evil-insert-line 0)
      (let* ((point-pos2 (point))
             (cmtstr "#_")
             (cmtstr-len (length cmtstr))
             (line-start (buffer-substring-no-properties point-pos2 (+ point-pos2 cmtstr-len))))
        (if (string= cmtstr line-start)
            (delete-char cmtstr-len)
          (insert cmtstr))
        (goto-char point-pos1))))
  ;;
  ;; Assign keybinding to the toggle-reader-comment-sexp function
  (define-key global-map (kbd "C-#") 'clojure-toggle-reader-comment-sexp)
  ;;
  ;; Evaluate code when it is contained in a (comment (,,,))
  ;; 24th sept - didnt work, even after updating spacemacs and packages
  ;; (setq cider-eval-toplevel-inside-comment-form t)
  ;;
  ;; (add-hook 'clojure-mode-hook
  ;;           '(setq cider-eval-toplevel-inside-comment-form t))
  ;;
  ;;
  ;; Toggle view of a clojure `(comment ,,,) block'
  ;;
  (defun clojure-hack/toggle-comment-block (arg)
    "Close all top level (comment) forms. With universal arg, open all."
    (interactive "P")
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp "^(comment\\>" nil 'noerror)
        (call-interactively
         (if arg 'evil-open-fold
           'evil-close-fold)))))

  (evil-define-key 'normal clojure-mode-map
    "zC" 'clojure-hack/toggle-comment-block
    "zO" (lambda () (interactive) (clojure-hack/toggle-comment-block 'open)))
  ;;
  ;;
  ;; Experiment: Start Clojure REPL with a specific profile
  ;; https://stackoverflow.com/questions/18304271/how-do-i-choose-switch-leiningen-profiles-with-emacs-nrepl
  ;;
  ;; (defun start-cider-repl-with-profile ()
  ;;   (interactive)
  ;;   (letrec ((profile (read-string "Enter profile name: "))
  ;;            (lein-params (concat "with-profile +" profile " repl :headless")))
  ;;     (message "lein-params set to: %s" lein-params)
  ;;     (set-variable 'cider-lein-parameters lein-params)
  ;;     (cider-jack-in)))
  ;;
  ;; My altered more idiomatic version, hopefully
  ;; - seems to be a bug...
  ;; (defun start-cider-repl-with-profile (profile)
  ;;   (interactive "sEnter profile name: ")
  ;;   (letrec ((lein-params (concat "with-profile +" profile " repl :headless")))
  ;;     (message "lein-params set to: %s" lein-params)
  ;;     (set-variable 'cider-lein-parameters lein-params)
  ;;     (cider-jack-in)))
  ;;
  ;;
  ;;
  ;; Hook for command-log-mode
  ;; shows keybindings & commands in separate buffer
  ;; Load command-log-mode when opening a clojure file
  ;; (add-hook 'clojure-mode-hook 'command-log-mode)
  ;;
  ;; Turn on command-log-mode when opening a source code or text file
  ;; (add-hook 'prog-mode-hook 'command-log-mode)
  ;; (add-hook 'text-mode-hook 'command-log-mode)
  ;;
  ;;
  ;; end of clojure configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Web-mode configuration
  ;;
  ;; Changing auto indent size for languages in html layer (web mode) to 2 (defaults to 4)
  (defun web-mode-indent-2-hook ()
    "Indent settings for languages in Web mode, markup=html, css=css, code=javascript/php/etc."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset  2)
    (setq web-mode-code-indent-offset 2))
  ;;
  (add-hook 'web-mode-hook  'web-mode-indent-2-hook)
  ;;
  ;; End of Web-mode configuration
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Eshell visual enhancements
  ;;
  ;; Add git status visual labels

  (require 'dash)
  (require 's)

  (defmacro with-face (STR &rest PROPS)
    "Return STR propertized with PROPS."
    `(propertize ,STR 'face (list ,@PROPS)))

  (defmacro esh-section (NAME ICON FORM &rest PROPS)
    "Build eshell section NAME with ICON prepended to evaled FORM with PROPS."
    `(setq ,NAME
           (lambda () (when ,FORM
                        (-> ,ICON
                            (concat esh-section-delim ,FORM)
                            (with-face ,@PROPS))))))

  (defun esh-acc (acc x)
    "Accumulator for evaluating and concatenating esh-sections."
    (--if-let (funcall x)
        (if (s-blank? acc)
            it
          (concat acc esh-sep it))
      acc))

  (defun esh-prompt-func ()
    "Build `eshell-prompt-function'"
    (concat esh-header
            (-reduce-from 'esh-acc "" eshell-funcs)
            "\n"
            eshell-prompt-string))

  (esh-section esh-dir
               "\xf07c"  ;  (faicon folder)
               (abbreviate-file-name (eshell/pwd))
               '(:foreground "gold" :bold ultra-bold :underline t))

  (esh-section esh-git
               "\xe907"  ;  (git icon)
               (magit-get-current-branch)
               '(:foreground "pink"))

  ;; (esh-section esh-python
  ;;              "\xe928"  ;  (python icon)
  ;;              pyvenv-virtual-env-name)

  (esh-section esh-clock
               "\xf017"  ;  (clock icon)
               (format-time-string "%H:%M" (current-time))
               '(:foreground "forest green"))

  ;; Below I implement a "prompt number" section
  (setq esh-prompt-num 0)
  (add-hook 'eshell-exit-hook (lambda () (setq esh-prompt-num 0)))
  (advice-add 'eshell-send-input :before
              (lambda (&rest args) (setq esh-prompt-num (incf esh-prompt-num))))

  (esh-section esh-num
               "\xf0c9"  ;  (list icon)
               (number-to-string esh-prompt-num)
               '(:foreground "brown"))

  ;; Separator between esh-sections
  (setq esh-sep "  ")  ; or " | "

  ;; Separator between an esh-section icon and form
  (setq esh-section-delim " ")

  ;; Eshell prompt header
  (setq esh-header "\n ")  ; or "\n┌─"

  ;; Eshell prompt regexp and string. Unless you are varying the prompt by eg.
  ;; your login, these can be the same.
  (setq eshell-prompt-regexp " ")   ; or "└─> "
  (setq eshell-prompt-string " ")   ; or "└─> "

  ;; Choose which eshell-funcs to enable
  ;; (setq eshell-funcs (list esh-dir esh-git esh-python esh-clock esh-num))
  (setq eshell-funcs (list esh-dir esh-git esh-clock esh-num))

  ;; Enable the new eshell prompt
  (setq eshell-prompt-function 'esh-prompt-func)

  ;; End of Eshell
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; END OF USER CONFIG
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(org-babel-load-languages
   (quote
    ((emacs-lisp . t)
     (erlang . t)
     (C . t)
     (ditaa . t)
     (dot . t)
     (java . t)
     (js . t)
     (python . t)
     (shell . t)
     (R . t))))
 '(org-babel-results-keyword "results")
 '(org-confirm-babel-evaluate nil)
 '(org-confirm-elisp-link-function nil)
 '(org-crypt-disable-auto-save (quote encrypt))
 '(org-enable-reveal-js-support t t)
 '(org-hide-emphasis-markers t)
 '(org-pretty-entities t)
 '(org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0" t)
 '(org-reveal-title-slide (quote auto))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("gnu" . "https://elpa.gnu.org/packages/")
     ("fto" . "https://firstthreeodds.org/packages/"))))
 '(package-selected-packages
   (quote
    (disaster company-c-headers cmake-mode clang-format visual-fill-column ranger yaml-mode rainbow-mode rainbow-identifiers ox-gfm magit-gh-pulls helm-company helm-c-yasnippet github-search github-clone github-browse-file git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht fuzzy flycheck-pos-tip flycheck emoji-cheat-sheet-plus diff-hl company-web web-completion-data company-tern tern company-statistics company-quickhelp pos-tip company-emoji company-anaconda company command-log-mode color-identifiers-mode clojure-snippets auto-yasnippet adoc-mode markup-faces ac-ispell auto-complete clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme afternoon-theme web-beautify test-rns livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc lv google-this first-ten-million-primes transient erlang coffee-mode bigal timp graphviz-dot-mode ox-reveal ob-erlang org-mime ghub let-alist alect-themes csv-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help mmm-mode markdown-toc markdown-mode gh-md winum org-category-capture web-mode tagedit smeargle slim-mode scss-mode sass-mode pug-mode orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download magit-gitflow less-css-mode htmlize helm-gitignore helm-css-scss haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link flyspell-correct-helm flyspell-correct evil-magit magit magit-popup git-commit with-editor emmet-mode auto-dictionary ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#CCCCCC" :background "#202020")))))
