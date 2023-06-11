
%Step 1
%DEFINITION Of CELLS near to each other
%Defining near cells in a column
%Two cells with different rows and same columns are near if difference between row numbers is 1 and column number remains same.
%Elements in cells are irrelevant,therefore _ placed in position of element
near(D,E,D+1,E) :- cell(D,E,_), cell(D+1,E,_).

%Defining near cells in a row
%Two cells with same rows and different columns are near if difference between column numbers is 1 and row number remains same
near(D,E,D,E+1) :- cell(D,E,_), cell(D,E+1,_).

%Defining nearness for any two random cells with row and column number D1,E1 and D2,E2
%Achieved by stating that If D1,E1 is near to D2,E2,then D2,E2 is near to D1,E1
near(D2,E2,D1,E1) :- near(D1,E1,D2,E2).

%Defining set of all possible solutions,such that every cell is either an eliminated black cell or not
%That is, either a cell is black is true or it is not black,but not both,thus reducing the possible black colored cells in the puzzle
%Step 2

1 { cellblack(D,E);-cellblack(D,E) } 1 :- cell(D,E,_).

%Step 3
%The eliminated black cells cannot be horizontally or vertically near.
% Achieved by creating a constraint,that states
%if 2 cells fall in the set of eliminated black cells,D1,E1 and D2,E2,the chance of both such cells 
%satisfyiny nearness statement is not possible and is then removed from the set of possible solutions created in Step 2
:- near(D1,E1,D2,E2), cellblack(D1,E1), cellblack(D2,E2).

%Step 3
%Removing solutions with Repetition of number in both row and column.
% Can’t have the same number twice in the same row.
%Achieved by creating a constraint that states if two cells have same row number and both cells do not fall in set of black cells 
%then it should not be the case that the column number is different ie,column number has to be same,which means if at all
%repetition of numbers  occurs in a row with cells D,E1 And D,E2 ,then E1!=E2 (different column numbers)is a possibility
% that has to be avoided.N denotes the number that appears same in the column.
:- cell(D,E1,N), cell(D,E2,N), -cellblack(D,E1), -cellblack(D,E2), E1 != E2.


% Can’t have the same number twice in the same column
%Achieved by creating a constraint that states
%if two cells have same column number and if numbers in cells are same and both cells do not fall in set of black cells then 
%it should not be the case that row numbers are different,ie ,row numbers have to be same ,which means if at all repetition 
%occurs in a column within two cells D1,E AND D2,E ,then D1!=D2 ,which is a possibility that have to be eliminated and 
%thus constraint is added.N denotes the number that appears same in the column.
:- cell(D1,E,N), cell(D2,E,N), -cellblack(D1,E), -cellblack(D2,E), D1 != D2.


%Step 4
% Defining connectivity between cells that are not eliminated
%If two cells (D1,E1) and (D2,E2) are near and they are not black eliminated cells then they are connected
%to each other.
path(D1,E1,D2,E2) :- near(D1,E1,D2,E2), -cellblack(D1,E1),-cellblack(D2,E2).

%Defining connectivity when 3 cells are considered
%if (D1,E1) is connected to (D2,E2) and (D2,E2) is connected to (D3,E3) ,then (D1,E1) is connected to (D3,E3).
path(D1,E1,D3,E3) :- path(D1,E1,D2,E2), path(D2,E2,D3,E3).

%Step 5
%All white cells have to be horizontally or vertically connected to each other.
% This can be achieved by eliminating the possibility that for any two white cells which are not connected
%to each other,then the cell numbers,then it should not be the case that they are not different,means,
%all possible solutions where any two white cells are not connected with each other is avoided,in case, it happens
%it implies they are same cells.
:- -cellblack(D1,E1), -cellblack(D2,E2), not path(D1,E1,D2,E2),(D1,E1) != (D2,E2).

%solution satisfying Step 1,2,3,4,5 is printed. 
#show cellblack/2.
