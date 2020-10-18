let tax = 0.1
window.addEventListener('load', () =>{
  const price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const add_profit = document.getElementById("profit")
  price.addEventListener("input",() => {
    const price_value = price.value ;
    const tax_price = Math.round(price.value * tax) ;
    const item_profit = price_value - tax_price ;
    add_tax_price.innerHTML = tax_price ;
    add_profit.innerHTML = item_profit ;
  });
});



