\version "2.16.2"


\include "building-blocks-paper.ily"

\include "building-blocks-patterns.ily"

\include "building-blocks-collate-patterns.ily"

\include "building-blocks-numbers.ily"


% Define common ("global") elements
global = {
  % By default the stems would go down (-> mimick the model)
  \stemUp  
  % Define the time signature
%  \time 7/2
  % Make the beams divided
  
}

% Prepare the five versions of the pattern
I =  {
  % _use_ the global elements
  \global
  % For the first version simply _use_ the pattern
  \music
}

II =  {
  \global
  % Display a different time signature
  \set DrumStaff.timeSignatureFraction = 7/4
  % Change the half notes to crotchets
  \shiftDurations #1 #0
  % make them use double space
  \scaleDurations 2/1
  % use the modified pattern
  \music
}

III =  {
  \global
  \set DrumStaff.timeSignatureFraction = 7/8
  \shiftDurations #2 #0
  \scaleDurations 4/1
  \music
}

IV =  {
  \global
  \set DrumStaff.timeSignatureFraction = 7/16
  \shiftDurations #3 #0
  \scaleDurations 8/1
  \music
}

V =  {
  \global
  \set DrumStaff.timeSignatureFraction = 7/32
  \scaleDurations 16/1
  \shiftDurations #4 #0
  \music
}

% Override some layout parameters
\layout {
  % We can override for different contexts individually
  \context {
    \Score
    % remove connecting line at system start
    % (note that we don't have to do that explicitly
    %  for the rest of the system because we define
    %  the staves as individual staves later)
    \override SystemStartBar #'stencil = ##f
    % Let rehearsal marks be printed as numbers with a box
    markFormatter = #format-mark-box-numbers
  }
  \context {
    \DrumStaff
      % It is simple to use any number of stafflines
      \override StaffSymbol #'line-count = #1
  }
}

% Define our score structure
\score {
  % Several layers in parallel
  <<
    % Five DrumStaff instances with their corresponding patterns
    \new DrumStaff \drummode { 
      \override Beam.stencil = ##f
      \I }
    \new DrumStaff \drummode { 
      \override Beam.stencil = ##f
      \II }
    \new DrumStaff \drummode { \III }
    \new DrumStaff \drummode { \IV }
    \new DrumStaff \drummode { \V }
    % One  additional context without staff for the numbers
    \new Dynamics \numbers
  >>
  % This actually triggers creating a print layout
  \layout { }
}
