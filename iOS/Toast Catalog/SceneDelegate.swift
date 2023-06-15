import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        window = UIWindow()
        window?.windowScene = scene as? UIWindowScene
        let presenter = ToastCatalogPresenter(service: ToastCatalogAdapter(),
                                              viewModelMapper: ToastViewModelMapper())
        let itemsViewController = ItemsViewController()
        itemsViewController.presenter = presenter
        window?.rootViewController = itemsViewController
        window?.makeKeyAndVisible()
    }
}
