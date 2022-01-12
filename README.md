
<!-- README.md is generated from README.Rmd. Please edit that file -->

# audubon <a href='https://paithiov909.github.io/audubon'><img src='man/figures/logo.png' align="right" height="139" /></a>

<!-- badges: start -->
<!-- badges: end -->

audubon is an R package for various Japanese text processing that
contains:

-   wrapper functions of
    [hakatashi/japanese.js](https://github.com/hakatashi/japanese.js)
-   an R port of
    [SudachiCharNormalizer](https://gist.github.com/sorami/bde9d441a147e0fc2e6e5fdd83f4f770)
-   and other miscellaneous functions

## Installation

``` r
remotes::install_github("paithio909/audubon")
```

## Usage

### Fill Japanese iteration marks (踊り字)

``` r
## 5文字以上あるとき直前の文字を繰り返して踊り字を置換する
strj_fill_iter_mark(c("あいうゝ〃かき",
                      "金子みすゞ", ## 濁点付きの場合には半角の濁点を付ける
                      "のたり〳〵かな", ## 2倍の踊り字（くの字点）まで対応している
                      "しろ／″＼とした")) ## 青空文庫の記法も
#> [1] "あいううゝかき"             "金子みすすﾞ"               
#> [3] "のたり<U+3033><U+3035>かな" "しろしﾞろとした"
## 文字正規化とあわせて使う想定
strj_fill_iter_mark("いすゞエルフトラック") %>%
  strj_normalize()
#> [1] "いすずエルフトラック"
```

### Character class conversion

``` r
strj_hiraganize("あのイーハトーヴォのすきとおった風")
#> [1] "あのいーはとーヴぉのすきとおった風"
strj_katakanize("あのイーハトーヴォのすきとおった風")
#> [1] "アノイーハトーヴォノスキトオッタ風"
strj_romanize("あのイーハトーヴォのすきとおった風")
#> [1] "ano<U+012B>hat<U+014D>vonosukit<U+014D>tta"
```

### Japanese text normalization (1)

``` r
## Neologd（https://github.com/neologd/mecab-ipadic-neologd/wiki/Regexp.ja）の文字正規化
strj_normalize("――南アルプスの　天然水-　Ｓｐａｒｋｉｎｇ*　Ｌｅｍｏｎ+　レモン一絞り")
#> [1] "ー南アルプスの天然水-Sparking* Lemon+レモン一絞り"
```

### Japanese text normalization (2)

``` r
## ふつうのNFKC正規化
stringi::stri_trans_nfkc("Ⅹⅳ")
#> [1] "Xiv"
## Sudachiの文字正規化（rewrite.defによる文字置換＋NFKC正規化の部分）を移植したもの
## Sudachiのrewrite.defではローマ数字などはNFKC正規化されない
strj_rewrite_as_def("Ⅹⅳ")
#> [1] "Ⅹⅳ"
## tolowerはしない
strj_rewrite_as_def("謎のヒロインX")
#> [1] "謎のヒロインX"
## 旧字を新字体に寄せる
strj_rewrite_as_def("惡と假面のルール", read_rewrite_def(system.file("def/kyuji.def", package = "audubon")))
#> [1] "悪と仮面のルール"
```

## License

MIT license.

Icons made by [iconixar](https://www.flaticon.com/authors/iconixar) from
[www.flaticon.com](https://www.flaticon.com/).
