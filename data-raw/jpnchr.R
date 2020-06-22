splt <-
  function(txt){
    strsplit(txt, split = NULL)[[1]]
  }

hira1 <-
  splt("あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん")

hira2 <-
  splt("ゔがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽぁぃぅぇぉっゃゅょ")

kata1 <-
  splt("アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン")

kata2 <-
  splt("ヴガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポァィゥェォッャュョ")

hankaku <-
  splt("ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｧｨｩｪｫｯｬｭｮ")

hiragana <- c(hira1, hira2)
katakana <- c(kata1, kata2)
hankaku

usethis::use_data(hiragana, overwrite = TRUE)
usethis::use_data(katakana, overwrite = TRUE)
usethis::use_data(hankaku, overwrite = TRUE)
