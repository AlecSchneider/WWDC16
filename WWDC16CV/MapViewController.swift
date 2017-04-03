//
//  ViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 20/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: ViewController, MKMapViewDelegate {
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue){
    }
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.hybrid
        case 2:
            mapView.mapType = MKMapType.satellite
        default:
            break;
        }
    }
    class ColorPointAnnotation: MKPointAnnotation {
        var pinColor: UIColor
        
        init(pinColor: UIColor) {
            self.pinColor = pinColor
            super.init()
        }
    }

    override func viewDidLoad() {
        
        let span = MKCoordinateSpanMake(0.006, 0.006)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.3928398, longitude: 13.12843959), span: span)
        
        
        let home = ColorPointAnnotation(pinColor: UIColor.green())
        home.title = "Home"
        home.coordinate = CLLocationCoordinate2DMake( 52.39263309,  13.13071093)
        
        let villa = ColorPointAnnotation(pinColor: UIColor.blue())
        villa.title = "Villa"
        villa.coordinate = CLLocationCoordinate2DMake( 52.39217198,  13.12384764)

        let hpi = ColorPointAnnotation(pinColor: UIColor.orange())
        hpi.title = "HPI"
        hpi.coordinate = CLLocationCoordinate2DMake( 52.39403793,  13.13347141)

        self.mapView.addAnnotation(home)
        self.mapView.addAnnotation(hpi)
        self.mapView.addAnnotation(villa)
        self.mapView.setRegion(region, animated: true)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longPressHandler(_:)))

      //   self.view.addGestureRecognizer(longPressRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        
        let deepPressGestureRecognizer = DeepPressGestureRecognizer(target: self,
                                                                    action: #selector(MapViewController.deepPressHandler(_:)),
                                                                    threshold: 1)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.longPressHandler(_:)))
        longPressRecognizer.minimumPressDuration = 2

        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            let colorPointAnnotation = annotation as! ColorPointAnnotation
            pinView?.canShowCallout = true
            pinView?.pinTintColor = colorPointAnnotation.pinColor
            pinView?.animatesDrop = true
            pinView?.tintColor = colorPointAnnotation.pinColor
        }
        else {
            pinView?.annotation = annotation
        }
        pinView?.addGestureRecognizer(deepPressGestureRecognizer)
        if self.traitCollection.forceTouchCapability != UIForceTouchCapability.available
        {
            pinView?.addGestureRecognizer(longPressRecognizer)
            print(pinView?.gestureRecognizers)

        }
        
        return pinView
    }
    
    func longPressHandler(_ value: UILongPressGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.began
        {
            print("deep press begin")
            
            let touchLocation = value.location(in: value.view!.window)
            
            let bounds = CGRect(origin: CGPoint.zero, size: value.view!.frame.size)
            
            
            // Create CAShapeLayerS
            let rectShape = CAShapeLayer()
            rectShape.bounds = bounds
            print(value.view!)
            rectShape.position = touchLocation
            rectShape.cornerRadius = bounds.width / 2
            view.layer.addSublayer(rectShape)
            
            rectShape.fillColor = value.view!.tintColor.cgColor
            
            // 1
            // begin with a circle with a 50 points radius
            let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 75).cgPath
            // animation end with a large circle with 500 points radius
            let endShape = UIBezierPath(roundedRect: CGRect(x: -675, y: -675, width: 1500, height: 1500), cornerRadius: 750).cgPath
            
            // set initial shape
            rectShape.path = startShape
            
            // 2
            // animate the `path`
            let animation = CABasicAnimation(keyPath: "path")
            animation.toValue = endShape
            animation.duration = 1 // duration is 1 sec
            // 3
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
            animation.fillMode = kCAFillModeBoth // keep to value after finishing
            animation.isRemovedOnCompletion = false // don't remove after finishing
            // 4
            rectShape.add(animation, forKey: animation.keyPath)
            
            switch value.view!.tintColor {
                
            case (UIColor.orange()):
                self.detailData = 0
                break
            case (UIColor.blue()):
                self.detailData = 1
                break
            case (UIColor.green()):
                self.detailData = 2
                break
            default:
                print("default")
            }
            
            var seconds = 0.8
            var delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.after(when: dispatchTime, execute: {
                
                self.performSegue(withIdentifier: "HPIDetail", sender: nil)
                
            })
            
            seconds = 2.0
            delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.after(when: dispatchTime, execute: {
                rectShape.removeFromSuperlayer()
            })
            
            
        }
        else if value.state == UIGestureRecognizerState.ended
        {
            print("deep press ends.")
        }
    }

    
    func deepPressHandler(_ value: DeepPressGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.began
        {
            print("deep press begin")
            
            let touchLocation = value.location(in: value.view!.window)
            
            let bounds = CGRect(origin: CGPoint.zero, size: value.view!.frame.size)
            
            
            // Create CAShapeLayerS
            let rectShape = CAShapeLayer()
            rectShape.bounds = bounds
            print(value.view!)
            rectShape.position = touchLocation
            rectShape.cornerRadius = bounds.width / 2
            view.layer.addSublayer(rectShape)
                        
            rectShape.fillColor = value.view!.tintColor.cgColor
            
            // 1
            // begin with a circle with a 50 points radius
            let startShape = UIBezierPath(roundedRect: bounds, cornerRadius: 75).cgPath
            // animation end with a large circle with 500 points radius
            let endShape = UIBezierPath(roundedRect: CGRect(x: -675, y: -675, width: 1500, height: 1500), cornerRadius: 750).cgPath
            
            // set initial shape
            rectShape.path = startShape
            
            // 2
            // animate the `path`
            let animation = CABasicAnimation(keyPath: "path")
            animation.toValue = endShape
            animation.duration = 1 // duration is 1 sec
            // 3
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
            animation.fillMode = kCAFillModeBoth // keep to value after finishing
            animation.isRemovedOnCompletion = false // don't remove after finishing
            // 4
            rectShape.add(animation, forKey: animation.keyPath)
                        
            switch value.view!.tintColor {
                
            case (UIColor.orange()):
                self.detailData = 0
                break
            case (UIColor.blue()):
                self.detailData = 1
                break
            case (UIColor.green()):
                self.detailData = 2
                break
            default:
                print("default")
            }
            
            var seconds = 0.8
            var delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.after(when: dispatchTime, execute: {
                
                self.performSegue(withIdentifier: "HPIDetail", sender: nil)
                
            })
            
            seconds = 2.0
            delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
            
            DispatchQueue.main.after(when: dispatchTime, execute: {
                rectShape.removeFromSuperlayer()
            })

            
        }
        else if value.state == UIGestureRecognizerState.ended
        {
            print("deep press ends.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "HPIDetail" {
            if let destination = segue.destinationViewController as? ViewController {
                destination.detailData = self.detailData
            }
        }
    }
}

