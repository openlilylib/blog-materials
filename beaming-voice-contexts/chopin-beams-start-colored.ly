\version "2.16.2"

#(define (override-color-for-all-grobs color)
  (lambda (context)
   (let loop ((x all-grob-descriptions))
    (if (not (null? x))
     (let ((grob-name (caar x)))
      (ly:context-pushpop-property context grob-name 'color color)
      (loop (cdr x)))))))


\relative c' { 
  \clef treble
  \time 6/8
  \key b \major
  ais'4 gis8 
  << 
    { \applyContext #(override-color-for-all-grobs (x11-color 'blue))
      gis'4.~\(
      gis16 fis eis dis cisis dis e eis\) gisis,\( ais 
      \override TupletNumber #'stencil = ##f
      \times 2/3
      {
        b16\accent[ s ais]
      }
      \stemDown gis4. fis4\) fis16 eis
    } 
    \\ 
    {
      gis'4.\>
      gis16 fis eis dis cisis dis\! e eis gisis, ais \times 2/3 {
        b16 eis, ais
      }
      \stemUp gis4.\accent fis4
    }
  >>
}
