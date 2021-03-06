classdef audioFile < robotics.ros.Message
    %audioFile MATLAB implementation of audio_receiver/audioFile
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2014-2017 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'audio_receiver/audioFile' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'f85244da6f4f35e48c2efcfd878b4fc3' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Dependent)
        FileName
        FileData
    end
    
    properties (Constant, Hidden)
        PropertyList = {'FileData', 'FileName'} % List of non-constant message properties
        ROSPropertyList = {'file_data', 'file_name'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = audioFile(msg)
            %audioFile Construct the message object audioFile
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function filename = get.FileName(obj)
            %get.FileName Get the value for property FileName
            filename = char(obj.JavaMessage.getFileName);
        end
        
        function set.FileName(obj, filename)
            %set.FileName Set the value for property FileName
            validateattributes(filename, {'char'}, {}, 'audioFile', 'FileName');
            
            obj.JavaMessage.setFileName(filename);
        end
        
        function filedata = get.FileData(obj)
            %get.FileData Get the value for property FileData
            javaArray = obj.JavaMessage.getFileData;
            array = obj.readJavaArray(javaArray, 'int16');
            filedata = int16(array);
        end
        
        function set.FileData(obj, filedata)
            %set.FileData Set the value for property FileData
            if ~isvector(filedata) && isempty(filedata)
                % Allow empty [] input
                filedata = int16.empty(0,1);
            end
            
            validateattributes(filedata, {'numeric'}, {'vector'}, 'audioFile', 'FileData');
            
            javaArray = obj.JavaMessage.getFileData;
            array = obj.writeJavaArray(filedata, javaArray, 'int16');
            obj.JavaMessage.setFileData(array);
        end
    end
    
    methods (Access = protected)
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Iterate over all primitive properties
            cpObj.FileName = obj.FileName;
            cpObj.FileData = obj.FileData;
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.FileName = strObj.FileName;
            obj.FileData = strObj.FileData;
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.FileName = obj.FileName;
            strObj.FileData = obj.FileData;
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.audio_receiver.audioFile.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.audio_receiver.audioFile;
            obj.reload(strObj);
        end
    end
end
