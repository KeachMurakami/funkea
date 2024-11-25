
`.geocoder` <- function() {
  last_execution <- Sys.time() - 11  # 初回は待機しないように11秒前に設定

  function(address) {
    # 前回の実行から10秒経過していない場合、必要な時間だけ待機
    current_time <- Sys.time()
    time_diff <- as.numeric(difftime(current_time, last_execution, units = "secs"))

    if (time_diff < 10) {
      Sys.sleep(10 - time_diff)
    }

    # URLの作成とリクエスト
    url <- paste0("https://www.geocoding.jp/api/?q=", address)
    response <- httr::GET(url)

    # XMLの解析
    doc <- xml2::read_xml(content(response, "text", encoding = "UTF-8"))

    # 緯度経度の取得
    lat <- xml2::xml_text(xml2::xml_find_first(doc, "//coordinate/lat"))
    lng <- xml2::xml_text(xml2::xml_find_first(doc, "//coordinate/lng"))

    # 実行時刻を更新
    last_execution <<- Sys.time()

    # 結果を返す
    return(c(lat = as.numeric(lat), lon = as.numeric(lon)))
  }
}
