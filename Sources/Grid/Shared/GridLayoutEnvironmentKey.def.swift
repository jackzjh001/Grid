//
//  GridLayoutEnvironmentKey.def.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/26.
//

import protocol SwiftUI.EnvironmentKey

/// A key for accessing ``GridLayout`` value  in the environment.
struct GridLayoutEnvironmentKey: EnvironmentKey{
	
	/// The default value for the `GridLayoutEnvironmentKey`.
	///
	/// If no ``GridLayout`` value passed (for instance, not in a ``Grid``), default to `nil`.
	static var defaultValue: GridLayout?
	
}
