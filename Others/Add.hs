module Add(add)where

import DataType    
add :: OptList_All->(Int,([Char],(Double->Double->Double)))->OptList_All
add z@(x@(OptList lev list):rest) y@(level,item)
    |lev==level=((OptList lev (item:list)):rest)
    |lev>level=x:(add rest y)
    |lev<level=(OptList level [item]):z
add [] (level,item)= [(OptList level [item])]