;;; cal-menu.el --- calendar functions for menu bar and popup menu support

;; Copyright (C) 1994 Free Software Foundation, Inc.

;; Author: Edward M. Reingold <reingold@cs.uiuc.edu>
;;	Lara Rios <lrios@coewl.cen.uiuc.edu>
;; Keywords: calendar
;; Human-Keywords: calendar, popup menus, menu bar

;; This file is part of GNU Emacs.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY.  No author or distributor
;; accepts responsibility to anyone for the consequences of using it
;; or for whether it serves any particular purpose or works at all,
;; unless he says so in writing.  Refer to the GNU Emacs General Public
;; License for full details.

;; Everyone is granted permission to copy, modify and redistribute
;; GNU Emacs, but only under the conditions described in the
;; GNU Emacs General Public License.   A copy of this license is
;; supposed to have been given to you along with GNU Emacs so you
;; can know your rights and responsibilities.  It should be in a
;; file named COPYING.  Among other things, the copyright notice
;; and this notice must be preserved on all copies.

;;; Commentary:

;; This collection of functions implements menu bar and popup menu support for
;; calendar.el.

;; Comments, corrections, and improvements should be sent to
;;  Edward M. Reingold               Department of Computer Science
;;  (217) 333-6733                   University of Illinois at Urbana-Champaign
;;  reingold@cs.uiuc.edu             1304 West Springfield Avenue
;;                                   Urbana, Illinois 61801

;;; Code:

