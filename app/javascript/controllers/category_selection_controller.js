import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category-selection"
export default class extends Controller {
  static targets = ["input"]
  selected(event) {
    console.log(event)
    event.currentTarget.classList.toggle("active")
    this.inputTarget.value += `${event.currentTarget.innerText};`
  }
}
