(() => {
  "use strict";

  document.documentElement.classList.add("js");

  const mobileQuery = window.matchMedia("(max-width: 767px)");
  const menuButton = document.querySelector(".site-nav__toggle");
  const menu = document.querySelector(".site-nav__links");
  const contactButton = document.querySelector(".contact-toggle");
  const contactPanel = document.querySelector(".author__urls");

  const setButtonState = (button, expanded, labels) => {
    if (!button) return;
    button.setAttribute("aria-expanded", String(expanded));
    if (labels) button.setAttribute("aria-label", expanded ? labels.close : labels.open);
  };

  const closeContact = () => {
    if (!contactButton || !contactPanel) return;
    setButtonState(contactButton, false);
    contactPanel.classList.remove("is--visible");
  };

  const closeMenu = ({ restoreFocus = false } = {}) => {
    if (!menuButton || !menu) return;
    setButtonState(menuButton, false, { open: "Open navigation menu", close: "Close navigation menu" });
    menu.classList.remove("is-open");
    if (mobileQuery.matches) menu.hidden = true;
    if (restoreFocus) menuButton.focus();
  };

  const openMenu = () => {
    if (!menuButton || !menu || !mobileQuery.matches) return;
    closeContact();
    menu.hidden = false;
    menu.classList.add("is-open");
    setButtonState(menuButton, true, { open: "Open navigation menu", close: "Close navigation menu" });
    menu.querySelector("a")?.focus();
  };

  const syncMenuToViewport = () => {
    if (!menuButton || !menu) return;
    menu.classList.remove("is-open");
    setButtonState(menuButton, false, { open: "Open navigation menu", close: "Close navigation menu" });
    menu.hidden = mobileQuery.matches;
  };

  if (menuButton && menu) {
    syncMenuToViewport();

    menuButton.addEventListener("click", () => {
      const expanded = menuButton.getAttribute("aria-expanded") === "true";
      expanded ? closeMenu() : openMenu();
    });

    menu.addEventListener("click", (event) => {
      if (event.target.closest("a")) closeMenu();
    });

    mobileQuery.addEventListener("change", syncMenuToViewport);
  }

  if (contactButton && contactPanel) {
    contactButton.addEventListener("click", () => {
      const expanded = contactButton.getAttribute("aria-expanded") === "true";
      closeMenu();
      setButtonState(contactButton, !expanded);
      contactPanel.classList.toggle("is--visible", !expanded);
    });
  }

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") return;
    const menuWasOpen = menuButton?.getAttribute("aria-expanded") === "true";
    closeMenu({ restoreFocus: menuWasOpen });
    closeContact();
  });

  document.addEventListener("click", (event) => {
    if (menuButton && menu && !menuButton.contains(event.target) && !menu.contains(event.target)) closeMenu();
    if (contactButton && contactPanel && !contactButton.contains(event.target) && !contactPanel.contains(event.target)) closeContact();
  });
})();
