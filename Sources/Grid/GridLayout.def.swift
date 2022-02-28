//
//  GridLayout.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import struct SwiftUI.CGFloat

/// A container holds grid layout configuration
struct GridLayout{
	
	/// Heights for each row in the grid.
	var heights: [CGFloat]
	
	/// Widths for each column in the grid.
	var widths: [CGFloat]
	
	/// X-Axis positions for each column in the grid.
	var x: [CGFloat]
	
	/// Y-Axis positions for each row in the grid.
	var y: [CGFloat]
	
	/// Creates a new instance from the given row and column counts.
	/// - Parameters:
	///   - rows: Number of rows in the grid
	///   - columns: Number of columns in the grid
	init(rows: Int, columns: Int){
		heights = .init(repeating: 0, count: rows)
		widths = .init(repeating: 0, count: columns)
		y = .init(repeating: 0, count: rows)
		x = .init(repeating: 0, count: columns)
	}
	
}
