// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33859,y:32870,varname:node_9361,prsc:2|emission-9931-OUT;n:type:ShaderForge.SFN_TexCoord,id:1625,x:32293,y:32810,varname:node_1625,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:1329,x:32473,y:32810,varname:node_1329,prsc:2,spu:0.1,spv:0.1|UVIN-1625-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:8014,x:32728,y:32810,ptovrint:False,ptlb:FirstTexture,ptin:_FirstTexture,varname:node_8014,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b6938f7e8f4329c40aaedacb20f834c2,ntxv:0,isnm:False|UVIN-1329-UVOUT;n:type:ShaderForge.SFN_Add,id:2172,x:33208,y:32997,varname:node_2172,prsc:2|A-2476-OUT,B-7431-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:4095,x:33454,y:32997,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_4095,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1af45cacbc75a3245b2546bbd8079c97,ntxv:0,isnm:False|UVIN-2172-OUT;n:type:ShaderForge.SFN_Multiply,id:2476,x:33149,y:32727,varname:node_2476,prsc:2|A-6033-OUT,B-6357-OUT;n:type:ShaderForge.SFN_Panner,id:2582,x:32477,y:33009,varname:node_2582,prsc:2,spu:0,spv:0.1|UVIN-1625-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:1614,x:32714,y:33029,ptovrint:False,ptlb:SecondTexture,ptin:_SecondTexture,varname:node_1614,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:87a9c25a75c34c146b94fda20fa43750,ntxv:0,isnm:False|UVIN-2582-UVOUT;n:type:ShaderForge.SFN_Add,id:6357,x:32936,y:32922,varname:node_6357,prsc:2|A-8014-R,B-1614-R;n:type:ShaderForge.SFN_Panner,id:7431,x:32458,y:33203,varname:node_7431,prsc:2,spu:0.2,spv:0.2|UVIN-1625-UVOUT;n:type:ShaderForge.SFN_Color,id:5551,x:33396,y:32647,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_5551,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0.7517242,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:9931,x:33625,y:32726,varname:node_9931,prsc:2|A-5551-RGB,B-4095-RGB,C-187-OUT;n:type:ShaderForge.SFN_Time,id:7774,x:32384,y:32622,varname:node_7774,prsc:2;n:type:ShaderForge.SFN_Sin,id:6033,x:32572,y:32622,varname:node_6033,prsc:2|IN-7774-T;n:type:ShaderForge.SFN_Distance,id:187,x:32920,y:33436,varname:node_187,prsc:2|A-1625-V,B-2253-OUT;n:type:ShaderForge.SFN_Clamp01,id:2253,x:32717,y:33414,varname:node_2253,prsc:2|IN-6033-OUT;proporder:4095-5551-8014-1614;pass:END;sub:END;*/

Shader "HCS/GlassEmission" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        [HDR]_MainColor ("MainColor", Color) = (0,0.7517242,1,1)
        _FirstTexture ("FirstTexture", 2D) = "white" {}
        _SecondTexture ("SecondTexture", 2D) = "white" {}
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
            uniform sampler2D _FirstTexture; uniform float4 _FirstTexture_ST;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform sampler2D _SecondTexture; uniform float4 _SecondTexture_ST;
            uniform float4 _MainColor;
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
                float4 node_7774 = _Time;
                float node_6033 = sin(node_7774.g);
                float4 node_5488 = _Time;
                float2 node_1329 = (i.uv0+node_5488.g*float2(0.1,0.1));
                float4 _FirstTexture_var = tex2D(_FirstTexture,TRANSFORM_TEX(node_1329, _FirstTexture));
                float2 node_2582 = (i.uv0+node_5488.g*float2(0,0.1));
                float4 _SecondTexture_var = tex2D(_SecondTexture,TRANSFORM_TEX(node_2582, _SecondTexture));
                float2 node_2172 = ((node_6033*(_FirstTexture_var.r+_SecondTexture_var.r))+(i.uv0+node_5488.g*float2(0.2,0.2)));
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(node_2172, _MainTexture));
                float3 emissive = (_MainColor.rgb*_MainTexture_var.rgb*distance(i.uv0.g,saturate(node_6033)));
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
