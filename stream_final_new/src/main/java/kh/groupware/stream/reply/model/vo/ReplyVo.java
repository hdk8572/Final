package kh.groupware.stream.reply.model.vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
public class ReplyVo {

	public String rno;
	public String tno;
	public String userid;
	public String rcontent;
	public String rdate;
	
}
