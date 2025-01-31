import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Re-initialize AOS when the controller connects
    if (typeof AOS !== 'undefined') {
      AOS.refresh()
    }
  }
}
