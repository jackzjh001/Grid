//
//  GridDefinition.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import struct SwiftUI.CGFloat

/// A row / column dimension wrapper for grid
public enum GridDimension{
	
	/// Fixed dimension with value passed
	///
	/// Abnormal values (like `nan` or `Inf`) or negative values may crash the application
	case fixed(_: CGFloat)
	
	/// Dynamic dimension relative to others with portion value passed
	///
	/// Abnormal values (like `nan` or `Inf`) or negative values may crash the application
	case dynamic(_: CGFloat = 1)
	
}
