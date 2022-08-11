const root = document.body;
const div = (...args) => m("div", ...args);

m.render(
  root,
  div({ class: "container vflex" }, [
    m("h1", "Calculation"),
    div({ class: "board flex" }, [
      div({ class: "talon card" }, "T"),
      div([
        div({ class: "foundations flex" }, [
          div({ class: "card" }, "F1"),
          div({ class: "card" }, "F2"),
          div({ class: "card" }, "F3"),
          div({ class: "card" }, "F4"),
        ]),
        div({ class: "tableaus flex" }, [
          div({ class: "card" }, "T1"),
          div({ class: "card" }, "T2"),
          div({ class: "card" }, "T3"),
          div({ class: "card" }, "T4"),
        ]),
      ]),
    ]),
  ])
);
