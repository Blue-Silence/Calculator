module DataType
(   
    Exp(..)
   ,ItemList(..)
   --,OptList
   --,OptList1(..)
   --,OptList2(..)
   --,OptList_All1
   --,OptList_All2
)where
data Exp = Opt [Char] | Exp [Exp] | Num Double | Complex [Exp]
    deriving (Show,Eq)

data ItemList a b c=ItemList a [(b,c)]
--type OptList a b c=[ItemList a b c]







