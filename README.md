# SRCP
<div>
<img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/>
<img src="https://img.shields.io/badge/OpenCV-5C3EE8?style=for-the-badge&logo=OpenCV&logoColor=white"/>
<img src="https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=TensorFlow&logoColor=white"/>

<a href="http://www.riss.kr/link?id=T15894033" target="_blank">
<img src="https://img.shields.io/badge/관련논문-FF0000?style=for-the-badge&logo=Apache&logoColor=white"/>
</a>
</div>

## SRCP: Space Robotics Challenge Phase 2 (NASA) 프로젝트

 <div align="center">
<img src="%EC%82%AC%EC%A7%84%26%EC%98%81%EC%83%81/0.%20Main.png" width="40%"/>
 &nbsp;
<img src="사진%26영상/GAZEBO.png" width="55%"/>
</div>
 

## 목적
- 다른 별에서 현장자원활용(In-Situ Resource Utilization : ISRU)이 가능한 자동 제어 로봇 개발
- 로봇을 제어하여 <b>1.자원 탐지 / 2.자원 채취 / 3.기지로 복귀</b> 미션을 연속으로 수행
- 성공적인 주행을 위해 Image Classification과 SLAM 기술을 적용

## 담당
- 프로젝트 통합 (With Purdue University)
- 로봇 주행 컨트롤러 (Python, ROS)
- 이미지 기반 거리 및 좌표 측정 (cv2)
- 장애물 회피 알고리즘
- SLAM을 활용한 주행 알고리즘 (RTAB SLAM)

## 구성
- 로봇은 자원을 탐지하는 Scout, 채취하는 Excavator, 수송하는 Hauler가 2대씩 총 6대로 구성
<div align="center">
<img src="사진%26영상/1.%20Scout.png" width="30%"/>&nbsp;
<img src="사진%26영상/2.%20Excavator.png" width="35%"/>&nbsp;
<img src="사진%26영상/3.%20Hauler.png" width="24%"/>
</div></br>
 
- 로봇에는 공통적으로 회전가능한 관절들과 라이트, 카메라, IMU, LIDAR 센서가 제공 
- 로봇의 충전을 위해선 로봇을 회전시켜 태양광 패널로 충전을 하거나 Repair Station으로 복귀해야 함
- 자원을 수송하는 Hauler가 Processing plant의 제출상자에 광물을 성공적으로 제출해야 점수가 획득
<div align="center">
<img src="사진%26영상/4.%20Processing%20plant.png" width="28%"/>&nbsp;
<img src="사진%26영상/4-2%20Plant%26Hauler.png" width="45%"/>
</div></br>
 
## 기능

### 1. 로봇 컨트롤러 
- 로봇의 컨트롤러는 모두 Python으로 구성
- 모든 로봇에 공통적으로 관절과 바퀴를 제어해 원하는 좌표까지 이동하는 메인 컨트롤러를 기본으로 개별 클래스로 카메라, 조명, 센서들, 버킷, 카고등을 연결
- 모든 센서값과 제어 명령은 ROS 메세지로 구현

### 2. RTAB SLAM
- Localization(현재 위치 파악)을 위해 RTAB SLAM(Simultaneous Localization and Mapping)을 활용해 Odometry(주행기록계) 구현 
- 아래 좌측 사진은 RTAB SLAM의 구현 예, 우측은 SRCP에서 구현된 RTAB SLAM

### 3. 이미지 기반 거리 및 좌표 보정
- IMU와 SLAM을 사용해도 점점 위치 오차가 누적되기 때문에 광물을 탐지할때 좌표의 정확도가 하락
- 광물을 탐지할때마다 맵의 중앙에 있는 Plant을 바라보고 카메라에 나타나는 건물의 높이를 통해 거리를 측정
- 이후 측정된 거리와 필터링된 IMU 값을 이용해 현재 좌표를 보정
- 이후 광물을 제출하러 기지 중앙에 왔을때도 Plant를 바라보고 좌표 보정

### 4. 장애물 회피
- 장애물을 탐지하기 위해 라이다(Lidar)센서를 사용
- 라이다 센서로 거리만 탐지할경우 아래와 같이 언덕 지형(좌측)도 장애물(우측)으로 감지되는 문제가 발생

<div align="center">
<img src="사진%26영상/6-1%20언덕%20앞%20로봇.png" width="40%"/>&nbsp;
<img src="사진%26영상/6-2%20암석%20앞%20로봇.png" width="40%"/>
</div></br>

- 라이다 센서로 측정된 점들의 연속성을 감지하는 알고리즘을 통해 암석과 언덕 지형을 구분
- 장애물을 만나면 로봇과의 각도에 따라 측면으로 회전하여 회피후 진행

<div align="center">
<img src="사진%26영상/장애물회피.gif" width="60%"/>
</div></br>

### 5. 이미지 분류 (YOLO)
- 인공지능 Image Classification 알고리즘인 YOLO를 사용해 카메라 영상에서 광물을 탐지하고 광물의 방향을 측정 (좌측: 광물, 우측: 광물을 판별하고 접근)
<div align="center">
<img src="사진%26영상/지형에%20묻힌%20광물.png" width="40%"/>&nbsp;
<img src="사진%26영상/광물탐지.gif" width="40%"/>
</div></br>




## 수상
- <b>SRCP: Space Robotics Challenge Phase 2 (NASA 미항공우주국) :	<a href="http://www.irobotnews.com/news/articleView.html?idxno=23801" target="_blank">Qualification Winner 2021.02 </a></b>


 <div align="center">
<img src="사진%26영상/Purdue-Hongik%20Team%20Qualifier%20Certificate.png" width="100%"/>
</div></br>
