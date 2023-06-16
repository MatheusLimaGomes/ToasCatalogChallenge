import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = UIWindow()
        window.windowScene = scene as? UIWindowScene
        let presenter = ToastCatalogPresenter(service: ToastCatalogAdapter(),
                                              viewModelMapper: ToastViewModelMapper())
        let itemsViewController = ItemsViewController(presenter: presenter)
        let navigationController = UINavigationController(rootViewController: itemsViewController)
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
