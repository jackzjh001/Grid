//
//  UniformGrid.def.swift
//  
//
//  Created by 赵家辉 on 2022/3/3.
//

import SwiftUI

/// A ``Grid``-like container that has uniform space distribution.
public struct UniformGrid<Content>{
	
	/// Holds the grid layout configuration for this grid.
	@State var layout: GridLayout
	
	/// A container for ``UniformGrid``'s row & column counts.
	var vm: ViewModel
	
	/// The child view to be hosted in the grid.
	@ViewBuilder var content: () -> Content
	
	/// Creates a new instance from the given row and column counts.
	/// - Parameters:
	///   - rows: A number indicates row count in the grid.
	///   - columns: A number indicates column count in the grid.
	///   - content: The child view to be hosted in the grid.
	public init(rows: Int, columns: Int, @ViewBuilder _ content: @escaping () -> Content){
		vm = .init(rows: rows, columns: columns)
		self.layout = .init(rows: rows, columns: columns, type: .uniform)
		self.content = content
	}
	
}
