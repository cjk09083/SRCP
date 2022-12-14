// Generated by gencpp from file srcp2_msgs/VolSensorMsg.msg
// DO NOT EDIT!


#ifndef SRCP2_MSGS_MESSAGE_VOLSENSORMSG_H
#define SRCP2_MSGS_MESSAGE_VOLSENSORMSG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace srcp2_msgs
{
template <class ContainerAllocator>
struct VolSensorMsg_
{
  typedef VolSensorMsg_<ContainerAllocator> Type;

  VolSensorMsg_()
    : header()
    , vol_type()
    , distance_to(0.0)  {
    }
  VolSensorMsg_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , vol_type(_alloc)
    , distance_to(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _vol_type_type;
  _vol_type_type vol_type;

   typedef float _distance_to_type;
  _distance_to_type distance_to;





  typedef boost::shared_ptr< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> const> ConstPtr;

}; // struct VolSensorMsg_

typedef ::srcp2_msgs::VolSensorMsg_<std::allocator<void> > VolSensorMsg;

typedef boost::shared_ptr< ::srcp2_msgs::VolSensorMsg > VolSensorMsgPtr;
typedef boost::shared_ptr< ::srcp2_msgs::VolSensorMsg const> VolSensorMsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator1> & lhs, const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.vol_type == rhs.vol_type &&
    lhs.distance_to == rhs.distance_to;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator1> & lhs, const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace srcp2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "79d667cc3950eac40bb1e3adee91ec19";
  }

  static const char* value(const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x79d667cc3950eac4ULL;
  static const uint64_t static_value2 = 0x0bb1e3adee91ec19ULL;
};

template<class ContainerAllocator>
struct DataType< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srcp2_msgs/VolSensorMsg";
  }

  static const char* value(const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#\n"
"# Space Robotics Simulation, Phase 2\n"
"# Copyright (c) 2019-2020, NASA-JSC. All Rights Reserved\n"
"# Unauthorized copying or distribution of this code is strictly prohibited\n"
"#\n"
"# Volatile Sensor query message.\n"
"#\n"
"Header      header\n"
"string      vol_type         # the type name string\n"
"float32     distance_to      # absolute distance from sensor to volatile (meters)\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.vol_type);
      stream.next(m.distance_to);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct VolSensorMsg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srcp2_msgs::VolSensorMsg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::srcp2_msgs::VolSensorMsg_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "vol_type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.vol_type);
    s << indent << "distance_to: ";
    Printer<float>::stream(s, indent + "  ", v.distance_to);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SRCP2_MSGS_MESSAGE_VOLSENSORMSG_H
