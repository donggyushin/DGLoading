import UIKit

open class DGLoading {
    public static let shared = DGLoading()
    private var customView: UIView?
    private var window: UIWindow?
    
    private init() {
        if #available(iOS 13, *) {
            window = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene) }).flatMap({ $0.windows }).first(where: { $0.isKeyWindow })
        } else {
            window = UIApplication.shared.keyWindow
        }
    }
    
    public convenience init(_ customView: UIView) {
        self.init()
        self.customView = customView
    }
    
    public func startLoading() {
        stopLoading()
        guard let window = window else { return }

        if let customView = customView {
            window.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                customView.centerYAnchor.constraint(equalTo: window.centerYAnchor),
                customView.centerXAnchor.constraint(equalTo: window.centerXAnchor)
            ])
            return
        }
        
        var indicator: UIActivityIndicatorView?
        
        if #available(iOS 13, *) {
            indicator = .init(style: .medium)
        } else {
            indicator = .init()
        }
        
        guard let indicator = indicator else { return }
        
        window.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            indicator.centerXAnchor.constraint(equalTo: window.centerXAnchor)
        ])
        indicator.startAnimating()
    }
    
    public func stopLoading() {
        customView?.removeFromSuperview()
        window?.subviews.filter({ $0 is UIActivityIndicatorView }).forEach({ $0.removeFromSuperview() })
    }
    
}
