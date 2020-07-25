const puppeteer = require("puppeteer");

const HEADLESS = true;
const TEST_BTN_IDX = 5;
const STARTER_CODE_BTN_IDX = 1;

const getChallengeInfo = async page => {
  return await page.evaluate(() => {
    const [titleSection, descriptionSection] = document.querySelector(
      ".grey-segment.code-area.instructions"
    ).children;

    const [
      headerSection,
      publishedSection,
      tagsSection,
    ] = titleSection.children;

    const [, publisher, , languageSection] = publishedSection.children;
    const [language] = languageSection.children;
    const tags = [...tagsSection.children].map(element => element.innerText);

    return {
      title: headerSection.innerText,
      description: descriptionSection.innerHTML,
      publishedBy: publisher.innerText,
      publishedByUrl: publisher.href,
      language: language.innerText,
      tags,
    };
  });
};

const getTextInsideCode = async (page, btnIndex) => {
  if (btnIndex === TEST_BTN_IDX)
    await page.evaluate(() => {
      const buttons = document.querySelectorAll(".rc-tabs-tab");
      if (buttons && buttons.length === 7) buttons[5].click();
    });
  else
    await page.evaluate(() => {
      const buttons = document.querySelectorAll(".rc-tabs-tab");
      if (buttons && buttons.length === 7) buttons[1].click();
    });
  await page.waitFor(3000);
  return await page.evaluate(() => {
    return [
      ...document.querySelectorAll(".CodeMirror.cm-s-default")[0].children[5]
        .children[0].children[0].children[0].children[0].children[4].children,
    ].map(el => el.innerText);
  });
};
const getTests = async page => await getTextInsideCode(page, TEST_BTN_IDX);

const getStarterCode = async page =>
  await getTextInsideCode(page, STARTER_CODE_BTN_IDX);

const main = async exerciseUrl => {
  try {
    const browser = await puppeteer.launch({ headless: HEADLESS });
    const page = await browser.newPage();
    await page.goto(exerciseUrl, {
      waitUntil: "networkidle2",
    });
    await page.waitFor(3000);
    const description = await getChallengeInfo(page);
    const tests = await getTests(page);
    const starterFn = await getStarterCode(page);
    const result = { ...description, tests, starterFn };
    await browser.close();
    return result;
  } catch (error) {
    console.error(error);
    return { error: error, url: exerciseUrl };
  }
};

module.exports = { main };
