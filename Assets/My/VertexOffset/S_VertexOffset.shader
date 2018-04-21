// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33352,y:32660,varname:node_9361,prsc:2|custl-6243-OUT,alpha-7300-OUT,voffset-2208-OUT;n:type:ShaderForge.SFN_TexCoord,id:7424,x:31955,y:33151,varname:node_7424,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_RemapRange,id:2208,x:32193,y:33143,varname:node_2208,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-7424-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:3793,x:32168,y:32926,varname:node_3793,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2208-OUT;n:type:ShaderForge.SFN_ArcTan2,id:4561,x:32358,y:32926,varname:node_4561,prsc:2,attp:0|A-3793-G,B-3793-R;n:type:ShaderForge.SFN_Append,id:774,x:32550,y:32914,varname:node_774,prsc:2|A-4561-OUT,B-4561-OUT;n:type:ShaderForge.SFN_Tex2d,id:8271,x:32945,y:32917,varname:node_8271,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3079-UVOUT,TEX-1774-TEX;n:type:ShaderForge.SFN_Color,id:475,x:32963,y:32710,ptovrint:False,ptlb:MainColor,ptin:_MainColor,varname:node_475,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.710345,c4:1;n:type:ShaderForge.SFN_Multiply,id:6243,x:33146,y:32899,varname:node_6243,prsc:2|A-475-RGB,B-8271-RGB,C-879-RGB;n:type:ShaderForge.SFN_Rotator,id:3079,x:32755,y:32917,varname:node_3079,prsc:2|UVIN-774-OUT,SPD-9534-OUT;n:type:ShaderForge.SFN_Slider,id:9534,x:32383,y:32769,ptovrint:False,ptlb:RotatorSpeed,ptin:_RotatorSpeed,varname:node_9534,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Distance,id:9486,x:32362,y:33313,varname:node_9486,prsc:2|A-7424-UVOUT,B-2001-OUT;n:type:ShaderForge.SFN_Vector2,id:2001,x:32167,y:33378,varname:node_2001,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Power,id:2220,x:32742,y:33376,varname:node_2220,prsc:2|VAL-9948-OUT,EXP-8841-OUT;n:type:ShaderForge.SFN_Slider,id:3261,x:32020,y:33616,ptovrint:False,ptlb:AphaPower,ptin:_AphaPower,varname:node_3261,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.5,max:3;n:type:ShaderForge.SFN_Exp,id:8841,x:32424,y:33539,varname:node_8841,prsc:2,et:1|IN-3261-OUT;n:type:ShaderForge.SFN_Clamp01,id:7300,x:33119,y:33253,varname:node_7300,prsc:2|IN-2220-OUT;n:type:ShaderForge.SFN_RemapRange,id:9948,x:32559,y:33295,varname:node_9948,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:0.7|IN-9486-OUT;n:type:ShaderForge.SFN_Tex2d,id:879,x:32916,y:33169,varname:_MainTexure_copy,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|UVIN-3079-UVOUT,TEX-1774-TEX;n:type:ShaderForge.SFN_Tex2dAsset,id:1774,x:32724,y:33112,ptovrint:False,ptlb:MainTexture,ptin:_MainTexture,varname:node_1774,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;proporder:475-9534-3261-1774;pass:END;sub:END;*/

Shader "HCS/VertexOffset" {
    Properties {
        _MainColor ("MainColor", Color) = (0,1,0.710345,1)
        _RotatorSpeed ("RotatorSpeed", Range(0, 10)) = 0
        _AphaPower ("AphaPower", Range(0, 3)) = 1.5
        _MainTexture ("MainTexture", 2D) = "white" {}
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
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _MainColor;
            uniform float _RotatorSpeed;
            uniform float _AphaPower;
            uniform sampler2D _MainTexture; uniform float4 _MainTexture_ST;
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
                float2 node_2208 = (o.uv0*2.0+-1.0);
                v.vertex.xyz = float3(node_2208,0.0);
                o.pos = v.vertex;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_3339 = _Time;
                float node_3079_ang = node_3339.g;
                float node_3079_spd = _RotatorSpeed;
                float node_3079_cos = cos(node_3079_spd*node_3079_ang);
                float node_3079_sin = sin(node_3079_spd*node_3079_ang);
                float2 node_3079_piv = float2(0.5,0.5);
                float2 node_2208 = (i.uv0*2.0+-1.0);
                float2 node_3793 = node_2208.rg;
                float node_4561 = atan2(node_3793.g,node_3793.r);
                float2 node_774 = float2(node_4561,node_4561);
                float2 node_3079 = (mul(node_774-node_3079_piv,float2x2( node_3079_cos, -node_3079_sin, node_3079_sin, node_3079_cos))+node_3079_piv);
                float4 node_8271 = tex2D(_MainTexture,TRANSFORM_TEX(node_3079, _MainTexture));
                float4 _MainTexure_copy = tex2D(_MainTexture,TRANSFORM_TEX(node_3079, _MainTexture));
                float3 finalColor = (_MainColor.rgb*node_8271.rgb*_MainTexure_copy.rgb);
                return fixed4(finalColor,saturate(pow((distance(i.uv0,float2(0.5,0.5))*1.4+0.0),exp2(_AphaPower))));
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
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
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float2 node_2208 = (o.uv0*2.0+-1.0);
                v.vertex.xyz = float3(node_2208,0.0);
                o.pos = v.vertex;
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
