# ===== Define Work Path ===== 
workpath <- "~/GitHub/tutorial_examples/R for Statistics/"


# ===== Load the Function to Create a Correlation Table with Stars ===== 
# x is a matrix containing the data
# method : correlation method. "pearson"" or "spearman"" is supported
# removeTriangle : remove upper or lower triangle
# results :  if "html" or "latex"
# the results will be displayed in html or latex format
# Credit: http://www.sthda.com/english/wiki/elegant-correlation-table-using-xtable-r-package
# Modified: Sheng-Bo Chen
corstars <-function(x, method=c("pearson", "spearman"), removeTriangle=c("upper", "lower"),
                    result=c("none", "html", "latex")){
  #Compute correlation matrix
  require(Hmisc)
  x <- as.matrix(x)
  correlation_matrix<-rcorr(x, type=method[1])
  R <- correlation_matrix$r # Matrix of correlation coeficients
  p <- correlation_matrix$P # Matrix of p-value 
  
  ## Define notions for significance levels; spacing is important.
  mystars <- ifelse(p < .0001, "****", ifelse(p < .001, "*** ", ifelse(p < .01, "**  ", ifelse(p < .05, "*   ", "    "))))
  
  ## trunctuate the correlation matrix to two decimal
  R <- format(round(cbind(rep(-1.11, ncol(x)), R), 2))[,-1]
  
  ## build a new matrix that includes the correlations with their apropriate stars
  Rnew <- matrix(paste(R, mystars, sep=""), ncol=ncol(x))
  diag(Rnew) <- paste(diag(R), " ", sep="")
  rownames(Rnew) <- colnames(x)
  colnames(Rnew) <- paste(colnames(x), "", sep="")
  
  ## remove upper triangle of correlation matrix
  if(removeTriangle[1]=="upper"){
    Rnew <- as.matrix(Rnew)
    Rnew[upper.tri(Rnew, diag = TRUE)] <- ""
    Rnew <- as.data.frame(Rnew)
  }
  
  ## remove lower triangle of correlation matrix
  else if(removeTriangle[1]=="lower"){
    Rnew <- as.matrix(Rnew)
    Rnew[lower.tri(Rnew, diag = TRUE)] <- ""
    Rnew <- as.data.frame(Rnew)
  }
  
  ## remove last column and return the correlation matrix
  Rnew <- cbind(Rnew[1:length(Rnew)-1])
  require(ztable)
  if (result[1]=="none") return(Rnew)
  else{
    if(result[1]=="html") ztable(Rnew, type="html")
    else ztable(Rnew)
  }
} 


# ===== Load the Cleaned Dataset to Data Frame ===== 
library(readr)
survey_data_004 <- read_csv(paste0(workpath, "survey_data_004.csv"), col_types = cols(
  StudentID = col_character(),
  Age       = col_integer(), 
  Gender    = col_integer(),
  Q1        = col_integer(), 
  Q2        = col_integer(), 
  Q3        = col_integer(), 
  Q4        = col_integer(), 
  Q5        = col_integer(), 
  Q6        = col_integer(), 
  Q7        = col_integer(), 
  Q8        = col_integer(), 
  Q9        = col_integer(), 
  Q10       = col_integer()
))


# ===== Subset the Data Frame ===== 
survey_data_004_cor <- subset( survey_data_004, select = -c(StudentID))


# ===== Fix the Repeated <th Issue by ztable ===== 
table_html <- capture.output(
  corstars(as.matrix(survey_data_004_cor), result="html")
)

table_html <- gsub("<th <th", "<th", table_html)


# ===== Save the Table in HTML and Open It in Browser ===== 
fileConn<-file(paste0(workpath, "table.html"))
writeLines(table_html, fileConn)
close(fileConn)

browseURL(paste0(workpath, "table.html")) 


# ===== Scatter Plot =====
# https://www.statmethods.net/graphs/scatterplot.html
# Tilde Operater Means Y~X (Dependent Variable Y is Predicted by Independent Variable X)
plot(survey_data_004_cor$Q1, survey_data_004_cor$Q2, main="Scatterplot Example", xlab="X", ylab="Y", pch=19)
abline(lm(survey_data_004_cor$Q2~survey_data_004_cor$Q1), col="red") # regression line (y~x)


# http://www.sthda.com/english/wiki/scatter-plot-matrices-r-base-graphs
pairs(survey_data_004_cor, main = "Pairs matrix", pch = 19, lower.panel = NULL)


library("PerformanceAnalytics")
chart.Correlation(survey_data_004_cor, histogram=TRUE, pch=19)


# ===== Correlation Plots ===== 
# https://www.statmethods.net/stats/correlations.html
library(Hmisc)
cor <- rcorr(as.matrix(survey_data_004_cor), type="pearson") # type can be pearson or spearman


# http://www.sthda.com/english/wiki/correlation-matrix-a-quick-start-guide-to-analyze-format-and-visualize-a-correlation-matrix-using-r-software
# https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html
# http://www.sthda.com/english/wiki/visualize-correlation-matrix-using-correlogram
library(corrplot)
corrplot(cor$r, type = "upper", tl.col = "black", tl.srt = 45)
corrplot(cor$r, type = "upper", tl.col = "black", tl.srt = 45, metho = "ellipse")
corrplot(cor$r, type = "upper", p.mat = cor$P, sig.level = 0.05, insig = "blank",   tl.col = "black", tl.srt = 45)
corrplot(cor$r, type = "upper", p.mat = cor$P, sig.level = 0.05, insig = "p-value", tl.col = "black", tl.srt = 45)
corrplot(cor$r, type = "upper", p.mat = cor$P, sig.level = 0.05, insig = "pch",     tl.col = "black", tl.srt = 45)
corrplot(cor$r, type = "upper", p.mat = cor$P, sig.level = 0.00, insig = "p-value", tl.col = "black", tl.srt = 45, metho = "ellipse")




# T-Test 
