module Tools(
    next
   ,belong
   ,getopt
)where

import DataType

next (list1,list2)=((cdr list1),(cdr list2))
car (x:y)=x
cdr (x:y)=y

belong (OptList _ x)=belongs x
getopt (OptList _ x) =get_opt x 

belongs :: [([Char],(Exp->Exp->Exp))]->String->Bool
belongs [] _=False
belongs ((name,_):rest) opt=if name==opt then True
                           else belongs rest opt

get_opt ((name,proc):rest) opt=if name==opt then proc
                               else get_opt rest opt