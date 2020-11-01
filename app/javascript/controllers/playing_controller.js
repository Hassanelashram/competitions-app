import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'picture' ];

  full() {
    let img = this.pictureTarget
    window.open(img.src, '_blank');
  }
}
