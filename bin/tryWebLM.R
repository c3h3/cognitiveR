# install.packages(c("devtools"))
# library(devtools)
# install_github("c3h3/cognitiveR")

library(cognitiveR)

apiKey = ""

webML.lsModels(apiKey)
webML.breakIntoWords(apiKey, model = "body", text = "今天天氣很好")
