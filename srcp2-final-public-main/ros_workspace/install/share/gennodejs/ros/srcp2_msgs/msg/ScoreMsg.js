// Auto-generated. Do not edit!

// (in-package srcp2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ScoreMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.score = null;
      this.hauler_volatile_score = null;
      this.types_collected = null;
      this.masses_collected_kg = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
      }
      if (initObj.hasOwnProperty('hauler_volatile_score')) {
        this.hauler_volatile_score = initObj.hauler_volatile_score
      }
      else {
        this.hauler_volatile_score = 0.0;
      }
      if (initObj.hasOwnProperty('types_collected')) {
        this.types_collected = initObj.types_collected
      }
      else {
        this.types_collected = [];
      }
      if (initObj.hasOwnProperty('masses_collected_kg')) {
        this.masses_collected_kg = initObj.masses_collected_kg
      }
      else {
        this.masses_collected_kg = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ScoreMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float64(obj.score, buffer, bufferOffset);
    // Serialize message field [hauler_volatile_score]
    bufferOffset = _serializer.float64(obj.hauler_volatile_score, buffer, bufferOffset);
    // Serialize message field [types_collected]
    bufferOffset = _arraySerializer.string(obj.types_collected, buffer, bufferOffset, null);
    // Serialize message field [masses_collected_kg]
    bufferOffset = _arraySerializer.float64(obj.masses_collected_kg, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ScoreMsg
    let len;
    let data = new ScoreMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hauler_volatile_score]
    data.hauler_volatile_score = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [types_collected]
    data.types_collected = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [masses_collected_kg]
    data.masses_collected_kg = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.types_collected.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 8 * object.masses_collected_kg.length;
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'srcp2_msgs/ScoreMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd717730154f875f7091c54cda3c9ac8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2021, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    # 
    # This message publishes the current score, and volatile collection state
    # for this simulation
    #
    Header header
    
    # scoring data
    float64 score # the current total score for this sim
    float64 hauler_volatile_score # the score of all the volatiles currently held in hauler bins (tie-breaker #1)
    
    # collection data (indexes align) -- this is for competitor information and used in tie-breaking
    string[] types_collected      # which types have been collected to date?
    float64[] masses_collected_kg # how much each type?
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ScoreMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
    }

    if (msg.hauler_volatile_score !== undefined) {
      resolved.hauler_volatile_score = msg.hauler_volatile_score;
    }
    else {
      resolved.hauler_volatile_score = 0.0
    }

    if (msg.types_collected !== undefined) {
      resolved.types_collected = msg.types_collected;
    }
    else {
      resolved.types_collected = []
    }

    if (msg.masses_collected_kg !== undefined) {
      resolved.masses_collected_kg = msg.masses_collected_kg;
    }
    else {
      resolved.masses_collected_kg = []
    }

    return resolved;
    }
};

module.exports = ScoreMsg;
