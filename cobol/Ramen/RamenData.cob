>> Source format free
identification division.
program-id. RamenData.
author. Daniel Marabito.

data division.
working-storage section.
01 RamenData.
       02 Nutrition.
           03 CaloriesPerServing pic 9999 value 190.
           03 CaloriesPerPackage pic 9999 value 370.
procedure division.
display "Ramen has " CaloriesPerServing " per serving, and " CaloriesPerPackage " per package.".
stop run.