import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  received(data) {

    if (data.notice || data.alert) {
      const Toast = Swal.mixin({
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000,
        timerProgressBar: true,
        didOpen: (toast) => {
          toast.onmouseenter = Swal.stopTimer
          toast.onmouseleave = Swal.resumeTimer
        }
      })

      Toast.fire({
        icon: data.notice ? "success" : "warning", title: data.notice || data.alert
      })
    }
  }
})
