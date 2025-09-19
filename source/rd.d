module rendernurse.rd;

// Docs: https://renderdoc.org/docs/in_application_api.html
// Header reference: https://github.com/baldurk/renderdoc/blob/v1.x/renderdoc/api/app/renderdoc_app.h


// Hand translated from the header to what you see below.

extern(C) @safe @nogc:
enum RENDERDOC_API_Version {
    Version_1_0_0 = 10000,
    Version_1_0_1 = 10001,
    Version_1_0_2 = 10002,
    Version_1_1_0 = 10100,
    Version_1_1_1 = 10101,
    Version_1_1_2 = 10102,
    Version_1_2_0 = 10200,
    Version_1_3_0 = 10300,
    Version_1_4_0 = 10400,
    Version_1_4_1 = 10401,
    Version_1_4_2 = 10402,
    Version_1_5_0 = 10500,
    Version_1_6_0 = 10600
}


alias RENDERDOC_WindowHandle = void*;
alias RENDERDOC_DevicePointer = void*;

enum RENDERDOC_CaptureOption {
    eRENDERDOC_Option_AllowVSync = 0,
    eRENDERDOC_Option_AllowFullScreen = 1,

    eRENDERDOC_Option_APIValidation = 2,
    eRENDERDOC_Option_DebugDeviceMode = eRENDERDOC_Option_APIValidation,
    eRENDERDOC_Option_CaptureCallstacks = 3,

    eRENDERDOC_Option_CaptureCallstacksOnlyDraws = 4,
    eRENDERDOC_Option_CaptureCallstacksOnlyActions = eRENDERDOC_Option_CaptureCallstacksOnlyDraws,

    eRENDERDOC_Option_DelayForDebugger = 5,

    eRENDERDOC_Option_VerifyBufferAccess = 6,
    eRENDERDOC_Option_VerifyMapWrites = eRENDERDOC_Option_VerifyBufferAccess,
    
    eRENDERDOC_Option_HookIntoChildren = 7,
    eRENDERDOC_Option_RefAllResource = 8,
    eRENDERDOC_Option_SaveAllInitials = 9,
    eRENDERDOC_Option_CaptureAllCmdLists = 10,
    eRENDERDOC_Option_DebugOutputMute = 11,
    eRENDERDOC_Option_AllowUnsupportedVendorExtensions = 12,
    eRENDERDOC_Option_SoftMemoryLimit = 13
}

alias pRENDERDOC_SetCaptureOptionU32 = int function(RENDERDOC_CaptureOption opt, uint val);
alias pRENDERDOC_SetCaptureOptionF32 = int function(RENDERDOC_CaptureOption opt, float val);

alias pRENDERDOC_GetCaptureOptionU32 = int  function(RENDERDOC_CaptureOption opt);
alias pRENDERDOC_GetCaptureOptionF32 = float  function(RENDERDOC_CaptureOption opt);

enum RENDERDOC_InputButton {
    eRENDERDOC_Key_0 = 0x30,
    eRENDERDOC_Key_1 = 0x31,
    eRENDERDOC_Key_2 = 0x32,
    eRENDERDOC_Key_3 = 0x33,
    eRENDERDOC_Key_4 = 0x34,
    eRENDERDOC_Key_5 = 0x35,
    eRENDERDOC_Key_6 = 0x36,
    eRENDERDOC_Key_7 = 0x37,
    eRENDERDOC_Key_8 = 0x38,
    eRENDERDOC_Key_9 = 0x39,

