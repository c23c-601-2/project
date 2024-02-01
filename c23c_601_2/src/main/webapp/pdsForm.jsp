<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="./css/imageForm.css" rel="stylesheet">
<!-- 본문시작 pdsForm.jsp -->
	<h3 class="h3"> * 사진 올리기 * </h3>
    <form name="photoForm" method="post" enctype="multipart/form-data" action="pdsIns.jsp" onsubmit="return pdsCheck(this)">
    <table class="form_table">
    	<tr>
          <th>이름</th>
          <td><input type="text" id="wname" name="wname" size="20" maxlength="100" required autofocus></td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
          	<textarea rows="5" cols="30" id="content" name="subject"></textarea>
          </td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" id="pw" name="passwd"></td>
        </tr>
        <tr>
          <th>첨부파일</th>
          <td><input type="file" id="filename" name="filename"></td>
        </tr>
        <tr>
          <td colspan="2">
          	<input type="submit" id="submit_button" value="전송">
            <input type="reset" id="reset_button" value="취소">
          </td>
        </tr>
    </table>
	</form>
<!-- 본문끝 -->


<script>

function pdsCheck(f){
 	//포토갤러리 유효성 검사
    //1) 이름이 2자 이상인가
    var wname=f.wname.value;
    wname=wname.trim();
    if(wname.length<2){
    	alert("이름은 2자 이상 입력해주세요.");
        f.wname.focus();
        return false;
    }//if end
    
    //2) 제목 (굳이 안 만들어도 될 것 같음)
    
    //3) 비밀번호는 4~15자 이내
    var passwd=f.passwd.value;
    passwd=passwd.trim();
    if(passwd.length<4 || passwd.length>15){
  	    alert("비밀번호를 4~15자 이내인지 확인해주세요");
  	    f.passwd.focus(); //커서 가져다 두기
  	    return false;  
  	}// if end	
    
    //4) 첨부파일
    var filename=f.filename.value;
    filename=filename.trim();
    if(filename.length==0){
    	alert("첨부파일을 선택하세요.");
        return false;
    }else{
        //파일 타입 (확장자를 출력하시오)
        
        //마지막 . 의 순서
        var dot=filename.lastIndexOf(".");
        
        //마지막 . 이후 문자열만 자르기 ( . 의 순서 그 다음의 문자열부터 가져와야하기 때문에 +1)
  	var ext=filename.substr(dot+1);  
        
        //전부 소문자로 치환
        ext=ext.toLowerCase();
        
        //포토게시판이기 때문에 확장자를 잘라서 이미지 확장자 찾기
        if(ext=="png" || ext=="jpg" || ext=="gif"){
  				return true;
  		}else{
  				alert("이미지 파일만 가능합니다.");
  				return false;
  		}//if end
  				  				
  	}//if end
  		return true;
                
}//pdsCheck() end
</script>