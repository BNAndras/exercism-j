test_nuc_cnt1=: monad define
assert 0 0 0 0-:nuc_cnt''
)

test_nuc_cnt2=: monad define
assert 0 0 1 0-:nuc_cnt'G'
)

test_nuc_cnt3=: monad define
assert 0 0 7 0-:nuc_cnt'GGGGGGG'
)

test_nuc_cnt4=: monad define
assert 20 12 17 2-:nuc_cnt'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
)