    eRENDERDOC_Key_A = 0x41,
    eRENDERDOC_Key_B = 0x42,
    eRENDERDOC_Key_C = 0x43,
    eRENDERDOC_Key_D = 0x44,
    eRENDERDOC_Key_E = 0x45,
    eRENDERDOC_Key_F = 0x46,
    eRENDERDOC_Key_G = 0x47,
    eRENDERDOC_Key_H = 0x48,
    eRENDERDOC_Key_I = 0x49,
    eRENDERDOC_Key_J = 0x4A,
    eRENDERDOC_Key_K = 0x4B,
    eRENDERDOC_Key_L = 0x4C,
    eRENDERDOC_Key_M = 0x4D,
    eRENDERDOC_Key_N = 0x4E,
    eRENDERDOC_Key_O = 0x4F,
    eRENDERDOC_Key_P = 0x50,
    eRENDERDOC_Key_Q = 0x51,
    eRENDERDOC_Key_R = 0x52,
    eRENDERDOC_Key_S = 0x53,
    eRENDERDOC_Key_T = 0x54,
    eRENDERDOC_Key_U = 0x55,
    eRENDERDOC_Key_V = 0x56,
    eRENDERDOC_Key_W = 0x57,
    eRENDERDOC_Key_X = 0x58,
    eRENDERDOC_Key_Y = 0x59,
    eRENDERDOC_Key_Z = 0x5A,

    eRENDERDOC_Key_NonPrintable = 0x100,

    eRENDERDOC_Key_Divide,
    eRENDERDOC_Key_Multiply,
    eRENDERDOC_Key_Subtract,
    eRENDERDOC_Key_Plus,

    eRENDERDOC_Key_F1,
    eRENDERDOC_Key_F2,
    eRENDERDOC_Key_F3,
    eRENDERDOC_Key_F4,
    eRENDERDOC_Key_F5,
    eRENDERDOC_Key_F6,
    eRENDERDOC_Key_F7,
    eRENDERDOC_Key_F8,
    eRENDERDOC_Key_F9,
    eRENDERDOC_Key_F10,
    eRENDERDOC_Key_F11,
    eRENDERDOC_Key_F12,

    eRENDERDOC_Key_Home,
    eRENDERDOC_Key_End,
    eRENDERDOC_Key_Insert,
    eRENDERDOC_Key_Delete,
    eRENDERDOC_Key_PageUp,
    eRENDERDOC_Key_PageDn,

    eRENDERDOC_Key_Backspace,
    eRENDERDOC_Key_Tab,
    eRENDERDOC_Key_PrtScrn,
    eRENDERDOC_Key_Pause,

    eRENDERDOC_Key_Max,
}

alias pRENDERDOC_SetFocusToggleKeys = void function(RENDERDOC_InputButton* keys, int num);
alias pRENDERDOC_SetCaptureKeys = void function(RENDERDOC_InputButton* keys, int num);

enum RENDERDOC_OverlayBits{
    eRENDERDOC_Overlay_Enabled = 0x1,
    eRENDERDOC_Overlay_FrameRate = 0x2,
    eRENDERDOC_Overlay_FrameNumber = 0x4,
    eRENDERDOC_Overlay_CaptureList = 0x8,
    eRENDERDOC_Overlay_Default = (eRENDERDOC_Overlay_Enabled | eRENDERDOC_Overlay_FrameRate |
                                eRENDERDOC_Overlay_FrameNumber | eRENDERDOC_Overlay_CaptureList),
    eRENDERDOC_Overlay_All = 0x7ffffff,
    eRENDERDOC_Overlay_None = 0
}

alias pRENDERDOC_GetOverlayBits = uint function();
alias pRENDERDOC_MaskOverlayBits = void function(uint And, uint Or);

alias pRENDERDOC_RemoveHooks = void function();
alias pRENDERDOC_Shutdown = pRENDERDOC_RemoveHooks;

alias pRENDERDOC_UnloadCrashHandler = void function();

alias pRENDERDOC_SetCaptureFilePathTemplate = void function(const(char)* path);
alias pRENDERDOC_SetLogFilePathTemplate = pRENDERDOC_SetCaptureFilePathTemplate;

alias pRENDERDOC_GetCaptureFilePathTemplate = const(char)* function();
alias pRENDERDOC_GetLogFilePathTemplate = pRENDERDOC_GetCaptureFilePathTemplate;

alias pRENDERDOC_GetNumCaptures = uint function();

alias pRENDERDOC_GetCapture = uint function(uint index, char* filename, uint* pathLen, long* timestamp);

alias pRENDERDOC_SetCaptureFileComments = void function(const(char)* filename, const(char)* comments);

alias pRENDERDOC_IsTargetControlConnected = uint function();
alias pRENDERDOC_IsRemoteAccessConnected = pRENDERDOC_IsTargetControlConnected;

