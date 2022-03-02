//
//  UniformGrid.ViewModel.def.swift
//  
//
//  Created by 赵家辉 on 2022/3/3.
//

import protocol SwiftUI.ObservableObject
import struct SwiftUI.Published

extension UniformGrid{
	
	/// A container for ``UniformGrid``'s row & column counts.
	class ViewModel: ObservableObject{
		
		/// Number of rows in the grid
		@Published var rows: Int
		
		/// Number of columns in the grid
		@Published var columns: Int
		
		/// Creates a new instance from the given row and column counts.
		/// - Parameters:
		///   - rows: A number indicates row count in the grid.
		///   - columns: A number indicates column count in the grid.
		init(rows: Int, columns: Int){
			precondition(rows > 0 && columns > 0, "Invalid Row / Column Count")
			self.rows = rows
			self.columns = columns
		}
	}
	
}
