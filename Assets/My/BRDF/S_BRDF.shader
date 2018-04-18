// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32660,varname:node_9361,prsc:2|custl-9775-OUT;n:type:ShaderForge.SFN_NormalVector,id:2572,x:32138,y:32763,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3103,x:32138,y:32953,varname:node_3103,prsc:2;n:type:ShaderForge.SFN_Dot,id:1144,x:32302,y:32874,varname:node_1144,prsc:2,dt:1|A-2572-OUT,B-3103-OUT;n:type:ShaderForge.SFN_Multiply,id:4032,x:32534,y:32884,varname:node_4032,prsc:2|A-1144-OUT,B-8519-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:8519,x:32302,y:33036,varname:node_8519,prsc:2;n:type:ShaderForge.SFN_LightColor,id:1792,x:32904,y:33051,varname:node_1792,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:5563,x:32904,y:32884,ptovrint:False,ptlb:BRDF_Texture,ptin:_BRDF_Texture,varname:node_5563,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6453c7fd60012fe42b4b68c10ba451df,ntxv:0,isnm:False|UVIN-4908-OUT;n:type:ShaderForge.SFN_Append,id:4908,x:32741,y:32884,varname:node_4908,prsc:2|A-4032-OUT,B-3618-OUT;n:type:ShaderForge.SFN_ViewVector,id:7690,x:32142,y:32503,varname:node_7690,prsc:2;n:type:ShaderForge.SFN_Dot,id:9691,x:32335,y:32503,varname:node_9691,prsc:2,dt:1|A-7690-OUT,B-2572-OUT;n:type:ShaderForge.SFN_Multiply,id:9775,x:33148,y:33006,varname:node_9775,prsc:2|A-5563-RGB,B-1792-RGB;n:type:ShaderForge.SFN_Power,id:3618,x:32590,y:32503,varname:node_3618,prsc:2|VAL-9691-OUT,EXP-9616-OUT;n:type:ShaderForge.SFN_Slider,id:9616,x:32282,y:32717,ptovrint:False,ptlb:HighLightPower,ptin:_HighLightPower,varname:node_9616,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:10;proporder:5563-9616;pass:END;sub:END;*/

Shader "HCS/BRDF" {
    Properties {
        _BRDF_Texture ("BRDF_Texture", 2D) = "white" {}
        _HighLightPower ("HighLightPower", Range(0, 10)) = 5
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _BRDF_Texture; uniform float4 _BRDF_Texture_ST;
            uniform float _HighLightPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
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
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_4908 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),_HighLightPower));
                float4 _BRDF_Texture_var = tex2D(_BRDF_Texture,TRANSFORM_TEX(node_4908, _BRDF_Texture));
                float3 finalColor = (_BRDF_Texture_var.rgb*_LightColor0.rgb);
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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _BRDF_Texture; uniform float4 _BRDF_Texture_ST;
            uniform float _HighLightPower;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
                UNITY_FOG_COORDS(4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
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
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float2 node_4908 = float2((max(0,dot(i.normalDir,lightDirection))*attenuation),pow(max(0,dot(viewDirection,i.normalDir)),_HighLightPower));
                float4 _BRDF_Texture_var = tex2D(_BRDF_Texture,TRANSFORM_TEX(node_4908, _BRDF_Texture));
                float3 finalColor = (_BRDF_Texture_var.rgb*_LightColor0.rgb);
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
