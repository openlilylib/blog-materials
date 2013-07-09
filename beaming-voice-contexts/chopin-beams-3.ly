\version "2.16.2"

\relative c' { 
  \clef treble
  \time 6/8
  \key b \major
  ais'4 gis8 gis'4.~\>\(
  gis16 fis eis dis cisis dis\! e eis\) gisis,\( ais 
    << 
      {
        \override TupletNumber #'stencil = ##f
        \times 2/3
        {
          b16\accent[ s ais]
        }
      } 
      \new Voice
      {
        \times 2/3 {
          b16 eis, ais
        }
      }
    >>
  \stemUp gis4.\accent fis4\)
}
