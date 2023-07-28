% DCG to match strings to string patterns, e.g "foo" = "f*".

% patt//1 is the interface to the DCG. It matches an empty string or a string
% pattern.
patt([])       --> [].
patt([C|Cs])   --> char(C), patt(Cs).
patt(['*'|Cs]) --> word, chrs(Cs).

% chrs//1 prevents matching patterns of sequential wildcards like "f**".
chrs([])       --> [].
chrs([C|Cs])   --> char(C), patt(Cs).

% char//1 matches any printable character.
char(C)        --> [C], { char_type(C, graph) }.
char(' ')      --> [' '].

% word//0 is a terminal which generates sequences of printable characters.
word           --> char(_), (word | empt).
empt           --> [].
