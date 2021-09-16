# 演算子について
# && || and or not
# and or notは&&,||より優先度が低い
# Rubyでは最後に評価されたオペランドが返る
# nilとfalseのみが疑となる。それ以外の全てのオブジェクトはtrueで真。
# 比較演算子では、左辺の評価のみで評価可能であれば、右辺は評価されない

# ifの条件式が疑の場合、else節がないので何も実行されず、nilが返る
if true&&true ;1 ;end #=>1
if nil&&10 ;1 ;end #=>nil
if false||true ;1 ;end #=>1
if nil||false ;1 ;end #=>nil

a = nil && 1 #=>nil  左辺を評価した時点で条件式の疑が確定するので、右辺は評価せず、評価値がnilとなる
a = 1 || 2   #=>1    左辺を評価した時点で条件式の真が確定するので、右辺は評価せず、評価値がnilとなる

b = b || 1   #bが初期化していない（nil）場合に1を格納
c ||= 1      #cが初期化していない（nil）場合に1を格納 上の略系。nilガードと呼ばれる。

p 1 && 2     #p(1&&2)と同義。2が出力される
p 1 and 2    #(p1)and2と同義。1が出力される pよりもandの優先度が低いため。
