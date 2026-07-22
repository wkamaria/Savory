import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "container"]

  add(event) {
    event.preventDefault()
    const newIndex = new Date().getTime()
    const newField = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, newIndex)
    this.containerTarget.insertAdjacentHTML("beforeend", newField)
  }

  remove(event) {
    event.preventDefault()
    const item = event.target.closest(".ingredient-row")
    const destroyInput = item.querySelector("input[name*='_destroy']")

    if (destroyInput) {
      destroyInput.value = "1"
      item.style.display = "none"
    } else {
      item.remove()
    }
  }
}
