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
					calculate(withRows: vm.rowDefinitions, columns: vm.columnDefinitions, height: p.size.height, width: p.size.width)
				}
				.onChange(of: p.size){ size in
					calculate(withRows: vm.rowDefinitions, columns: vm.columnDefinitions, height: size.height, width: size.width)
				}
				.onReceive(vm.$rowDefinitions){ rows in
					calculate(withRows: rows, columns: vm.columnDefinitions, height: p.size.height, width: p.size.width)
				}
				.onReceive(vm.$columnDefinitions){ columns in
					calculate(withRows: vm.rowDefinitions, columns: columns, height: p.size.height, width: p.size.width)
				}
		}
		.environment(\.gridLayout, layout)
	}
	
}
