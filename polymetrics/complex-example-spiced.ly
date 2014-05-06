\version "2.19.4"

\paper {
  indent = 0
}

\layout {
  \context {
    \Score
    \remove "Timing_translator"
    \remove "Default_bar_line_engraver"
    \override TupletNumber.text = #tuplet-number::calc-fraction-text
  }
  \context {
    \Staff
    \consists "Timing_translator"
    \consists "Default_bar_line_engraver"
  }
}


\relative c' <<
  \new Staff {
    \time 4/20
    \tupletSpan 4*4/5
    \tuplet 5/4 {
      \repeat unfold 2 { f16[ e d c] }
    }
    <<
      {
        \voiceOne
        \tupletSpan 4*8/5
        \tuplet 3/2 {
          \scaleDurations 4/5 {
            f4 g a8 b
          }
        }

        \time 3/4
        \tupletSpan 4*3
        \tuplet 7/6 {
          ais8 b c cis d e es
        }
        \time 1/5
        \tuplet 5/4 {
          d4
        }
        \time 1/4
        c4
      }
      \new Voice {
        \voiceTwo
        \tuplet 5/4 {
          \repeat unfold 2 { f,16[ e d c] }
        }
        \tuplet 3/2 {
          fis2 g \tuplet 7/4 {
            gis8[ fis f e es d des]
          }
        } \tuplet 5/4 c4
      }
    >>
  }
  \new Staff {
    \time 4/4
    c4 c c c |
    c4 c c c |
  }
  \new Staff {
    \compoundMeter #'(4 3 2 12)
    <<
      {
        \voiceOne
        \tupletSpan 4*3
        \tuplet 9/6 {
          f8 f g g a \tuplet 3/2 { gis fis16 gis a8 } b c
          c4 c
          c8 d16 e fis8
          g4
        } |
        \compoundMeter #'((2 7) (3 14))
        \tuplet 7/8 {
          a16 c c c 
        }
        \tuplet 7/8 {
          b a g
        }
      }
      \new Voice {
        \voiceTwo
        f,4 g8 f
        \tuplet 7/5 {
          e4 d c d e d c
        }
        f4
      }
    >>
  }
>>