//
//  ScannerViewController.swift
//  SeanKit
//
//  Created by Sean Li on 4/16/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import AVFoundation
import UIKit

public protocol ScannerViewControllerDelegate {
    func found(code: String)
}

public class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    public var scannerDelegate: ScannerViewControllerDelegate!
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // EXPLANATION:
        
        // AVCaptureSession()
        // To record anything, you create a "session" for it.
        
        
        // Then walk away from it for a second. In our case, we're doing video, so we:
        
        // - create the device which can capture video. -- AVCaptureDevice.default(for: .video)
        
        // - get the video input from that device. -- AVCaptureDeviceInput(device: videoCaptureDevice)
        
        // Finally, add it as an input to the capture session if possible.
        
        // Then, not only do we need to add an input to capture session, but also an output for metadata (scanning codes) -- AVVCaptureMetadataOutput().
        
        // We specify that the output is looking for certain codes (.qr, etc.)
        
        // This metadata output object also needs a delegate, which is self.
        
        // Because the VC is the delegate, we call a function that gets called when an output is read. In this case, this function also stops the camera session. It also extracts the string.
        
        
        
        // Keep in mind that this whole time, the user does not SEE anything. For the user to see the active video, we need to create a preview layer on that session -- AVCaptureVideoPreviewLayer(session: ourAVCaptureSession)
        
        // We set up this preview layer just like we set any view.
        
        
        
        // Set background to black.
        view.backgroundColor = UIColor.black
        
        // Create a capture session. This contains the whole machine.
        captureSession = AVCaptureSession()
        
        // First, create a device that captures video.
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        // Access the video input of that device.
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        // Add that video input to the capture session. (Before this, the capture session hasn't been linked up with everything we're doing.)
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        // Get the metadata from that capture session. We add this object as an output (sounds oxymoronic).
        // If that's possible, we set the metadata output properties so that it knows what is its delegate, and what metadataObjectTypes to scan.
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417, .qr, .code128, .code39]
        } else {
            failed()
            return
        }
        
        // Until now, the user can't SEE anything. The preview layer is what shows what the AVCaptureSession is showing. We set it like any layer.
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        
        // So we created the whole machine but haven't started running it yet. Now we start it.
        captureSession.startRunning()
    }
    
    
    public func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    
    public func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            scannerDelegate.found(code: stringValue)
        }
        
//        dismiss(animated: true)
    }
    
    
    public override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}
