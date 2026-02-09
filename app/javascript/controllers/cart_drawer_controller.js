import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["drawer", "overlay"]

    connect() {
        this.isOpen = false
    }

    open(event) {
        if (event) event.preventDefault()
        this.isOpen = true
        this.drawerTarget.classList.remove("translate-x-full")
        this.overlayTarget.classList.remove("opacity-0", "pointer-events-none")
        document.body.classList.add("overflow-hidden")
    }

    close(event) {
        if (event) event.preventDefault()
        this.isOpen = false
        this.drawerTarget.classList.add("translate-x-full")
        this.overlayTarget.classList.add("opacity-0", "pointer-events-none")
        document.body.classList.remove("overflow-hidden")
    }
}
