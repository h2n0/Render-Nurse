module rendernurse.nurse;

public import rendernurse.rd;
import core.sys.posix.dlfcn;

alias RENDERDOC_API = RENDERDOC_API_1_6_0*;

private void* mod;

RENDERDOC_API attachToRenderDoc(){


    RENDERDOC_API rdoc_api = null;

	mod = dlopen("librenderdoc.so", RTLD_NOW | RTLD_NOLOAD);
	if(mod){
		pRENDERDOC_GetAPI RENDERDOC_GetAPI = cast(pRENDERDOC_GetAPI)dlsym(mod, "RENDERDOC_GetAPI");

		int ret = RENDERDOC_GetAPI(RENDERDOC_API_Version.Version_1_6_0, cast(void **)(&rdoc_api));
        if(ret == 0)return null;
	}

    return rdoc_api;

}

void unloadRenderDoc(){
	if(mod){
		dlclose(mod);
	}
}