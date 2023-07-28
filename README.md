## Prolog Pattern Match
A Definite Clause Grammar to match strings to string patterns, with `*` as a wildcard.

### Rules
A pattern is a list of printable characters. The asterisk character is a wildcard which matches one or more characters (not zero like with a glob or regex).

### Examples

    ?- % only an empty list matches an empty list
    phrase(patt(C),"").
       C = []
    ;  false.
    ?- % wildcard matches one or more characters
    phrase(patt(C),"fo").
       C = "fo"
    ;  C = "f*"
    ;  C = "*"
    ;  C = "*o"
    ;  false.
    ?- % test a pattern against a string
    phrase(patt("foo*"),"foo/bar").
       true
    ;  false.
    ?- % generate patterns to match two strings
    phrase(patt(C),"/bin/bash"), phrase(patt(C), "/bin/sh").
       C = "/bin/*"
    ;  C = "/bin/*h"
    ;  C = "/bin*"
    ;  C = "/bin*h"
    ;  C = "/bin*sh"
    ;  ...
    ;  false.

### Usage

Tested with Trealla and SWI-Prolog. Doesn't work on Scryer Prolog.

With SWI-Prolog, set the `double_quotes` flag to `chars` to make the examples work.

    ?- set_prolog_flag(double_quotes, chars).

### MIT License

Copyright (c) 2023 David Farrell

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
