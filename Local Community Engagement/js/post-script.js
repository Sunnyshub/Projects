document.addEventListener('DOMContentLoaded', function () {
    var modal = document.getElementById("addPostModal");
    var btn = document.querySelector(".add-activity-button-home");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "block";
    }

    span.onclick = function () {
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    document.getElementById("postForm").addEventListener("submit", function (e) {
        e.preventDefault();
        var title = document.getElementById("postTitle").value;
        var content = document.getElementById("postContent").value;
        addPost(title, content);
        modal.style.display = "none";
    });
});

function addPost(title, content) {
    var mainContainer = document.querySelector("main");
    var newPostHtml = `
        <section>
            <div class="container">
                <div class="container-left">
                    <img src="images/Leaderboard/Grandma.png" alt="User Image" class="user-image">
                </div>
                <div class="container-right">
                    <h2>${title}</h2>
                    <p>${content}</p>
                    <a href="path-to-read-more.html">Read more...</a>
                    <div class="responses">
                        <a href="">View responses</a>
                    </div>
                </div>
            </div>
        </section>`;
    mainContainer.insertAdjacentHTML('beforeend', newPostHtml);
}
