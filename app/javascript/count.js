function count(){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('keyup', () => {
    const countVal = itemPrice.value
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    const addTaxPriceAns = Math.floor(countVal / 10)
    addTaxPrice.innerHTML = `${addTaxPriceAns}`;
    const profitAns = Math.ceil(countVal - addTaxPrice.innerHTML)
    profit.innerHTML = `${profitAns}`;
  })
}
window.addEventListener('load', count);