\version "2.16.2"

\relative c' { 
  \clef treble
  \time 6/8
  \key b \major
  ais'4 gis8 gis'4.~\>\(
  gis16 fis eis dis cisis dis\! e eis\) gisis,\( ais 
    << 
      {
        \voiceTwo
        \times 2/3 {
          b16 eis, ais
        }
      } 
      \new Voice
      {
        \voiceOne
        \override TupletNumber #'stencil = ##f
        \times 2/3
        {
          b16\accent[ s ais]
        }
      }
    >>
  \oneVoice gis4.\accent fis4\)
}
