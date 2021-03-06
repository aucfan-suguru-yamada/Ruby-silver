# 正規表現について

# 「/」で囲むと正規表現オブジェクト
# もしくは、「%r」で始めると正規表現オブジェクト


# ===は含まれているかを評価する
/Ruby/ === "I love Ruby" # => true


# 「~=」演算子は、正規表現と文字列がマッチ（===）した場合に、文字列のインデックスを返す
/Ruby/ =~ "I love Ruby" # => 7
"I love Ruby" =~ /Ruby/ # => 7


# マッチした文字列を取り出す
# 組み込み関数「$`, $&, $'」を使う
/bb/=~"aabbcc"

p $` #=>"aa"  マッチした文字列より前の文字
p $& #=>"bb"  マッチした文字列
p $' #=>"cc"  マッチした文字列より後ろの文字


# メタ文字（繰り返し）
# *	    0回以上
# +	    1回以上
# ?	    0回か1回
# {n}	  n回
# {n,}	n回以上
# {,n}	n回以下
# {n,m}	n回以上m回以下

/a+/ === "fooa" # => false aが2回以上連続する必要がある

# メタ文字（表現）
# ^   行頭。改行を考慮する。
# $   行末。改行を考慮する。
# .   改行を除く任意の1文字。ただし、mオプションがあれば改行にもマッチ。
# \w	単語を構成する文字 [a-zA-Z0-9_]
# \W	単語を構成しない文字 [^a-zA-Z0-9_]
# \s	空白文字 [ \t\r\n\f]
# \S	空白でないような文字 [^ \t\r\n\f]
# \d	10進数の数字 [0-9]
# \D	10進数の数字でないような文字 [^0-9]
# \h	16進数の数字 [0-9a-fA-F]
# \H	16進数の数字でないような文字 [^0-9a-fA-F]
# \A  先頭の文字
# \z  末尾の文字。改行の影響なし
# \Z  末尾の文字。改行で終わっていれば改行の直前にマッチ
# |   |の左右のいずれか

# 正規表現オプション
# i  大文字と小文字の区別をしない
# o  一度だけ式展開を行う
# x  パターン中の空白と改行を無視する。# 移行を無視する
# m  正規表現記号「.」が改行にもマッチする

/ruby/ === "RUBY"   #=>false
/ruby/i === "RUBY"  #=>true
/a.*b/ === "a\nb"   #=>false
/a.*b/m ==="a\nb"   #=>true


# []文字クラスを使ったメタ文字表現
# []     []内の文字いずれか1文字にマッチする
# [^]    []内の文字以外にマッチする
# [a-z]  小文字のa~zの任意1文字にマッチ。[abcdefghijklmnopqrstuvwxyz]と同じ
# [A-Z]  大文字のA~Zの任意1文字にマッチ。[ABCDEFGHIJKLMNOPQRSTUVWXYZ]と同じ
# [0-9]  数字1桁にマッチ。[0123456789]と同じ

p /[Nn]ew/ === "New"            #=> true    Nもしくはnで始まり、ewを含む文字ならtrue
p /[Nn]ew/ === "N"              #=> false
p /[Nn]ew/ === "newaaa"         #=> true
p /New|new/ === "New"           #=> true    Newもしくはnewを含んでいる文字ならtrue
p /[Nn][e][w]/ === "Newaa"      #=> true    Nもしくはnで始まり、e,wと続く