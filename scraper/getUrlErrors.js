const exercises = require("./complete_exercises.json");
const fsp = require("fs/promises");

const errorUrls = exercises.filter(exercise => {
  return (
    Object.keys(exercise).includes("error") ||
    Object.values(exercise).includes("")
  );
});

const jsonifiedList = JSON.stringify(errorUrls, null, "\t");

fsp
  .writeFile("./scrap_errors.json", jsonifiedList)
  .then(() => console.log("Saved successfuly"))
  .catch(() => console.log("Valio vrg carnalito"));
