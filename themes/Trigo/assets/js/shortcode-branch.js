/* Tree shortcode script to expand and collapse branches. */

document.addEventListener("DOMContentLoaded", () => {
  document.addEventListener("click", event => {
    const branch = event.target.closest(".branch");
    if (!branch) return;

    branch.dataset.state =
      branch.dataset.state === "open" ? "closed" : "open";
  });
});
