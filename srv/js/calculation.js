const root = document.body;
const get = (url) => m.request({ method: "GET", url });
const div = (...args) => m("div", ...args);
const ul = (...args) => m("ul", ...args);
const li = (...args) => m("li", ...args);

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
            { class: "talon dropzone card-wrapper" },
            div({
              draggable: true,
              class: `card dropzone _${GameState.talon.topCard}`,
            })
          ),
          div([
            ul(
              { class: "foundations flex" },
              GameState.foundations.stack.map((cardId) =>
                div(
                  { class: `card-wrapper dropzone` },
                  li({
                    draggable: true,
                    class: `foundation dropzone card _${cardId}`,
                  })
                )
              )
            ),
            ul(
              { class: "tableaus flex" },
              GameState.tableaus.stack.map((cardId) =>
                div(
                  { class: `card-wrapper dropzone` },
                  li({
                    draggable: true,
                    class: `tableau dropzone card _${cardId}`,
                  })
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

/* events fired on the draggable target */
document.addEventListener("drag", () => {
  console.log("dragging");
});

document.addEventListener("dragstart", (event) => {
  // store a ref. on the dragged elem
  dragged = event.target;
  // make it half transparent
  event.target.classList.add("dragging");
});

document.addEventListener("dragend", (event) => {
  // reset the transparency
  event.target.classList.remove("dragging");
});

/* events fired on the drop targets */
document.addEventListener(
  "dragover",
  (event) => {
    // prevent default to allow drop
    event.preventDefault();
  },
  false
);

document.addEventListener("dragenter", (event) => {
  // highlight potential drop target when the draggable element enters it
  if (event.target.classList.contains("dropzone")) {
    event.target.classList.add("dragover");
  }
});

document.addEventListener("dragleave", (event) => {
  // reset background of potential drop target when the draggable element leaves it
  if (event.target.classList.contains("dropzone")) {
    event.target.classList.remove("dragover");
  }
});

document.addEventListener("drop", (event) => {
  // prevent default action (open as link for some elements)
  event.preventDefault();
  // move dragged element to the selected drop target
  if (event.target.classList.contains("dropzone")) {
    event.target.classList.remove("dragover");
    dragged.parentNode.removeChild(dragged);
    event.target.appendChild(dragged);
  }
});
