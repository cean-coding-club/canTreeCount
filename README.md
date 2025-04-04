# canTreeCount
Using remote sensing (e.g. aerial imagery) data to count canopy trees in Perth

## Remember the workflow:
1. Consider pulling from the github repo before making changes (pull button on Git tab)
2. Always create a new branch (top right of Git tab) to make edits
3. Save edits, select items to commit, and commit with a useful simple comment
4. Push the edited branch to the Github repo
5. Make a pull request on Github website
6. Someone will review and accept the changes, and merge the edited branch into the main branch

## Things to consider / do:

### Imagery data collection
Investigate aerial imagery that we can use (e.g. can we use and download Google Earth imagery?)
Eventually this should be placed into a 'data' folder that we will share between everyone

### Machine learning model
Select the easiest ML model that we can use for the project (e.g. YOLO?)
Script should run in R (but could potentially use python??)
Seems like python is better for machine learning things than R, for some reason?

### Obtain training dataset
We need to decide on a training dataset
This could be the Curtin University tree location and species data that the "overstory" project is using??
This dataset will also go into the shared 'data' file.

### Imagery formatting
What format does the imagery data need to be in?
We might need an R script to reformat or prepare the spatial imagery.

### Data output
What output do we want?
A bounding box around each tree should allow us to count all trees but also obtain area

### Compile relevant papers/publications
We should add any relevant papers to a new file in the project folder, with hyperlinks to the paper

# 

