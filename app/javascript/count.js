function count(){
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener('keyup', () => {
    const fee = itemPrice.value * 0.1
    const salesProfit = itemPrice.value * 0.9

    const fee_floor = Math.floor(fee)
    const salesProfit_ceil = Math.ceil(salesProfit)

    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")

    addTaxPrice.innerHTML = `${fee_floor}`
    profit.innerHTML = `${salesProfit_ceil}`
  });
};

setInterval(count, 1000);
