//
//  GridLayout.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import struct SwiftUI.CGFloat

/// A container holds grid layout configuration
struct GridLayout{
	
	/// Type of the hosting grid
	enum GridType{
		case normal
		case uniform
	}
	
	/// Type of the hosting grid
	var type: GridType
	
	/// Number of rows in the grid
	///
	/// Only used if hosted by ``UniformGrid``.
	var rows: Int
	
	/// Number of columns in the grid
	///
	/// Only used if hosted by ``UniformGrid``.
	var columns: Int
	
	/// Heights for each row in the grid.
	///
	/// If hosted by ``UniformGrid``, contains only 1 element representing total height.
	var heights: [CGFloat]
	
	/// Widths for each column in the grid.
	///
	/// If hosted by ``UniformGrid``, contains only 1 element representing total width.
	var widths: [CGFloat]
	
	/// X-Axis positions for each column in the grid.
	///
	/// If hosted by ``UniformGrid``, contains no element.
	var x: [CGFloat]
	
	/// Y-Axis positions for each row in the grid.
	///
	/// If hosted by ``UniformGrid``, contains no element.
	var y: [CGFloat]
	
	/// Creates a new instance from the given row and column counts.
	/// - Parameters:
	///   - rows: Number of rows in the grid.
	///   - columns: Number of columns in the grid.
	init(rows: Int, columns: Int, type: GridType = .normal){
		self.rows = rows
		self.columns = columns
		self.type = type
		heights = .init(repeating: 0, count: rows)
		widths = .init(repeating: 0, count: columns)
		y = .init(repeating: 0, count: rows)
		x = .init(repeating: 0, count: columns)
	}
	
}
