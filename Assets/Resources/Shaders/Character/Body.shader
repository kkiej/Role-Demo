Shader "LiteRenderPipeline/Character/Body"
{
    Properties
    {
        [KeywordEnum(None, Face, Hair, UpperBody, LowerBody)]
        _Area ("Material Area", Float) = 0
        [HideInInspector] _HeadForward("", Vector) = (0,0,1)
        [HideInInspector] _HeadRight("", Vector) = (1,0,0)
        
        [Hedaer(Base Color)]
        [HideInInspector] _BaseMap("", 2D) = "white" {}
        [NoScaleOffset] _FaceColorMap("Face Color Map", 2D) = "white"{}
        [NoScaleOffset] _HairColorMap("Hair Color Map", 2D) = "white" {}
        [NoScaleOffset] _UpperBodyColorMap("Upper Body Color Map", 2D) = "white" {}
        [NoScaleOffset] _LowerBodyColorMap("Lower Body Color Map", 2D) = "white" {}
        _FrontFaceTintColor("Front Face Tint Color", Color) = (1, 1, 1, 1)
        _BackFaceTintColor("Back Face Tint Color", Color) = (1, 1, 1, 1)
        _Alpha("Alpha", Range(0, 1)) = 1
        _AlphaClip("Alpha Clip", Range(0, 1)) = 0.333
        
        [Header(Light Map)]
        [NoScaleOffset] _HairLightMap("Hair Light Map", 2D) = "black" {}
        [NoScaleOffset] _UpperBodyLightMap("Upper Body Light Map", 2D) = "black" {}
        [NoScaleOffset] _LowerBodyLightMap("Lower Body Light Map", 2D) = "black" {}
        
        [Header(Ramp Map)]
        [NoScaleOffset] _HairCoolRamp("Hair Cool Ramp", 2D) = "white" {}
        [NoScaleOffset] _HairWarmRamp("Hair Warm Ramp", 2D) = "white" {}
        [NoScaleOffset] _BodyCoolRamp("Body Cool Ramp", 2D) = "white" {}
        [NoScaleOffset] _BodyWarmRamp("Body Warm Ramp", 2D) = "white" {}
        
        [Header(Indirect Lighting)]
        _IndirectLightFlattenNormal("Indirect Light Flatten Normal", Range(0, 1)) = 0
        _IndirectLightUsage("Indirect Light Usage", Range(0, 1)) = 0.5
        _IndirectLightOcclusionUsage("Indirect Light Occlusion Usage", Range(0, 1)) = 0.5
        _IndirectLightMixBaseColor("Indirect Light Mix Base Color", Range(0, 1)) = 1
        
        [Header(Main Lighting)]
        _MainLightColorUsage("Main Light Color Usage", Range(0, 1)) = 1
        _ShadowThresholdCenter("Shadow Threshold Center", Range(-1, 1)) = 0
        _ShadowThresholdSoftness("Shadow Threshold Softness", Range(0, 1)) = 0.1
        _ShadowRampOffset("Shadow Ramp Offset", Range(0, 1)) = 0.75
        
        [Header(Face)]
        [NoScaleOffset] _FaceMap("Face Map", 2D) = "black" {}
        _FaceShadowOffset("Face Shadow Offset", Range(-1, 1)) = -0.01
        _FaceShadowTransitionSoftness("Face Shadow Transition Softness", Range(0, 1)) = 0.05
        
        [Header(Specular)]
        _SpecularExponent("Specular Exponent", Range(1, 128)) = 50
        _SpecularKsNonMetal("Specular Ks Non-Metal", Range(0, 1)) = 0.04
        _SpecularKsMetal("Specular Ks Metal", Range(0, 1)) = 1
        _SpecularBrightness("Specular Brightness", Range(0, 10)) = 1
        
        [Header(Stockings)]
        [NoScaleOffset] _UpperBodyStockings("Upper Body Stockings", 2D) = "black" {}
        [NoScaleOffset] _LowerBodyStockings("Lower Body Stockings", 2D) = "black" {}
        _StockingsDarkColor("Stockings Dark Color", Color) = (0, 0, 0, 1)
        [HDR] _StockingsLightColor("Stockings Light Color", Color) = (1.8, 1.48299, 0.856821)
        [HDR] _StockingsTransitionColor("Stockings Transition Color", Color) = (0.360381, 0.242986, 0.358131)
        _StockingsTransitionThreshold("Stockings Transition Threshold", Range(0, 1)) = 0.58
        _StockingsTransitionPower("Stockings Transition Power", Range(0.1, 50)) = 1
        _StockingsTransitionHardness("Stockings Transition Hardness", Range(0, 1)) = 0.4
        _StockingsTextureUsage("Stockings Texture Usage", Range(0, 1)) = 0.1
        
        [Header(Rim Lighting)]
        _RimLightWidth("Rim Light Width", Range(0, 10)) = 1
        _RimLightThreshold("Rim Light Threshold", Range(-1, 1)) = 0.05
        _RimLightFadeout("Rim Light Fadeout", Range(0.01, 1)) = 1
        [HDR] _RimLightTintColor("Rim Light Tint Color", Color) = (1, 1, 1)
        _RimLightBrightness("Rim Light Brightness", Range(0, 10)) = 1
        _RimLightMixAlbedo("Rim Light Mix Albedo", Range(0, 1)) = 0.9
        
        [Header(Emission)]
        [Toggle(_EMISSION_ON)] _UseEmission("Use Emission", Float) = 0
        _EmissionMixBaseColor("Emission Mix Base Color", Range(0, 1)) = 1
        _EmissionTintColor("Emission Tint Color", Color) = (1, 1, 1)
        _EmissionIntensity("Emission Intensity", Range(0, 100)) = 1
        
        [Header(Outline)]
        [Toggle(_OUTLINE_ON)] _UseOutline("Use Outline", Float) = 1
        [Toggle(_OUTLINE_VERTEX_COLOR_SMOOTH_NORMAL)] _OutlineUseVertexColorSmoothNormal("Use Vertex Color Smooth Normal", Float) = 0
        _OutlineWidth("Outline Width", Range(0, 10)) = 1
        _OutlineGamma("Outline Gamma", Range(1, 255)) = 16
        
        [Header(Surface Options)]
        [Enum(UnityEngine.Rendering.CullMode)] _Cull("Cull Mode", Float) = 2
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlendMode("Src Blend Mode", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlendMode("Dst Blend Mode", Float) = 0
        [Enum(UnityEngine.Rendering.BlendOp)] _BlendOp("Blend Operation", Float) = 0
        [Enum(Off, 0, On, 1)] _ZWrite("ZWrite", Float) = 1
        _StencilRef("Stencil Reference", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp("Stencil Comparison", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilPassOp("Stencil Pass Operation", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilFailOp("Stencil Fail Operation", Int) = 0
        [Enum(UnityEngine.Rendering.StencilOp)] _StencilZFailOp("Stencil Z Fail Operation", Int) = 0
        
        [Header(Draw Overlay)]
        [Toggle(_DRAW_OVERLAY_ON)] _UseDrawOverlay("Use Draw Overlay", Float) = 0
        [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlendModeOverlay("Overlay Pass Src Blend Mode", Float) = 1
        [Enum(UnityEngine.Rendering.BlendMode)] _DstBlendModeOverlay("Overlay Pass Dst Blend Mode", Float) = 0
        [Enum(UnityEngine.Rendering.BlendOp)] _BlendOpOverlay("Overlay Pass Blend Operation", Float) = 0
        _StencilRefOverlay("Overlay Pass Stencil Reference", Range(0, 255)) = 0
        [Enum(UnityEngine.Rendering.CompareFunction)] _StencilCompOverlay("Overlay Pass Stencil Comparison", Int) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" 
            "RenderPipeline" = "LiteRenderPipeline"
            "LiteRPMaterialType" = "Lit"
            "IgnoreProjector" = "True" }
        LOD 100

        HLSLINCLUDE
        #pragma shader_feature_local _AREA_FACE
        #pragma shader_feature_local _AREA_HAIR
        #pragma shader_feature_local _AREA_UPPERBODY
        #pragma shader_feature_local _AREA_LOWERBODY
        #pragma shader_feature_local _OUTLINE_ON
        #pragma shader_feature_local _OUTLINE_VERTEX_COLOR_SMOOTH_NORMAL
        #pragma shader_feature_local _DRAW_OVERLAY_ON
        #pragma shader_feature_local _EMISSION_ON
        ENDHLSL

        Pass
        {
            Name "ShadowCaster"
            Tags{"LightMode" = "ShadowCaster"}
            
            ZWrite [_ZWrite]
            ZTest LEqual
            ColorMask 0
            Cull [_Cull]
            
            HLSLPROGRAM
            #pragma exclude_renderers gles gles3 glcore
            #pragma target 4.5

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature_local_fragment _ALPHATEST_ON
            #pragma shader_feature_local_fragment _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            // -------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON

            // -------------------------------------
            // Universal Pipeline Keywords
            // This is used during shadow map generation to differentiate between directional and punctual light shadows, as they use different formulas to apply Normal Bias
            #pragma multi_compile_vertex _ _CASTING_PUNCUAL_LIGHT_SHADOW

            #pragma vertex ShadowPassVertex
            #pragma fragment ShadowPassFragment

            #include "Packages/com.unity.render-pipelines.universal//ShaderLibrary/Input.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
            ENDHLSL
        }

        Pass
        {
            Name "DepthOnly"
            Tags{"LightMode" = "DepthOnly"}
            
            ZWrite [_ZWrite]
            ColorMask 0
            Cull [_Cull]
            
            HLSLPROGRAM
            #pragma exclude_renderers gles gles3 glcore
            #pragma target 4.5

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature_local_fragment _ALPHATEST_ON
            #pragma shader_feature_local_fragment _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            // -------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON

            // -------------------------------------
            // Universal Pipeline Keywords

            #pragma vertex DepthOnlyVertex
            #pragma fragment DepthOnlyFragment

            #include "Assets/LiteRP/Runtime/ShaderLibrary/LitInput.hlsl"
            #include "Assets/LiteRP/Runtime/ShaderLibrary/DepthOnlyPass.hlsl"
            ENDHLSL
        }

        /*Pass
        {
            Name "DepthNormals"
            Tags{"LightMode" = "DepthNormals"}
            
            ZWrite [_ZWrite]
            Cull [_Cull]
            
            HLSLPROGRAM
            #pragma exclude_renderers gles gles3 glcore
            #pragma target 4.5

            // -------------------------------------
            // Material Keywords
            #pragma shader_feature_local _NORMALMAP
            #pragma shader_feature_local _PARALLAXMAP
            #pragma shader_feature_local _ _DETAIL_MULX2 _DETAIL_SCALED
            #pragma shader_feature_local_fragment _ALPHATEST_ON
            #pragma shader_feature_local_fragment _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

            // -------------------------------------
            // GPU Instancing
            #pragma multi_compile_instancing
            #pragma multi_compile _ DOTS_INSTANCING_ON

            // -------------------------------------
            // Universal Pipeline Keywords

            #pragma vertex DepthNormalsVertex
            #pragma fragment DepthNormalsFragment

            #include "Assets/LiteRP/Runtime/ShaderLibrary/LitInput.hlsl"
            #include "Assets/LiteRP/Runtime/ShaderLibrary/LitDepthNormalsPass.hlsl"
            ENDHLSL
        }*/

        Pass
        {
            Name "DrawCore"
            Tags
            {
                "LightMode" = "LiteForward"
            }
            
            Cull [_Cull]
            ZWrite [_ZWrite]
            Blend [_SrcBlendMode] [_DstBlendMode]
            BlendOp [_BlendOp]
            Stencil
            {
                Ref [_StencilRef]
                Comp [_StencilComp]
                Pass [_StencilPassOp]
                Fail [_StencilFailOp]
                ZFail [_StencilZFailOp]
            }
            
            HLSLPROGRAM
            #pragma multi_compile _MAIN_LIGHT_SHADOWS
            #pragma multi_compile _MAIN_LIGHT_SHADOWS_CASCADE
            #pragma multi_compile _SHADOWS_SOFT
            #pragma multi_compile_fog

            #pragma vertex DrawCoreVertex
            #pragma fragment DrawCoreFragment

            #include "SRUniversalInput.hlsl"
            #include "SRuniversalDrawCorePass.hlsl"
            ENDHLSL
        }
    }
}
