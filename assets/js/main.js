(() => {
  "use strict";

  document.documentElement.classList.add("js");

  const toggles = [
    {
      button: document.querySelector(".site-nav__toggle"),
      panel: document.querySelector(".site-nav__links"),
      openClass: "is-open"
    },
    {
      button: document.querySelector(".contact-toggle"),
      panel: document.querySelector(".author__urls"),
      openClass: "is--visible"
    }
  ];

  const close = ({ button, panel, openClass }) => {
    if (!button || !panel) return;
    button.setAttribute("aria-expanded", "false");
    panel.classList.remove(openClass);
  };

  toggles.forEach((toggle) => {
    const { button, panel, openClass } = toggle;
    if (!button || !panel) return;

    button.addEventListener("click", () => {
      const expanded = button.getAttribute("aria-expanded") === "true";
      toggles.forEach((other) => {
        if (other !== toggle) close(other);
      });
      button.setAttribute("aria-expanded", String(!expanded));
      panel.classList.toggle(openClass, !expanded);
    });
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") toggles.forEach(close);
  });

  document.addEventListener("click", (event) => {
    toggles.forEach((toggle) => {
      const { button, panel } = toggle;
      if (button && panel && !button.contains(event.target) && !panel.contains(event.target)) close(toggle);
    });
  });
})();
