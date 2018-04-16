// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33324,y:32714,varname:node_9361,prsc:2|emission-9926-OUT,custl-4868-OUT,clip-4939-OUT;n:type:ShaderForge.SFN_Time,id:1459,x:32262,y:33090,varname:node_1459,prsc:2;n:type:ShaderForge.SFN_Sin,id:7083,x:32487,y:33109,varname:node_7083,prsc:2|IN-1459-T;n:type:ShaderForge.SFN_Subtract,id:4939,x:32844,y:32749,varname:node_4939,prsc:2|A-8220-OUT,B-5629-OUT;n:type:ShaderForge.SFN_TexCoord,id:6930,x:32164,y:32740,varname:node_6930,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Add,id:8220,x:32609,y:32749,varname:node_8220,prsc:2|A-5700-OUT,B-6930-U;n:type:ShaderForge.SFN_Noise,id:5700,x:32373,y:32648,varname:node_5700,prsc:2|XY-6930-UVOUT;n:type:ShaderForge.SFN_RemapRange,id:5629,x:32737,y:33124,varname:node_5629,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:3|IN-7083-OUT;n:type:ShaderForge.SFN_ComponentMask,id:2666,x:32757,y:32560,varname:node_2666,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-6930-U;n:type:ShaderForge.SFN_Append,id:4868,x:32935,y:32889,varname:node_4868,prsc:2|A-6930-V,B-9128-OUT,C-9128-OUT;n:type:ShaderForge.SFN_Vector1,id:9128,x:32645,y:32909,varname:node_9128,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9926,x:33059,y:32590,varname:node_9926,prsc:2|A-1625-OUT,B-2666-OUT;n:type:ShaderForge.SFN_Vector1,id:1625,x:32742,y:32476,varname:node_1625,prsc:2,v1:2;pass:END;sub:END;*/

Shader "HCS/Noise" {
    Properties {
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d11 glcore gles3 
            #pragma target 3.0
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
            float4 frag(VertexOutput i) : COLOR {
                float2 node_5700_skew = i.uv0 + 0.2127+i.uv0.x*0.3713*i.uv0.y;
                float2 node_5700_rnd = 4.789*sin(489.123*(node_5700_skew));
                float node_5700 = frac(node_5700_rnd.x*node_5700_rnd.y*(1+node_5700_skew.x));
                float4 node_1459 = _Time;
                float node_7083 = sin(node_1459.g);
                clip(((node_5700+i.uv0.r)-(node_7083*1.5+1.5)) - 0.5);
////// Lighting:
////// Emissive:
                float node_9926 = (2.0*i.uv0.r.r);
                float3 emissive = float3(node_9926,node_9926,node_9926);
                float node_9128 = 1.0;
                float3 finalColor = emissive + float3(i.uv0.g,node_9128,node_9128);
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d11 glcore gles3 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float2 node_5700_skew = i.uv0 + 0.2127+i.uv0.x*0.3713*i.uv0.y;
                float2 node_5700_rnd = 4.789*sin(489.123*(node_5700_skew));
                float node_5700 = frac(node_5700_rnd.x*node_5700_rnd.y*(1+node_5700_skew.x));
                float4 node_1459 = _Time;
                float node_7083 = sin(node_1459.g);
                clip(((node_5700+i.uv0.r)-(node_7083*1.5+1.5)) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
