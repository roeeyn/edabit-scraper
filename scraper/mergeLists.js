const completeExercises = require("../ut_complete_exercises.json");
const exercisesList = require("../ut_exercises_list.json");
const fsp = require("fs/promises");

const unmatchedElements = completeExercises.filter(
  (element, idx) => element.url !== exercisesList[idx].url
);

if (unmatchedElements.length > 0) {
  console.log(
    "Lists from ut_complete_exercises.json and ut_exercises_list.json must match"
  );
  return;
}

const mergedList = completeExercises.map((element, idx) => {
  return { ...element, ...exercisesList[idx] };
});

const jsonifiedMergeList = JSON.stringify(mergedList, null, "\t");
fsp.writeFile("../ut_merged_list.json", jsonifiedMergeList);
console.log(`Written ${mergedList.length} challenges`);
