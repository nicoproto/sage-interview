import {
  Controller
} from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["results"]

  connect() {
    // Fetching categories from API to insert dynamically
    fetch("https://api.chucknorris.io/jokes/categories")
      .then(response => response.json())
      .then((data) => {
        data.forEach((category) => {
          const categoryLink = `
          <li>
            <button
              class="p-2 font-semibold hover:bg-yellow-300 transition-all capitalize"
              data-controller="facts"
              data-action="facts#search"
              data-type="category"
              data-query="${category}">
              ${category}
            </button>
          </li>`;

          this.resultsTarget.insertAdjacentHTML('beforeend', categoryLink);
        });
      })
  }
}
