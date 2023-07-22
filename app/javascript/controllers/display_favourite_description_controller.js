import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-favourite-description"
export default class extends Controller {
  static targets = ["description"]
  revealContent(event) {
    console.log(event)
    event.currentTarget.classList.toggle("active");
  }
}
