<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	const contextPath = "${pageContext.request.contextPath }"; /* js file 용 - contextPath 변수 지정 */
</script>
<script>
	const principal_username = "${principal.username }"; /*js file 용 - principal_username 변수 지정 */
</script>
<script>
	var alertmsg = "${alertmsg}";
	if(alertmsg){
		alert(alertmsg);
	}
</script>