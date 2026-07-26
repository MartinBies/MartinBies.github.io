(() => {
  "use strict";

  document.documentElement.classList.add("js");

  const mobileViewport = window.matchMedia("(max-width: 767px)");
  const menuButton = document.querySelector(".site-nav__toggle");
  const menu = document.querySelector(".site-nav__links");
  const contactButton = document.querySelector(".contact-toggle");
  const contacts = document.querySelector(".contact-panel");

  const isExpanded = (button) => button?.getAttribute("aria-expanded") === "true";
  const closest = (target, selector) => target instanceof Element ? target.closest(selector) : null;

  const setExpanded = (button, open, name = "") => {
    button?.setAttribute("aria-expanded", String(open));
    if (name) button?.setAttribute("aria-label", `${open ? "Close" : "Open"} ${name}`);
  };

  const closeContacts = () => {
    setExpanded(contactButton, false);
    contacts?.classList.remove("is--visible");
  };

  const setMenu = (open, restoreFocus = false) => {
    if (!menuButton || !menu) return;

    const shouldOpen = open && mobileViewport.matches;
    if (shouldOpen) closeContacts();

    setExpanded(menuButton, shouldOpen, "navigation menu");
    menu.hidden = mobileViewport.matches && !shouldOpen;

    if (shouldOpen) menu.querySelector("a")?.focus();
    if (restoreFocus) menuButton.focus();
  };

  if (menuButton && menu) {
    setMenu(false);
    menuButton.addEventListener("click", () => setMenu(!isExpanded(menuButton)));
    menu.addEventListener("click", (event) => {
      if (closest(event.target, "a")) setMenu(false);
    });
    mobileViewport.addEventListener("change", () => setMenu(false));
  }

  contactButton?.addEventListener("click", () => {
    const open = !isExpanded(contactButton);
    setMenu(false);
    setExpanded(contactButton, open);
    contacts?.classList.toggle("is--visible", open);
  });

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") return;

    const menuWasOpen = isExpanded(menuButton);
    const contactsWereOpen = isExpanded(contactButton);
    setMenu(false, menuWasOpen);
    closeContacts();
    if (contactsWereOpen) contactButton.focus();
  });

  document.addEventListener("click", (event) => {
    if (isExpanded(menuButton) && !closest(event.target, ".site-nav")) setMenu(false);
    if (isExpanded(contactButton) && !closest(event.target, ".contact-panel-wrapper")) closeContacts();
  });
})();
