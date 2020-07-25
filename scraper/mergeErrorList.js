const completeExercises = require("./complete_exercises.json");
const errorFixList = require("./complete_error_fix.json");
const fsp = require("fs/promises");

const fixedUrls = errorFixList.map(({ url }) => url);

const mergedList = completeExercises.map((exercise, idx) => {
  if (fixedUrls.includes(exercise.url)) {
    return errorFixList.filter(
      fixedExercise => fixedExercise.url === exercise.url
    )[0];
  }
  return exercise;
});

const jsonifiedMergeList = JSON.stringify(mergedList, null, "\t");
fsp.writeFile("./complete_exercises.json", jsonifiedMergeList);
console.log(`Written ${mergedList.length} challenges`);
