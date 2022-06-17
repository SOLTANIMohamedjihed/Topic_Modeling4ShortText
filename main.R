library(BTM)
library(textplot)
library(ggraph)
library(concaveman)

data("brussels_reviews_anno", package = "udpipe")

## Taking only nouns of Dutch data

x <- subset(brussels_reviews_anno, language == "nl")
x <- subset(x, xpos %in% c("NN", "NNP", "NNS"))
x <- x[, c("doc_id", "lemma")]

## Building the model
set.seed(321)
model  <- BTM(x, k = 3, beta = 0.01, iter = 1000, trace = 100)

## Inspect the model - topic frequency + conditional term probabilities
model$theta


topicterms <- terms(model, top_n = 10)
topicterms


# Visualisation of your model


plot(model)