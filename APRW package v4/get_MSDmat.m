function msd=get_MSDmat(t)
% this is not complete!!
% Calculate MSD profiles of trajectories
    tpui=unique(t(:,4));
    tpnum=length(tpui);
   for kp=1:length(tpui)
        coi=t(:,4)==tpui(kp);
        xytmp=t(coi,1:2);
        msd0(:,kp)=ezmsd0(xytmp(:,1))+ezmsd0(xytmp(:,2));            
   end
    msd0=msd0*ptp.psize^2; % convert unit to length scale
    msd=[zeros(length(msd0(:,1)),3),msd0];    
    msd=lavmsd(msd);
     % fill out the first colmn as time interval
    msd(:,1) =[1 :length(msd0(:,1))] ; % time interval will be in the ( :,1)    
    
end