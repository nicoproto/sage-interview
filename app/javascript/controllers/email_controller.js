import { Controller } from "@hotwired/stimulus";
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "input" ]

  send() {
    const factId = document.getElementById('results').dataset.id

    if (this.inputTarget != "") {
      fetch(`/queries/${factId}/send?email=${this.inputTarget.value}`, {
          method: "POST",
          headers: {
            "Accept": "application/json",
            "X-CSRF-Token": csrfToken()
          },
        })
    }
  }
}