alias pRENDERDOC_LaunchReplayUI = uint function(uint target, const(char)* cmdline);

alias pRENDERDOC_GetAPIVersion = void function(int* major, int* minor, int* patch);

alias pRENDERDOC_ShowReplayUI = void function();

alias pRENDERDOC_SetActiveWindow = void function(RENDERDOC_DevicePointer device, RENDERDOC_WindowHandle window);

alias pRENDERDOC_TriggerCapture = void function();
alias pRENDERDOC_TriggerMultiFrameCapture = void function(uint num);

alias pRENDERDOC_StartFrameCapture = void function(RENDERDOC_DevicePointer device, RENDERDOC_WindowHandle window);

alias pRENDERDOC_IsFrameCapturing = uint function();

alias pRENDERDOC_EndFrameCapture = uint function(RENDERDOC_DevicePointer device, RENDERDOC_WindowHandle window);

alias pRENDERDOC_DiscardFrameCapture = void function(RENDERDOC_DevicePointer device, RENDERDOC_WindowHandle window);

alias pRENDERDOC_SetCaptureTitle = void function(const(char)* title);

struct RENDERDOC_API_1_6_0 {
    pRENDERDOC_GetAPIVersion GetAPIVersion;

    pRENDERDOC_SetCaptureOptionU32 SetCaptureOptionU32;
    pRENDERDOC_SetCaptureOptionF32 SetCaptureOptionF32;

    pRENDERDOC_GetCaptureOptionU32 GetCaptureOptionU32;
    pRENDERDOC_GetCaptureOptionF32 GetCaptureOptionF32;

    pRENDERDOC_SetFocusToggleKeys SetFocusToggleKeys;
    pRENDERDOC_SetCaptureKeys SetCaptureKeys;

    pRENDERDOC_GetOverlayBits GetOverlayBits;
    pRENDERDOC_MaskOverlayBits MaskOverlayBits;

    union{
        pRENDERDOC_Shutdown Shutdown;   
        pRENDERDOC_RemoveHooks RemoveHooks;
    }

    pRENDERDOC_UnloadCrashHandler UnloadCrashHandler;

    union{
        pRENDERDOC_SetLogFilePathTemplate SetLogFilePathName;
        pRENDERDOC_SetCaptureFilePathTemplate SetCaptureFilePathTemplate;
    }

    union{
        pRENDERDOC_GetLogFilePathTemplate GetLogFilePathName;
        pRENDERDOC_GetCaptureFilePathTemplate GetCaptureFilePathTemplate;
    }

    pRENDERDOC_GetNumCaptures GetNumCaptures;
    pRENDERDOC_GetCapture GetCapture;

    pRENDERDOC_TriggerCapture TriggerCapture;

    union{
        pRENDERDOC_IsRemoteAccessConnected IsRemoteAccessConnected;
        pRENDERDOC_IsTargetControlConnected IsTargetControlConnected;
    }

    pRENDERDOC_LaunchReplayUI LaunchReplayUI;
    pRENDERDOC_SetActiveWindow SetActiveWindow;

    pRENDERDOC_StartFrameCapture StartFrameCapture;
    pRENDERDOC_IsFrameCapturing IsFrameCapturing;
    pRENDERDOC_EndFrameCapture EndFrameCapture;

    pRENDERDOC_TriggerMultiFrameCapture TriggerMultiFrameCaptrue;

    pRENDERDOC_SetCaptureFileComments SetCaptureFileComments;

    pRENDERDOC_DiscardFrameCapture DiscardFrameCapture;

    pRENDERDOC_ShowReplayUI ShowReplayUI;

    pRENDERDOC_SetCaptureTitle SetCaptureTitle;
}

alias RENDERDOC_API_1_0_0 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_0_1 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_0_2 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_1_0 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_1_2 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_2_0 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_3_0 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_4_0 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_4_1 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_4_2 = RENDERDOC_API_1_6_0;
alias RENDERDOC_API_1_5_0 = RENDERDOC_API_1_6_0;

alias pRENDERDOC_GetAPI = int function(RENDERDOC_API_Version ver, void** outAPIPointers);