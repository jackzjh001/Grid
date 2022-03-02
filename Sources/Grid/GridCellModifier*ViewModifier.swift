//
//  GridCellModifier*ViewModifier.swift
//  
//
//  Created by 赵家辉 on 2022/2/28.
//

import SwiftUI

extension GridCellModifier: ViewModifier{
	
	func body(content: Content) -> some View {
		GridCell(row: row, column: column, rowSpan: rowSpan, columnSpan: columnSpan){ _ in
			content
		}
	}
	
}
