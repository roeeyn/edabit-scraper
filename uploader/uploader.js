const dotenv = require("dotenv");
dotenv.config();

const { connect2db } = require("./db/db");
const exerciseList = require("../ut_merged_list.json");
const { Exercise } = require("./db/models");
const fsp = require("fs/promises");
const { each } = require("awaity/esm");

connect2db()
  .then(async message => {
    console.log(message);

    await each(exerciseList, async (exercise, idx) => {
      try {
        const newExercise = new Exercise({ ...exercise });
        await newExercise.save();
        console.log(`Saved ${idx + 1}/${exerciseList.length}`);
      } catch (error) {
        console.log(error);
        fsp.appendFile("./errors.txt", `${exercise.url}\n`);
      }
    });

    console.log("Finished Successfuly");
  })
  .catch(err => console.error("holi", err));
