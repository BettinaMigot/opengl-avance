#version 330

in vec3 vViewSpacePosition;
in vec3 vViewSpaceNormal;
in vec2 vTexCoords;

layout(location = 0) out vec3 fPosition;
layout(location = 1) out vec3 fNormal;
layout(location = 2) out vec3 fAmbient;
layout(location = 3) out vec3 fDiffuse;
layout(location = 4) out vec4 fGlossyShininess;

uniform vec3 uKa;
uniform vec3 uKd;
uniform vec3 uKs;
uniform float uShininess;

uniform sampler2D uKaSampler;
uniform sampler2D uKdSampler;
uniform sampler2D uKsSampler;
uniform sampler2D uShininessSampler;

void main()
{

    fPosition = vViewSpacePosition;
    fNormal = normalize(vViewSpaceNormal);

    vec3 ka = uKa * vec3(texture(uKaSampler, vTexCoords));
    fAmbient = ka;

    vec3 ks = uKs * vec3(texture(uKsSampler, vTexCoords));
    fGlossyShininess.rgb = ks;

    float shininess = uShininess * float(texture(uShininessSampler, vTexCoords));
    fGlossyShininess.a = shininess;
}