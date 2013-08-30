\version "2.16.2"

% Examples for "LilyPond and Version Control" post

music = \relative c { 
  \key c \major 
  \clef bass
  c4 d e d | % 110
  f2 a4. g16 f | % 111
  e2. c4-| | c'1 | % 112
  b4.( a8 g4) b-> | % 113
  c2 c, | % 114
  a' g4-.-- fis-.-- | %115
  g1\fermata %116
}

\score {
  \new Staff \music
}