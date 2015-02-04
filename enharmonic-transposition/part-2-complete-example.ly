\version "2.16.2"

\paper {
  indent = 0
  system-count = 1
}

beginning = \relative c'' { 
  \key as \major
  \time 3/2
  \autoBeamOff
  c c8 c es4. as,8 as4 bes |
  c2 
}

middlesection = \relative gis' {
  \stopStaff s1 |
  \startStaff
  \key e \major
  gis1 fis4 gis |
  a1
}
  
end = {
  \stopStaff s1 |
  \startStaff
  \beginning
}
  
% Uncomment to apply enharmonic transposition
%middlesection = \transpose e fes \middlesection

music = {
  \beginning
  \middlesection
  \end
}

% Leave one of the following lines uncommented
%music = \transpose as g \music
music = \transpose as ges \music

\score {
  \new Staff \music
  \layout {}
}