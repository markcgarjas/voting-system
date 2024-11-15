import {Controller} from "@hotwired/stimulus";
import Swal from "sweetalert2";

export default class extends Controller {
  static values = {
    notice: String, alert: String
  };

  connect() {
    let notice = this.noticeValue
    let alert = this.alertValue

    if (notice || alert) {
      const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.onmouseenter = Swal.stopTimer;
          toast.onmouseleave = Swal.resumeTimer;
        }
      });

      Toast.fire({
        icon: notice ? "success" : "warning", title: notice || alert
      });
    }
  }
}
