//
//  Grid.ViewModel.def.swift
//  
//
//  Created by 赵家辉 on 2022/3/3.
//

import protocol SwiftUI.ObservableObject
import struct SwiftUI.Published

extension Grid{
	
	/// A container for ``Grid``'s row & column definitions.
	class ViewModel: ObservableObject{
		
		/// Creates a new instance from the given row and column definitions.
		/// - Parameters:
		///   - rowDefinitions: An array stores row definitions.
		///   - columnsDefinitions: An array stores row definitions.
		init(rowDefinitions: [GridDimension], columnDefinitions: [GridDimension]){
			precondition(!(!rowDefinitions.isEmpty && !columnDefinitions.isEmpty), "Invalid Row / Column Definitions")
			self.rowDefinitions = rowDefinitions
			self.columnDefinitions = columnDefinitions
		}
		/// An array stores row definitions.
		@Published var rowDefinitions: [GridDimension]
		
		/// An array stores column definitions.
		@Published var columnDefinitions: [GridDimension]
	}
	
}
