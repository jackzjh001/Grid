//
//  Grid*View.swift
//  Flex Calc Test
//
//  Created by 赵家辉 on 2022/2/28.
//

import SwiftUI

extension Grid: View where Content: View{
	
	public var body: some View{
		GeometryReader{ p in
			content()
				.onAppear{
					calculate(withHeight: p.size.height, width: p.size.width)
				}
				.onChange(of: p.size){ _ in
					calculate(withHeight: p.size.height, width: p.size.width)
				}
		}
		.environment(\.gridLayout, layout)
	}
	
}
