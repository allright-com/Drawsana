//
//  DragOnlyPenTool.swift
//
//  Created by Alex Frankiv on 2/17/19.
//  Copyright © 2019 Alex Frankiv. All rights reserved.
//

public class DragonlyPenTool: PenTool {
	
	override public func handleDragEnd(context: ToolOperationContext, point: CGPoint) {
		guard let segments = self.shapeInProgress?.segments, !segments.isEmpty else {
			// intentionally nothing for tap (like in web version)
			return
		}
		super.handleDragEnd(context: context, point: point)
	}
}
