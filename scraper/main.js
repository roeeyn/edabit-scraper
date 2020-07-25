const fsp = require("fs/promises");
const { main } = require("./getCompleteExercise");
const reduce = require("awaity/reduce");
const isFix = process.env.FIX || false;
const exerciseList = isFix
  ? require("./scrap_errors.json")
  : require("./exercises_list.json");
const mainScript = async () => {
  const finalExercises = await reduce.default(
    exerciseList,
    async (carry, { url }, iteration, originalArray) => {
      console.log(`********************* ${url} *************************`);
      console.log(`******** ${iteration + 1}/${originalArray.length} ******`);
      const mainExerciseDetails = await main(url);
      const exerciseDetails = { ...mainExerciseDetails, url };
      console.log(exerciseDetails);
      const newCarry = [...carry, exerciseDetails];
      const jsonifiedCarry = JSON.stringify(newCarry, null, "\t");
      await fsp.writeFile(
        isFix ? "./error_carry.json" : "./complete_carry.json",
        jsonifiedCarry
      );
      return newCarry;
    },
    []
  );

  const jsonifiedResult = JSON.stringify(finalExercises, null, "\t");
  await fsp.writeFile(
    isFix ? "./complete_error_fix.json" : "./complete_exercises.json",
    jsonifiedResult
  );
  console.log("ahuevo...?");
};

mainScript();
