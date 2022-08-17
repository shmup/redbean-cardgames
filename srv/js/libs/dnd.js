(function () {
  "use strict";
  // https://html.spec.whatwg.org/multipage/dnd.html#drag-and-drop-processing-model
  // https://caniuse.com/dragndrop

  const dnd = {};

  let dragged;

  const addListener = (name, fn, limit = 0) => {
    document.addEventListener(name, utils.throttle(fn, limit, true));
  };

  /* events fired on the draggable target */
  addListener("drag", (e) => {
    console.debug("dragging", e.target);
  }, 500);

  addListener("dragstart", (e) => {
    // store a ref. on the dragged elem
    dragged = e.target;
    // make it half transparent
    e.target.classList.add("dragging");

    setTimeout(function() {
      e.target.style.visibility = "hidden";
    }, 1);
  });

  addListener("dragend", (e) => {
    // console.debug("dropped", e.target);
    // reset the transparency

    e.target.classList.remove("dragging" );

    setTimeout(function() {
      e.target.style.visibility = "";
    }, 1);

    dragged = undefined;
  });

  /* events fired on the drop targets */
  addListener(
    "dragover",
    (e) => {
      // prevent default to allow drop
      e.preventDefault();
    }
  );

  addListener("dragenter", (e) => {
    console.debug("enter dropzone", e.target, e);

    // highlight potential drop target when the draggable element enters it
    if (e.target.classList.contains("dropzone")) {
      e.target.classList.add("dragover");
    }
  });

  addListener("dragleave", (e) => {
    console.debug("leave dropzone", e.target);

    // reset background of potential drop target when the draggable element leaves it
    if (e.target.classList.contains("dropzone")) {
      e.target.classList.remove("dragover");
    }
  });

  addListener("drop", (e) => {
    console.debug("drop", e);

    // prevent default action (open as link for some elements)
    e.preventDefault();

    // always remove the dragover
    e.target.classList.remove("dragover");

    // prevent the dragged being dropped into itself
    if (dragged === e.target) {
      return;
    }

    // move dragged element to the selected drop target
    if (e.target.classList.contains("dropzone")) {
      dragged.parentNode.removeChild(dragged);
      e.target.appendChild(dragged);
    }
  });

  if (typeof module !== "undefined") module["exports"] = dnd;
  else window.dnd = dnd;
})();
