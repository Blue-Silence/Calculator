module Value(
    value
)where

import DataType
import Tools


--
value :: (OptList_All1,OptList_All2)->(OptList_All1,OptList_All2)->Exp->Exp
value _ _ (Num value)=Num value
value _ _ all@(Complex _)=all
value all list@((list1:_),(list2:_)) (Exp (optexp@(Opt opt):exp:rest))
    |belong list1 opt =value all list (Exp (((getopt list1 opt) (value all all exp)):rest))
    |otherwise =value all (next list) (Exp (optexp:(value all list (Exp (exp:rest))):[]))
value all list@((list1:_),(list2:_)) (Exp (x:optexp@(Opt opt):y:rest))
    |belong list1 opt =value all list (Exp (((getopt list2 opt) (value all all x) (value all all y)):rest))
    |otherwise =value all (next list) (Exp (x:optexp:(value all list (Exp (y:rest))):[]))
























