/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.shirofaces;

import java.io.IOException;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import org.apache.shiro.SecurityUtils;
import org.omnifaces.util.Faces;
import org.omnifaces.util.Messages;


/**
 *
 * @author user
 */
@RequestScoped
@Named
public class logout {

    /**
     * Creates a new instance of logout
     */
    public logout() {
    }
   private static final String LOGIN_URL = "faces/login.xhtml";
    public void logout() throws IOException 
    {
        SecurityUtils.getSubject().logout();
        Faces.invalidateSession();
        Messages.addFlashGlobalInfo("You have successfully Sing out", (Object) null);
        Faces.redirect(LOGIN_URL);
        
    }
    
    
}
