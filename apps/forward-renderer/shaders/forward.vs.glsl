#version 330

// Attributs de sommet
layout(location = 0) in vec3 aPosition; // Position du sommet
layout(location = 1) in vec3 aNormal; // Normale du sommet
layout(location = 2) in vec2 aTexCoords; // Coordonnées de texture du sommet

// Matrices de transformations reçues en uniform
uniform mat4 uMVPMatrix;
uniform mat4 uMVMatrix;
uniform mat4 uNormalMatrix;

// Sorties du shader
out vec3 vPosition_vs; // Position du sommet transformé dans l'espace View
out vec3 vNormal_vs; // Normale du sommet transformé dans l'espace View
out vec2 vTexCoords; // Coordonnées de texture du sommet

void main() {
    // Passage en coordonnées homogènes
    vec4 vertexPosition = vec4(aPosition, 1);
    vec4 vertexNormal = vec4(aNormal, 0);

    // Calcul des valeurs de sortie
    vPosition_vs = vec3(uMVMatrix * vertexPosition);
    vNormal_vs = vec3(uNormalMatrix * vertexNormal);
    vTexCoords = aTexCoords;

    // Calcul de la position projetée
    gl_Position = uMVPMatrix * vertexPosition;
}
