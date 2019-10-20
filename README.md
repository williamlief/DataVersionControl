# DataVersionControl
Package for Automating Version Control of Data Files. 

This package came about from my frustration with trying to recreate old charts and tables while working on long term research projects. 
Because data files are not tracked in git, tracking my code meant either laboriously re-running old data cleaning scripts to restore data to its prior state or manually adding version stamps to data files and 
updating them in all relevent scripts whenever a data set was edited. 
This package automates the version control of data files by automatically adding prefixes to file names, and using git to save the current version at each point in time. 

# Use
- Run `create_data_vc()` on project initializaiton, this will create a text file in the root directory to track file versions. 
- Save files with `saveRDS_vc()`. Supply arguments *exactly* as you would to `saveRDS`. A stamp will be automatically added with daily granularity by default. 
  - Commit the changes to `DATA_VC` to git. 
- Read files with `readRDS_vc()`. Supply arguments *exactly* as you would to `readRDS`. **Do not include the stamp in the `file` parameter**
- If you need to return to a prior point in your git history, `DATA_VC` will revert and `readRDS_vc` will pull the correct data file for that point in time. 

# Details
This package address the challenge of tracking data files within git. 
It works by creating multiple versions of datafiles, and updating a textfile that records the current version. 
It is disk space intensive and likely not an appropriate solution for files that are very large and change frequently. 
The user should first run `make_data_vc()` which will create the tracking file ("data_vc" by default) in the root directory. 
All subsequent data files should be saved and read using saveRDS_vc and readRDS_vc, these functions behave exactly the same as their base versions, except that they access the "data_vc" file to track the `stamp` prefix and write/read the appropriate file. 
The default stamp is `Sys.Date()` and will not track changes within a day, use `Sys.time()` for more granular tracking. 
Git commits of changes to "data_vc" will allow the user toreturn to any previous commit of the project and automatically access the data in the state that it existed at that point in the git history. 
