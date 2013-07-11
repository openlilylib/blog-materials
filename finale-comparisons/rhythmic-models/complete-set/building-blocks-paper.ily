
% Set the global layout parameters.
% (For this example we don't actually need them)
\paper {
  % Remove the default indentation of the first system
  indent = 0
  max-systems-per-page = 3
  min-systems-per-page = 3
  ragged-last-bottom = ##f
}

\layout {
  \context {
    \Score
      \remove Bar_number_engraver
      \numericTimeSignature
  }
  \context {
    \DrumStaff
      \set subdivideBeams = ##t
      \set baseMoment = #(ly:make-moment 1 16)
      \override VerticalAxisGroup 
        #'default-staff-staff-spacing 
        #'basic-distance = #13
  }
}