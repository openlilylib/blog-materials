\version "2.16.2"

\paper {
  % Remove the indentation of the first system
  indent = 0
  % Set the number of systems to prevent line breaks in the middle of a pattern
  system-count = 5
}

% Define the pattern.
% This could also be done using a Scheme function,
% but I want to keep it simple for this example.
pattern = { 
  c2[ r r c] r r r |
  c2[ r r c r r c] |
  c2[ r r c r c] r |
  c2[ r r c r c c] 
  \break
}

\new DrumStaff \drummode {
  % Turn stems upwards (cosmetic modification)
  \stemUp
  % Define number of staff lines
  \override Staff.StaffSymbol #'line-count = #1
  % Prevent reminder time signatures to be printed at the end of the staff
  \override Staff.TimeSignature #'break-visibility = #'#(#f #t #t)
  % Remove barnumbers (optionally)
  \override Score.BarNumber #'break-visibility = #'#(#f #f #f)
  % Set initial time signature
  \time 7/2
%  \set proportionalNotationDuration = #(ly:make-moment 1 2)
  % Use the pattern
  \pattern
  % Set next time signature
  \time 7/4
%  \set proportionalNotationDuration = #(ly:make-moment 1 4)
  % Use the pattern with modified durations
  \shiftDurations #1 #0 \pattern
  \time 7/8
%  \set proportionalNotationDuration = #(ly:make-moment 1 8)
  \shiftDurations #2 #0 \pattern
  \time 7/16
%  \set proportionalNotationDuration = #(ly:make-moment 1 16)
  \shiftDurations #3 #0 \pattern
  \time 7/32
%  \set proportionalNotationDuration = #(ly:make-moment 1 32)
  \shiftDurations #4 #0 \pattern
}

%
%\score {
%  \new DrumStaff \drum
%  \layout { }
%}
