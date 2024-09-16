import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  submitTurboForm(event) {
    event.currentTarget.form.requestSubmit()
  }
}
