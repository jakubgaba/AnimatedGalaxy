varying vec3 vColor;
void main() {

//disc
    // float strenght = distance(gl_PointCoord, vec2(0.5));
    // strenght = step(0.5, strenght);
    // strenght = 1.0 - strenght;

    //diffuse point
    float strenght = distance(gl_PointCoord, vec2(0.5));
    strenght = 1.0 - strenght;
    strenght = pow(strenght, 10.0);

    //final color
    vec3 color = mix(vec3(0.0), vColor, strenght);

    gl_FragColor = vec4(color, 1.0);
            #include <colorspace_fragment>
}