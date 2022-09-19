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

class SystemPowerSaveSrvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.power_save = null;
    }
    else {
      if (initObj.hasOwnProperty('power_save')) {
        this.power_save = initObj.power_save
      }
      else {
        this.power_save = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SystemPowerSaveSrvRequest
    // Serialize message field [power_save]
    bufferOffset = _serializer.bool(obj.power_save, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SystemPowerSaveSrvRequest
    let len;
    let data = new SystemPowerSaveSrvRequest(null);
    // Deserialize message field [power_save]
    data.power_save = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/SystemPowerSaveSrvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '998b7585d22f359014b545da29bfc6f2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2019, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    bool power_save
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SystemPowerSaveSrvRequest(null);
    if (msg.power_save !== undefined) {
      resolved.power_save = msg.power_save;
    }
    else {
      resolved.power_save = false
    }

    return resolved;
    }
};

class SystemPowerSaveSrvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SystemPowerSaveSrvResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SystemPowerSaveSrvResponse
    let len;
    let data = new SystemPowerSaveSrvResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.message);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'srcp2_msgs/SystemPowerSaveSrvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SystemPowerSaveSrvResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SystemPowerSaveSrvRequest,
  Response: SystemPowerSaveSrvResponse,
  md5sum() { return '7952b3919e8de2c1fd024be9ea064cf1'; },
  datatype() { return 'srcp2_msgs/SystemPowerSaveSrv'; }
};
