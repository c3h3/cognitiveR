#' sentiment.buildOneDocument
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' sentiment.buildOneDocument()
#' @import uuid
#' @export
sentiment.buildOneDocument = function(lang="en", id="", text= "nice!"){
  if (id==""){
    id = UUIDgenerate(T)
  }

  return(sprintf('{"language": "%s","id": "%s","text": "%s"}', lang, id, text))
}


#' sentiment.buildQueryBody
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' sentiment.buildQueryBody(sentiment.buildOneDocument(),sentiment.buildOneDocument())
#' @export
sentiment.buildQueryBody = function(...){
  docs = list(...)
  docs$sep = ","
  sprintf('{"documents": [%s]}',do.call(paste,docs))
}

#' sentiment.getScores
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' sentiment.getScores("yourApiKey", list(lang="en", id="", text= "nice!"),list(lang="en", id="", text= "nice!"),list(lang="en", id="", text= "nice!"))
#' @import httr magrittr rjson
#' @export
sentiment.getScores = function(apiKey, ...){
  listOfDocData = list(...)
  listOfDocDataStrings = lapply(listOfDocData,function(args){
    do.call(sentiment.buildOneDocument,args)
  })

  postBody = do.call(sentiment.buildQueryBody,listOfDocDataStrings)

  headers = add_headers('Content-Type'='application/json',
                        'Ocp-Apim-Subscription-Key' = apiKey)

  res = POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
             headers,
             body = postBody)

  resData = res %>% content()
  resData$postBody = postBody
  # resData$postBodyDf = data.frame(do.call(rbind,rjson::fromJSON(postBody)))
  return(resData)
}


