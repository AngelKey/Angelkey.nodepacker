##### Signed by https://keybase.io/max
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iQEcBAABCgAGBQJUJDs/AAoJEJgKPw0B/gTfn4gIAKljgeUYTcV6k49Q1Q0R6fH+
Y6CyY7q/hhbpxQT3Rcdk1GXwu2aFAh0P0C/ExmbSEzLYMC449szNDz5wSUh1LZ1v
ubGfVKJiwvUPLgWkPPLPbAjJCg2khhaRyC1oLyidkOFG9vW4Klvl/JBLfzOFYHeC
rv8ngUdgt43adTHRt1jc7CF3oUEG0C515WyfnYcsTPwt60uZyoqczUviqxjkAVBQ
zeTiYcYKrilS0LLIqY04tiPG4IZFqG+jC2xIF0ZVXh7Rvb55xOtT/XyJgUi8rdT6
jPZtHETKjTTbFrJM/q53YwOC8j2TgOPtfL7iQgyP4pn9+szJ866QJT0azecml8U=
=z/Qw
-----END PGP SIGNATURE-----

```

<!-- END SIGNATURES -->

### Begin signed statement 

#### Expect

```
size    exec  file                 contents                                                        
              ./                                                                                   
587             .gitignore         abcbd5929ba2d059647bd4c6c99a74df2676bfbaaf44535e4713b53fbd14e6a8
1486            LICENSE            0133d99e5f3794ab32c1bb0dd378ffaae765a74137c66d49196f36186d1506a0
244             Makefile           7d397680c94d1b5ec2436610beb8dd4f27586306210920e31981449157824fd1
1242            index.iced         b19da7e3c2a78cf4318093e998154606beda4a21958c943ce137cba6f83f4754
1941            index.js           21e8459754fba13396f401d9884aab1dbd2240c33ffe2b39dce0b83fe106b1b6
690             package.json       4125faf8c67feb887d5cf09ecd9eb35df19d185f6476bdd29191ef7abe11c417
                test/                                                                              
                  files/                                                                           
111305              0_simple.iced  5385574a97f864f986169e1e60837ac640d627ef8264c73605c8d69856f559ff
183               run.iced         822568debeae702ca4d1f3026896d78b2d426e960d77cb3c374da059ef09f9fd
```

#### Ignore

```
/SIGNED.md
```

#### Presets

```
git      # ignore .git and anything as described by .gitignore files
dropbox  # ignore .dropbox-cache and other Dropbox-related files    
kb       # ignore anything as described by .kbignore files          
```

<!-- summarize version = 0.0.9 -->

### End signed statement

<hr>

#### Notes

With keybase you can sign any directory's contents, whether it's a git repo,
source code distribution, or a personal documents folder. It aims to replace the drudgery of:

  1. comparing a zipped file to a detached statement
  2. downloading a public key
  3. confirming it is in fact the author's by reviewing public statements they've made, using it

All in one simple command:

```bash
keybase dir verify
```

There are lots of options, including assertions for automating your checks.

For more info, check out https://keybase.io/docs/command_line/code_signing