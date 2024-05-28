//
//  ContentView.swift
//  Metals
//
//  Created by Can Yoldas on 27/05/2024.
//

import SwiftUI
import MetalKit

struct ContentView: UIViewRepresentable {
    
    static var defaultLibrary: MTLLibrary = {
        guard let library = MTLCreateSystemDefaultDevice()?.makeDefaultLibrary() else { fatalError() }
        
        return library
    }()
    
    func makeCoordinator() -> Renderer {
        return Renderer(self)
    }
    
    
    
    func makeUIView(context: Context) -> MTKView {
       let view = MTKView()
        view.delegate = context.coordinator
        view.preferredFramesPerSecond = 60
        view.enableSetNeedsDisplay = true
        
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            view.device = metalDevice
        }
        
        view.framebufferOnly = false
        view.drawableSize = view.frame.size
        
        
        return view
    }
    
    
    func updateUIView(_ uiView: MTKView, context: Context) { }
}


#Preview {
    ContentView()
}
