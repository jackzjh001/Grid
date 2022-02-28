//
//  GridCell*View.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import SwiftUI

extension GridCell: View where Content: View{
	
	public var body: some View{
		// GridView Check
		if let layout = layout{
			let columnRange = (column..<column+columnSpan).clamped(to: layout.widths.indices)
			let rowRange = (row..<row+rowSpan).clamped(to: layout.heights.indices)
			let widthSum = layout.widths[columnRange].reduce(0, +)
			let heightSum = layout.heights[rowRange].reduce(0, +)
			Group{
				// Bounds Check
				if column < layout.x.count && row < layout.y.count{
					let x: CGFloat = layout.x[column] - 0.5 * layout.widths[column] + 0.5 * widthSum
					let y: CGFloat = layout.y[row] - 0.5 * layout.heights[row] + 0.5 * heightSum
					content(CGRect(x: x, y: y, width: widthSum, height: heightSum))
						.frame(width: widthSum, height: heightSum)
						.clipped()
						.position(x: x, y: y)
				}
			}.transition(.opacity)
			
		} else{
			content(CGRect.null)
		}
	}
	
}


