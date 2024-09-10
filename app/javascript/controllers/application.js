import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

Rails.start()
Turbolinks.start()
ActiveStorage.start()

export { application }