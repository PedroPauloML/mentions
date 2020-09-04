import Tribute from "tributejs";

document.addEventListener("DOMContentLoaded", () => {
  if (document.getElementById("post_content")) {
    var tribute = new Tribute({
      values: function (text, cb) {
        remoteSearch(text, (users) => cb(users));
      },
      lookup: function (user, mentionText) {
        return `${user.key} (${user.value})`;
      },
    });
    tribute.attach(document.getElementById("post_content"));
  }
});

function remoteSearch(text, cb) {
  var URL = "/users/for_mentions.json";
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4) {
      if (xhr.status === 200) {
        var data = JSON.parse(xhr.responseText);
        cb(data);
      } else if (xhr.status === 403) {
        cb([]);
      }
    }
  };
  xhr.open("GET", URL + "?q=" + text, true);
  xhr.send();
}
