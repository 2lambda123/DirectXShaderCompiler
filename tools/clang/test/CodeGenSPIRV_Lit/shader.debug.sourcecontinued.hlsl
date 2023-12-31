// RUN: %dxc -T ps_6_0 -E MainPs -fspv-debug=vulkan-with-source-test -fcgl  %s -spirv | FileCheck %s

// CHECK:             DebugSource {{%[0-9]+}} {{%[0-9]+}}
// CHECK:             DebugSourceContinued {{%[0-9]+}}

Texture2D g_tColor;

SamplerState g_sAniso;

struct PS_INPUT
{
    float2 vTextureCoords : TEXCOORD2 ;
} ;

struct PS_OUTPUT
{
    float4 vColor : SV_Target0 ;
} ;

PS_OUTPUT MainPs ( PS_INPUT i )
{
    PS_OUTPUT ps_output ;

    ps_output . vColor = g_tColor . Sample ( g_sAniso , i . vTextureCoords . xy ) ;
    return ps_output ;
}

