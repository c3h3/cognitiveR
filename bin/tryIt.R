# install.packages(c("devtools"))
library(devtools)
install_github("c3h3/cognitiveR")

library(cognitiveR)

apiKey = ""


sentiment.getScores(apiKey,
                    list(lang="en", id="", text= "nice, it's perfect!"),
                    list(lang="en", id="", text= "Very  bad hotel, room was very bad smells,  shower was very bad from now I never go to westbetern hotels."),
                    list(lang="zh_cht", id="", text= "今天天氣很好"))

detectLanguage.getLanguages(apiKey,
                            list(id="", text= "nice, it's perfect!"),
                            list(id="", text= "今天天氣很好"),
                            list(id="", text= "ཀོང་དགས་།"))


keyPhrases.getKeyPhrases(apiKey,
                         list(lang="zh_cht", id="", text= "今天天氣很好"),
                         list(lang="en", id="", text= "Very  bad hotel, room was very bad smells,  shower was very bad from now I never go to westbetern hotels."))

# japan news 
# original title = "三船敏郎さん、ハリウッド殿堂入り　式典に孫ら出席"
# "http://www.asahi.com/articles/ASJCH2RMXJCHUHBI00H.html"
 
keyPhrases.getKeyPhrases(apiKey,
                         list(lang="ja", id="", text= " 俳優の故・三船敏郎さんが米ハリウッドの殿堂「ウォーク・オブ・フェーム」（名声の歩道）入りする記念式典が１４日、ロサンゼルスで開かれ、三船さんの名前入りの星形プレートが披露された。三船さんは、黒澤明監督の「七人の侍」などで、世界的に有名になった。

　地元メディアによると、殿堂入りは２５９４番目。日本関係者は、米国で活躍した俳優の早川雪洲さん、マコ岩松さんのほか、怪獣ゴジラが選ばれている。今回の式典には、三船さんの親族らが出席した。

　三船さんは１９９７年に７７歳でなくなるまで、「用心棒」「赤ひげ」「羅生門」など生涯で１５０本以上の映画に出演。国際的スターとなり、「世界で最も知られた日本人俳優」と評価された。（平山亜理） ") )

# output  ####
# Microsoft cognitive API is powerful !!!
# $documents[[1]]$keyPhrases[[1]]
# [1] "三船敏郎"
# 
# $documents[[1]]$keyPhrases[[2]]
# [1] "殿堂入り"
# 
# $documents[[1]]$keyPhrases[[3]]
# [1] "名前入り"
# 
# $documents[[1]]$keyPhrases[[4]]
# [1] "日本人俳優"
# 
# $documents[[1]]$keyPhrases[[5]]
# [1] "世界"
