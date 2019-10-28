make_data_vc()
system("mkdir testdata")

saveRDS_vc(cars, "testdata/mycars.rds")
