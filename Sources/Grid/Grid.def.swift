//
//  Grid.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/23.
//

import struct SwiftUI.State
import struct SwiftUI.ViewBuilder
import struct SwiftUI.CGFloat

public struct Grid<Content>{
	
	@State var layout: GridLayout
	
	let rowDefinitions: [GridDimension]
	
	let columnDefinitions: [GridDimension]
	
	@ViewBuilder let content: () -> Content
	
	public init(rowDefinitions: [GridDimension],
				columnDefinitions: [GridDimension],
				_ content: @escaping () -> Content){
		self.rowDefinitions = rowDefinitions
		self.columnDefinitions = columnDefinitions
		self.content = content
		layout = GridLayout(rows: rowDefinitions.count, columns: columnDefinitions.count)
	}
	
	func calculateAbsoluteDimensions(_ dimensions: [GridDimension], absoluteTotal: CGFloat) -> [CGFloat]{
		var fixedSum: CGFloat = 0
		var dynamicSum: CGFloat = 0
		for dimension in dimensions {
			if case .fixed(let value) = dimension{
				fixedSum += value
			}
			if case .dynamic(let value) = dimension{
				dynamicSum += value
			}
		}
		let dynamicTotal: CGFloat = max(absoluteTotal - fixedSum, 0)
		let dynamicSingle: CGFloat = dynamicTotal / dynamicSum
		var absoluteValue = [CGFloat](repeating: 0, count: dimensions.count)
		for index in rowDefinitions.indices {
			let dimension = rowDefinitions[index]
			if case .fixed(let value) = dimension{
				absoluteValue[index] = value
			}
			if case .dynamic(let value) = dimension{
				absoluteValue[index] = value * dynamicSingle
			}
		}
		return absoluteValue
	}
	
	func calculatePositions(_ absoluteDimensions: [CGFloat]) -> [CGFloat]{
		var positions = [CGFloat](repeating: 0, count: absoluteDimensions.count)
		for index in absoluteDimensions.indices{
			let last = index == 0 ? 0 : positions[index - 1]
			let offset = index == 0 ? 0 : 0.5 * absoluteDimensions[index - 1]
			positions[index] = last + offset + 0.5 * absoluteDimensions[index]
		}
		return positions
	}
	
	func calculate(withHeight height: CGFloat, width: CGFloat){
		let widths = calculateAbsoluteDimensions(columnDefinitions, absoluteTotal: width)
		let heights = calculateAbsoluteDimensions(rowDefinitions, absoluteTotal: height)
		let x = calculatePositions(widths)
		let y = calculatePositions(heights)
		layout.x = x
		layout.y = y
		layout.widths = widths
		layout.heights = heights
	}
	
}
