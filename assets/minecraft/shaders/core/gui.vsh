#version 150

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec4 vertexColor;

void main() {

	gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
	ivec3 guiColor = ivec3(Color.xyz * 255 + vec3(0.5));

	// Remove sidebar to the left of chat window
	if (Position.x <= 2 && guiColor == ivec3(208, 208, 208)) {
		vertexColor = vec4(0);

	// Vanilla behavior
	} else {
		vertexColor = Color;
	}

}