// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|normal-2105-RGB,custl-3960-OUT;n:type:ShaderForge.SFN_Fresnel,id:6350,x:31824,y:33493,varname:node_6350,prsc:2|NRM-9196-OUT,EXP-1805-OUT;n:type:ShaderForge.SFN_NormalVector,id:9196,x:31580,y:32912,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:1805,x:31418,y:33688,ptovrint:False,ptlb:FresnelIntensity,ptin:_FresnelIntensity,varname:node_1805,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3,max:10;n:type:ShaderForge.SFN_Tex2d,id:2105,x:33039,y:32322,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_2105,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:3027,x:31958,y:33826,ptovrint:False,ptlb:FresnelColor,ptin:_FresnelColor,varname:node_3027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9,c2:0.2,c3:0.2,c4:1;n:type:ShaderForge.SFN_Multiply,id:2097,x:32237,y:33496,varname:node_2097,prsc:2|A-3389-OUT,B-3027-RGB,C-273-OUT,D-847-OUT;n:type:ShaderForge.SFN_Tex2d,id:8162,x:32723,y:32172,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_8162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:4445,x:32717,y:32547,varname:node_4445,prsc:2|A-5190-OUT,B-4822-OUT;n:type:ShaderForge.SFN_Slider,id:273,x:31825,y:33988,ptovrint:False,ptlb:InIntensity,ptin:_InIntensity,varname:node_273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;n:type:ShaderForge.SFN_Add,id:8456,x:32576,y:33053,varname:node_8456,prsc:2|A-3389-OUT,B-2097-OUT;n:type:ShaderForge.SFN_Vector1,id:847,x:32044,y:33932,varname:node_847,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:925,x:32742,y:33253,varname:node_925,prsc:2|A-3389-OUT,B-3027-RGB,C-273-OUT;n:type:ShaderForge.SFN_ViewVector,id:4124,x:31580,y:32761,varname:node_4124,prsc:2;n:type:ShaderForge.SFN_Dot,id:1430,x:31880,y:32925,varname:node_1430,prsc:2,dt:1|A-4124-OUT,B-9196-OUT;n:type:ShaderForge.SFN_OneMinus,id:3487,x:32042,y:32925,varname:node_3487,prsc:2|IN-1430-OUT;n:type:ShaderForge.SFN_Relay,id:3389,x:32124,y:33515,varname:node_3389,prsc:2|IN-6350-OUT;n:type:ShaderForge.SFN_Exp,id:6933,x:32112,y:33317,varname:node_6933,prsc:2,et:0|IN-3186-OUT;n:type:ShaderForge.SFN_Multiply,id:9992,x:32275,y:32966,varname:node_9992,prsc:2|A-3487-OUT,B-6933-OUT;n:type:ShaderForge.SFN_OneMinus,id:3186,x:31932,y:33317,varname:node_3186,prsc:2|IN-1805-OUT;n:type:ShaderForge.SFN_LightVector,id:8861,x:31567,y:32615,varname:node_8861,prsc:2;n:type:ShaderForge.SFN_Slider,id:5085,x:31906,y:32405,ptovrint:False,ptlb:node_5085,ptin:_node_5085,varname:node_5085,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:10;n:type:ShaderForge.SFN_Exp,id:1562,x:32246,y:32306,varname:node_1562,prsc:2,et:1|IN-5085-OUT;n:type:ShaderForge.SFN_Power,id:6619,x:32396,y:32179,varname:node_6619,prsc:2|VAL-3386-OUT,EXP-1562-OUT;n:type:ShaderForge.SFN_Dot,id:3386,x:32145,y:32190,varname:node_3386,prsc:2,dt:1|A-7580-OUT,B-9196-OUT;n:type:ShaderForge.SFN_Color,id:3527,x:32171,y:32478,ptovrint:False,ptlb:node_3527,ptin:_node_3527,varname:node_3527,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5190,x:32550,y:32321,varname:node_5190,prsc:2|A-6619-OUT,B-3527-RGB,C-6487-OUT;n:type:ShaderForge.SFN_Dot,id:5540,x:31954,y:32598,varname:node_5540,prsc:2,dt:1|A-8861-OUT,B-9196-OUT;n:type:ShaderForge.SFN_Multiply,id:4822,x:32476,y:32657,varname:node_4822,prsc:2|A-8162-RGB,B-5540-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:9231,x:31941,y:32753,varname:node_9231,prsc:2;n:type:ShaderForge.SFN_LightColor,id:5115,x:32083,y:32800,varname:node_5115,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9203,x:32868,y:32801,varname:node_9203,prsc:2|A-4445-OUT,B-9231-OUT,C-5115-RGB;n:type:ShaderForge.SFN_Desaturate,id:1769,x:32561,y:31840,varname:node_1769,prsc:2|COL-8162-RGB;n:type:ShaderForge.SFN_RemapRange,id:9410,x:32759,y:31840,varname:node_9410,prsc:2,frmn:0,frmx:1,tomn:-2,tomx:2|IN-1769-OUT;n:type:ShaderForge.SFN_Clamp01,id:6487,x:32933,y:31840,varname:node_6487,prsc:2|IN-9410-OUT;n:type:ShaderForge.SFN_HalfVector,id:7580,x:31587,y:32175,varname:node_7580,prsc:2;n:type:ShaderForge.SFN_Add,id:3960,x:33032,y:32998,varname:node_3960,prsc:2|A-9203-OUT,B-925-OUT;proporder:8162-2105-3027-1805-273-5085-3527;pass:END;sub:END;*/

Shader "HCS/S_Fresnel" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _FresnelColor ("FresnelColor", Color) = (0.9,0.2,0.2,1)
        _FresnelIntensity ("FresnelIntensity", Range(0, 10)) = 3
        _InIntensity ("InIntensity", Range(0, 10)) = 10
        _node_5085 ("node_5085", Range(0, 10)) = 2
        _node_3527 ("node_3527", Color) = (0.5,0.5,0.5,1)
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
            uniform float _FresnelIntensity;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _FresnelColor;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _InIntensity;
            uniform float _node_5085;
            uniform float4 _node_3527;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float node_3389 = pow(1.0-max(0,dot(i.normalDir, viewDirection)),_FresnelIntensity);
                float3 finalColor = ((((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_node_5085))*_node_3527.rgb*saturate((dot(_MainTexture_var.rgb,float3(0.3,0.59,0.11))*4.0+-2.0)))+(_MainTexture_var.rgb*max(0,dot(lightDirection,i.normalDir))))*attenuation*_LightColor0.rgb)+(node_3389*_FresnelColor.rgb*_InIntensity));
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
            uniform float _FresnelIntensity;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _FresnelColor;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _InIntensity;
            uniform float _node_5085;
            uniform float4 _node_3527;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float node_3389 = pow(1.0-max(0,dot(i.normalDir, viewDirection)),_FresnelIntensity);
                float3 finalColor = ((((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_node_5085))*_node_3527.rgb*saturate((dot(_MainTexture_var.rgb,float3(0.3,0.59,0.11))*4.0+-2.0)))+(_MainTexture_var.rgb*max(0,dot(lightDirection,i.normalDir))))*attenuation*_LightColor0.rgb)+(node_3389*_FresnelColor.rgb*_InIntensity));
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
