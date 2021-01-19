package com.elephone.management.service;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class AuthService {
    public List<String> getAuthorities() {
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        List<String> authorities = grantedAuthorities.stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList());
        return authorities;
    }
}
