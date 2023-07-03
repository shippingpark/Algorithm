
// AViewController.swift

import UIKit





class AViewController: UIViewController {
  @objc func pushToBViewController() {
          let bViewController = BViewController()
          navigationController?.pushViewController(bViewController, animated: true)
      }
}





