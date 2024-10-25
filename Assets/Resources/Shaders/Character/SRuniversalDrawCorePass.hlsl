#ifndef LITERP_SRUNIVERSAL_PASS_INCLUDED
#define LITERP_SRUNIVERSAL_PASS_INCLUDED

#include "Assets/LiteRP/Runtime/ShaderLibrary/ShaderVariablesFunctions.hlsl"

struct Attributes
{
    float4 positionOS : POSITION;
    half3 normalOS : NORMAL;
    half4 tangentOS : TANGENT;
    float2 uv : TEXCOORD0;
};

struct Varyings
{
    float2 uv : TEXCOORD0;
    float4 positionWSAndFogFactor : TEXCOORD1;
    float3 normalWS : TEXCOORD2;
    float3 viewDirectionWS : TEXCOORD3;
    float3 SH : TEXCOORD4;
    float4 positionCS : SV_POSITION;
};

Varyings DrawCoreVertex(Attributes input)
{
    Varyings output = (Varyings)0;
    UNITY_SETUP_INSTANCE_ID(input);
    UNITY_TRANSFER_INSTANCE_ID(input, output);
    
    VertexPositionInputs vertexInput = GetVertexPositionInputs(input.positionOS.xyz);
    VertexNormalInputs vertexNormalInput = GetVertexNormalInputs(input.normalOS, input.tangentOS);

    output.uv = TRANSFORM_TEX(input.uv, _BaseMap);
    output.positionCS = vertexInput.positionCS;
    
    return output;
}

float4 DrawCoreFragment(Varyings input, bool isFrontFace : SV_IsFrontFace) : SV_TARGET
{
    float3 baseColor = SAMPLE_TEXTURE2D(_BaseMap, sampler_BaseMap, input.uv).rgb;
    float4 areaMap = 0;
#if _AREA_FACE
    areaMap = SAMPLE_TEXTURE2D(_FaceColorMap, sampler_BaseMap, input.uv);
#elif _AREA_HAIR
    areaMap = SAMPLE_TEXTURE2D(_HairColorMap, sampler_BaseMap, input.uv);
#elif _AREA_UPPERBODY
    areaMap = SAMPLE_TEXTURE2D(_UpperBodyColorMap, sampler_BaseMap, input.uv);
#elif _AREA_LOWERBODY
    areaMap = SAMPLE_TEXTURE2D(_LowerBodyColorMap, sampler_BaseMap, input.uv);
#endif
    baseColor = areaMap.rgb;

    float3 albedo = 0;
    albedo += baseColor;
    
    float4 color = float4(albedo, 1);
    return color;
}
#endif