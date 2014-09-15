/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.shirofaces;

import org.apache.shiro.authc.credential.DefaultPasswordService;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.DefaultHashService;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.apache.shiro.util.SimpleByteSource;

/**
 *
 * @author user
 */
public class SHA256 {

    public static void main(String args[]) {
        RandomNumberGenerator rng = new SecureRandomNumberGenerator();
        Object salt = rng.nextBytes();
        String hashedPasswordBase64 = new Sha256Hash("juancho18", salt, 1024).toBase64();

        Sha256Hash sha256Hash = new Sha256Hash("juancho18");
        System.out.println("Clave sin salt: " + sha256Hash.toHex());
        System.out.println("Clave con salt : " + hashedPasswordBase64);

        DefaultHashService hashService = new DefaultHashService();
        hashService.setHashIterations(50000); // 500000
        hashService.setHashAlgorithmName(Sha256Hash.ALGORITHM_NAME);
        hashService.setPrivateSalt(new SimpleByteSource("jumarome"));
        hashService.setGeneratePublicSalt(true);

        DefaultPasswordService passwordService = new DefaultPasswordService();
        passwordService.setHashService(hashService);
        String salte = hashService.getPrivateSalt().toBase64();
        String claveMaldita = passwordService.encryptPassword("unaep");
        System.out.println("Miraaa: " + claveMaldita);

        System.out.println("private salt= " + salte);

    }

}
