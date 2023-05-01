# judge-hs

ローカルで簡易的にプログラムを実行テストする。

## 使い方

`judge-hs` は `stack new abcXXX` のように初期化された stack プロジェクトのルートディレクトリで実行します。
テストのための入力データファイルは`test/case/probA/in/*.txt`、出力データファイルは `test/case/probA/out/*.txt` であることを前提とします。
このとき、対応する入力データファイル名と出力データファイル名は一致している必要があります。

```
% pwd
/home/nobsun/abcXXX
% stack build abcXXX:exe:probA
...
% judge-hs probA
hoge_00.txt: AC : 0.266370749s
hoge_01.txt: AC : 0.322416156s
```

