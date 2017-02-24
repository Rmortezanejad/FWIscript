
fig=figure(6)
Ts=5;
Te=10;
fs=1/dt;
[t1, t2] = butter(2, [(1/Te)/(fs/2) (1/Ts)/(fs/2)]);
for i=b-20:4:b
    plot(t,i+s4(:,i)/max(s4(:,i)),'LineWidth',1) 
    hold on
    plot(t,i+d4(:,i)/max(d4(:,i)),'r','LineWidth',1)
    hold on
    num2str(value(i,4))
    text(220,i,['dt=',num2str(value(i,4))])
    
    scatter(w1(i,4)*dt,i,'g')
    scatter(w3(i,4)*dt,i)
    scatter(w2(i,4)*dt,i,'g') 
    
    
end
nametitle=['Period:',num2str(Ts),'s-',num2str(Te),'s']    
title(nametitle)

set(gca,'XTick',[0 40 80 120 160 200 240] )
xlim([0 240])
xlabel('time/s','Position',[220,-3])
ylabel('station index')  
legend('syn','obs','Location','East')
saveas(fig,[isource,'-',nametitle],'pdf')
