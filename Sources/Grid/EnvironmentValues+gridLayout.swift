//
//  EnvironmentValues+gridLayout.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import struct SwiftUI.EnvironmentValues

extension EnvironmentValues{
	
	var gridLayout: GridLayout?{
		get{ self[GridLayoutEnvironmentKey.self] }
		set{ self[GridLayoutEnvironmentKey.self] = newValue }
	}
	
}
