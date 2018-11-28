import DataType
import Value
import Transfer

list2=[(ItemList 2 [("*",(xxx))]),(ItemList 1 [("+",(plus))])]
list1=[(ItemList 1 [("~",(sqt))])]
xxx (Num x) (Num y)=(Num (x*y))
sqt (Num x)=(Num (x*x))
plus (Num x) (Num y)=(Num (x+y))