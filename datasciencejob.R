library(tm)
df=read.csv(file.choose(), stringsAsFactors=F)
job_corpus=Corpus(VectorSource(df$JobRequirment))
print(job_corpus)
inspect(job_corpus[1:5])
##time to identify real words with tm_map
##translate to lower case
clean_job_corpus=tm_map(job_corpus, tolower)
#remove numbers
clean_job_corpus=tm_map(clean_job_corpus, removeNumbers)
#remove punctuation
clean_job_corpus=tm_map(clean_job_corpus, removePunctuation)
#remove non content words or "stop words"
stopwords()[1:10]
clean_job_corpus=tm_map(clean_job_corpus,removeWords,stopwords())
#remove white space
clean_job_corpus=tm_map(clean_job_corpus, stripWhitespace)
#inspect it
inspect(clean_job_corpus[1:3])
#tokenize the now cleaned corpus
cj_dtm=DocumentTermMatrix(clean_job_corpus)
inspect(cj_dtm[1:4, 30:35])
library(wordcloud)
wordcloud(clean_job_corpus, min.freq=40)