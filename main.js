const fsp = require("fs/promises");
const exerciseList = require("./exercises_list.json");
const { main } = require("./getCompleteExercise");
const reduce = require("awaity/reduce");
const mainScript = async () => {
  const finalExercises = await reduce.default(
    exerciseList,
    async (carry, { url }, iteration, originalArray) => {
      console.log(`********************* ${url} *************************`);
      console.log(`******** ${iteration + 1}/${originalArray.length} ******`);
      const exerciseDetails = await main(url);
      console.log(exerciseDetails);
      const newCarry = [...carry, exerciseDetails];
      const jsonifiedCarry = JSON.stringify(newCarry, null, "\t");
      await fsp.writeFile("./complete_carry.json", jsonifiedCarry);
      return newCarry;
    },
    []
  );

  const jsonifiedResult = JSON.stringify(finalExercises, null, "\t");
  await fsp.writeFile("./complete_exercises.json", jsonifiedResult);
  console.log("ahuevo...?");
};

mainScript();
