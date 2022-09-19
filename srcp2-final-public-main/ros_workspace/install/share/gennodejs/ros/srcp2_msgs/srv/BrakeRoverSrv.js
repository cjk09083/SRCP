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

class BrakeRoverSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.brake_force = null;
    }
    else {
      if (initObj.hasOwnProperty('brake_force')) {
        this.brake_force = initObj.brake_force
      }
      else {
        this.brake_force = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BrakeRoverSrvRequest
    // Serialize message field [brake_force]
    bufferOffset = _serializer.float64(obj.brake_force, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BrakeRoverSrvRequest
    let len;
    let data = new BrakeRoverSrvRequest(null);
    // Deserialize message field [brake_force]
    data.brake_force = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/BrakeRoverSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c5ffc183306e0f005a1347749c77564';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2019, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    float64 brake_force
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BrakeRoverSrvRequest(null);
    if (msg.brake_force !== undefined) {
      resolved.brake_force = msg.brake_force;
    }
    else {
      resolved.brake_force = 0.0
    }

    return resolved;
    }
};

class BrakeRoverSrvResponse {
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
    // Serializes a message object of type BrakeRoverSrvResponse
    // Serialize message field [finished]
    bufferOffset = _serializer.bool(obj.finished, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BrakeRoverSrvResponse
    let len;
    let data = new BrakeRoverSrvResponse(null);
    // Deserialize message field [finished]
    data.finished = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/BrakeRoverSrvResponse';
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
    const resolved = new BrakeRoverSrvResponse(null);
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
  Request: BrakeRoverSrvRequest,
  Response: BrakeRoverSrvResponse,
  md5sum() { return '0c30799110874cd224d9a2d9de3215fc'; },
  datatype() { return 'srcp2_msgs/BrakeRoverSrv'; }
};
