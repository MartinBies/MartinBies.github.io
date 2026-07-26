(() => {
  "use strict";

  document.documentElement.classList.add("js");

  const mobile = window.matchMedia("(max-width: 767px)");
  const menuButton = document.querySelector(".site-nav__toggle");
  const menu = document.querySelector(".site-nav__links");
  const contactButton = document.querySelector(".contact-toggle");
  const contacts = document.querySelector(".author__urls");
  const expanded = (button) => button?.getAttribute("aria-expanded") === "true";

  const setExpanded = (button, open, name = "") => {
    button?.setAttribute("aria-expanded", String(open));
    if (name) button?.setAttribute("aria-label", `${open ? "Close" : "Open"} ${name}`);
  };

  const closeContacts = () => {
    setExpanded(contactButton, false);
    contacts?.classList.remove("is--visible");
  };

  const setMenu = (open, focus = false) => {
    if (!menuButton || !menu) return;
    open = open && mobile.matches;
    if (open) closeContacts();
    setExpanded(menuButton, open, "navigation menu");
    menu.hidden = mobile.matches && !open;
    if (open) menu.querySelector("a")?.focus();
    if (focus) menuButton.focus();
  };

  if (menuButton && menu) {
    setMenu(false);
    menuButton.addEventListener("click", () => setMenu(!expanded(menuButton)));
    menu.addEventListener("click", (event) => event.target.closest("a") && setMenu(false));
    mobile.addEventListener("change", () => setMenu(false));
  }

  contactButton?.addEventListener("click", () => {
    const open = !expanded(contactButton);
    setMenu(false);
    setExpanded(contactButton, open);
    contacts?.classList.toggle("is--visible", open);
  });

  document.addEventListener("keydown", (event) => {
    if (event.key !== "Escape") return;
    const contactWasOpen = expanded(contactButton);
    setMenu(false, expanded(menuButton));
    closeContacts();
    if (contactWasOpen) contactButton.focus();
  });

  document.addEventListener("click", (event) => {
    if (menuButton && menu && !event.target.closest(".site-nav")) setMenu(false);
    if (contactButton && contacts && !event.target.closest(".author__urls-wrapper")) closeContacts();
  });
})();
