import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Import and register all TailwindCSS Components
import { Alert, Dropdown, Modal, Tabs, Popover, Toggle, Slideover } from "tailwindcss-stimulus-components"
application.register('alert', Alert)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)

// Import custom controllers
import HomepageController from "./controllers/homepage_controller"
import AboutController from "./controllers/about_controller"
import EventsController from "./controllers/events_controller"

application.register("homepage", HomepageController)
application.register("about", AboutController)
application.register("events", EventsController)

// Initialize AOS
const initAOS = () => {
  if (typeof AOS !== 'undefined') {
    AOS.init({
      duration: 800,
      once: true,
      offset: 100,
      delay: 100
    });
  }
};

// Initialize on first load
document.addEventListener('DOMContentLoaded', initAOS);

// Initialize on Turbo navigation
document.addEventListener('turbo:load', initAOS);
document.addEventListener('turbo:render', () => {
  if (typeof AOS !== 'undefined') {
    AOS.refresh();
  }
});

// Export for importmap
window.Stimulus = application
