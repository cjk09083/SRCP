// Auto-generated. Do not edit!

// (in-package srcp2_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PidListSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.show_list = null;
    }
    else {
      if (initObj.hasOwnProperty('show_list')) {
        this.show_list = initObj.show_list
      }
      else {
        this.show_list = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PidListSrvRequest
    // Serialize message field [show_list]
    bufferOffset = _serializer.bool(obj.show_list, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PidListSrvRequest
    let len;
    let data = new PidListSrvRequest(null);
    // Deserialize message field [show_list]
    data.show_list = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/PidListSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8d020193fe1203f15066d15c91bb7954';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2020, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    bool     show_list    # shows all current PIDs of the rover's joints
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PidListSrvRequest(null);
    if (msg.show_list !== undefined) {
      resolved.show_list = msg.show_list;
    }
    else {
      resolved.show_list = false
    }

    return resolved;
    }
};

class PidListSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.finished = null;
    }
    else {
      if (initObj.hasOwnProperty('finished')) {
        this.finished = initObj.finished
      }
      else {
        this.finished = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PidListSrvResponse
    // Serialize message field [finished]
    bufferOffset = _serializer.bool(obj.finished, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PidListSrvResponse
    let len;
    let data = new PidListSrvResponse(null);
    // Deserialize message field [finished]
    data.finished = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/PidListSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2797c797e620a950ba704492d72873b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool finished
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PidListSrvResponse(null);
    if (msg.finished !== undefined) {
      resolved.finished = msg.finished;
    }
    else {
      resolved.finished = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PidListSrvRequest,
  Response: PidListSrvResponse,
  md5sum() { return '3f65269ed0f5642343d3d700bb52a4e0'; },
  datatype() { return 'srcp2_msgs/PidListSrv'; }
};
