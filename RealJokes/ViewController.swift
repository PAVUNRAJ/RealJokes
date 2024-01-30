//
//  ViewController.swift
//  RealJokes
//
//  Created by PavunRaj on 28/01/24.
//

import UIKit
import CoreLocation
import ARKit


class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        sceneView.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let config = ARWorldTrackingConfiguration()
        sceneView.session.run(config)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sceneView.session.pause()
    }
    @IBAction func findObject(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FindRealObject") as? FindRealObject
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    

}


// MARK: LocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            print("Location\(location)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
}

// MARK: SceneDelegate

extension ViewController: ARSCNViewDelegate {
    
}


