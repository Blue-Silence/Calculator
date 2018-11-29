import DataType
import Value
import Transfer

list1=[(ItemList 999 [(",",(xxx))])]
list2=[("~",(sqt))]
list3=[(ItemList 2 [("*",(multi))]),(ItemList 1 [("+",(plus))])]

all=(list1,list2,list3)

multi (Num x) (Num y)=(Num (x*y))
sqt (Num x)=(Num (x*x))
plus (Num x) (Num y)=(Num (x+y))
xxx x y=(Complex [x,y])