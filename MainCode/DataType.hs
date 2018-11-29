module DataType
(   
    Exp(..)
   ,ItemList(..)
)where
data Exp = Opt [Char] | Exp [Exp] | Num Double | Complex [Exp]
    deriving (Show,Eq)

data ItemList a b c=ItemList a [(b,c)]








