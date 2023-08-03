% DCG to match strings to string patterns, e.g "foo" = "f*".

% patt//1 is the interface to the DCG.
patt([])       --> [].
patt([C|Cs])   --> char(C), patt(Cs).
patt(['*'|Cs]) --> word, chrs(Cs).

% chrs//1 prevents matching patterns of sequential wildcards like "f**".
chrs([])       --> [].
chrs([C|Cs])   --> char(C), patt(Cs).

% char//1 matches any printable character, and space.
char(C)        --> [C], { char_type(C, graph) }.
char(' ')      --> [' '].

% word//0 generates sequences of char//1.
word           --> char(_), (word | empt).
empt           --> [].
