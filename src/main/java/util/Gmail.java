package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    	//관리자의 아이디, 비밀번호 입력(구글 계정)
        return new PasswordAuthentication("kjy1ho@gmail.com","!jy1017121032a");
    	   
    }
    
}
