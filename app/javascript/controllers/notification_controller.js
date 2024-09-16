import { Controller } from "@hotwired/stimulus"
import { useTransition } from 'stimulus-use';

export default class extends Controller {
  static targets = ['notification']
  static values = {
    timer: Number
  }

  connect() {
    console.log(this.timerValue)
    const timer = this.timerValue || 5000
    const controller = this
    const notification = this.notificationTarget

    useTransition(this, {
      element: this.notificationTarget,
      enterActive: 'slide-enter-active',
      enterFrom: 'slide-enter-from',
      enterTo: 'slide-enter-to',
      leaveActive: 'slide-leave-active',
      leaveFrom: 'slide-leave-from',
      leaveTo: 'slide-leave-to',
      hidden_class: 'd-none',
      transitioned: false,
    });

    this.enter()

    setTimeout(async function () {
      await controller.leave();
      controller.element.remove()
    }, timer);
  }

  close(event) {
    event.preventDefault();
    this.leave();
  }
}
