import DataType

list1=[(ItemList 999 [(",",(xxx))])]
list2=[("sqt",(sqt))]
list3=[(ItemList 2 [("*",(multi))]),(ItemList 1 [("+",(plus))])]

all=(list1,list2,list3) --valueMain输入列表样例

multi (Num x) (Num y)=(Num (x*y))
sqt (Num x)=(Num (x*x))
plus (Num x) (Num y)=(Num (x+y))

xxx :: Exp->Exp->Exp
xxx (Complex x) (Complex y)=Complex (x++y)
xxx (Num x) (Complex y)=Complex ((Num x):y)
xxx (Num x) (Num y)=Complex [(Num x),(Num y)]
