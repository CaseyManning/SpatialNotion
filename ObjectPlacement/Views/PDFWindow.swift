//
//  PDFWindow.swift
//  ObjectPlacement
//
//  Created by Casey Manning on 3/8/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI
import PDFKit

// PDF Viewer
struct PDFKitView: UIViewRepresentable {
    
    let pdfDocument: PDFDocument
    
    init(pdfData pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

private func generatePDF() -> Data {
        
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 595, height: 842)) // A4 paper size
        
        let data = pdfRenderer.pdfData { context in
            
            context.beginPage()
            
            let attributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 72)
            ]
            // adding text to pdf
            let text = "I'm a PDF!"
            text.draw(at: CGPoint(x: 20, y: 50), withAttributes: attributes)
            
            // adding image to pdf from assets
            // add an image to xcode assets and rename this.

        }
        
        return data
        
    }

struct PDFWindow: View {
    var body: some View {
        let url = Bundle.main.url(forResource: "greenwald", withExtension: "pdf")!
        PDFKitView(pdfData: PDFDocument(url: url)!)
    }
}

#Preview {
    PDFWindow()
}
