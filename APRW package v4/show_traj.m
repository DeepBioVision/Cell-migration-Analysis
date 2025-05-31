function show_traj_v2(xys,param)
%% 1. Plot all trajectoreis 
    if nargin==0
         xys=get_trajfile;
    end
    if nargin<=1;
        param.outfigurenum=1;
        param.repN=10;
    end    

    figure(param.outfigurenum) ; 
    Nc=length(xys); % number of cell trajectories        
    cidk=jet(Nc); % generate different colors for different trajectoreis. 
      for k=1:param.repN:Nc;  
         xy=xys{k};             
         xy=[xy(:,1)-xy(1,1), xy(:,2)-xy(1,2)];           
         plot(xy(:,1),xy(:,2),'-','color',cidk(k,:),'linewidth',1.5); hold on;     
      end
      hold off;
      axis equal;
      set(gca,'xtick',[],'ytick',[]);
      