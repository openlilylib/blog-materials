% Define a reusable variable for the pattern.
% This could also be done more generic using a Scheme function,
% but I want to keep it simple for this example.
pattern = { 
  % The manual Beams will yield warnings for the
  % half note and crotchet versions (of course)
  % but we can happily ignore them
  \mark \default
  c2[ r r c] r r r 
  c2[ r r c r r c] 
  c2[ r r c r c] r 
  c2[ r r c r c c] 
  
}
