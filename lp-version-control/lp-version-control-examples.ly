\version "2.16.2"

% Examples for "LilyPond and Version Control" post

music = \relative c { \key c \major \clef bass
  c4 d e d | f2 a4. g16 f | e2. c4-| | c'1 |
  b4.( a8 g4) b-> | c2 c, | a' g4-- fis-- | g1\fermata }

\score {
  \new Staff \music
}