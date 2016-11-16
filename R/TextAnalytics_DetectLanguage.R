#' detectLanguage.buildOneDocument
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' detectLanguage.buildOneDocument()
#' @import uuid
#' @export
detectLanguage.buildOneDocument = function(id="", text= "nice!"){
  if (id==""){
    id = UUIDgenerate(T)
  }

  return(sprintf('{"id": "%s","text": "%s"}', id, text))
}


#' buildQueryBody
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' detectLanguage.buildQueryBody(detectLanguage.buildOneDocument(),detectLanguage.buildOneDocument())
#' @export
detectLanguage.buildQueryBody = function(...){
  docs = list(...)
  docs$sep = ","
  sprintf('{"documents": [%s]}',do.call(paste,docs))
}

#' detectLanguage.getLanguages
#'
#' https://westus.dev.cognitive.microsoft.com/docs/services/TextAnalytics.V2.0/operations/56f30ceeeda5650db055a3c7
#'
#' @examples
#' detectLanguage.getLanguages("yourApiKey", list(id="", text= "nice, it's perfect!"),list(id="", text= "今天天氣很好"),list(id="", text= "ཀོང་དགས་།"))
#' @import httr magrittr rjson
#' @export
detectLanguage.getLanguages = function(apiKey, ...){
  listOfDocData = list(...)
  listOfDocDataStrings = lapply(listOfDocData,function(args){
    do.call(detectLanguage.buildOneDocument,args)
  })

  postBody = do.call(detectLanguage.buildQueryBody,listOfDocDataStrings)

  headers = add_headers('Content-Type'='application/json',
                        'Ocp-Apim-Subscription-Key' = apiKey)

  res = POST("https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/languages",
             headers,
             body = postBody)

  resData = res %>% content()
  resData$postBody = postBody
  # resData$postBodyDf = data.frame(do.call(rbind,rjson::fromJSON(postBody)))
  return(resData)
}


