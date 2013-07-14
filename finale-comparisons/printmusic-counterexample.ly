\version "2.17.6"

% source code for the counter-example in post http://lilypondblog.org/2013/06/printmusic-hmm/

up = {
  \time 4/4
  \relative f' {
    \voiceOne
    \set TabVoice.minimumFret = #7
    \set TabVoice.restrainOpenStrings = ##t
    r8. d16 \times 2/3 { e8 fis g }
    \tag #'tab
    \shape #'((0 . -2.7)(-0.6 . -2.65)(-0.2 . -1.9)(0 . -1.8)) Slur
    \grace { fis8[( g] } fis8.) e16
    \times 2/3 {
      fis8
      \tag #'staff
      \shape #'((0 . -0.2)(0 . -0.2)(0 . -0.2)(0 . -0.2)) Slur
      e( d)
    }
  }
}

lo = {
  \voiceTwo
  d,1
}

\markup { "Drop D tuning" }

\score {
  \new StaffGroup \with { instrumentName = Guitar }
  <<
    \new Staff = "guitar traditional" \with {
      \override StaffGrouper #'staff-staff-spacing #'padding = #33
    }
    <<
      \override Staff.OctavateEight #'font-shape = #'roman
      \override Staff.OctavateEight #'font-series = #'bold
      \override Staff.OctavateEight #'X-offset = #0.7
      \clef "treble_8"
      \context Voice = "upper" \removeWithTag #'tab \up
      \context Voice = "lower" \lo
    >>
    \new TabStaff = "guitar tab" \with {
      stringTunings = #guitar-drop-d-tuning
    } <<
      \context TabVoice = "upper" \removeWithTag #'staff \up
      \context TabVoice = "lower" \lo
    >>
  >>
  \layout {
    \context {
      \Score
      \override StaffGrouper.staff-staff-spacing.padding = #2.5
      \override StaffGrouper.staff-staff-spacing.basic-distance = #1
    }
  }
}
