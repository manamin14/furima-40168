
document.addEventListener('DOMContentLoaded', function() {
  const priceInput = document.getElementById('item-price');
  const commissionOutput = document.getElementById('commission');
  const profitOutput = document.getElementById('profit');

  priceInput.addEventListener('input', updateOutputs);

  function updateOutputs() {
    const price = parseFloat(priceInput.value);

    // ここで手数料や利益の計算を行うロジックを追加
    const commission = calculateCommission(price);
    const profit = calculateProfit(price, commission);

    // 結果を表示
    commissionOutput.textContent = Math.floor(commission).toFixed(0);
    profitOutput.textContent = Math.floor(profit).toFixed(0);
  }

  function calculateCommission(price) {
    // 手数料の計算ロジックを追加
    // 例: 価格の10%を手数料とする
    return price * 0.1;
  }

  function calculateProfit(price, commission) {
    // 利益の計算ロジックを追加
    // 例: 価格から手数料を差し引いたものを利益とする
    return price - commission;
  }
});
