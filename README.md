# study_asm
18/Dec/2019 -- 08/03/2020

gitpod
 brew install <PackageName>.

The art
1. Data representations
- bit (1), nibble(4), byte(8), word(16), double words(32)
- hexadecimal numeric systems, mapping table
- radix 10, 2, 16: begin with decimal, end with (h, b, [t |d])
- signed & unsigned nb, two complements
    + inverted 
    + add 1
  == NEG (negote), CHS
- bit logicals: AND, OR (inclusive OR), XOR (exclusive 1 1 = 0), NOT
- sign and zero extension
- shifts (left-right), arithmetic shift right and rotation left-right
  --> why no need arithmetic left?
- bit fields and packed data (space efficient but inefficient).
- ASCII code (bit 5, 6), carriage return-line feed, windows(CRLF), OSX (CR), UNIX(LF).

2. Boolean Algebre