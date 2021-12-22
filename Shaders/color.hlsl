//***************************************************************************************
// color.hlsl by Frank Luna (C) 2015 All Rights Reserved.
//
// Transforms and colors geometry.
//***************************************************************************************

cbuffer cbPerObject : register(b0)
{
	float4x4 gWorldViewProj;
	int frame;
};

struct VertexIn
{
	float3 PosL  : POSITION;
    float4 Color : COLOR;
};

struct VertexOut
{
	float4 PosH  : SV_POSITION;
    float4 Color : COLOR;
};

VertexOut VS(VertexIn vin)
{
	VertexOut vout;
	
	// Transform to homogeneous clip space.
	vout.PosH = mul(float4(vin.PosL, 1.0f), gWorldViewProj)*2;
	
	// Just pass vertex color into the pixel shader.
    vout.Color = vin.Color;
    
    return vout;
}

float4 PS(VertexOut pin) : SV_Target
{
	if (frame % 4 == 0)
	{
		float final_color = 1;
		return final_color;
	}
	if (frame % 4 == 1)
	{
		float final_color = 0.5;
		return final_color;
	}
	if (frame % 4 == 2)
	{
		float final_color = 0;
		return final_color;
	}
	else
	{
		float final_color = 0;
		return final_color;
	}
}