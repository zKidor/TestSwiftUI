//
//  HikeGraph.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/23.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import SwiftUI

func rangOfRanges<C:Collection>(_ ranges:C)->Range<Double> where C.Element == Range<Double>{
    
    guard !ranges.isEmpty else {
        return 0..<0
    }
    
    let low = ranges.lazy.map{$0.lowerBound}.min()!
    let high = ranges.lazy.map { (range) -> Double in
        return range.upperBound
    }.max()!
    return low..<high
    
}

func magnitude(of range:Range<Double>)->Double{
    return range.upperBound - range.lowerBound
}

struct HikeGraph: View {
    var hike:Hike
    var path:KeyPath<Hike.Observation,Range<Double>>
    
    var color:Color{
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    var body: some View {
        let data = hike.observations
        let overallRange = rangOfRanges(data.lazy.map({ (observation) ->Range<Double> in
            return observation[keyPath:self.path]
        }))
        let maxMagnitude = data.map { (observation) -> Double in
            magnitude(of: observation[keyPath:self.path])
        }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))
        
        return GeometryReader{ proxy in
            
            HStack(alignment: .bottom, spacing: proxy.size.width / 120){
                ForEach(data.indices){ index in
                    GraphCapsule(index: index, height: proxy.size.height, range: data[index][keyPath: self.path], overallRange: overallRange)
                        .colorMultiply(self.color)
                }
            .offset(x: 0, y: proxy.size.height * heightRatio)
            }
            
        }
    }
}

struct HikeGraph_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HikeGraph(hike: hikeData[0], path: \.elevation)
            HikeGraph(hike: hikeData[0], path: \.heartRate)
            HikeGraph(hike: hikeData[0], path: \.pace)
        }.frame(height:200)
    }
}
