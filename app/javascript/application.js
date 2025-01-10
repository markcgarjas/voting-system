// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "../assets/stylesheets/application.css"
import "./channels"
import Swal from 'sweetalert2';
window.Swal = Swal;
Turbo.session.drive = false;