//
//  ViewController.swift
//  HW2_Piramid
//
//  Created by 3droot on 03.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Please uncomment one of the MARKs
        //MARK:-> Make line
        drawLine(number: 5, size: 130,distance: 30)
        //MARK:-> Make Stairs
//        drawStairs(number: 4, size: 100, distance: 30)
        //MARK:-> Make Piramid
//        drawPiramid(number: 5, size: 100, distance: 20)
    }
    
    
    //Task 1: Draw a line
    func drawLine(number: Int, size: CGFloat, distance: CGFloat){
        
        let shapeView = UIView()
        
        // add number of boxes to shapeView
        for i in 0 ..< number {
            let boxX =  CGFloat(i)*(size+distance)
            let box = drawBox(x: boxX, y: 0, size: size)
            shapeView.addSubview(box)
        }
        
        centerViewToScreen(shapeView: shapeView, boxNumber: number, linesNumber: 1, boxSize: size, boxDistance: distance)
//        shapeView.backgroundColor = UIColor.red
        view.addSubview(shapeView)
    }
    
    
    //Task 2: Draw stairs
    func drawStairs(number: Int, size: CGFloat, distance: CGFloat) {
        
        let shapeView = UIView()
        
        for i in 0..<number {
            for y in 0..<i+1 {
                let boxX =  CGFloat(y)*(size+distance)
                let boxY = CGFloat(i)*(size+distance)
                let box = drawBox(x: boxX, y: boxY, size: size)
                shapeView.addSubview(box)
            }
        }
        centerViewToScreen(shapeView: shapeView, boxNumber: number, linesNumber: number, boxSize: size, boxDistance: distance)
//        shapeView.backgroundColor = UIColor.red
        view.addSubview(shapeView)
    }
    
    //Task 3: Draw piramid
    func drawPiramid(number: Int, size: CGFloat, distance: CGFloat) {
        
        let shapeView = UIView()
        let centerView = size*CGFloat(number)+CGFloat(number-1)*distance
        
        for i in 0..<number {
            for y in 0..<i+1 {
                let boxFirstX = centerView/2 - (CGFloat(i)+1)*size/2 - distance/2*CGFloat(i)
                let boxX = boxFirstX + CGFloat(y)*(size+distance)
                let boxY = CGFloat(i)*(size+distance)
                let box = drawBox(x: boxX, y: boxY, size: size)
                shapeView.addSubview(box)
            }
        }
        centerViewToScreen(shapeView: shapeView, boxNumber:number, linesNumber: number, boxSize: size, boxDistance: distance)
//        shapeView.backgroundColor = UIColor.red
        view.addSubview(shapeView)
    }
    
    //center view with boxes depends of amount
    func centerViewToScreen(shapeView: UIView, boxNumber: Int, linesNumber: Int, boxSize: CGFloat, boxDistance: CGFloat){
        //make shapeView size the same as content
        shapeView.frame.size.width = CGFloat(boxNumber)*boxSize + CGFloat(boxNumber-1)*boxDistance
        shapeView.frame.size.height = CGFloat(linesNumber)*boxSize + CGFloat(linesNumber-1)*boxDistance
        
        //center viewShape on screen
        shapeView.frame.origin.x = view.frame.midX - shapeView.frame.width/2
        shapeView.frame.origin.y = view.frame.midY - shapeView.frame.height/2
        
    }
    //make a box
    func drawBox(x: CGFloat, y: CGFloat, size: CGFloat) ->UIView{
        let box = UIView()
        box.backgroundColor = UIColor.darkGray
        box.frame = CGRect(x: x, y: y, width: size, height: size)
        return box
    }
}

