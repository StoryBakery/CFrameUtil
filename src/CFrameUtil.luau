local CFrameUtil = {}

function CFrameUtil.GetQuaternionVector3FromCFrame(cframe: CFrame)
	local axis, angle = cframe:ToAxisAngle()
	return axis * math.sin( angle / 2 )
end


function CFrameUtil.ToQuaternionTable(cframe: CFrame): {number}
	local qVector = CFrameUtil.GetQuaternionVector3FromCFrame(cframe)
	
	return {
		cframe.X,
		cframe.Y,
		cframe.Z,
		qVector.X,
		qVector.Y,
		qVector.Z
	}
end

function CFrameUtil.FromQuaternionTable(qTable: {number}): CFrame
	local x, y, z, qx, qy, qz = table.unpack(qTable)
	local qw = (1 - (qx^2 + qy^2 + qz^2))^0.5
	
	return CFrame.new(x, y, z, qx, qy, qz, qw)
end


return table.freeze(CFrameUtil)