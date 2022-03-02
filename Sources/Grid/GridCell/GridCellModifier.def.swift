//
//  GridCellModifier.def.swift
//  
//
//  Created by 赵家辉 on 2022/2/28.
//

/// A modifier that wraps the content view inside a ``GridCell``
struct GridCellModifier{
	
	/// Row index in the grid.
	var row: Int
	
	/// Column index in the grid.
	var column: Int
	
	/// A number indicates how many rows the cell spans to (defaults to 1).
	var rowSpan: Int
	
	/// A number indicates how many columns the cell spans to (defaults to 1).
	var columnSpan: Int
	
}
