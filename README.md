# Answer Set Programming
An ASP program (hitori.lp) that solves the puzzle for any instance. The program receive as input a set cell/3 of triples r; c; n such that the grid has number n
in row r, column c. The output of the program is a set cellblack/2 of pairs r; c such that the cell at row r, column c is eliminated.
Hitori is played in an n  n grid of cells, where each cell contains a number j E {1..n}. The objective is to remove cells (marked as black), so that the three following rules are satisfied.
1. No number appears more than once in a row or column.
2. The eliminated black cells cannot be horizontally or vertically adjacent.
3. The remaining numbered (white) cells must be connected to each other, i.e., any whitecell is reachable from another white cell by vertical or horizontal movements through
white cells.
