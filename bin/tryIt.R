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

