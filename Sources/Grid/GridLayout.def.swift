//
//  GridLayout.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import struct SwiftUI.CGFloat

struct GridLayout{
	
	var heights: [CGFloat]
	
	var widths: [CGFloat]
	
	var x: [CGFloat]
	
	var y: [CGFloat]
	
	init(rows: Int, columns: Int){
		heights = .init(repeating: 0, count: rows)
		widths = .init(repeating: 0, count: columns)
		y = .init(repeating: 0, count: rows)
		x = .init(repeating: 0, count: columns)
	}
	
}
