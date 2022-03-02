//
//  View+gridCell.swift
//  
//
//  Created by 赵家辉 on 2022/2/28.
//

import protocol SwiftUI.View

extension View{
	
	/// Sets the grid cell parameters
	/// - Parameters:
	///   - rows: Row index in the grid.
	///   - columns: Column index in the grid.
	///   - rowSpan: A number indicates how many rows the cell spans to (defaults to 1).
	///   - columnSpan: A number indicates how many columns the cell spans to (defaults to 1).
	/// - Returns: A view with grid cell parameters set to the value you supply.
	public func gridCell(row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1) -> some View{
		self.modifier(GridCellModifier(row: row, column: column, rowSpan: rowSpan, columnSpan: columnSpan))
	}
	
}
