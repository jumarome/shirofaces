/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.shirofaces;

import java.io.IOException;
import java.io.Serializable;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.security.sasl.AuthenticationException;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.omnifaces.util.Faces;
import org.omnifaces.util.Messages;

/**
 *
 * @author user
 */
@SessionScoped
@Named
public class login implements Serializable{

    /**
     * Creates a new instance of login
     */
    public login() {
    }
    
    private static final String HOME_URL = "faces/welcome.xhtml";

    private String username;
    private String password;
    private boolean remember;
    
    public void submit() throws IOException {
        try {
            SecurityUtils.getSubject().login(new UsernamePasswordToken(username, password, remember));
            
           
            SavedRequest savedRequest = WebUtils.getAndClearSavedRequest(Faces.getRequest());
            Faces.redirect(savedRequest != null ? savedRequest.getRequestUrl() : HOME_URL);
            
        }
        catch (AuthenticationException | IncorrectCredentialsException | UnknownAccountException e) {
            
            Messages.addGlobalError("Invalid Username/Password");
                             
        }
        
      
        
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isRemember() {
        return remember;
    }

    public void setRemember(boolean remember) {
        this.remember = remember;
    }
    
    
    
}
