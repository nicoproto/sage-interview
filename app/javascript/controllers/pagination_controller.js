import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['page'];

  initialize() {
    this.currentPage = 0
  }

  goTo(event) {
    this.pageTargets[this.currentPage].classList.add("hidden");
    this.pageTargets[event.target.dataset.page].classList.remove("hidden");
    this.currentPage = event.target.dataset.page;
  }
}