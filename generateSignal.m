function [semnal]=generateSignal(fs, mics, t, source)
       
         s2=rand(fs*t,1);
       
        [a,b]=size(mics);
 
        dist=zeros(1,a);
        for i=1:a
            dist(i)=sqrt( (source(1)-mics(i,1))^2 +(source(2)-mics(i,2))^2 +(source(3)-mics(i,3))^2);
        end

        [distS, index]=sort(dist);

        Dd=zeros(1, a-1);
        ind=1;
        for i=1:1
           for j=i+1:a
               Dd(ind)=abs(distS(i)-distS(j));
               ind=ind+1;
           end
        end

        V_s=340; %m/s
        Dt=(Dd*1)/V_s;

        xes=round((1*fs)*Dt);



        semnal=zeros(a, fs*t);
        semnal(index(1), :)=s2';

        for i=2:a
            s_aux=[rand(xes(i-1),1)' s2(1:fs*t-(xes(i-1)))'];
            semnal(index(i),:)=s_aux;

        end
        semnal=semnal';
end
