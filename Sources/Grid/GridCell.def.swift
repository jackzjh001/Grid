//
//  GridCell.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import struct SwiftUI.Environment
import struct SwiftUI.ViewBuilder
import struct SwiftUI.CGRect

public struct GridCell<Content>{
	
	@Environment(\.gridLayout) var layout: GridLayout!
	
	var row: Int
	
	var column: Int
	
	var rowSpan: Int
	
	var columnSpan: Int
	
	@ViewBuilder var content: (CGRect) -> Content
	
	public init(row: Int, column: Int, rowSpan: Int = 1, columnSpan: Int = 1, _ content: @escaping (CGRect) -> Content){
		self.row = row
		self.column = column
		self.rowSpan = rowSpan
		self.columnSpan = columnSpan
		self.content = content
	}
	
}
