# init.R
#
# Example R code to install packages if not already installed
#


my_packages = c("devtools","data.table","xgboost")


install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))

install_version("randomForest", version = "4.0.1.", repos = "http://cran.us.r-project.org")
