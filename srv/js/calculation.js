const root = document.body;
const get = (url) => m.request({ method: "GET", url });
const div = (...args) => m("div", ...args);

const GameState = {
  error: "",
  init: {
    // this will set up a new gamestate
    fetch: () => {
      get("/api/v1/calculation/init")
        .then(({ talonTopCard, tableau, foundations }) => {
          GameState.talon.topCard = talonTopCard;
          GameState.foundations.stack = foundations;
          GameState.tableau.stack = tableau;
        })
        .catch((e) => {
          GameState.talon.error = e.message;
        });
    },
  },
  talon: {
    error: "",
    topCard: 0,
    fetch: () => {
      get("/api/v1/talon")
        .then((card) => {
          GameState.talon.topCard = card.id;
        })
        .catch((e) => {
          GameState.talon.error = e.message;
        });
    },
  },
  foundations: {
    stack: [],
  },
  tableau: {
    stack: [],
  },
};

const Calculation = {
  oninit: GameState.init.fetch,
  view: () => {
    return div({ class: "container vflex" }, [
      div(
        { class: "board flex" },
        div({ class: "inner-board flex" }, [
          div({ class: `talon card _${GameState.talon.topCard}` }),
          div([
            div(
              { class: "foundations flex" },
              GameState.foundations.stack.map((cardId) =>
                div({ class: `card _${cardId}` })
              )
            ),
            div({ class: "tableaus flex" }, [
              div({ class: "card _empty" }),
              div({ class: "card _empty" }),
              div({ class: "card _empty" }),
              div({ class: "card _empty" }),
            ]),
          ]),
        ])
      ),
    ]);
  },
};

m.route(root, "/", {
  "/": Calculation,
});
