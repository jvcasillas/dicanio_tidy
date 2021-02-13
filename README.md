Last update: 2021-02-12

1.  Convert the columns val\_F0 and val\_int into long format. Right
    now, there are 9 values across each interval (numbered 1-9) and
    create a column “Time”, numbered 1-9.

2.  After this, I make sure all Ø and “0” are NA.

3.  Then, I create a column log(F0) and read the data into R to run my R
    code to do by-speaker F0 normalization/standardization.

4.  I often need to recode the data to extract a column containing tonal
    information. I might do this by copying over the Segment column into
    a Tonal column and then deleting all non-numerical values. I kind of
    like using existing annotations to create new ones.
