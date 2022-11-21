#Simpleks algoritam
#Autori: Muhamed Masnopita i Admir Mehmedagić


using LinearAlgebra  

A=[1 0; 1 -1]; 

c=[5 4]; 
b=[7;8]; 



if(size(A,1) != size(c,2)) throw(DomainError("Nije dobro"));  
end

if(size(A,2) != size(b,1)) throw(DomainError("Nije dobro")); 
end

M=[b A I(size(b,1)); 0 c zeros(1, size(c,2))]    

brojKolona=size(M,2) 
brojRedova=size(M,1) 



while true 
	q=1 #kolona one varijable koja ulazi u bazu
	p=1 #indeks pozicije u bazi na kojoj se nalazi indeks varijable
	najveci=0

	pivot = 0


	for i = brojRedova
		for j = 2:brojKolona
			if(M[i,j]>=najveci)
				najveci = M[i,j] 
				q=j;
			end
		end 		
	end 

	najmanji = M[1,1]/M[1,q]  

	if najveci == 0 
		break
	else 
		#Sada treba naći pivot element
		for i = 1:size(b,1)
			if M[i, 1]/M[i,q] <=najmanji 
					najmanji = M[i,1]/M[i,q]
					p=i
				end 
			end 
		end
		
		#može se ručno ovdje provjeriti pivot
		pivot=M[p,q] 

	for i = 1:size(b,1)+size(A,1)+1 
		for j = 1:size(b,2)+1
			if(i==p) 
				#Ovako postizemo da pivot element bude 1
				mnozilac=1/M[p,q] 
				#Sada svaki broj iz ovog reda treba pomnoziti sa varijablom mnozilac 
				M[i,j]=M[i,j]*mnozilac
			end
		end
	end

	for i = 1:brojRedova
		for j = 1:brojKolona
			mnozilac=M[i,q]/M[p,q]
			if(i!=p) 
				M[i,j] = M[i,j] - M[p,j]*mnozilac
			end
		end 		
	end 

end
    
Z = M[brojRedova,1] 
x1 = M[1,1] 
x2 = M[2,1] 
#Sada ovo možemo dalje ako ima još varijabli u bazi


