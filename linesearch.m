nplot=5;
ymax=4;
figname='linesearch'
data=load('./nonorm/misfit/all_misfit');

[a b]=size(data);
fig=figure(1)

for i=1:a
  
    if (data(i,1)==1)  
        subplot(1,nplot,1)
        plot(data(i,2)*100,data(i,3),'linewidth',4)
        xlim([0 4])
        ylim([0 ymax])
        xlabel('Step Length(%)')
        ylabel('Misfit')
        title('T = 20-40s')
        daspect([2 1 1]);   
        set(gca,'xtick',[0:1:4])
        hold on
        subplot(1,nplot,2)
        plot(data(i,2)*100,data(i,4),'linewidth',4)
        hold on   
        xlim([0 4])
        ylim([0 ymax])
        title('T = 15-30s')
        xlabel('Step Length(%)')
        daspect([2 1 1]);
        set(gca,'xtick',[0:1:4])
        
        subplot(1,nplot,3)
        plot(data(i,2)*100,data(i,5),'linewidth',4)
        hold on   
        xlim([0 4])
        ylim([0 ymax])
        title('T = 10-20s')
        xlabel('Step Length(%)')
        daspect([2 1 1]);
        set(gca,'xtick',[0:1:4])
        subplot(1,nplot,4)
        plot(data(i,2)*100,data(i,6),'linewidth',4)
        hold on          
        xlim([0 4])
        ylim([0 ymax])
        title('T = 6-15s')
        xlabel('Step Length(%)')
        daspect([2 1 1]);
        set(gca,'xtick',[0:1:4])
        subplot(1,nplot,5)
        plot(data(i,2)*100,data(i,end),'linewidth',4)
        hold on          
        xlim([0 4])
        ylim([0 ymax])
        xlabel('Step Length(%)')
        title('ALL')
        daspect([2 1 1]);
        set(gca,'xtick',[0:1:4])
        
        
    end
end

saveas(fig,figname,'pdf')
        

