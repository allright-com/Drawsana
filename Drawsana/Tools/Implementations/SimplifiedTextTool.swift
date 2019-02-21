//
//  SimplifiedTextTool.swift
//
//  Created by Alex Frankiv on 2/17/19.
//  Copyright © 2019 Alex Frankiv. All rights reserved.
//

public class SimplifiedTextTool: TextTool {
	
	override public func handleDragStart(context: ToolOperationContext, point: CGPoint) {
		// intentionally nothing
	}
	
	override public func finishEditing(context: ToolOperationContext) {
		guard !(self.selectedShape?.text.isEmpty ?? false) else {
			self.applyRemoveShapeOperation(context: context)
			return
		}
		super.finishEditing(context: context)
	}
}
