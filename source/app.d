import core.sys.posix.dlfcn;
import std.stdio;

import rendernurse;

int main()
{
	RENDERDOC_API_1_1_2 *rdoc_api = null;

	if(void *mod = dlopen("librenderdoc.so", RTLD_NOW | RTLD_NOLOAD)){
		pRENDERDOC_GetAPI RENDERDOC_GetAPI = cast(pRENDERDOC_GetAPI)dlsym(mod, "RENDERDOC_GetAPI");
		int ret = RENDERDOC_GetAPI(RENDERDOC_API_Version.Version_1_1_2, cast(void **)(&rdoc_api));
		assert(ret == 1);
	}

	if(rdoc_api){
		writeln("Working fine!");

		rdoc_api.StartFrameCapture(null, null);
		rdoc_api.EndFrameCapture(null, null);
	}else{
		writeln("No debugger");
	}

    return 0;
}