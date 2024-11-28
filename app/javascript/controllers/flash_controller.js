import {Controller} from "@hotwired/stimulus";
import Swal from "sweetalert2";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = {
    notice: String, alert: String, role: String
  };

  connect() {
    let notice = this.noticeValue
    let alert = this.alertValue
    let role = this.roleValue

    if (notice || alert) {
      this.showNotification(notice, alert);
    }

    if (role === 'admin') {
      this.subscribeToAdminNotifications();
    }
  }

  subscribeToAdminNotifications() {
    consumer.subscriptions.create("NotificationChannel", {
      received: (data) => {
        if (data.notice || data.alert) {
          this.showNotification(data.notice, data.alert);
        }
      }
    });
  }

  showNotification(notice, alert) {
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
