// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-7135-OUT,custl-6610-OUT;n:type:ShaderForge.SFN_Slider,id:484,x:31553,y:33188,ptovrint:False,ptlb:FresnelRange,ptin:_FresnelRange,varname:node_484,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:3;n:type:ShaderForge.SFN_Fresnel,id:5889,x:31907,y:33030,varname:node_5889,prsc:2|EXP-484-OUT;n:type:ShaderForge.SFN_Multiply,id:3262,x:32165,y:33111,varname:node_3262,prsc:2|A-5889-OUT,B-5170-OUT;n:type:ShaderForge.SFN_Slider,id:5170,x:31859,y:33296,ptovrint:False,ptlb:FresenelIntensity,ptin:_FresenelIntensity,varname:node_5170,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:3;n:type:ShaderForge.SFN_LightAttenuation,id:4089,x:32140,y:32749,varname:node_4089,prsc:2;n:type:ShaderForge.SFN_LightColor,id:1671,x:32140,y:32615,varname:node_1671,prsc:2;n:type:ShaderForge.SFN_LightVector,id:9113,x:31264,y:32317,varname:node_9113,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:7473,x:31264,y:32445,prsc:2,pt:True;n:type:ShaderForge.SFN_HalfVector,id:1818,x:31264,y:32596,varname:node_1818,prsc:2;n:type:ShaderForge.SFN_Dot,id:2678,x:31476,y:32360,cmnt:Lambert,varname:node_2678,prsc:2,dt:1|A-9113-OUT,B-7473-OUT;n:type:ShaderForge.SFN_Dot,id:7335,x:31476,y:32534,cmnt:Blinn-Phong,varname:node_7335,prsc:2,dt:1|A-7473-OUT,B-1818-OUT;n:type:ShaderForge.SFN_Multiply,id:4917,x:31871,y:32529,cmnt:Specular Contribution,varname:node_4917,prsc:2|A-2678-OUT,B-912-OUT,C-2168-RGB;n:type:ShaderForge.SFN_Tex2d,id:1738,x:31372,y:31939,ptovrint:False,ptlb:Diffuse,ptin:_Diffuse,varname:node_851,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6991,x:31871,y:32356,cmnt:Diffuse Contribution,varname:node_6991,prsc:2|A-8610-OUT,B-2678-OUT;n:type:ShaderForge.SFN_Color,id:3040,x:31372,y:32124,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_5927,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Exp,id:2184,x:31476,y:32717,varname:node_2184,prsc:2,et:1|IN-9918-OUT;n:type:ShaderForge.SFN_Slider,id:8138,x:30935,y:32719,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5328,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;n:type:ShaderForge.SFN_Power,id:912,x:31674,y:32603,varname:node_912,prsc:2|VAL-7335-OUT,EXP-2184-OUT;n:type:ShaderForge.SFN_Add,id:6748,x:32140,y:32475,cmnt:Combine,varname:node_6748,prsc:2|A-6991-OUT,B-4917-OUT,C-5228-OUT;n:type:ShaderForge.SFN_Multiply,id:6610,x:32463,y:32721,cmnt:Attenuate and Color,varname:node_6610,prsc:2|A-6748-OUT,B-1671-RGB,C-4089-OUT;n:type:ShaderForge.SFN_ConstantLerp,id:9918,x:31264,y:32719,varname:node_9918,prsc:2,a:1,b:11|IN-8138-OUT;n:type:ShaderForge.SFN_Color,id:2168,x:31674,y:32758,ptovrint:False,ptlb:Spec Color,ptin:_SpecColor,varname:node_4865,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_AmbientLight,id:6444,x:32336,y:32402,varname:node_6444,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7135,x:32529,y:32354,cmnt:Ambient Light,varname:node_7135,prsc:2|A-8610-OUT,B-6444-RGB;n:type:ShaderForge.SFN_Multiply,id:8610,x:31570,y:32038,cmnt:Diffuse Color,varname:node_8610,prsc:2|A-1738-RGB,B-3040-RGB;n:type:ShaderForge.SFN_Set,id:4368,x:32682,y:33120,varname:fresenel,prsc:2|IN-464-OUT;n:type:ShaderForge.SFN_Get,id:5228,x:31844,y:32885,varname:node_5228,prsc:2|IN-4368-OUT;n:type:ShaderForge.SFN_Multiply,id:464,x:32477,y:33084,varname:node_464,prsc:2|A-3262-OUT,B-7349-RGB,C-7037-OUT;n:type:ShaderForge.SFN_Color,id:7349,x:32265,y:33267,ptovrint:False,ptlb:FresenlColor,ptin:_FresenlColor,varname:node_7349,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2,c2:1,c3:0,c4:1;n:type:ShaderForge.SFN_ToggleProperty,id:7037,x:32286,y:33670,ptovrint:False,ptlb:Toggle,ptin:_Toggle,varname:node_7037,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True;proporder:484-5170-1738-3040-8138-2168-7349-7037;pass:END;sub:END;*/

Shader "HCS/CodeShader" {
    Properties {
        _FresnelRange ("FresnelRange", Range(0, 3)) = 1
        _FresenelIntensity ("FresenelIntensity", Range(0, 3)) = 1
        _Diffuse ("Diffuse", 2D) = "white" {}
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Gloss ("Gloss", Range(0, 1)) = 0.5
        _SpecColor ("Spec Color", Color) = (1,1,1,1)
        _FresenlColor ("FresenlColor", Color) = (0.2,1,0,1)
        [MaterialToggle] _Toggle ("Toggle", Float ) = 1
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
            uniform float _FresnelRange;
            uniform float _FresenelIntensity;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float4 _FresenlColor;
            uniform fixed _Toggle;
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
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 node_8610 = (_Diffuse_var.rgb*_Color.rgb); // Diffuse Color
                float3 node_7135 = (node_8610*UNITY_LIGHTMODEL_AMBIENT.rgb); // Ambient Light
                float3 emissive = node_7135;
                float node_2678 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float3 fresenel = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelRange)*_FresenelIntensity)*_FresenlColor.rgb*_Toggle);
                float3 finalColor = emissive + (((node_8610*node_2678)+(node_2678*pow(max(0,dot(normalDirection,halfDirection)),exp2(lerp(1,11,_Gloss)))*_SpecColor.rgb)+fresenel)*_LightColor0.rgb*attenuation);
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
            uniform float _FresnelRange;
            uniform float _FresenelIntensity;
            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;
            uniform float4 _Color;
            uniform float _Gloss;
            uniform float4 _FresenlColor;
            uniform fixed _Toggle;
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
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv0, _Diffuse));
                float3 node_8610 = (_Diffuse_var.rgb*_Color.rgb); // Diffuse Color
                float node_2678 = max(0,dot(lightDirection,normalDirection)); // Lambert
                float3 fresenel = ((pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelRange)*_FresenelIntensity)*_FresenlColor.rgb*_Toggle);
                float3 finalColor = (((node_8610*node_2678)+(node_2678*pow(max(0,dot(normalDirection,halfDirection)),exp2(lerp(1,11,_Gloss)))*_SpecColor.rgb)+fresenel)*_LightColor0.rgb*attenuation);
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
