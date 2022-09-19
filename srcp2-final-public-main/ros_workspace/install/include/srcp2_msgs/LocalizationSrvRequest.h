// Generated by gencpp from file srcp2_msgs/LocalizationSrvRequest.msg
// DO NOT EDIT!


#ifndef SRCP2_MSGS_MESSAGE_LOCALIZATIONSRVREQUEST_H
#define SRCP2_MSGS_MESSAGE_LOCALIZATIONSRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace srcp2_msgs
{
template <class ContainerAllocator>
struct LocalizationSrvRequest_
{
  typedef LocalizationSrvRequest_<ContainerAllocator> Type;

  LocalizationSrvRequest_()
    : call(false)  {
    }
  LocalizationSrvRequest_(const ContainerAllocator& _alloc)
    : call(false)  {
  (void)_alloc;
    }



   typedef uint8_t _call_type;
  _call_type call;





  typedef boost::shared_ptr< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct LocalizationSrvRequest_

typedef ::srcp2_msgs::LocalizationSrvRequest_<std::allocator<void> > LocalizationSrvRequest;

typedef boost::shared_ptr< ::srcp2_msgs::LocalizationSrvRequest > LocalizationSrvRequestPtr;
typedef boost::shared_ptr< ::srcp2_msgs::LocalizationSrvRequest const> LocalizationSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator1> & lhs, const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.call == rhs.call;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator1> & lhs, const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace srcp2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d38b7b718cec41d2541ee881ff979ad0";
  }

  static const char* value(const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd38b7b718cec41d2ULL;
  static const uint64_t static_value2 = 0x541ee881ff979ad0ULL;
};

template<class ContainerAllocator>
struct DataType< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srcp2_msgs/LocalizationSrvRequest";
  }

  static const char* value(const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#\n"
"# Space Robotics Simulation, Phase 2\n"
"# Copyright (c) 2019, NASA-JSC. All Rights Reserved\n"
"# Unauthorized copying or distribution of this code is strictly prohibited\n"
"#\n"
"# Service message for getting rover absolute position\n"
"#\n"
"bool call\n"
;
  }

  static const char* value(const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.call);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct LocalizationSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::srcp2_msgs::LocalizationSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "call: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.call);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SRCP2_MSGS_MESSAGE_LOCALIZATIONSRVREQUEST_H
