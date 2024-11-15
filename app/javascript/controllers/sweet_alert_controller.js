import {Controller} from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static targets = ["button"]
  static values = {
    controllerPath: String,
  }

  confirmDelete(event) {
    event.preventDefault()
    this.showConfirmationDialog(
      "Are you sure you want to delete this?",
      "This action cannot be undone.",
      () => this.submitSignOutForm(event.target.href)
    )
  }

  confirmSignOut(event) {
    event.preventDefault()
    this.showConfirmationDialog(
      "Are you sure you want to sign out?",
      "",
      () => this.submitSignOutForm(event.target.href)
    )
  }

  showConfirmationDialog(title, text, onConfirm) {
    Swal.fire({
      title: title,
      text: text,
      icon: "warning",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "Cancel",
    }).then((result) => {
      if (result.isConfirmed) {
        onConfirm()
      }
    })
  }

  submitSignOutForm(actionUrl) {
    const form = document.createElement("form")
    form.method = "POST"
    form.action = actionUrl

    const csrfToken = document.querySelector("meta[name='csrf-token']")?.getAttribute("content")
    if (!csrfToken) {
      console.error("CSRF token not found")
      return
    }

    const csrfInput = document.createElement("input")
    csrfInput.type = "hidden"
    csrfInput.name = "authenticity_token"
    csrfInput.value = csrfToken
    form.appendChild(csrfInput)

    const methodInput = document.createElement("input")
    methodInput.type = "hidden"
    methodInput.name = "_method"
    methodInput.value = "delete"
    form.appendChild(methodInput)

    document.body.appendChild(form)
    form.submit()
  }
}