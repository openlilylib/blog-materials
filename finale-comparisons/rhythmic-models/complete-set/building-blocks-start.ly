\version "2.16.2"


% include paper layout
% uncomment the version we want to use
\include "building-blocks-a4.ily"
%\include "building-blocks-beamer.ily"

% include global layout definitions
\include "layout.ily"


%{ function to 
   - print the exercise number
   - print the virtual time signature
   - insert a line break
%}
newExercise = 
#(define-music-function (parser location numerator) (number?)
    #{
      \break
      \mark \default
      % denominator is set within \patterns as a function of the current layer
      \set DrumStaff.timeSignatureFraction = #(cons numerator denominator) #})


% include the actual (generated) musical content
\include "building-blocks-patterns.ily"

% not implemented yet
\include "building-blocks-numbers.ily"


% Prepare the five versions of the pattern
I =  {
  % Use the \patterns function and pass the denominator as argument
  \patterns 2
}

II =  {
  % Change the half notes to crotchets
  \shiftDurations #1 #0
  % make them use double space
  \scaleDurations 2/1
  % use the modified pattern with "4" as denominator
  \patterns 4
}

III =  {
  \shiftDurations #2 #0
  \scaleDurations 4/1
  \patterns 8
}

IV =  {
  \shiftDurations #3 #0
  \scaleDurations 8/1
  \patterns 16
}

V =  {
  \scaleDurations 16/1
  \shiftDurations #4 #0
  \patterns 32
}


% Define our score structure
\score {
  % Several layers in parallel
  <<
    % Five DrumStaff instances with their corresponding patterns
    \new DrumStaff \drummode { 
      % Remove any beams for the halfnote and crotchet layers
      \override Beam.stencil = ##f
      \I }
    \new DrumStaff \drummode { 
      \override Beam.stencil = ##f
      \II }
    \new DrumStaff \drummode { \III }
    \new DrumStaff \drummode { \IV }
    \new DrumStaff \drummode { \V }
    % One  additional context without staff for the numbers
    %\new Dynamics \numbers
  >>
  % This actually triggers creating a print layout
  \layout {}
}
