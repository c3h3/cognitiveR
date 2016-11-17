#' webML.lsModels
#'
#' https://dev.projectoxford.ai/docs/services/55de9ca4e597ed1fd4e2f104/operations/565bf87b778daf12447f43c1
#'
#' @examples
#' webML.lsModels()
#' @import httr magrittr
#' @export
webML.lsModels = function(apiKey){
  headers = add_headers('Content-Type'='application/json',
                        'Ocp-Apim-Subscription-Key' = apiKey)

  res = GET("https://api.projectoxford.ai/text/weblm/v1.0/models", headers)

  resData = res %>% content()
  return(resData)
}
