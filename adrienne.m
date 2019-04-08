    function okn1=adrienne(lc1)
    l11=round(lc1/10.5);
    l21=round(6*lc1/10.5);
    l31=round(3*lc1/10.5);
    okn1=zeros(lc1,1);
    okn1=window(@blackmanharris,l11);
    okn1(round(l11/2):lc1)=1;
    okn11=window(@blackmanharris,l21);
    okn1(lc1-(l21-l31):lc1)=okn11(l31:l21);
    end