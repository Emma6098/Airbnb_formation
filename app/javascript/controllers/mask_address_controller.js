import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-address"
export default class extends Controller {
  static targets = ["maskedElement", "deleteTexte"]

  connect() {
    console.log("Hello from toggle_controller.js")
  }
  fire() {
    this.maskedElementTarget.classList.toggle("d-none");
    this.deleteTexteTarget.value = "";
  }
}
