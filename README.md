
<!-- README.md is generated from README.Rmd. Please edit that file -->

# audubon

<!-- badges: start -->
<!-- badges: end -->

> [ローマ字とひらがなを変換するやつ](https://github.com/yumetodo/romaji_kana_cvt_rust)

## Comparisons

### To Roman

``` r
zipangu::str_conv_romanhira("でゅららら", "roman")
#> [1] "de~yurarara"
audubon::invert_to_roman("でゅららら")
#>  でゅららら 
#> "dhurarara"
zipangu::str_conv_romanhira("ゑぐざゐる", "roman")
#> [1] "weguzawiru"
audubon::invert_to_roman("ゑぐざゐる")
#>     ゑぐざゐる 
#> "wyeguzawyiru"
zipangu::str_conv_romanhira("じぇんつーぺんぎん", "roman")
#> [1] "jents<U+016B>pengin"
audubon::invert_to_roman("じぇんつーぺんぎん")
#> じぇんつーぺんぎん 
#>                 NA
zipangu::str_conv_romanhira("じぇんつうぺんぎん", "roman")
#> [1] "jentsuupengin"
audubon::invert_to_roman("じぇんつうぺんぎん")
#> じぇんつうぺんぎん 
#> "zyenntuupennginn"
```

### To Hiragana

``` r
zipangu::str_conv_romanhira("dhurarara", "hiragana")
#> [1] "でへぅららら"
audubon::invert_to_kana("dhurarara")
#>    dhurarara 
#> "でゅららら"
zipangu::str_conv_romanhira("weguzawyiru", "hiragana")
#> [1] "ゑぐざういる"
audubon::invert_to_kana("weguzawyiru")
#>    weguzawyiru 
#> "うぇぐざゐる"
zipangu::str_conv_romanhira("jent'upengin", "hiragana")
#> [1] "じぇんてうぺんぎん"
audubon::invert_to_kana("jent'upengin")
#>         jent'upengin 
#> "じぇんとぅぺんぎん"
```

### Limitations

-   カタカナや「ー」など、マップできない文字があると`NA_character`になる
-   おそらくWindowsではデフォルトエンコーディングの影響で戻り値に「ゔ」が含まれると上手く変換されない

## License

BLS-1.0
