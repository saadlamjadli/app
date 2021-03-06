# init.R
#
# Example R code to install packages if not already installed
#


my_packages = c("data.table","shiny","RMySQL")


install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))

install.packages("/app/localpackages/randomForest_4.6-10.tar.gz", repos=NULL, type="source")
