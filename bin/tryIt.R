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

#################################################################
# Case Study: Japanese news
# original title = "三船敏郎さん、ハリウッド殿堂入り　式典に孫ら出席"
# "http://www.asahi.com/articles/ASJCH2RMXJCHUHBI00H.html"
#################################################################

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


#################################################################
# Case Study: English news
# Ref: http://www.programmableweb.com/news/citi-launches-global-developer-hub-and-banking-apis/2016/11/16
#################################################################

keyPhrases.getKeyPhrases(apiKey,
                         list(lang="en", id="", text="Citi has announced the launch of a new Developer Hub and set of banking APIs. The new Citi Global Developer Hub provides a suite of APIs developers can use to build financial applications that benefit Citi customers. The Citi Developer Hub includes eight different API products (closed beta) that provide access to Citi platform capabilities such as account management, peer to peer payments, and money transfer to institutions. Services are currently available in three markets (Singapore, Australia, and the United States). The Monetary Authority of Singapore (MAS) has also announced the launch of a new set of APIs available on the MAS website. The MAS APIs provide access to data from the MAS Monthly Statistical Bulletin such as exchange rates, interest rates of banks and finance companies, and domestic interest rates.

The timing of these announcements is not coincidental. Citi Singapore is working with the MAS to develop a global API initiative. Sopnendu Mohanty, chief FinTech officer of the MAS, is quoted in the press release:

We are delighted that Citi Singapore is playing a leading role in developing and launching this global API initiative during the Singapore FinTech Festival which is held from 14-18 November 2016. This will encourage open collaborations with the FinTech community and potentially deliver better financial services for customers, as well as re-affirm Citi's thought leadership in shaping the future of financial services.
One of the reasons Citi launched the global API Developer Hub is to enable interoperability which is key to extracting the full potential of FinTech collaboration between banks and nonbanks. A number of multinational FinTech standardization initiatives are currently in development. Launching the global API Developer Hub allowed Citi to get the ball rolling when it comes to these initiatives. Citi provided ProgrammableWeb a quote from Carey Kolaja, global chief product officer, Citi FinTech, who says that:The Monetary Authority of Singapore has been very supportive of open collaboration between banks and the FinTech community. We decided that the inaugural Singapore FinTech Festival was the perfect opportunity to unveil the global Citi Developer Hub. What differentiates Citi from many other banks is our globality. While we’re headquartered in the US, our customers’ needs are borderless. Launching this Developer Hub in Singapore with APIs from multiple countries illustrates our global approach to developing solutions for our customers. Citi plans on developing additional APIs in the future and the company is looking to the developer community and partners to provide feedback as to what use cases would be best to tackle next and what customer problems need to be addressed. The Citi Developer Hub is a core component of Citi’s Global Open Banking strategy which will enable greater speed to market, agility, and innovation through partnerships and strategic alliances for the benefit of our customers, says Kolaja. Developer interested in using Citi APIs can apply for access at https://developer.citi.com.") )

