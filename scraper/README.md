# Edabit Scrapper

## Setup the workspace

Install all the dependencies by running:

```bash
npm install
```

## Get the exercises list

For getting a list of the exercises, run:

```bash
node getExercisesList.js
```

A list of the exercises found in 19/07/2020 can be found in `ut_exercises_list.json`

## Get the actual exercises with tests

For getting all the exercises details and tests, run

```bash
# Watch out, this could take up to 5 hrs!
node main.js
```

A list of the exercises found in 21/07/2020 can be found in `ut_complete_exercises.json`

## Fix all the scraper errors from the previous step

First get the urls that threw errors, by executing
```bash
node getUrlErrors.js
```

For fixing, run the `main.js` file, but with the `FIX` flag with true

```bash
FIX=true node main.js
```

## Merge info from exercises and list

For merging the info of the list and the exercises details, run

```bash
node mergeLists.js
```

A complete merged list created in 21/07/2020 can be found in `ut_merged_list.json`
