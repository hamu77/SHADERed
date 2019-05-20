// constant buffer for projection and view matrix
cbuffer cbStatic : register(b0)
{
	matrix matOrtho;
	matrix matGeo;
};

// vertex input
struct VINPUT
{
	float3 Pos : POSITION;
	float3 Normal : NORMAL;
	float2 UV : TEXCOORD;
};

// vertex output
struct VOUTPUT
{
	float4 Pos : SV_POSITION;
	float2 UV : TEXCOORD;
};

VOUTPUT main(VINPUT vin)
{
	VOUTPUT vout;

	vout.Pos = mul(mul(float4(vin.Pos,1), matGeo), matOrtho);
	vout.UV = vin.UV;

	return vout;
}