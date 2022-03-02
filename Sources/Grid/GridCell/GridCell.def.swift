//
//  GridCell.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import struct SwiftUI.Environment
import struct SwiftUI.ViewBuilder
import struct SwiftUI.CGRect

/// A view wrapper cooperates ``Grid``.
public struct GridCell<Content>{
	
	/// Holds the grid layout configuration for this grid.
	@Environment(\.gridLayout) var layout: GridLayout!
	
	/// Row index in the grid.
	var row: Int
	
	/// Column index in the grid.
	var column: Int
	
	/// A number indicates how many rows the cell spans to (defaults to 1).
	var rowSpan: Int
	
	/// A number indicates how many columns the cell spans to (defaults to 1).
	var columnSpan: Int
	
	/// The wrapped view to be located in the grid.
	@ViewBuilder var content: (CGRect) -> Content
	
	/// Creates a new instance from the given row and column index.
	/// - Parameters:
	///   - rows: Row index in the grid.
	///   - columns: Column index in the grid.
	///   - rowSpan: A number indicates how many rows the cell spans to (defaults to 1).
	///   - columnSpan: A number indicates how many columns the cell spans to (defaults to 1).
	///   - content: The wrapped view to be located in the grid.
	public init(row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1, @ViewBuilder _ content: @escaping (CGRect) -> Content){
		self.row = row
		self.column = column
		self.rowSpan = rowSpan
		self.columnSpan = columnSpan
		self.content = content
	}
	
}
