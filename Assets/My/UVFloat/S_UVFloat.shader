// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32660,varname:node_9361,prsc:2|custl-9137-RGB;n:type:ShaderForge.SFN_Tex2d,id:9137,x:32685,y:32751,ptovrint:False,ptlb:Water,ptin:_Water,varname:node_9137,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d97533a3ae000c74e9189e8f6a4be215,ntxv:0,isnm:False|UVIN-1421-OUT;n:type:ShaderForge.SFN_TexCoord,id:5429,x:32877,y:33150,varname:node_5429,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:2795,x:32097,y:33153,ptovrint:False,ptlb:HSpped,ptin:_HSpped,varname:node_2795,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Slider,id:338,x:32062,y:33436,ptovrint:False,ptlb:VSpeed,ptin:_VSpeed,varname:_U_Pos_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:168,x:32540,y:33140,varname:node_168,prsc:2|A-2795-OUT,B-4471-TSL;n:type:ShaderForge.SFN_Time,id:4471,x:32117,y:33270,varname:node_4471,prsc:2;n:type:ShaderForge.SFN_Multiply,id:4287,x:32580,y:33382,varname:node_4287,prsc:2|A-338-OUT,B-4471-TSL,C-338-OUT;n:type:ShaderForge.SFN_Append,id:7518,x:32901,y:33296,varname:node_7518,prsc:2|A-168-OUT,B-4287-OUT;n:type:ShaderForge.SFN_Add,id:1421,x:33101,y:33242,varname:node_1421,prsc:2|A-5429-UVOUT,B-7518-OUT;n:type:ShaderForge.SFN_Panner,id:8167,x:32337,y:32755,varname:node_8167,prsc:2,spu:1,spv:1|UVIN-5429-UVOUT;proporder:9137-2795-338;pass:END;sub:END;*/

Shader "HCS/UVFloat" {
    Properties {
        _Water ("Water", 2D) = "white" {}
        _HSpped ("HSpped", Range(0, 10)) = 0
        _VSpeed ("VSpeed", Range(0, 10)) = 0
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
            uniform sampler2D _Water; uniform float4 _Water_ST;
            uniform float _HSpped;
            uniform float _VSpeed;
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
                float4 node_4471 = _Time;
                float2 node_1421 = (i.uv0+float2((_HSpped*node_4471.r),(_VSpeed*node_4471.r*_VSpeed)));
                float4 _Water_var = tex2D(_Water,TRANSFORM_TEX(node_1421, _Water));
                float3 finalColor = _Water_var.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
