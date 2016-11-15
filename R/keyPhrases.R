#' keyPhrases.buildOneDocument
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' keyPhrases.buildOneDocument()
#' @import uuid
#' @export
keyPhrases.buildOneDocument = function(lang="en", id="", text= "nice! it's perfect!"){
  if (id==""){
    id = UUIDgenerate(T)
  }

  return(sprintf('{"language": "%s","id": "%s","text": "%s"}', lang, id, text))
}


#' keyPhrases.buildQueryBody
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' keyPhrases.buildQueryBody(keyPhrases.buildOneDocument(),keyPhrases.buildOneDocument())
#' @export
keyPhrases.buildQueryBody = function(...){
  docs = list(...)
  docs$sep = ","
  sprintf('{"documents": [%s]}',do.call(paste,docs))
}


#' keyPhrases.getKeyPhrases
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' keyPhrases.getKeyPhrases("yourApiKey", list(lang="zh_cht", id="", text= "今天天氣很好"),list(lang="en", id="", text= "Very  bad hotel, room was very bad smells,  shower was very bad from now I never go to westbetern hotels."))
#' @import httr magrittr rjson
#' @export
keyPhrases.getKeyPhrases = function(apiKey, ...){
  listOfDocData = list(...)
  listOfDocDataStrings = lapply(listOfDocData,function(args){
    do.call(sentiment.buildOneDocument,args)
  })

  postBody = do.call(sentiment.buildQueryBody,listOfDocDataStrings)

  headers = add_headers('Content-Type'='application/json',
                        'Ocp-Apim-Subscription-Key' = apiKey)

  res = POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/keyPhrases",
             headers,
             body = postBody)

  resData = res %>% content()
  resData$postBody = postBody
  # resData$postBodyDf = data.frame(do.call(rbind,rjson::fromJSON(postBody)))
  return(resData)
}


