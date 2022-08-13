const root = document.body;
const get = (url) => m.request({ method: "GET", url });
const div = (...args) => m("div", ...args);

const GameState = {
  talon: {
    error: "",
    topCard: 0,
    fetch: () => {
      get("/api/v1/talon").then((card) => {
        GameState.talon.topCard = card.id
      }).catch((e) => {
        GameState.talon.error = e.message
      })
    },
  },
  foundations: {
    stack: [],
  },
  tableaus: {
    stack: [],
  },
};

const Calculation = {
  oninit: GameState.talon.fetch,
  view: () => {
    return div({ class: "container vflex" }, [
      div(
        { class: "board flex" },
        div({ class: "inner-board flex" }, [
          div({ class: `talon card _${GameState.talon.topCard}` }),
          div([
            div({ class: "foundations flex" }, [
              div({ class: "card _1" }),
              div({ class: "card _2" }),
              div({ class: "card _3" }),
              div({ class: "card _4" }),
            ]),
            div({ class: "tableaus flex" }, [
              div({ class: "card _15" }),
              div({ class: "card _51" }),
              div({ class: "card _32" }),
              div({ class: "card _11" }),
            ]),
          ]),
        ])
      ),
    ]);
  },
};

m.route(root, "/", {
  "/": Calculation
});
