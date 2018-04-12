// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|custl-3317-OUT;n:type:ShaderForge.SFN_HalfVector,id:9862,x:31708,y:32239,varname:node_9862,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:9146,x:31721,y:32669,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:5776,x:31738,y:32877,varname:node_5776,prsc:2;n:type:ShaderForge.SFN_Dot,id:2806,x:31939,y:32766,varname:node_2806,prsc:2,dt:0|A-9146-OUT,B-5776-OUT;n:type:ShaderForge.SFN_Add,id:3317,x:32649,y:32589,varname:node_3317,prsc:2|A-3221-OUT,B-1-OUT;n:type:ShaderForge.SFN_Tex2d,id:3023,x:32045,y:32994,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_3023,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1,x:32468,y:32881,varname:node_1,prsc:2|A-2806-OUT,B-3023-RGB;n:type:ShaderForge.SFN_Color,id:8271,x:32080,y:32419,ptovrint:False,ptlb:HighLightColor,ptin:_HighLightColor,varname:node_8271,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:3221,x:32267,y:32239,varname:node_3221,prsc:2|A-9924-OUT,B-8271-RGB,C-4826-OUT;n:type:ShaderForge.SFN_Dot,id:2278,x:31874,y:32239,varname:node_2278,prsc:2,dt:1|A-9862-OUT,B-9146-OUT;n:type:ShaderForge.SFN_Power,id:9924,x:32068,y:32239,varname:node_9924,prsc:2|VAL-2278-OUT,EXP-4236-OUT;n:type:ShaderForge.SFN_Slider,id:5721,x:31495,y:32416,ptovrint:False,ptlb:HighLightRange,ptin:_HighLightRange,varname:node_5721,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;n:type:ShaderForge.SFN_Exp,id:4236,x:31874,y:32419,varname:node_4236,prsc:2,et:1|IN-5721-OUT;n:type:ShaderForge.SFN_Slider,id:4826,x:31939,y:32603,ptovrint:False,ptlb:HightLightIntensity,ptin:_HightLightIntensity,varname:node_4826,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;proporder:3023-8271-5721-4826;pass:END;sub:END;*/

Shader "HCS/S_HighLight" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _HighLightColor ("HighLightColor", Color) = (1,1,1,1)
        _HighLightRange ("HighLightRange", Range(0, 10)) = 10
        _HightLightIntensity ("HightLightIntensity", Range(0, 10)) = 10
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _HighLightColor;
            uniform float _HighLightRange;
            uniform float _HightLightIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float3 finalColor = ((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_HighLightRange))*_HighLightColor.rgb*_HightLightIntensity)+(dot(i.normalDir,lightDirection)*_MainTexture_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float4 _HighLightColor;
            uniform float _HighLightRange;
            uniform float _HightLightIntensity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float3 finalColor = ((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_HighLightRange))*_HighLightColor.rgb*_HightLightIntensity)+(dot(i.normalDir,lightDirection)*_MainTexture_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
