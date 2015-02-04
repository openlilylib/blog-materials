music = \relative as {
  \key as \major
  % music 1 
  \key e \major
  % music 2
  \key as \major
  % music 3
}

% becomes

beginning = \relative as {
  \key as \major
  % music 1
}
middlesection = {
  \key e \major
  % music 2
}
end = \relative as {
  \key as \major
  % music 3
}

music = {
  \beginning
  \middlesection
  \end
}

\score {
  \new Staff \transpose as g \music
  \layout {}
}