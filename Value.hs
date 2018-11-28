import DtatType
import Tools
import Other_Function

--value=>value_1or3->before_value2->value2->value_1or3

type OptList=([ItemList Int String [Exp->Exp->Exp]],([(String,[Exp->Exp])]),[ItemList Int String [Exp->Exp->Exp]])
type List13=ItemList Int String [Exp->Exp->Exp]

value :: OptList->Exp->Exp
value_1or3 :: OptList->List13->[Exp]->[Exp]
value2 :: OptList->[(String,[Exp->Exp])]->[Exp]->[Exp]
value_cycle :: OptList->(OptList->List13->[Exp]->[Exp])->List13->[Exp]

value all@(list1,list2,list3) (Exp exp)=value_cycle all (value_1or3) list3 (value2  all list2 (before_value2 (value_cycle all (value_1or3) list1 exp)))
value _ x=x

value_cycle _ _ [] result =result
value_cycle all proc (now:xs) result=value_cycle all proc xs (proc all now result)

value_1or3 _ _ []=[]
value_1or3 _ _ (x:[])=(x:[])
value_1or3 _ _ (x:y:[])=(x:y:[])
value all listnow (x:(Opt opt):y:rest)
    |not (nullif opt_get)==((car opt_get) (value all x) (value all y)):(value_1or3 all listnow rest)
    |otherwise =x:(Opt opt):(value_1or3 all listnow (y:rest))
        where opt_get=get_opt listnow opt
value all listnow (x:rest)=x:(value_cycle all listnow rest)

--20182228 remain value2 get_mutil_1 trun_mutil_to_Exp before_value2
