module Value_Main(value_Main)where
import Transfer
import Value
import DataType
value_Main :: ([ItemList Integer String (Exp->Exp->Exp)],([(String,(Exp->Exp))]),[ItemList Integer String (Exp->Exp->Exp)])->String->Exp
value_Main all str=(value all . transfer_final) str