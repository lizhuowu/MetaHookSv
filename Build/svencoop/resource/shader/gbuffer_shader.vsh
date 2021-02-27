varying vec4 worldpos;
varying vec4 normal;
varying vec4 color;

#ifdef SCROLL_ENABLED
uniform float speed;
#endif

void main()
{
  worldpos = vec4(gl_Vertex.xyz / gl_Vertex.w, 1.0);
  normal = vec4(normalize(gl_Normal), 1.0);
  
#ifdef DIFFUSE_ENABLED
  
  #ifdef SCROLL_ENABLED

    gl_TexCoord[0] = vec4(gl_MultiTexCoord0.x + gl_MultiTexCoord0.z * speed, gl_MultiTexCoord0.y, 0.0, 0.0);
  
  #else

    gl_TexCoord[0] = gl_MultiTexCoord0;

  #endif

#endif

#ifdef LIGHTMAP_ENABLED
  gl_TexCoord[1] = gl_MultiTexCoord1;
#endif

#ifdef DETAILTEXTURE_ENABLED
  gl_TexCoord[2] = gl_MultiTexCoord2;
#endif

  color = gl_Color;
  gl_Position = ftransform();
}