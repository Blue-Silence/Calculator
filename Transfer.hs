module Transfer (
    transfer_final )where

import DataType
data Exps = Opts [Char] | Exps [Exps] | Nums Double | Begins | Ends
    deriving (Show,Eq)

transfer_final=transfeToExp . transfer

transfer :: String ->Exps
transfer x=y
    where (y,_)=(transferf [] . transferm . words) x

transferm :: [String]->[Exps]
transferm ("(":x)=Begins:(transferm x)
transferm (")":x)=Ends:(transferm x)
transferm []=[]
transferm (x:y)= let new=reads x ::[(Double,String)] 
                     get ((x,_):_)=x  in
    if new==[] then (Opts x):(transferm y)
    else (Nums (get new)):(transferm y)

transferf :: [Exps]->[Exps]->(Exps,[Exps])
transferf fromer []=((Exps fromer),[])
transferf former (Ends:rest)=((Exps former),rest)
transferf fromer (Begins:x)=transferf (fromer++[exp]) rest
                        where (exp,rest)=transferf [] x
transferf former (x:rest)=transferf (former++[x]) rest

transfeToExp :: Exps->Exp
transfeToExp (Exps (x:[]))=transfeToExp x
transfeToExp (Exps (x:xs))=Exp ((transfeToExp x):(transfeToExp (Exps xs)):[])
transfeToExp (Nums x)=(Num x)
transfeToExp (Opts x)=(Opt x)