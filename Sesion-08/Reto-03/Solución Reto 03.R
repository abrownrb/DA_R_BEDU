library(randomForest)
cancer <- 'http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data'
cancer <- read.table(file=url(cancer), header=FALSE, sep=',')
colnames(cancer) <- c('codigo',
                  'clump_thickness',
                  'uniformity_of_cell_size',
                  'uniformity_of_cell_shape',
                  'marginal_adhesion',
                  'single_epithelial_cell_size',
                  'bare_nuclei',
                  'bland_chromatin',
                  'normal_nucleoli',
                  'mitoses',
                  'clase')
cancer <- cancer[,-1]
cancer$clase <- factor(ifelse(cancer$clase==4, 1, 0))
randfor <- randomForest(clase ~ ., data=cancer, importance=TRUE, proximity=TRUE)
print(randfor)
