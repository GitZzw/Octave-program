function aa= recorder(cf,handles)
%RECORDER Summary of this function goes here
% Detailed explanation goes here
% h=figure(soundrec);

h=cf;
thehandles=handles;
setappdata(h,'isrecording',1);

recObj = audiorecorder(48000,8,1);
record(recObj);
pause(0.2);
warning off % 当采样数据不够时，取消警告
while isrecording(recObj) % 检查对象是否仍在运行
    if getappdata(h,'isrecording')
        myRecording=getaudiodata(recObj);
        [m,n]=size(myRecording);
        if(m>48000)
            data2=myRecording(m-recObj.SampleRate:m,1);% 获取对象中的最后Ai.SampleRate个采样数据
        else
            data2=myRecording(1:m,1);% 获取对象中的最后Ai.SampleRate个采样数据
        end
        plot(thehandles.axes1,data2) % 绘制最后Ai.SampleRate个采样数据的图形，因此表现出来就是实时的了
        set(handles.axes1,'ylim',[-1 1],'xlim',[0 recObj.SampleRate],'yticklabel',[],'xticklabel',[]);
        box off;
        y1=fft(data2,2048); %对信号做2048点FFT变换
        f=recObj.SampleRate*(0:1023)/2048;
        bar(handles.axes2,f,abs(y1(1:1024)),0.8,'b') %做原始语音信号的FFT频谱图
        set(handles.axes2,'ylim',[0 8],'xlim',[0 20000],'yticklabel',[],'xticklabel',[]);%设置handles.axes2的横纵坐标范围
 %       set(handles.axes2,'yticklabel',[],'xticklabel',[]);%设置handles.axes2的横纵坐标范围
        box off;
%   y=abs(y1(1:1024));
        f=[1.00 1.25 1.60 2.00 2.50 3.15 4.00 5.00 6.30 8.00];
        fn=[f,10*f,100*f,1000*f,10000*f];
        fc=fn(1,15:44);
        oc6=2^(1/6);
        for i=1:length(fc)
       %下线频率
           fl=fc(i)/oc6;
       %上限频率
           fu=fc(i)*oc6;
           nl=round(fl*2048/recObj.SampleRate+1);
           nu=round(fu*2048/recObj.SampleRate+1);
           if(fu>48000/2)
               numm=i-1;break
           else
               numm=30;
           end
           b=zeros(1,2048);
           b(nl:nu)=y1(nl:nu);
           b(2048-nu+1:2048-nl+1)=y1(2048-nu+1:2048-nl+1);
           c=ifft(b,2048);
           yc(i)=sqrt(var(real(b(1:2048))));
        end

%% 绘制三分之一倍频程有效值图形
%         pro1=[];ypro=[];xpro=[];
%         for k=1:1:30
% %             bar(handles.axes3,fc(1:numm),yc(1:numm),1,'b'); %做原始语音信号的FFT频谱图
%               xpro=fc(k)/oc6:0.5:fc(k)*oc6; 
%               pro1=[pro1 xpro];
%               [m1,n1]=size(xpro);
%               for j=1:1:n1
%                   ypro=[ypro yc(k)];
%               end
%         end
%         bar(handles.axes3,pro1,ypro,100,'b');
%         set(handles.axes3,'ylim',[0 2]);%设置handles.axes2的横纵坐标范围 
          bar(handles.axes3,1:30,yc,1,'b');
          set(handles.axes3,'ylim',[0 0.8]);%设置handles.axes2的横纵坐标范围 
          set(handles.axes3,'XTickLabel',{'0','200','500','800','1.2K','5K','20K'},'yticklabel',[]);
          box off;
          drawnow; % 刷新图像
      else
          stop(recObj);
%         stop(recObj);
%         aa=getaudiodata(recObj);
%         axes(thehandles.axes1);
%         plot(thehandles.axes1,aa) % 绘制所有采样数据的图形
% 
%         y1=fft(myRecording,2048); %对信号做2048点FFT变换
%         f=recObj.SampleRate*(0:1023)/2048;
%         bar(handles.axes2,f,abs(y1(1:1024)),0.8,'g') %做原始语音信号的FFT频谱图
%         %set(handles.axes2,'ylim',[0 10],'xlim',[0 20000]);%设置handles.axes2的横纵坐标范围
%         drawnow; % 刷新图像
%         setappdata(h,'sounds',aa);
    end
end






