;;; polovtsian-dances.el ---              -*- lexical-binding: t; -*-

;; Copyright (C) 2015  supermomonga

;; Author: supermomonga
;; Keywords: convenience
;; Created: 2015-12-24
;; Version: 0.0.1
;; Package-Requires: ((emacs "24"))
;; URL: https://github.com/supermomonga/polovtsian-dances.el

;; The MIT License (MIT)
;;
;; Copyright (c) 2015 supermomonga
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.

;;; Commentary:

;; Половецкая пляска с хором


;;; Code:
(require 'cl-lib)

(defun polovtsian-dances ()
  (interactive)
  (let* ((orig-buf (current-buffer))
        (mo-buf (get-buffer-create "*Polovtsian Dances*"))
        (mo-image-path (concat (file-name-directory (buffer-file-name))
                               "mo.png"))
        (mo-image (create-image mo-image-path))
        (horizontal-spaces (/ (- (frame-pixel-width) (car (image-size mo-image t)))
                              (frame-char-width)
                              2))
        (vertical-spaces (/ (- (frame-pixel-height) (cdr (image-size mo-image t)))
                              (frame-char-height)
                              2)))
    (switch-to-buffer mo-buf)
    (delete-other-windows)
    (dotimes (count 100)
      (erase-buffer)
      (dotimes (_ (- vertical-spaces 2))
        (newline))
      (if (eq (% count 3) 0)
          (newline))
      (dotimes (_ horizontal-spaces)
        (insert " "))
      (if (eq (% count 2) 0)
          (insert "  "))
      (insert-image mo-image)

      (unless (eq (% count 3) 0)
          (newline))
      (newline)
      (newline)
      (insert "Polovtsian Dances")
      (setq-local fill-column (/ (frame-pixel-width) (frame-char-width)))
      (center-line)
      (sit-for 0.05))
    ))

(provide 'polovtsian-dances)
