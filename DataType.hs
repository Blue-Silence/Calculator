module DataType
(   
    Exp(..)
   ,OptList1(..)
   ,OptList2(..)
   ,OptList_All1
   ,OptList_All2
)where
data Exp = Opt [Char] | Exp [Exp] | Num Double | Complex [Exp]
    deriving (Show,Eq)
data OptList1 = OptList1 Int [([Char],(Exp->Exp))]
data OptList2 = OptList2 Int [([Char],(Exp->Exp->Exp))]
type OptList_All1=[OptList1]
type OptList_All2=[OptList2]