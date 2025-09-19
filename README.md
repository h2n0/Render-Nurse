# Render Nurse

A Simple D Language binding for the [RenderDoc API](https://renderdoc.org/docs/in_application_api.html).

### **Currently only supports Linux**

## Installation
#### dub.json
```json
    "render-nurse": "~>0.0.1"
```

#### dub.sdl
```sdl
    dependency "render-nurse" version="~>0.0.1"
```

## Example Usage
```d
module source.test;

import std.stdio:writeln;
import rendernurse.nurse;

RENDERDOC_API rdoc;

void main(){
    rdoc = attachToRenderDoc();
    if(rdoc){
        writeln("Attached to RenderDoc");
    }else{
        writeln("No RenderDoc process found");
        unloadRenderDoc();
    }

    loop();

    unloadRenderDoc();
}

void render(){

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    rdoc.StartFrameCapture();

    rdoc.EndFrameCapture();
}
```