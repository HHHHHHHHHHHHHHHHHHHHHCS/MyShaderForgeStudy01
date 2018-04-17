// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33288,y:32733,varname:node_9361,prsc:2|custl-5429-OUT,olwid-1169-OUT,olcol-3841-RGB;n:type:ShaderForge.SFN_LightVector,id:1880,x:31978,y:32855,varname:node_1880,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:7155,x:31978,y:33001,prsc:2,pt:False;n:type:ShaderForge.SFN_Dot,id:896,x:32177,y:32887,varname:node_896,prsc:2,dt:1|A-1880-OUT,B-7155-OUT;n:type:ShaderForge.SFN_Append,id:8000,x:32570,y:32878,varname:node_8000,prsc:2|A-7561-OUT,B-7561-OUT;n:type:ShaderForge.SFN_Tex2d,id:8311,x:32733,y:32878,ptovrint:False,ptlb:MainTexure,ptin:_MainTexure,varname:node_8311,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:aa762ee7680f35f4fb9a9210fa94ce61,ntxv:0,isnm:False|UVIN-8000-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8199,x:32350,y:33063,varname:node_8199,prsc:2;n:type:ShaderForge.SFN_Slider,id:1169,x:32904,y:33066,ptovrint:False,ptlb:OutlineWidth,ptin:_OutlineWidth,varname:node_1169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:3841,x:32982,y:33181,ptovrint:False,ptlb:OutlineColor,ptin:_OutlineColor,varname:node_3841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_HalfVector,id:3545,x:31978,y:32615,varname:node_3545,prsc:2;n:type:ShaderForge.SFN_Dot,id:8650,x:32177,y:32690,varname:node_8650,prsc:2,dt:0|A-3545-OUT,B-1880-OUT;n:type:ShaderForge.SFN_Append,id:8824,x:32559,y:32686,varname:node_8824,prsc:2|A-8650-OUT,B-8650-OUT;n:type:ShaderForge.SFN_Tex2d,id:4316,x:32733,y:32686,ptovrint:False,ptlb:HightLightTexture,ptin:_HightLightTexture,varname:node_4316,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6a985dfcd1d3ca94e9753748ed65c697,ntxv:0,isnm:False|UVIN-8824-OUT;n:type:ShaderForge.SFN_Add,id:5429,x:33085,y:32795,varname:node_5429,prsc:2|A-4316-RGB,B-8311-RGB;n:type:ShaderForge.SFN_Multiply,id:7561,x:32384,y:32897,varname:node_7561,prsc:2|A-896-OUT,B-8199-OUT;proporder:8311-1169-3841-4316;pass:END;sub:END;*/

Shader "HCS/Cartoon" {
    Properties {
        _MainTexure ("MainTexure", 2D) = "white" {}
        _OutlineWidth ("OutlineWidth", Range(0, 1)) = 0
        _OutlineColor ("OutlineColor", Color) = (0.5,0.5,0.5,1)
        _HightLightTexture ("HightLightTexture", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform float _OutlineWidth;
            uniform float4 _OutlineColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( float4(v.vertex.xyz + v.normal*_OutlineWidth,1) );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexure; uniform float4 _MainTexure_ST;
            uniform sampler2D _HightLightTexture; uniform float4 _HightLightTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
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
                float attenuation = LIGHT_ATTENUATION(i);
                float node_8650 = dot(halfDirection,lightDirection);
                float2 node_8824 = float2(node_8650,node_8650);
                float4 _HightLightTexture_var = tex2D(_HightLightTexture,TRANSFORM_TEX(node_8824, _HightLightTexture));
                float node_7561 = (max(0,dot(lightDirection,i.normalDir))*attenuation);
                float2 node_8000 = float2(node_7561,node_7561);
                float4 _MainTexure_var = tex2D(_MainTexure,TRANSFORM_TEX(node_8000, _MainTexure));
                float3 finalColor = (_HightLightTexture_var.rgb+_MainTexure_var.rgb);
                return fixed4(finalColor,1);
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTexure; uniform float4 _MainTexure_ST;
            uniform sampler2D _HightLightTexture; uniform float4 _HightLightTexture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
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
                float attenuation = LIGHT_ATTENUATION(i);
                float node_8650 = dot(halfDirection,lightDirection);
                float2 node_8824 = float2(node_8650,node_8650);
                float4 _HightLightTexture_var = tex2D(_HightLightTexture,TRANSFORM_TEX(node_8824, _HightLightTexture));
                float node_7561 = (max(0,dot(lightDirection,i.normalDir))*attenuation);
                float2 node_8000 = float2(node_7561,node_7561);
                float4 _MainTexure_var = tex2D(_MainTexure,TRANSFORM_TEX(node_8000, _MainTexure));
                float3 finalColor = (_HightLightTexture_var.rgb+_MainTexure_var.rgb);
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
