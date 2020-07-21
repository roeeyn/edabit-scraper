const puppeteer = require("puppeteer");
const fsp = require("fs/promises");
const loadMoreBtnSelector = "button.ui.fluid.button";

const getChallenges = async (page, previousLength = 0) => {
  const allChallenges = await page.evaluate(() => {
    return Array.from(document.querySelectorAll("a.content")).map(element => {
      const [title, description, tags, difficulty] = element.children;
      const finalTags = [...tags.children].map(tag => tag.innerText);
      return {
        title: title.innerText,
        shortDescription: description.innerText,
        tags: finalTags,
        difficulty: difficulty.innerText,
        url: element.href,
      };
    });
  });

  const loadMoreBtn = await page.evaluate(() => {
    return !!document.querySelector("button.ui.fluid.button");
  });

  console.log(loadMoreBtn, allChallenges.length);
  if (allChallenges.length > 0) {
    const jsonifiedChallenges = JSON.stringify(allChallenges, null, "\t");
    await fsp.writeFile("./carry.json", jsonifiedChallenges);
  }

  if (loadMoreBtn) {
    await page.click(loadMoreBtnSelector, {
      delay: previousLength > 850 ? 6000 : 3000,
    });
    return await getChallenges(page, allChallenges.length);
  } else return allChallenges;
};

const main = async () => {
  try {
    const browser = await puppeteer.launch({ headless: false });
    const page = await browser.newPage();
    await page.goto("https://edabit.com/challenges", {
      waitUntil: "networkidle2",
    });

    await getChallenges(page);

    await browser.close();
  } catch (error) {
    console.error(error);
  }
};

main();
