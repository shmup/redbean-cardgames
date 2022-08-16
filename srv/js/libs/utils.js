(function () {
  "use strict";

  const u = {};

  u.debounce = (func, delay, immediate) => {
    let timerId;
    return (...args) => {
      const boundFunc = func.bind(this, ...args);
      clearTimeout(timerId);
      if (immediate && !timerId) {
        boundFunc();
      }
      const calleeFunc = immediate
        ? () => {
            timerId = null;
          }
        : boundFunc;
      timerId = setTimeout(calleeFunc, delay);
    };
  };

  u.throttle = (func, delay, immediate) => {
    let timerId;
    return (...args) => {
      const boundFunc = func.bind(this, ...args);
      if (timerId) {
        return;
      }
      if (immediate && !timerId) {
        boundFunc();
      }
      timerId = setTimeout(() => {
        if (!immediate) {
          boundFunc();
        }
        timerId = null; // reset the timer so next call will be excuted
      }, delay);
    };
  };

  if (typeof module !== "undefined") module["exports"] = u;
  else window.utils = u;
})();
