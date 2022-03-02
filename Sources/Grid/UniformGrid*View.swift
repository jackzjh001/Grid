//
//  UniformGrid*View.swift
//  
//
//  Created by 赵家辉 on 2022/3/3.
//

import SwiftUI

extension UniformGrid: View where Content: View{
	
	public var body: some View{
		GeometryReader{ p in
			content()
				.onAppear{
					layout.heights = [p.size.height]
					layout.widths = [p.size.width]
				}
				.onChange(of: p.size){ size in
					layout.heights = [size.height]
					layout.widths = [size.width]
				}
				.onReceive(vm.$rows){ rows in
					layout.rows = rows
				}
				.onReceive(vm.$columns){ columns in
					layout.columns = columns
				}
		}
		.environment(\.gridLayout, layout)
	}
	
}
