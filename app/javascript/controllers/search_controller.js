import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay"]

  toggle() {
    this.overlayTarget.classList.toggle("show")
  }

  close() {
    this.overlayTarget.classList.remove("show")
  }
}
