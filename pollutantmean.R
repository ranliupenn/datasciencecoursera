pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  files_full <- list.files(directory, full.names=TRUE)
  
  tmp <- vector(mode = "list", length = length(files_full))
  for (i in seq_along(files_full)) {
    tmp[[i]] <- read.csv(files_full[[i]])
  }
  dat <- do.call(rbind, tmp)
  
  dat_subset <- subset(dat, dat$ID %in% id)
  mean(dat_subset[, pollutant], na.rm=TRUE)  
}

pollutantmean("specdata", "sulfate", 1:10)

system.time(pollutantmean("specdata", "sulfate", 1:10))
