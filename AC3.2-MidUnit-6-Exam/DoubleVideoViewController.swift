//
//  DoubleVideoViewController.swift
//  AC3.2-MidUnit-6-Exam
//
//  Created by Jason Gresh on 2/3/17.
//  Copyright © 2017 AccessCode. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
import SnapKit



class DoubleVideoViewController: UIViewController, CellTitled, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var titleForCell: String = "Double Video"
    
    @IBOutlet weak var videoContainerTop: UIView!
    @IBOutlet weak var videoContainerBottom: UIView!
    var movieURL: URL?
    var videoVC = AVPlayerViewController()
//    var secondVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //This causes a mess of constraints issues
        videoContainerTop.addSubview(videoVC.view)
//        videoContainerBottom.addSubview(secondVC.view)
        videoContainerBottom.addSubview(videoVC.view)
        
        // don't f with this line
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }

    override func viewDidLayoutSubviews() {
        // update your layers' frames here
        
        videoVC.view.snp.makeConstraints { (view) in
             view.edges.equalTo(videoContainerTop)
        }
        
//        secondVC.view.snp.makeConstraints { (view) in
//            view.edges.equalTo(videoContainerBottom)
//        }
        
    }
    
    @IBAction func loadVideo(_ sender: UIButton) {
        let videoPickerController = UIImagePickerController()
        videoPickerController.sourceType = .photoLibrary
        videoPickerController.mediaTypes = [String(kUTTypeMovie)]
        videoPickerController.delegate = self
        self.present(videoPickerController, animated: true, completion: nil)

    }
    
    //MARK: - UIPickerControllerDelegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        switch info[UIImagePickerControllerMediaType] as! String {
        case String(kUTTypeMovie):
            if let url = info[UIImagePickerControllerReferenceURL] as? URL  {
                self.movieURL = url
                let playerItem = AVPlayerItem(url: movieURL!)
                self.videoVC.player = AVPlayer(playerItem: playerItem)
                let playerLayer = AVPlayerLayer(player: self.videoVC.player)
                self.videoContainerTop.layer.addSublayer(playerLayer)
                playerLayer.player?.play()

            }
        default:
            print("cannot get media")
        }
        dismiss(animated: true) {
            if let url = self.movieURL {
                let player = AVPlayer(url: url)
                let playerController = AVPlayerViewController()
                playerController.player = player
                self.present(playerController, animated: true, completion: {
                    self.movieURL = nil
                })
            }
        }
    }

    
}
