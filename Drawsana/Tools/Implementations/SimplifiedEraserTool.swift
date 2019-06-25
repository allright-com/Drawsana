//
//  InsecureEraserTool.swift
//
//  Created by Alex Frankiv on 2/17/19.
//  Copyright © 2019 Alex Frankiv. All rights reserved.
//

public class SimplifiedEraserTool: DrawingTool {
	
	/* DISCLAIMER:
	* This kind of interaction is completely NOT iOS-like. The removing process should be handled on drag end.
	* However, in web-version we have this approach so we have to create the same interaction experience.
	*/
	
	public var isProgressive: Bool = false
	public var name: String = "SimplifiedEraser"
	
	// MARK: - API
	public init() {}
	
	public func handleTap(context: ToolOperationContext, point: CGPoint) {
		removeShape(context: context, at: point)
	}
	
	public func handleDragStart(context: ToolOperationContext, point: CGPoint) {
		// intentionally nothing
	}
	
	public func handleDragContinue(context: ToolOperationContext, point: CGPoint, velocity: CGPoint) {
		// intentionally nothing
	}
	
	public func handleDragEnd(context: ToolOperationContext, point: CGPoint) {
		removeShape(context: context, at: point)
	}
	
	public func handleDragCancel(context: ToolOperationContext, point: CGPoint) {
		// intentionally nothing
	}
	
	// MARK: - Private logic
    private func removeShape(context: ToolOperationContext, at point: CGPoint) {
        let plusPoint = CGPoint(x: point.x + 5.0, y: point.y + 5.0)
        let minusPoint = CGPoint(x: point.x - 5.0, y: point.y - 5.0)
        print(point)
        if let shape = context.drawing.getShape(at: point) {
            context.operationStack.apply(operation: RemoveShapeOperation(shape: shape))
        }
        
        if let shape = context.drawing.getShape(at: plusPoint) {
            context.operationStack.apply(operation: RemoveShapeOperation(shape: shape))
        }
        
        if let shape = context.drawing.getShape(at: minusPoint) {
            context.operationStack.apply(operation: RemoveShapeOperation(shape: shape))
        }
    }
}
