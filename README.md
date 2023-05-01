# judge-hs

ローカルで簡易的に Haskell で書いたプログラムを実行テストする。

## 使い方

```
% stack build abcXXX:exe:probA
...
% judge-hs probA
hoge_00.txt: AC : 0.266370749s
hoge_01.txt: AC : 0.322416156s
```
テストのための入力データファイルは`test/case/probA/in/*.txt`、出力データファイルは `test/case/probA/out/*.txt` であることを前提とします（入力データファイル名と出力データファイル名は一致することを前提とします）。

