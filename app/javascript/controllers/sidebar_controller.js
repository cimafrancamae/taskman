import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
//   connect() {
//     this.element.textContent = "Hello World!"
//   }

    static targets = ["sidebar", "mainContent"]

    toggleSidebar() {
        this.sidebarTarget.classList.toggle("-translate-x-full")
        this.mainContentTarget.classList.toggle("ml-0")
    }
}
