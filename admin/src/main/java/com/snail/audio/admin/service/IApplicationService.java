package com.snail.audio.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.snail.audio.admin.entity.App;
@Service
public interface IApplicationService {
     public List<App> getApplication(int start,int end);
}
