//
//  Grid.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/23.
//

import struct SwiftUI.State
import struct SwiftUI.ViewBuilder
import struct SwiftUI.CGFloat

/// A container view that arranges its child views in a grid, hosting ``GridCell``s and allocate space for it.
public struct Grid<Content>{
	
	/// Holds the grid layout configuration for this grid.
	@State var layout: GridLayout
	
	/// An array stores row definitions.
	let rowDefinitions: [GridDimension]
	
	/// An array stores column definitions.
	let columnDefinitions: [GridDimension]
	
	/// The child view to be hosted in the grid.
	@ViewBuilder let content: () -> Content
	
	/// Creates a new instance from the given row and column definitions.
	/// - Parameters:
	///   - rowDefinitions: An array stores row definitions.
	///   - columns: An array stores row definitions.
	///   - content: The child view to be hosted in the grid.
	public init(rowDefinitions: [GridDimension],
				columnDefinitions: [GridDimension],
				_ content: @escaping () -> Content){
		self.rowDefinitions = rowDefinitions
		self.columnDefinitions = columnDefinitions
		self.content = content
		layout = GridLayout(rows: rowDefinitions.count, columns: columnDefinitions.count)
	}
	
	/// Calculates absolute dimensions according to native device.
	/// - Parameters:
	///   - dimensions: Relative dimensions of rows or columns.
	///   - absoluteTotal: Absolute dimension of the grid's height or width.
	/// - Returns: Absolute dimensions of rows or columns.
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
	
	/// Calculates positions according to absolute dimensions of the cells.
	/// - Parameters:
	///   - absoluteDimensions: Absolute dimensions of rows or columns.
	/// - Returns: X-Axis or Y-Axis positions of cells.
	func calculatePositions(_ absoluteDimensions: [CGFloat]) -> [CGFloat]{
		var positions = [CGFloat](repeating: 0, count: absoluteDimensions.count)
		for index in absoluteDimensions.indices{
			let last = index == 0 ? 0 : positions[index - 1]
			let offset = index == 0 ? 0 : 0.5 * absoluteDimensions[index - 1]
			positions[index] = last + offset + 0.5 * absoluteDimensions[index]
		}
		return positions
	}
	
	/// Calculate dimensions and positions according to grid's height and width
	/// - Parameters:
	///   - height: The grid's height
	///   - width: The grid's width
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
