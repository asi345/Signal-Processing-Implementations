# MATLAB

- all programs run as script, no input output
- so variables does not disappear when script finishes
- comment with %
- .m extension
- make string with ''
- no type declaration
- case sensitive
- do not use as variable names
    1. i,j
    2. pi
    3. ans
    4. Inf, -Inf
    5. NaN
- to see output, add semicolon at the end of line

- exponentiation is ^
- multiplication is not implicit
- can use scalar operators on vectors to apply them to all elements of the vector
(for * and ^, use .*, ./ and .^ to do the element-wise operation)
- to do these operations element-wise between two vectors, all dimensions should match (except
  exponentiation)
- * is dot-product or outer-product
- ^ can only be done in square matrices and scalars

- INDEXING STARTS AT 1, a(n)

- not equal -> ~=
- xor -> xor
- all true -> all
- any true -> any
- 0 is false, anything not 0 is true

- if cond1
    commands
  elseif cond2
    commands
  else
    commands
  end
no parantheses

- for n=1:100
    commands
  end
the loop variable is defined as a vector and is a scalar in the command block

- while cond
    commands
  end

- can save figures as .fig, .bmp, .eps, .pdf

#  function definition
- function [out1, out2, out3] = <functionname>(in1, in2)
- function name should match the matlab file name
- it automatically return variables in the output part of the declaration
- variables created in the function but not returned are deleted after function stops running

- overloading functions are totally okay, actually the built-in functions below are also overloaded
  many times having variable input combinations
- use **varargin**, **nargin**, **varargout**, **nargout** to have variable function inputs and
  outputs

## row vector
- [1 2 3]
- [1,2,3]

## column vector
- [1;2;3]

## matrix
- [1 2;3 4]
- a = [1 2]
- b = [3 4]
- c = [5;6]
- d = [a;b]
- e = [d c]
- f = [[e e];[a b a]]

## string
- character vectors
- str = ['Hello, I am ' 'John']
- ['actual text' stringvariable] is valid

## help

## help <function>

## doc <function>

## disp
- display

## save <filename> <variable> <variable> ..
- save variables in the file <filename>.mat
- file is created in current directory

## clear <variable> <variable> ..
- delete variables from workspace
- use "all" to clear all variables

## load <filename> <variable> <variable> ..
- load variables from the file <filename>.mat

## clc
- clear window

## sqrt
## log
## log10
## cos
## atan
## exp
## round
## floor
## ceil
## angle
## abs

## transpose
- can also use a' and a.'
- a' is the hermitian transpose

## sum(<vector>)
- sum of elements of vector

## prod(<vector>)
- product of elements of vector

## ones(1, 10)
- row vector with 10 1s

## zeros(23, 1)
- column vector with 23 1s

## rand(1, 45)
- row vector with 45 uniform[0, 1]s

## nan(1, 69)
- row vector of NaNs(uninitialized variables)

## linspace(0, 10, 5)
- start at 0, end at 10, 5 values

## 0:2:10
- vector that starts with 0, increments by 2, ends at or before 10
- c = 1:5 means increment by 1

## logspace
- linspace but values are logarithmically spaced

## a(n)
- nth element of a vector

## a(n:m)
- elements between n and m in vector a(inclusive)

## a(1:end-1)
- end can be used to refer last index

## a(1, 1)
- indexing matrix
- can also use a(1), a(2) to index matrix
- in second way, a(2) means a(2, 1), so goes columns first
- to convert between them, use **ind2sub** and **sub2ind**

## rand(5)
- gives 5x5 random matrix

## a(1:3, 2:4)
- taking out submatrix

## a([1 5 3], [1 4])
- specifies the rows and columns to be selected

## a(2,:)
- takes second row of matrix

## a(:, 3)
- takes third column of matrix

## min(vec), max(vec)

## find
- find(vec == 9)
- find(vec > 2 & vec < 6)

## plot(x, y)
- x can be linspace vector
- x and y vectors must be the same size

## plot(x, y, 'k.-')
- third argument : color, marker, line-style
- plot(x, y, '.') -> plot without connecting the dots
- plot(x,y,'--s','LineWidth',2,... 'Color', [1 0 0], ...
You can set colors by using a vector of [R G B] values or a predefined color character like 'g', 'k', etc.
0.8 0.6 0.4 0.2
'MarkerEdgeColor','k',...
'MarkerFaceColor','g',...
'MarkerSize',10)

## plot3(x, y, z, 'k', 'LineWidth', 2)
- can set limits to axes by using **xlim**, **ylim** and **zlim**

## figure
- open a new figure

## subplot(2, 3, 1)
- makes a figure with 2 rows and three columns of axes, and activates the first axis for plotting
- each axis can have labels, a legend and a title
- use for multiple axes in the same figure

## subplot(2, 3, 4:6)
- activating a range of axes fuses them into one

## close([1 3])
- closes figure 1 and 3

## close all
- close all figures

## randn(size)
- size x size matrix with random normal standard variables
- if the matrix should not be square, then give 2 dimensions

## theta, r = cart2pol(real, imag)
- converts cartesian components to polar form

## abs(z)
- absolute value or complex magnitude depending on z

## angle(z)
- phase angle of complex number z

## x, y = pol2cart(theta, r)
- converts polar form to cartesian components

## mean(A)
- mean of vector A
- if A is matrix, returns a row vector containing mean for each column
- to get mean of all elements, use **mean(A, 'all')**

## std(A)
- standard deviation of vector A
- if A is matrix, returns a row vector containing std for each column
- it normalizes by N-1 by default, std(A, 0)
- to normalize by N, use std(A, 1)
- to get std of all elements, use **std(A, 0, 'all')**
