import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.sidebarElement = this.element;
    this.resizeHandler = this.updateSidebarVisibility.bind(this);
    window.addEventListener("resize", this.resizeHandler);
    
    requestAnimationFrame(() => {
      this.updateSidebarVisibility();
    });
  }

  disconnect() {
    window.removeEventListener("resize", this.resizeHandler);
    this.closeSidebar();
  }

  updateSidebarVisibility() {
    const isMobile = window.innerWidth < 768;
    if (!isMobile) {
      this.closeSidebar();
    }
  }

  closeSidebar() {
    this.sidebarElement.classList.remove("active");
    document.body.classList.remove("sidebar-open");
    const overlay = document.querySelector(".sidebar-overlay");
    if (overlay) {
      overlay.classList.add("opacity-0");
      setTimeout(() => overlay.remove(), 300);
    }
  }

  toggle() {
    const isActive = this.sidebarElement.classList.contains("active");
    
    if (isActive) {
      this.closeSidebar();
    } else {
      requestAnimationFrame(() => {
        this.sidebarElement.classList.add("active");
        document.body.classList.add("sidebar-open");
        
        const overlay = document.createElement("div");
        overlay.className = "sidebar-overlay opacity-0";
        overlay.addEventListener("click", () => this.toggle());
        document.body.appendChild(overlay);
        
        overlay.offsetHeight;
        requestAnimationFrame(() => {
          overlay.classList.remove("opacity-0");
        });
      });
    }
  }
}
