window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue * 0.1);
    addTaxPrice.innerHTML = tax;
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax;
  });
});

