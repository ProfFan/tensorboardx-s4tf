import Foundation
import TensorFlow
import Python

public protocol HistogramWritable {
    func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int?)
}

extension SummaryWriter {
    public func addHistograms<L: HistogramWritable>(tag: String, layer: L, globalStep: Int? = nil) {
        layer.writeHistograms(tag: tag, writer: self, globalStep: globalStep)
    }
}

extension Dense: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).weight", values: weight, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

extension Conv1D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

extension Conv2D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

extension Conv3D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

// TODO: Not yet available in the latest release v0.6.0.
//extension TransposedConv1D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
//    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
//        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
//        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
//    }
//}

extension TransposedConv2D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

// TODO: Not yet available in the latest release v0.6.0.
//extension TransposedConv3D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
//    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
//        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
//        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
//    }
//}

extension DepthwiseConv2D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).filter", values: filter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

extension SeparableConv1D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).depthwiseFilter", values: depthwiseFilter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).pointwiseFilter", values: pointwiseFilter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}

extension SeparableConv2D: HistogramWritable where Scalar: FloatingPoint&PythonConvertible {
    public func writeHistograms(tag: String, writer: SummaryWriter, globalStep: Int? = nil) {
        writer.addHistogram(tag: "\(tag).depthwiseFilter", values: depthwiseFilter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).pointwiseFilter", values: pointwiseFilter, globalStep: globalStep)
        writer.addHistogram(tag: "\(tag).bias", values: bias, globalStep: globalStep)
    }
}
