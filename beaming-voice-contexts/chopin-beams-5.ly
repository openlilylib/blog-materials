\version "2.16.2"

% Don't bother looking for that, isn't publicly available yet ;-)
\include "curvesToolbox/debugCurves.ily"

\relative c' { 
  \clef treble
  \time 6/8
  \key b \major
  ais'4 gis8 gis'4.~\>\(
  gis16 fis eis dis cisis dis\! e eis\) 
    % \displayControlPoints isn't publicly available so far ...
    \displayControlPoints
    % From LilyPond 2.17.4 onwards you'd have to put the "PhrasingSlur" 
    % at the end of that line.
    \shape PhrasingSlur #'((0 . -.5)(0 . 1.5)(1 . 0.5)(0 . 0)) 
    gisis,\( ais 
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
