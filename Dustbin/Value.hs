module Value(
    value
)where

import DataType
import Tools


--
value :: (OptList a [Char] (Exp->Exp),OptList a [Char] (Exp->Exp->Exp))->(OptList a [Char] (Exp->Exp),OptList a [Char] (Exp->Exp->Exp))->Exp->Exp

value _ _ (Num value)=Num value
value _ _ all@(Complex _)=all
value all list@((list1:_),(list2:_)) (Exp (optexp@(Opt opt):exp:rest))
    |not (nullif optlist) =value all list (Exp (((car optlist) (value all all exp)):rest))
    |otherwise =value all (next list) (Exp (optexp:(value all list (Exp (exp:rest))):[]))
        where optlist=(get_opt list1 opt)            
value all list@((list1:_),(list2:_)) (Exp (x:optexp@(Opt opt):y:rest))
    |not (nullif optlist) =value all list (Exp (((car optlist) (value all all x) (value all all y)):rest))
    |otherwise =value all (next list) (Exp (x:optexp:(value all list (Exp (y:rest))):[]))
        where optlist=(get_opt list2 opt)
              