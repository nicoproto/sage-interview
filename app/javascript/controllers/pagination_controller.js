import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['page', 'btn'];

  initialize() {
    this.currentPage = 0
  }

  goTo(event) {
    this.pageTargets[this.currentPage].classList.add("hidden");
    this.pageTargets[event.target.dataset.page].classList.remove("hidden");

    this.btnTargets[this.currentPage].classList.remove('font-bold')

    this.currentPage = event.target.dataset.page;
    console.log(this.btnsTarget)
    event.target.classList.add('font-bold');
  }
}