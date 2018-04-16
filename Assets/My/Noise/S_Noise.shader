// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33324,y:32714,varname:node_9361,prsc:2|alpha-4939-OUT;n:type:ShaderForge.SFN_Time,id:1459,x:32286,y:33094,varname:node_1459,prsc:2;n:type:ShaderForge.SFN_Sin,id:7083,x:32487,y:33109,varname:node_7083,prsc:2|IN-1459-T;n:type:ShaderForge.SFN_Noise,id:8284,x:32308,y:32799,varname:node_8284,prsc:2;n:type:ShaderForge.SFN_RemapRange,id:184,x:32695,y:33109,varname:node_184,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-7083-OUT;n:type:ShaderForge.SFN_Vector1,id:4226,x:32849,y:33191,varname:node_4226,prsc:2,v1:0;n:type:ShaderForge.SFN_Subtract,id:4939,x:32926,y:32872,varname:node_4939,prsc:2|A-9282-OUT,B-184-OUT;n:type:ShaderForge.SFN_RemapRange,id:9282,x:32504,y:32820,varname:node_9282,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-8284-OUT;pass:END;sub:END;*/

Shader "HCS/Noise" {
    Properties {
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
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
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float3 finalColor = 0;
                float2 node_8284_skew = i.uv0 + 0.2127+i.uv0.x*0.3713*i.uv0.y;
                float2 node_8284_rnd = 4.789*sin(489.123*(node_8284_skew));
                float node_8284 = frac(node_8284_rnd.x*node_8284_rnd.y*(1+node_8284_skew.x));
                float4 node_1459 = _Time;
                float node_184 = (sin(node_1459.g)*0.5+0.5);
                fixed4 finalRGBA = fixed4(finalColor,((node_8284*0.5+0.5)-node_184));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
