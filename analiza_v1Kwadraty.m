clear all
clc


t01=470;    %poczatek okna
dt=330;     %dlugosc okna
t11=t01+dt; %

lwav=10000; %iloœæ odczytanych próbek z odpowiedzi impulsowych

n=0;
% dostêp do katalogów z wynikami
katalog='C:/Users/aslod/Desktop/pendrive/TPiRDz/lab5/zajecia/2019-03-27_TPiRD_panele/13_00/grupa 1 kwadraty';

pusta_katalog=dir(sprintf('%s/%s',katalog,'pusta'));
plyta_katalog=dir(sprintf('%s/%s',katalog,'plyta'));
panele_katalog=dir(sprintf('%s/%s',katalog,'wyniki'));




for z=3:length(panele_katalog) % pêtla po subkatalogach z wynikami
    folder=panele_katalog(z).isdir;
    if folder==1
        n=n+1;
            subkatalog=dir(sprintf('%s',katalog,'/wyniki/',panele_katalog(z).name));

        for i=1:4
            ir_1=sprintf('%s/%s/%s',katalog,'pusta',pusta_katalog(i+2).name); %œcia¿ka do pliku z pustego stanowiska
            ir_2=sprintf('%s/%s/%s',katalog,'plyta',plyta_katalog(i+2).name); %œcia¿ka do pliku z p³t¹ referencyjn¹
            ir_3=sprintf('%s/%s/%s/%s',katalog,'wyniki',panele_katalog(z).name,subkatalog(i+2).name);  %œcia¿ka do pliku z podkatalogu z wynikami 
            
            % odczyt odpowiedzi impulsowych
            
            
            [IR_100(:,i,1),fs]=audioread(ir_1,[1,lwav]);
            [IR_100(:,i,2),fs]=audioread(ir_2,[1,lwav]);
            [IR_100(:,i,3),fs]=audioread(ir_3,[1,lwav]);

            
        end
        
            [maxin1, nir1] = max(IR_100(:,1,1));
            [maxin2, nir2] = max(IR_100(:,1,2));
            [maxin3, nir3] = max(IR_100(:,1,3));
            
            IR100jeden = IR_100(nir1 - 200:nir1 + 2000, 1,1);
            IR100dwa = IR_100(nir2 - 200:nir2 + 2000, 1,2);
            IR100trzy = IR_100(nir3 - 200:nir3 + 2000, 1,3);
        
            clear i
            lc1=t11-t01+1;
        

    %okno adrienne
    okn1=adrienne(lc1);

    
    
    
x = 1:length(IR100jeden);

figure(1)
plot(x, IR100jeden, x, IR100dwa, x, IR100trzy)
legend ('p³yta','pusta','wyniki')




  
  
  
  
% 
%             figure(2)
%                 semilogx(f1,FTT1,'--k',f1,FTs(1:(length(f1)),1),'k','linewidth',2),axis([500 10000 -25 5]);,grid;    
%                 set(gca,'FontSize',textax);
%                 axis([fd fg -25 5]),...
%                 title(panele_katalog(z).name,'fontsize',textti),...
%                 xlabesl('Czêstotliwoœæ f[Hz]','fontsize',textax),...
%                 ylabel('Skutecznoœæ L_x[dB]','fontsize',textax);
% 
%             print('-djpeg', sprintf('%s.jpg',panele_katalog(z).name));
              
end
end
