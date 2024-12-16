		! this program shows max. min. avg. mul. of rapidity
		real(kind=8):: maxrap,minrap,rap,temp
		integer(kind=8):: i,j,N,mul,nev,pid
		open(unit=1,file="eta_ampt2tev.dat")
		open(unit=2,file="backup.dat")
		N=100000
		minrap=0.
		maxrap=0.
		smul=0
		write(*,*) "No. of events: ",N
		do i=1,N
			read(1,*) nev, mul
			do j=1,mul
		 		read(1,*) pid, rap
		 		temp=rap
		 		if(temp.gt.maxrap) then 
		 			maxrap=temp
		 		endif
		 		if(temp.lt.minrap) then 
		 			minrap=temp
		 		endif
		 		write(2,*) nev, mul, temp, maxrap, minrap
		 	enddo
		 	smul=smul+mul
		enddo
		avmul=smul/N
		write(*,*) "Total multiplicity: ",smul
		write(*,*) "Aver. multiplicity: ",avmul
		write(*,*) "Max. pseudorapidity: ",maxrap
		write(*,*) "Min. pseudorapidity: ",minrap	
		stop
		end
