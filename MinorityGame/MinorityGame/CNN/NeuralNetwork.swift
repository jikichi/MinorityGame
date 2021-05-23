//
//  NeuralNetwork.swift
//  MinorityGame
//
//  Created by jikichi on 2021/05/20.
//

import Foundation

final class NeuralNetwork {
    var layers: [Layer] = []
    var learningRate = Float(0.05)
    var epochs = 30
    var batchSize = 16
}

class Layer {
    var neurons: [Neuron] = []
    var function: ActivationFunction
    var output: DataPiece?
    
    init(function: ActivationFunction) {
        self.function = function
    }
}

struct Neuron {
    var weight: [Float]
    var weightsDelta: [Float]
    var bias: Float
    var delta: Float
}

protocol ActivationFunction {
    var rawValue: Int { get }
    func transfer(input: Float) -> Float
    func derivative(output: Float) -> Float
}

struct Sigmoid: ActivationFunction {
    var rawValue: Int = 0
    
    func transfer(input: Float) -> Float {
        return 1.0 / (1.0 + exp(-input))
    }
    
    func derivative(output: Float) -> Float {
        return output * (1.0 - output)
    }
}

func getActivationFunction(rawValue: Int) -> ActivationFunction {
    switch rawValue {
    default:
        return Sigmoid()
    }
}

enum ActivationFunctionRaw: Int {
    case sigmoid = 0
}

func forward(input: DataPiece) -> DataPiece {
    return input
}

func backward(input: DataPiece, previous: Layer?) -> DataPiece {
    return input
}

func deltaWeights(input: DataPiece, learningRate: Float) -> DataPiece {
    return input
}
func updateWeight() {
    return
}

//func train(set: Dataset) -> Float {
//    var error = Float.zero
//    for epoch in 0 ..< epochs {
//        var shuffledSet = set.items.shuffled()
//        error = Float.zero
//        while !shuffledSet.isEmpty {
//            let batch = shuffled.prefix(bachSize)
//            for item in batch {
//                let predictions = forward(input: item.input)
//            }
//        }
//    }
//    
//}

