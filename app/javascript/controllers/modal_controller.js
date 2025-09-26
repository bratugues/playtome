import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {

  static targets = ["gameform"]
  connect() {
    this.modal = new bootstrap.Modal(this.gameformTarget)
  }

  open(){
    this.modal.show()
  }

  close(){
    this.modal.hide()
  }

  submitEnd(e){
    if (e.detail.success) {
      this.close();
    }
  }
}
