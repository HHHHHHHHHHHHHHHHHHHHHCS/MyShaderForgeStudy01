// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32660,varname:node_9361,prsc:2|custl-2154-RGB,alpha-2154-A;n:type:ShaderForge.SFN_UVTile,id:2536,x:32421,y:32781,varname:node_2536,prsc:2|WDT-8460-OUT,HGT-4891-OUT,TILE-452-OUT;n:type:ShaderForge.SFN_Tex2d,id:2154,x:32632,y:32781,ptovrint:False,ptlb:AnimTexture,ptin:_AnimTexture,varname:node_2154,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:8978c5e26153545408b35c090994acec,ntxv:0,isnm:False|UVIN-2536-UVOUT;n:type:ShaderForge.SFN_Vector1,id:8460,x:32141,y:32757,varname:node_8460,prsc:2,v1:8;n:type:ShaderForge.SFN_Vector1,id:4891,x:32141,y:32841,varname:node_4891,prsc:2,v1:-8;n:type:ShaderForge.SFN_Time,id:7193,x:31798,y:33081,varname:node_7193,prsc:2;n:type:ShaderForge.SFN_Trunc,id:452,x:32239,y:32969,varname:node_452,prsc:2|IN-1150-OUT;n:type:ShaderForge.SFN_Slider,id:876,x:31719,y:32960,ptovrint:False,ptlb:AnimSpeed,ptin:_AnimSpeed,varname:node_876,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Multiply,id:1150,x:32060,y:33061,varname:node_1150,prsc:2|A-876-OUT,B-7193-T;proporder:2154-876;pass:END;sub:END;*/

Shader "HCS/TextureAnim" {
    Properties {
        _AnimTexture ("AnimTexture", 2D) = "white" {}
        _AnimSpeed ("AnimSpeed", Range(0, 10)) = 1
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
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _AnimTexture; uniform float4 _AnimTexture_ST;
            uniform float _AnimSpeed;
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
////// Lighting:
                float node_8460 = 8.0;
                float4 node_7193 = _Time;
                float node_452 = trunc((_AnimSpeed*node_7193.g));
                float2 node_2536_tc_rcp = float2(1.0,1.0)/float2( node_8460, (-8.0) );
                float node_2536_ty = floor(node_452 * node_2536_tc_rcp.x);
                float node_2536_tx = node_452 - node_8460 * node_2536_ty;
                float2 node_2536 = (i.uv0 + float2(node_2536_tx, node_2536_ty)) * node_2536_tc_rcp;
                float4 _AnimTexture_var = tex2D(_AnimTexture,TRANSFORM_TEX(node_2536, _AnimTexture));
                float3 finalColor = _AnimTexture_var.rgb;
                return fixed4(finalColor,_AnimTexture_var.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
