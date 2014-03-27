\version "2.18.0"

% define a LilyPond variable
bpm = 60

% define a Scheme variable
#(define schemeBpm 72)

{
  % assign a tempo literally
  \tempo 8=54
  R1

  % assign a tempo via the LilyPond variable
  \tempo 8=\bpm
  R1

  % assign a tempo via the Scheme variable
  \tempo 8=\schemeBpm
  R1
}

