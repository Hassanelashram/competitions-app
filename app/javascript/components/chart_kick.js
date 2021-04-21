import chartkick from "chartkick"

const chartKick = () => {
    let countryBtn = document.getElementById('country-btn');
    const chart = document.getElementById('chart-views');
    
    if (chart === null) {
        return
    }
    chart.classList.add("visible")
    countryBtn.addEventListener('click', () => {
      chart.classList.toggle("visible")
    })
}

export { chartKick }