## <mark class='blue'>1절 데이터 모델의 이해</mark>
### <mark>1.모델링의 이해</mark>
<br>

#### 가. 모델링의 정의
복잡한 현실세계를 일정한 표기법에 의해 표현하는 일.
복잡한 현실세계를 단순화해 표현하는 것이다.

##### 모델링의 특징
* 추상화
	* 현실세계를 일정한 형식에 맞추어 표현함.
* 단순화
	* 복잡한 현실세계를 약속된 규약에 의해 제한된 표기법이나 언어로 표현하여 쉽게 이해할 수 있도록 함.
* 명확화
	* 누구나 이해하기 쉽게 하기 위해 대상에 대한 애매모호함을 제거하고 정확하게 현상을 기술.

##### 모델링의 관점
* 데이터 관점
* 프로세스 관점
* 데이터와 프로세스의 상관 관점
---
### <mark>2.데이터 모델의 기본 개념 이해</mark><br>
**데이터 모델링이란?**

정보시스템을 구축하기 위한 데이터 관점의 업무분석 기법
* 실무적으로는 업무에서 필요한 데이터를 시스템 구축 방법론에 따라 분석하고 설계하여 정보시스템을 구축하는 과정으로 정의

**데이터 모델이 제공하는 기능**
* 시스템 가시화, 행동 명세화, 구조화 틀 제공, 문서화 등등

### <mark>3.데이터 모델링의 중요성 및 유의점</mark><br>
* 파급효과
* 복잡한 정보 요구 사항의 간결한 표현
* 데이터 품질
	* 중복, 비유연성, 비일관성

### <mark class='pink'>4.데이터 모델링의 중요성 및 유의점</mark><br>
1. 상위 수준을 형상화 하기 위한 개념적 데이터 모델링
2. 구체화한 업무 중심의 데이터 모델을 만드는 논리적 모델링
3. 테이블 스페이스 등을 고려한 물리적 데이터 모델링

### <mark class='a'>5. 프로젝트 생명주기에서 데이터 모델링</mark><br>
데이터 축/ 애플리케이션 축(Process)
 분석: 개념적&논리적 데이터 모델링 / 프로세스 모델링
 설계: 물리적 데이터 모델링 / AP 설계
 개발: DB 구축 / AP 개발
 테스트: DB 튜닝 / AP 테스트
 전환/ 이행: DB 전환 / AP 설치

### <mark class='pink'>6. 데이터 모델링에서 데이터 독립성의 이해</mark><br>
- 데이터독립성의 필요
- 데이터베이스 3단계 구조
> 외부 단계
> >논리적 데이터 독립성
> 
> 개념적 단계
> >물리적 데이터 독립성
> 
> 내부적 단계
- 데이터독립성 요소
	- 외부 스키마 == 서브스키마
		- 사용자가 보는 개인적 DB 스키마
	- 개념스키마
		- 응용시스템 사용자들이 필요로 하는 데이터를 통합한 전체 DB 기술
	- 내부스키마
		- DB가 물리적으로 저장된 형식
- 두 영역의 데이터독립성
- 사상 (Mapping)
		
