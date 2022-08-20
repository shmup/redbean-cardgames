const root = document.body;
const get = (url) => m.request({ method: "GET", url });
const div = (...args) => m("div", ...args);
const ul = (...args) => m("ul", ...args);
const li = (...args) => m("li", ...args);
const card = (cardId) => ({
  draggable: true,
  "data-card_id": cardId,
  "data-type_id": 0,
  class: `card dropzone _${cardId}`,
});

dnd.onDrop = (draggedNode, zoneNode) => {
  const draggedData = draggedNode.dataset;
  const zoneData = zoneNode.dataset;

  console.log('dropped', draggedData, zoneData);

  return true;
};

const ZoneTypes = {
  foundation: 0,
  tableau: 1,
};

const GameState = {
  error: "",
  init: {
    // this will set up a new gamestate
    fetch: () => {
      get("/api/v1/calculation/init")
        .then(({ talonTopCard, tableaus, foundations }) => {
          GameState.talon.topCard = talonTopCard;
          GameState.foundations.stack = foundations;
          GameState.tableaus.stack = tableaus;
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
      get("/api/v1/calculation/talon")
        .then((card) => {
          GameState.talon.topCard = card.id;
        })
        .catch((e) => {
          GameState.talon.error = e.message;
        });
    },
  },
  foundations: {
    stack: [0, 0, 0, 0],
  },
  tableaus: {
    stack: [0, 0, 0, 0],
  },
};

const Calculation = {
  oninit: GameState.init.fetch,
  view: () => {
    return div({ class: "container vflex" }, [
      div(
        { class: "board flex" },
        div({ class: "inner-board flex" }, [
          div(
            {
              "data-type_id": 3,
              "data-zone_id": 0,
              class: "talon dropzone card-wrapper _back2",
            },
            div(card(GameState.talon.topCard))
          ),
          div([
            ul(
              { class: "foundations flex" },
              GameState.foundations.stack.map((cardId, zoneId) =>
                div(
                  {
                    "data-type_id": 1,
                    "data-zone_id": zoneId,
                    class: `card-wrapper foundation dropzone`,
                  },
                  li(card(cardId))
                )
              )
            ),
            ul(
              { class: "tableaus flex" },
              GameState.tableaus.stack.map((cardId, zoneId) =>
                div(
                  {
                    "data-type_id": 2,
                    "data-zone_id": zoneId,
                    class: `card-wrapper tableau dropzone`,
                  },
                  Number(cardId) !== 0 && li(card(cardId))
                )
              )
            ),
          ]),
        ])
      ),
    ]);
  },
};

m.route(root, "/", {
  "/": Calculation,
});
