#' webML.lsModels
#'
#' https://dev.projectoxford.ai/docs/services/55de9ca4e597ed1fd4e2f104/operations/565bf87b778daf12447f43c1
#'
#' @examples
#' webML.lsModels(apiKey="")
#' @import httr magrittr
#' @export
webML.lsModels = function(apiKey){
  headers = add_headers('Content-Type'='application/json',
                        'Ocp-Apim-Subscription-Key' = apiKey)

  res = GET("https://api.projectoxford.ai/text/weblm/v1.0/models", headers)

  resData = res %>% content()
  return(resData)
}


#' webML.breakIntoWords
#'
#' Break Into Words
#' Insert spaces into a string of words lacking spaces, like a hashtag or part of a URL. Punctuation or exotic characters can prevent a string from being broken, so it’s best to limit input strings to lower-case, alpha-numeric characters.
#'
#' Ref: https://dev.projectoxford.ai/docs/services/55de9ca4e597ed1fd4e2f104/operations/565bf87b778daf12447f43c1
#'
#'@param apiKey string Subscription key which provides access to this API. Found in your subscriptions.
#'@param model string Which model to use, supported value: title/anchor/query/body
#'@param text string The line of text to break into words. If spaces are present, they will be interpreted as hard breaks and maintained, except for leading or trailing spaces, which will be trimmed.
#'@param order (optional) number The order of N-gram. If not specified, use default value 5 .Supported value: 1, 2, 3, 4, 5.
#'@param maxNumOfCandidatesReturned (optional) number Max number of candidates would be returned. If not specified, use default value 5.
#'
#' @examples
#' webML.breakIntoWords(apiKey=""model = "body",text = "今天天氣很好")
#' @import httr magrittr
#' @export
webML.breakIntoWords = function(apiKey,
                                model,
                                text,
                                order = 5,
                                maxNumOfCandidatesReturned = 5){

  query = list(model = model,
               text = text,
               order = order,
               maxNumOfCandidatesReturned = maxNumOfCandidatesReturned)


  headers = add_headers('Ocp-Apim-Subscription-Key' = apiKey)
  res = POST(url = "https://api.projectoxford.ai/",
             path = "text/weblm/v1.0/breakIntoWords",
             query = query,
             headers)
  resData = res %>% content()
  return(resData)
}

