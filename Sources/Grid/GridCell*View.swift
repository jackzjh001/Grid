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
			switch layout.type{
				case .normal:
					Group{
						// Bounds Check
						if layout.x.indices.contains(column), layout.y.indices.contains(row), columnSpan > 0, rowSpan > 0{
							let columnRange = (column..<column + columnSpan).clamped(to: layout.widths.indices)
							let rowRange = (row..<row + rowSpan).clamped(to: layout.heights.indices)
							let widthSum = layout.widths[columnRange].reduce(0, +)
							let heightSum = layout.heights[rowRange].reduce(0, +)
							let x: CGFloat = layout.x[column] - 0.5 * layout.widths[column] + 0.5 * widthSum
							let y: CGFloat = layout.y[row] - 0.5 * layout.heights[row] + 0.5 * heightSum
							content(CGRect(x: x, y: y, width: widthSum, height: heightSum))
								.frame(width: widthSum, height: heightSum)
							//.clipped()
								.position(x: x, y: y)
						}
					}
					//.transition(.asymmetric(insertion: .opacity.animation(.default), removal: .identity))
					//.transition(.opacity.animation(.default))
				case .uniform:
					if let width = layout.widths.first, let height = layout.heights.first, column > 0, row > 0, columnSpan > 0, rowSpan > 0{
						let unitWidth = width / CGFloat(layout.columns)
						let unitHeight = height / CGFloat(layout.rows)
						let x = (CGFloat(column) + CGFloat(columnSpan) / 2) * unitWidth
						let y = (CGFloat(row) + CGFloat(rowSpan) / 2) * unitHeight
						content(CGRect(x: x, y: y, width: unitWidth * CGFloat(columnSpan), height: unitHeight * CGFloat(rowSpan)))
							.frame(width: unitWidth * CGFloat(columnSpan), height: unitHeight * CGFloat(rowSpan))
							.position(x: x, y: y)
					} else{
						fatalError("Internal Error")
					}
			}
		} else{
			content(CGRect.null)
		}
	}
	
}


