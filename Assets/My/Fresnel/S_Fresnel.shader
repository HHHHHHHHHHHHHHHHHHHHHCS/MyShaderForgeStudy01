// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|normal-2105-RGB,custl-4445-OUT;n:type:ShaderForge.SFN_Fresnel,id:6350,x:32088,y:32811,varname:node_6350,prsc:2|NRM-9196-OUT,EXP-1805-OUT;n:type:ShaderForge.SFN_NormalVector,id:9196,x:31808,y:32800,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:1805,x:31651,y:32994,ptovrint:False,ptlb:FresnelIntensity,ptin:_FresnelIntensity,varname:node_1805,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3,max:10;n:type:ShaderForge.SFN_Tex2d,id:2105,x:32870,y:32608,ptovrint:False,ptlb:NormalMap,ptin:_NormalMap,varname:node_2105,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:bbab0a6f7bae9cf42bf057d8ee2755f6,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:3027,x:32325,y:33125,ptovrint:False,ptlb:FresnelColor,ptin:_FresnelColor,varname:node_3027,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9,c2:0.2,c3:0.2,c4:1;n:type:ShaderForge.SFN_Multiply,id:2097,x:32528,y:32962,varname:node_2097,prsc:2|A-3389-OUT,B-3027-RGB,C-273-OUT,D-847-OUT;n:type:ShaderForge.SFN_Tex2d,id:8162,x:32568,y:32571,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_8162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:4445,x:33018,y:32847,varname:node_4445,prsc:2|A-8162-RGB,B-925-OUT;n:type:ShaderForge.SFN_Slider,id:273,x:32192,y:33287,ptovrint:False,ptlb:InIntensity,ptin:_InIntensity,varname:node_273,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:10,max:10;n:type:ShaderForge.SFN_Add,id:8456,x:32721,y:32884,varname:node_8456,prsc:2|A-3389-OUT,B-2097-OUT;n:type:ShaderForge.SFN_Vector1,id:847,x:32335,y:33398,varname:node_847,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:925,x:32817,y:33071,varname:node_925,prsc:2|A-3389-OUT,B-3027-RGB,C-273-OUT;n:type:ShaderForge.SFN_ViewVector,id:4124,x:31799,y:32517,varname:node_4124,prsc:2;n:type:ShaderForge.SFN_Dot,id:1430,x:31990,y:32622,varname:node_1430,prsc:2,dt:1|A-4124-OUT,B-9196-OUT;n:type:ShaderForge.SFN_OneMinus,id:3487,x:32152,y:32622,varname:node_3487,prsc:2|IN-1430-OUT;n:type:ShaderForge.SFN_Relay,id:3389,x:32491,y:32814,varname:node_3389,prsc:2|IN-6350-OUT;n:type:ShaderForge.SFN_Exp,id:6933,x:32222,y:33014,varname:node_6933,prsc:2,et:0|IN-3186-OUT;n:type:ShaderForge.SFN_Multiply,id:9992,x:32335,y:32622,varname:node_9992,prsc:2|A-3487-OUT,B-6933-OUT;n:type:ShaderForge.SFN_OneMinus,id:3186,x:32042,y:33014,varname:node_3186,prsc:2|IN-1805-OUT;proporder:8162-2105-3027-1805-273;pass:END;sub:END;*/

Shader "HCS/S_Fresnel" {
    Properties {
        _MainTexture ("MainTexture", 2D) = "white" {}
        _NormalMap ("NormalMap", 2D) = "bump" {}
        _FresnelColor ("FresnelColor", Color) = (0.9,0.2,0.2,1)
        _FresnelIntensity ("FresnelIntensity", Range(0, 10)) = 3
        _InIntensity ("InIntensity", Range(0, 10)) = 10
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
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float _FresnelIntensity;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float4 _FresnelColor;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
            uniform float _InIntensity;
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
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
////// Lighting:
                float4 _MainTexture_var = tex2D(_MainTexture,TRANSFORM_TEX(i.uv0, _MainTexture));
                float node_3389 = pow(1.0-max(0,dot(i.normalDir, viewDirection)),_FresnelIntensity);
                float3 finalColor = (_MainTexture_var.rgb+(node_3389*_FresnelColor.rgb*_InIntensity));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
