NB. define rebase_conj as a conjunction:
NB.   u is the output base
NB.   v is the input base
NB. It produces a verb that takes the digits and return the results
NB. for invalid inputs as defined in the exercise it will not output an error or empty
NB. but follows the rule for `#.`:
NB.   for (`input_base=2` and `digits= 1 2 3`)
NB.   => #. 1 2 3
NB.   => (1 * 2^2) + (2 * 2^1) + (2 * 2^0) 
NB.   => 11


rebase=: monad define
  'input_base digits output_base'=. y                            NB. splits inputs and assing to its proper name
  
  valid_bases  =. input_base *.&(2&<:) output_base
  valid_digits =. input_base *./@:(0&<:@:] , >) digits

  if. (valid_bases *. valid_digits) do.                   
    output_base {{ [: u&#.^:_1 v&#. }} input_base digits         NB. if all inputs are valid converts the digits    
  else.
    0$0                                                          NB. else returns `0$0` (empty)
  end. 
)
