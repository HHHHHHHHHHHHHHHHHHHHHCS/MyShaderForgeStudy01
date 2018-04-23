// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-1034-OUT;n:type:ShaderForge.SFN_Panner,id:5302,x:32131,y:32864,varname:node_5302,prsc:2,spu:0.3,spv:0|UVIN-7503-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7503,x:31814,y:33006,varname:node_7503,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:1034,x:32800,y:32933,varname:node_1034,prsc:2|A-9944-OUT,B-1063-OUT;n:type:ShaderForge.SFN_Panner,id:1532,x:32127,y:33111,varname:node_1532,prsc:2,spu:0,spv:0.2|UVIN-7503-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7909,x:32393,y:32879,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_7909,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:600624ded2b17344aa5b8e68f36b1837,ntxv:0,isnm:False|UVIN-5302-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:7178,x:32393,y:33114,ptovrint:False,ptlb:SecondTexture,ptin:_SecondTexture,varname:node_7178,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1af45cacbc75a3245b2546bbd8079c97,ntxv:0,isnm:False|UVIN-1532-UVOUT;n:type:ShaderForge.SFN_Color,id:2032,x:32372,y:32663,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_2032,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:2,c3:2,c4:1;n:type:ShaderForge.SFN_Multiply,id:9944,x:32570,y:32823,varname:node_9944,prsc:2|A-2032-RGB,B-7909-R;n:type:ShaderForge.SFN_Color,id:8793,x:32410,y:33389,ptovrint:False,ptlb:SecondColor,ptin:_SecondColor,varname:node_8793,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:22,c2:2,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:1063,x:32586,y:33238,varname:node_1063,prsc:2|A-7178-RGB,B-8793-RGB,C-2486-OUT;n:type:ShaderForge.SFN_Distance,id:2486,x:32200,y:33306,varname:node_2486,prsc:2|A-7503-V,B-6394-OUT;n:type:ShaderForge.SFN_Time,id:7813,x:31592,y:33462,varname:node_7813,prsc:2;n:type:ShaderForge.SFN_Sin,id:2815,x:31823,y:33478,varname:node_2815,prsc:2|IN-7813-T;n:type:ShaderForge.SFN_Clamp01,id:3202,x:31992,y:33478,varname:node_3202,prsc:2|IN-2815-OUT;n:type:ShaderForge.SFN_OneMinus,id:6394,x:32173,y:33478,varname:node_6394,prsc:2|IN-3202-OUT;proporder:7909-7178-2032-8793;pass:END;sub:END;*/

Shader "HCS/Emission" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _SecondTexture ("SecondTexture", 2D) = "white" {}
        [HDR]_MainColor ("MainColor", Color) = (0,2,2,1)
        [HDR]_SecondColor ("SecondColor", Color) = (22,2,0,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform sampler2D _SecondTexture; uniform float4 _SecondTexture_ST;
            uniform float4 _MainColor;
            uniform float4 _SecondColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 node_9034 = _Time;
                float2 node_5302 = (i.uv0+node_9034.g*float2(0.3,0));
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_5302, _MainTexture));
                float2 node_1532 = (i.uv0+node_9034.g*float2(0,0.2));
                float4 _SecondTexture_var = tex2D(_SecondTexture,TRANSFORM_TEX(node_1532, _SecondTexture));
                float4 node_7813 = _Time;
                float3 emissive = ((_MainColor.rgb*_MainTexture_var.r)+(_SecondTexture_var.rgb*_SecondColor.rgb*distance(i.uv0.g,(1.0 - saturate(sin(node_7813.g))))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
