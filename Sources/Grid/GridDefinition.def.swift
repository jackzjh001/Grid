//
//  GridDefinition.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import struct SwiftUI.CGFloat

public enum GridDimension{
	
	case fixed(_: CGFloat)
	
	case dynamic(_: CGFloat = 1)
	
}
