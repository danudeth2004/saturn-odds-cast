import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["test", "form"]

  static values = { submitUrl: String, approveUrl: String, rejectUrl: String }

  connect() {
  }

  submit(){
    this.formTarget.action = this.submitUrlValue
  }
  approve(){
    this.formTarget.action = this.approveUrlValue
  }
  reject(){
    this.formTarget.action = this.rejectUrlValue
  }
}
