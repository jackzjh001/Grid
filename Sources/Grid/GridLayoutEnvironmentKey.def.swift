//
//  GridLayoutEnvironmentKey.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import protocol SwiftUI.EnvironmentKey

struct GridLayoutEnvironmentKey: EnvironmentKey{
	
	typealias Value = GridLayout?
	
	static var defaultValue: GridLayout?
	
}
