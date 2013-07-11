% The \layout block is the place to define some global layout settings
\layout {
  % We can modify the contexts individually
  \context {
    % global score settings
    \Score
      % Remove printing of barnumbers
      \remove Bar_number_engraver
      % Prevent C style time signatures
      \numericTimeSignature
      % Prevent reminder time signatures to be printed at the end of a line
      \override TimeSignature #'break-visibility = #'#(#f #f #t)
      % Let rehearsal marks be printed as numbers with a box
      markFormatter = #format-mark-box-numbers
      % remove connecting line at system start
      % (note that we don't have to do that explicitly
      %  for the rest of the system because we define
      %  the staves as individual staves later)
      \override SystemStartBar #'stencil = ##f
  }
  \context {
    % Settings on staff level
    \DrumStaff
      % Control the behaviour of beams
      \set subdivideBeams = ##t
      \set baseMoment = #(ly:make-moment 1 16)
      % Make all stems point upwards
      \override Stem #'direction = #1
      % It is simple to use any number of stafflines
      \override StaffSymbol #'line-count = #1
      % control the spacing between the staves
      \override VerticalAxisGroup 
        #'default-staff-staff-spacing 
        #'basic-distance = #13
  }
}

