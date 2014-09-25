##### Signed by https://keybase.io/max
```
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iQEcBAABCgAGBQJUJDTuAAoJEJgKPw0B/gTf9TQH/jcShAVgiDhOSiWwH/gJ18Du
7tgExp9RiMHdfvGN8N4ywC/5tz4ltYSm+wnvxnReBIdNjwh9bhoariIlq31NQbr7
KeQV5NQZYAB6X+KoybvYa6EULUa6jj/9xx3M3EI3hwQiwaRG3enlEAef+vk0Vjaa
P535TQagre63CNqbG0+sevB9aqp7V6/i6/UXAmLBIgGOEzGnXJ1Yuufz7ingMfKA
9ufxilNaZpZAKm5prExeDrQTAW55okkNsTk07yG1eqq/40am7QCWtbkyP2Pc62ON
GVnZBCY7vx+9iqs5cFmuoQAvKdWWnGm+YyA95amP4IV7YWLwGEs6JRBUtlBgyc0=
=L2s+
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
1219            index.iced         cdf68567a62413ab702229cd371617bbea968c2c035964bbd1bdc58eeb7fb1b8
1910            index.js           71bb64c4bad410bd3df9ca8e9533718d980b3926a03c3730b0ab2a5665d2b895
690             package.json       1c66a75d9ed31a2622edaf598cef6d3255b90dcbf4c3a44d401166ee92da7267
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