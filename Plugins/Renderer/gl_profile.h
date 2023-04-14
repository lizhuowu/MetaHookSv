#pragma once

typedef struct glprofile_s
{
	char name[64];
	GLuint query_object;
	double cpu_begin;
	double cpu_end;
	bool query_started;
}glprofile_t;

extern cvar_t *gl_profile;

void GL_FreeProfiles(void);
void GL_BeginProfile(glprofile_t *profile, const char *name);
void GL_EndProfile(glprofile_t *profile);