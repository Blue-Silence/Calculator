module Tools(
    headStringIf --判断输入的第一个String是否为第二个String头部
   ,headStringListIf --判断输入的第一个String是否为第二个String List中某个String的头部
   ,getStringPairInString --从第一个String头部取出存在于第二个String List的最长String，与剩余部分组成二元组返回
)where

headStringIf :: String->String->Bool
headStringIf [] _ =True
headStringIf _ [] =False
headStringIf (x:xs) (y:ys)=and [(x==y),(headStringIf xs ys)]

headStringListIf :: String->[String]->Bool
headStringListIf [] _ =True
headStringListIf _ [] =False
headStringListIf x (y:ys)=or [(headStringIf x y),(headStringListIf x ys)]

getStringPairInString :: String->[String]->(String,String)
getStringPairInString=getStringPairInString_a []

getStringPairInString_a :: String->String->[String]->(String,String)
getStringPairInString_a former [] _=(former,[])
getStringPairInString_a former (x:xs) list
    |headStringListIf (former++[x]) list=getStringPairInString_a (former++[x]) xs list
    |otherwise=(former,(x:xs))