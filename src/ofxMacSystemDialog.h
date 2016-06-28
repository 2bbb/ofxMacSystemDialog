//
//  ofxMacSystemSaveDialog.h
//
//  Created by ISHII 2bit on 2016/06/28.
//
//

#pragma once

#ifndef ofxMacSystemSaveDialog_h
#define ofxMacSystemSaveDialog_h

#include "ofMain.h"

#if defined( TARGET_OSX )

ofFileDialogResult ofxMacSystemLoadDialog(const std::string &windowTitle = "",
                                          bool bFolderSelection = false,
                                          const std::string &defaultPath = "",
                                          const std::vector<std::string> &allowedTypes = std::vector<std::string>());

ofFileDialogResult ofxMacSystemSaveDialog(const std::string &defaultName,
                                          const std::string &messageName,
                                          const std::string &defaultPath = "",
                                          const std::vector<std::string> &allowedTypes = std::vector<std::string>());

#endif

#endif /* ofxMacSystemSaveDialog_h */
