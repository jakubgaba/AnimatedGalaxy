uniform float uTime;
uniform float uSize;
attribute float aScale;
attribute vec3 aRandomness;
varying vec3 vColor;

void main() {
            //Position
        vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //Spin 
        float angle = atan(modelPosition.x, modelPosition.z);
        float distanceToCenter = length(modelPosition.xz);
        float angleOffset = (1.0 / distanceToCenter) * uTime * 1.0;
        angle += angleOffset;
        modelPosition.x = sin(angle) * distanceToCenter;
        modelPosition.z = cos(angle) * distanceToCenter;
        modelPosition.y = - distanceToCenter;
//Randomness
        modelPosition.x += aRandomness.x;
        modelPosition.y += aRandomness.y;
        modelPosition.z += aRandomness.z;

        vec4 viewPosition = viewMatrix * modelPosition;
        vec4 projectedPosition = projectionMatrix * viewPosition;

        gl_Position = projectedPosition;

            //Size
        gl_PointSize = uSize * aScale;
        gl_PointSize *= (2.0 / -viewPosition.z);

    //color
        vColor = color;
}