(define-key calendar-mode-map [down-mouse-2] 'calendar-mouse-date-menu)
  
(define-key calendar-mode-map [menu-bar moon]
  '("Moon" . calendar-phases-of-moon))

(define-key calendar-mode-map [menu-bar diary]
  (cons "Diary" (make-sparse-keymap "Diary")))

(define-key calendar-mode-map [menu-bar diary heb]
  '("Insert Hebrew" . calendar-mouse-insert-hebrew-diary-entry))
(define-key calendar-mode-map [menu-bar diary isl]
  '("Insert Islamic" . calendar-mouse-insert-islamic-diary-entry))
(define-key calendar-mode-map [menu-bar diary cyc]
  '("Insert cyclic" . insert-cyclic-diary-entry))
(define-key calendar-mode-map [menu-bar diary blk]
  '("Insert block" . insert-block-diary-entry))
(define-key calendar-mode-map [menu-bar diary ann]
  '("Insert anniversary" . insert-anniversary-diary-entry))
(define-key calendar-mode-map [menu-bar diary yr]
  '("Insert yearly" . insert-yearly-diary-entry))
(define-key calendar-mode-map [menu-bar diary mon]
  '("Insert monthly" . insert-monthly-diary-entry))
(define-key calendar-mode-map [menu-bar diary wk]
  '("Insert weekly" . insert-weekly-diary-entry))
(define-key calendar-mode-map [menu-bar diary ent]
  '("Insert daily". insert-diary-entry))
(define-key calendar-mode-map [menu-bar diary all]
  '("Show all" . show-all-diary-entries))
(define-key calendar-mode-map [menu-bar diary mark]
 '("Mark all" . mark-diary-entries))
(define-key calendar-mode-map [menu-bar diary view]
  '("Cursor date" . view-diary-entries))

(define-key calendar-mode-map [menu-bar holidays]
  (cons "Holidays" (make-sparse-keymap "Holidays")))

(define-key calendar-mode-map [menu-bar holidays unmark]
  '("Unmark" . calendar-unmark))
(define-key calendar-mode-map [menu-bar holidays mark]
  '("Mark" . mark-calendar-holidays))
(define-key calendar-mode-map [menu-bar holidays 3-mon]
  '("3 months" . list-calendar-holidays))
(define-key calendar-mode-map [menu-bar holidays 1-day]
  '("One day" . calendar-cursor-holidays))

(define-key calendar-mode-map [menu-bar goto]
  (cons "Goto" (make-sparse-keymap "Goto")))

(define-key calendar-mode-map [menu-bar goto french]
  '("French date" . calendar-goto-french-date))
(define-key calendar-mode-map [menu-bar goto mayan]
  (cons "Mayan date" (make-sparse-keymap "Mayan")))
(define-key calendar-mode-map [menu-bar goto julian]
  '("Julian date" . calendar-goto-julian-date))
(define-key calendar-mode-map [menu-bar goto islamic]
  '("Islamic date" . calendar-goto-islamic-date))
(define-key calendar-mode-map [menu-bar goto hebrew]
  '("Hebrew date" . calendar-goto-hebrew-date))
(define-key calendar-mode-map [menu-bar goto astro]
  '("Astronomical date" . calendar-goto-astro-date))
(define-key calendar-mode-map [menu-bar goto iso]
  '("ISO date" . calendar-goto-iso-date))
(define-key calendar-mode-map [menu-bar goto gregorian]
  '("Other date" . calendar-goto-date))
(define-key calendar-mode-map [menu-bar goto end-of-year]
  '("End of year" . calendar-end-of-year))
(define-key calendar-mode-map [menu-bar goto beginning-of-year]
  '("Beginning of year" . calendar-beginning-of-year))
(define-key calendar-mode-map [menu-bar goto end-of-month]
  '("End of month" . calendar-end-of-month))
(define-key calendar-mode-map [menu-bar goto beginning-of-month]
  '("Beginning of month" . calendar-beginning-of-month))
(define-key calendar-mode-map [menu-bar goto end-of-week]
  '("End of week" . calendar-end-of-week))
(define-key calendar-mode-map [menu-bar goto beginning-of-week]
  '("Beginning of week" . calendar-beginning-of-week))
(define-key calendar-mode-map [menu-bar goto today]
  '("Today" . calendar-current-month))


(define-key calendar-mode-map [menu-bar goto mayan prev-rnd]
  '("Previous Round" . calendar-previous-calendar-round-date))
(define-key calendar-mode-map [menu-bar goto mayan nxt-rnd]
  '("Next Round" . calendar-next-calendar-round-date))
(define-key calendar-mode-map [menu-bar goto mayan prev-haab]
  '("Previous Haab" . calendar-previous-haab-date))
(define-key calendar-mode-map [menu-bar goto mayan next-haab]
  '("Next Haab" . calendar-next-haab-date))
(define-key calendar-mode-map [menu-bar goto mayan prev-tzol]
  '("Previous Tzolkin" . calendar-previous-tzolkin-date))
(define-key calendar-mode-map [menu-bar goto mayan next-tzol]
  '("Next Tzolkin" . calendar-next-tzolkin-date))

(define-key calendar-mode-map [menu-bar scroll]
  (cons "Scroll" (make-sparse-keymap "Scroll")))

(define-key calendar-mode-map [menu-bar scroll bk-12]
  '("Backward 1 Year" . "4\ev"))
(define-key calendar-mode-map [menu-bar scroll bk-3]
  '("Backward 3 Months" . scroll-calendar-right-three-months))
(define-key calendar-mode-map [menu-bar scroll bk-1]
  '("Backward 1 Month" . scroll-calendar-right))
(define-key calendar-mode-map [menu-bar scroll fwd-12]
  '("Forward 1 Year" . "4\C-v"))
(define-key calendar-mode-map [menu-bar scroll fwd-3]
  '("Forward 3 Months" . scroll-calendar-left-three-months))
(define-key calendar-mode-map [menu-bar scroll fwd-1]
  '("Forward 1 Month" . scroll-calendar-left))

(put 'calendar-forward-day 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-backward-day 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-forward-week 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-backward-week 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-forward-month 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-backward-month 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-forward-year 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-backward-year 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-beginning-of-year 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-end-of-year 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-beginning-of-month 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-end-of-month 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-end-of-week 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-beginning-of-week 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-mouse-print-dates 'menu-enable '(calendar-event-to-date))
(put 'calendar-sunrise-sunset 'menu-enable '(calendar-event-to-date))
(put 'calendar-cursor-holidays 'menu-enable '(calendar-cursor-to-date))
(put 'view-diary-entries 'menu-enable '(calendar-cursor-to-date))
(put 'calendar-mouse-insert-hebrew-diary-entry
     'menu-enable
     '(calendar-cursor-to-date))
(put 'calendar-mouse-insert-islamic-diary-entry
     'menu-enable
     '(calendar-cursor-to-date))
(put 'insert-cyclic-diary-entry 'menu-enable '(calendar-cursor-to-date))
(put 'insert-block-diary-entry 'menu-enable '(calendar-cursor-to-date))
(put 'insert-anniversary-diary-entry 'menu-enable '(calendar-cursor-to-date))
(put 'insert-yearly-diary-entry 'menu-enable '(calendar-cursor-to-date))
(put 'insert-monthly-diary-entry 'menu-enable '(calendar-cursor-to-date))
(put 'insert-weekly-diary-entry 'menu-enable '(calendar-cursor-to-date))

(defun calendar-event-to-date ()
  "Date of last event. Nil if last event was not done on a date."
  (save-excursion
    (goto-char (posn-point (event-start last-input-event)))
    (calendar-cursor-to-date)))

(defun calendar-mouse-insert-hebrew-diary-entry (event)
  "Pop up menu to insert a Hebrew-date diary entry."
  (interactive "e")
  (let ((hebrew-selection
         (x-popup-menu
          event
          (list "Hebrew insert menu"
                (list (calendar-hebrew-date-string (calendar-cursor-to-date))
                      '("One time" . insert-hebrew-diary-entry)
                      '("Monthly" . insert-monthly-hebrew-diary-entry)
                      '("Yearly" . insert-yearly-hebrew-diary-entry))))))
    (and hebrew-selection (call-interactively hebrew-selection))))

(defun calendar-mouse-insert-islamic-diary-entry (event)
  "Pop up menu to insert an Islamic-date diary entry."
  (interactive "e")
  (let ((islamic-selection
         (x-popup-menu
          event
          (list "Islamic insert menu"
                (list (calendar-islamic-date-string (calendar-cursor-to-date))
                      '("One time" . insert-islamic-diary-entry)
                      '("Monthly" . insert-monthly-islamic-diary-entry)
                      '("Yearly" . insert-yearly-islamic-diary-entry))))))
    (and islamic-selection (call-interactively islamic-selection))))

(defun calendar-mouse-sunrise/sunset ()
  "Show sunrise/sunset times for mouse-selected date."
  (interactive)
  (save-excursion
    (calendar-goto-date (calendar-event-to-date))
    (calendar-sunrise-sunset)))

(defun calendar-mouse-holidays ()
  "Show holidays for mouse-selected date."
  (interactive)
  (save-excursion
    (calendar-goto-date (calendar-event-to-date))
    (calendar-cursor-holidays)))

(defun calendar-mouse-view-diary-entries ()
  "View diary entries on mouse-selected date."
  (interactive)
  (save-excursion
    (calendar-goto-date (calendar-event-to-date))
    (view-diary-entries 1)))

(defun calendar-mouse-print-dates ()
  "Pop up menu of equivalent dates to mouse selected date."
  (interactive)
  (let ((date (calendar-event-to-date)))
    (x-popup-menu
     event
     (list
      "Date Menu"
      (append
       (list
        (concat (calendar-date-string date) " (Gregorian)")
        (list (calendar-iso-date-string date))
        (list (format "ISO date: %s" (calendar-iso-date-string date)))
        (list (format "Julian date: %s" (calendar-julian-date-string date)))
        (list (format "Astronomical (Julian) date (before noon): %s"
                      (calendar-astro-date-string date)))
        (list (format "Hebrew date (before sunset): %s"
                      (calendar-hebrew-date-string date))))
       (let ((i (calendar-islamic-date-string date)))
         (if (not (string-equal i ""))
             (list (format "Islamic date (before sunset): %s" i))))
       (let ((f (calendar-french-date-string date)))
         (if (not (string-equal f ""))
             (list (format "French Revolutionary date: %s" f))))
       (list
         (format "Mayan date: %s" (calendar-mayan-date-string date))))))))

(defun calendar-mouse-date-menu (event)
  "Pop up menu for selected date."
  (interactive "e")
  (let ((selection
         (x-popup-menu
          event
          (if (calendar-event-to-date)
              (list "Menu"
                     (list
                      (calendar-date-string
                       (or (calendar-event-to-date)
                           (error "Mouse is not on a date!"))
                       t t)
                      '("Diary entries" . calendar-mouse-view-diary-entries)
                      '("Holidays" . calendar-mouse-holidays)
                      '("Mark date" . calendar-set-mark)
                      '("Sunrise/sunset" . calendar-mouse-sunrise/sunset)
                      '("Other calendars" . calendar-mouse-print-dates)))
            (list "Menu"
                   (list
                    (let ((m1 displayed-month)
                          (y1 displayed-year)
                          (m2 displayed-month)
                          (y2 displayed-year))
                      (increment-calendar-month m1 y1 -1)
                      (increment-calendar-month m2 y2 1)
                      (if (= y1 y2)
                          (format "%s--%s, %d"
                              (substring (calendar-month-name m1) 0 3)
                              (substring (calendar-month-name m2) 0 3) y2)
                        (format "%s, %d--%s, %d"
                                (substring (calendar-month-name m1) 0 3) y1
                                (substring (calendar-month-name m2) 0 3) y2)))
                     '("Scroll forward" . scroll-calendar-left-three-months)
                     '("Scroll backward" . scroll-calendar-right-three-months)
                     '("Show diary" . show-all-diary-entries)
                     '("Mark diary entries" . mark-diary-entries)
                     '("List holidays" . list-calendar-holidays)
                     '("Mark holidays" . mark-calendar-holidays)
                     '("Unmark" . calendar-unmark)
                     '("Lunar phases" . calendar-phases-of-moon)
                     '("Exit calendar" . exit-calendar)))))))
    (and selection (call-interactively selection))))

(run-hooks 'cal-menu-load-hook)

(provide 'cal-menu)

;;; cal-menu.el ends here
