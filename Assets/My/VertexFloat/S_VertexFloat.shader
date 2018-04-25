// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32660,varname:node_9361,prsc:2|custl-9804-RGB,voffset-3900-OUT;n:type:ShaderForge.SFN_Time,id:888,x:31304,y:32855,varname:node_888,prsc:2;n:type:ShaderForge.SFN_Sin,id:9505,x:32147,y:32922,varname:node_9505,prsc:2|IN-377-OUT;n:type:ShaderForge.SFN_Vector3,id:1060,x:32069,y:32735,varname:node_1060,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Multiply,id:3900,x:32398,y:32950,varname:node_3900,prsc:2|A-1060-OUT,B-9505-OUT,C-8731-OUT;n:type:ShaderForge.SFN_Add,id:3475,x:31781,y:32688,varname:node_3475,prsc:2|A-4712-OUT,B-3645-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4776,x:31126,y:32477,varname:node_4776,prsc:2;n:type:ShaderForge.SFN_Multiply,id:377,x:31930,y:32901,varname:node_377,prsc:2|A-3475-OUT,B-311-OUT;n:type:ShaderForge.SFN_Slider,id:311,x:31602,y:33042,ptovrint:False,ptlb:SegmentCount,ptin:_SegmentCount,varname:node_311,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Slider,id:8731,x:32056,y:33114,ptovrint:False,ptlb:SegmentIIntensity,ptin:_SegmentIIntensity,varname:node_8731,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Tex2d,id:9804,x:32952,y:32742,ptovrint:False,ptlb:node_9804,ptin:_node_9804,varname:node_9804,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d97533a3ae000c74e9189e8f6a4be215,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:4712,x:31506,y:32676,varname:node_4712,prsc:2|A-3992-OUT,B-8891-OUT;n:type:ShaderForge.SFN_Multiply,id:3645,x:31563,y:32879,varname:node_3645,prsc:2|A-888-T,B-898-OUT;n:type:ShaderForge.SFN_Slider,id:898,x:31254,y:33084,ptovrint:False,ptlb:TimeScale,ptin:_TimeScale,varname:node_898,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_ObjectPosition,id:5919,x:31126,y:32644,varname:node_5919,prsc:2;n:type:ShaderForge.SFN_Subtract,id:3992,x:31358,y:32492,varname:node_3992,prsc:2|A-4776-X,B-5919-X;n:type:ShaderForge.SFN_Subtract,id:8891,x:31343,y:32665,varname:node_8891,prsc:2|A-4776-Z,B-5919-Z;proporder:9804-311-8731-898;pass:END;sub:END;*/

Shader "HCS/VertexFloat" {
    Properties {
        _node_9804 ("node_9804", 2D) = "white" {}
        _SegmentCount ("SegmentCount", Range(0, 10)) = 1
        _SegmentIIntensity ("SegmentIIntensity", Range(0, 10)) = 1
        _TimeScale ("TimeScale", Range(0, 10)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
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
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform float _SegmentCount;
            uniform float _SegmentIIntensity;
            uniform sampler2D _node_9804; uniform float4 _node_9804_ST;
            uniform float _TimeScale;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_888 = _Time;
                v.vertex.xyz += (float3(0,1,0)*sin(((((mul(unity_ObjectToWorld, v.vertex).r-objPos.r)+(mul(unity_ObjectToWorld, v.vertex).b-objPos.b))+(node_888.g*_TimeScale))*_SegmentCount))*_SegmentIIntensity);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
                float4 _node_9804_var = tex2D(_node_9804,TRANSFORM_TEX(i.uv0, _node_9804));
                float3 finalColor = _node_9804_var.rgb;
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
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform float _SegmentCount;
            uniform float _SegmentIIntensity;
            uniform float _TimeScale;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float4 node_888 = _Time;
                v.vertex.xyz += (float3(0,1,0)*sin(((((mul(unity_ObjectToWorld, v.vertex).r-objPos.r)+(mul(unity_ObjectToWorld, v.vertex).b-objPos.b))+(node_888.g*_TimeScale))*_SegmentCount))*_SegmentIIntensity);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
