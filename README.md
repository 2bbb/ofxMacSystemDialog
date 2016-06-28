# ofxMacSystemDialog

more detailed ofSystem{Load,Save}Dialog for OSX

## API

### ofxMacSystemLoadDialog

```
ofFileDialogResult ofxMacSystemLoadDialog(const std::string &windowTitle = "",
                                          bool bFolderSelection = false,
                                          const std::string &defaultPath = "",
                                          const std::vector<std::string> &allowedTypes = std::vector<std::string>());
```

### ofxMacSystemSaveDialog

```
ofFileDialogResult ofxMacSystemSaveDialog(const std::string &defaultName,
                                          const std::string &messageName,
                                          const std::string &defaultPath = "",
                                          const std::vector<std::string> &allowedTypes = std::vector<std::string>());
```

## Update history

### 2016/06/28 ver 0.0.1 release

## License

MIT License.

## Author

* ISHII 2bit [bufferRenaiss co., ltd.]
* ishii[at]buffer-renaiss.com

## At the last

Please create a new issue if there is a problem.
And please throw a pull request if you have a cool idea!!
