#!/usr/bin/env -S guile -s
!#
(use-modules (ice-9 popen) (ice-9 format)
	     (ice-9 rdelim))

(define (run-command cmd)
  (let* ((port (open-input-pipe cmd))
	 (output (read-delimited "" port)))
    (close-pipe port)
    output))

(define (backup-dir source dest)
  (format #t "Backup de ~a a ~a...\n" source dest)
  (run-command (format #f "tar -cvzf ~a ~a" dest source)))

(backup-dir "/home/user/books/scheme" "scheme.tar.gz")
