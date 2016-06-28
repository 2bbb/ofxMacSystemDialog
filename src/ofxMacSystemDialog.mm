//
//  ofxMacSystemDialog.mm
//
//  Created by ISHII 2bit on 2016/06/28.
//
//

#include "ofxMacSystemDialog.h"

#if defined( TARGET_OSX )

static void restoreAppWindowFocus(){
    NSWindow * appWindow = (NSWindow *)ofGetCocoaWindow();
    if(appWindow) {
        [appWindow makeKeyAndOrderFront:nil];
    }
}

ofFileDialogResult ofxMacSystemLoadDialog(const std::string &windowTitle,
                                          bool bFolderSelection,
                                          const std::string &defaultPath,
                                          const std::vector<std::string> &types)
{
    ofFileDialogResult results;
    
    @autoreleasepool {
        NSOpenGLContext *context = [NSOpenGLContext currentContext];
        
        NSOpenPanel * loadDialog = [NSOpenPanel openPanel];
        [loadDialog setAllowsMultipleSelection:NO];
        [loadDialog setCanChooseDirectories:bFolderSelection];
        [loadDialog setResolvesAliases:YES];
        
        if(!windowTitle.empty()) {
            [loadDialog setTitle:[NSString stringWithUTF8String:windowTitle.c_str()]];
        }
        
        if(!defaultPath.empty()) {
            NSString * s = [NSString stringWithUTF8String:defaultPath.c_str()];
            s = [[s stringByExpandingTildeInPath] stringByResolvingSymlinksInPath];
            NSURL * defaultPathUrl = [NSURL fileURLWithPath:s];
            [loadDialog setDirectoryURL:defaultPathUrl];
        }
        
        if(!types.empty()) {
            NSMutableArray *allowedFileTypes = [NSMutableArray new];
            for(auto &type : types) {
                [allowedFileTypes addObject:@(type.c_str())];
            }
            [loadDialog setAllowedFileTypes:allowedFileTypes];;
        }
        NSInteger buttonClicked = [loadDialog runModal];
        [context makeCurrentContext];
        restoreAppWindowFocus();
        
        if(buttonClicked == NSFileHandlingPanelOKButton) {
            NSURL * selectedFileURL = [[loadDialog URLs] objectAtIndex:0];
            results.filePath = string([[selectedFileURL path] UTF8String]);
        }
    }

    if( results.filePath.length() > 0 ){
        results.bSuccess = true;
        results.fileName = ofFilePath::getFileName(results.filePath);
    }
    
    return results;
}

ofFileDialogResult ofxMacSystemSaveDialog(const std::string &defaultName,
                                          const std::string &messageName,
                                          const std::string &defaultPath,
                                          const std::vector<std::string> &types)
{
    ofFileDialogResult results;
    
    @autoreleasepool {
        NSSavePanel *saveDialog = [NSSavePanel savePanel];
        NSOpenGLContext *context = [NSOpenGLContext currentContext];
        [saveDialog setMessage:@(messageName.c_str())];
        [saveDialog setNameFieldStringValue:@(defaultName.c_str())];
        [saveDialog setDirectoryURL:[NSURL fileURLWithPath:@(defaultPath.c_str())]];
        if(!types.empty()) {
            NSMutableArray *allowedFileTypes = [NSMutableArray new];
            for(auto &type : types) {
                [allowedFileTypes addObject:@(type.c_str())];
            }
            [saveDialog setAllowedFileTypes:allowedFileTypes];
        }
        
        NSInteger buttonClicked = [saveDialog runModal];
        restoreAppWindowFocus();
        [context makeCurrentContext];
        
        if(buttonClicked == NSFileHandlingPanelOKButton){
            results.filePath = string([[[saveDialog URL] path] UTF8String]);
        }
    }
    
    if( results.filePath.length() > 0 ){
        results.bSuccess = true;
        results.fileName = ofFilePath::getFileName(results.filePath);
    }
    
    return results;
}

#endif
