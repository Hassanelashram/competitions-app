const linkToClipboard = () => {
    const linkBtn = document.getElementById("link-btn");
    linkBtn.addEventListener('click', () => {
    const url = "https://stryfe-app.herokuapp.com/users/sign_up?referrer=";
    navigator.clipboard.writeText(url + linkBtn.dataset.userId).then(function() {
        linkBtn.textContent = "Link Copied"
        linkBtn.classList.add("disabled")
    }, function(err) {
        console.error('Async: Could not copy text: ', err);
    });
    })
}

export { linkToClipboard }