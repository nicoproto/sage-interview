import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ['input'];

  search() {
    const type = this.element.dataset.type;
    const query = type == "words" ? this.inputTarget.value : this.element.dataset.query;

    fetch(`/queries?type=${type}&query=${query}`, {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": csrfToken()
        },
      })
      .then(response => response.json())
      .then((data) => {
        // Cleaning up previous results
        document.getElementById("pagination").innerHTML = "";
        document.getElementById("pages").innerHTML = "";
        document.getElementById("results").removeAttribute('data-controller', 'pagination');

        this.paginate(data)

        // Add information to results, updated visibility and connected controller
        document.getElementById("results").setAttribute('data-id', data["id"]);
        document.getElementById("results").setAttribute('data-controller', 'pagination');
        document.getElementById("email-field").classList.remove('hidden');
      })
  }

  paginate(data) {
    // Grouping in pages for pagination
    const resultArray = [];

    while (data["value"].length) {
      resultArray.push(data["value"].splice(0, 10));
    }

    resultArray.forEach(function (value, i) {
      const pageClass = i == 0 ? "" : "hidden";

      const resultPage = `<div class="${pageClass}" data-pagination-target="page" data-page=${i}>${value.map(x => `<li>${x}</li>`).join('')}</div>`;
      document.getElementById("pages").insertAdjacentHTML('beforeend', resultPage);

      const btnText = i == 0 ? "First" : i + 1;
      if (resultArray.length > 1) {
        const paginationButton = `<button data-action="pagination#goTo" data-page=${i}>${btnText}</div>`;
        document.getElementById("pagination").insertAdjacentHTML('beforeend', paginationButton);
      }
    })
  }
}
