const root = document.body;
const div = (...args) => m("div", ...args);

m.render(
  root,
  div({ class: "container vflex" }, [
    div(
      { class: "board flex" },
      div({ class: "inner-board flex" }, [
        div({ class: "talon card _back2" }),
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
  ])
);
