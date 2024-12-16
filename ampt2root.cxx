# include <iostream>
# include <fstream>
# include <iomanip>
# include <cstdlib>
# include <string>

void ampt2root(){

	TFile *f = new TFile("ampt.root","RECREATE");
	TTree *t = new TTree("t","ampt data");
	
	Int_t pid[99999], event, test, nop, npart1, npart2;
	Int_t npart1_el, npart1_inel, npart2_el, npart2_inel;
	
	Float_t temp;
	Float_t b, px[99999], py[99999], pz[99999], m[99999];
	Float_t x[99999], y[99999], z[99999], time[99999];
	
	t->Branch("event",&event,"event/I");
	t->Branch("test",&test,"test/I");
	t->Branch("nop",&nop,"nop/I");
	t->Branch("npart1",&npart1,"npart1/I");
	t->Branch("npart2",&npart2,"npart2/I");
	t->Branch("npart1_el",&npart1_el,"npart1_el/I");
	t->Branch("npart1_inel",&npart1_inel,"npart1_inel/I");
	t->Branch("npart2_el",&npart2_el,"npart2_el/I");
	t->Branch("npart2_inel",&npart2_inel,"npart2_inel/I");
	t->Branch("pid",&pid[0],"pid[nop]/I");
	t->Branch("b",&b,"b/F");
	t->Branch("px",&px[0],"px[nop]/F");
	t->Branch("py",&py[0],"py[nop]/F");
	t->Branch("pz",&pz[0],"pz[nop]/F");
	t->Branch("m",&m[0],"m[nop]/F");
	t->Branch("x",&x[0],"x[nop]/F");
	t->Branch("y",&y[0],"y[nop]/F");
	t->Branch("z",&z[0],"z[nop]/F");
	t->Branch("time",&time[0],"time[nop]/F");
	
	ifstream file("ampt.dat");
	Int_t tnev = 10000; 
	
	for(Int_t i=0; i<tnev; i++){	
		file >> event >> test >> nop >> b >> npart1 >> npart2 >> npart1_el >> npart1_inel >> npart2_el >> npart2_inel >> temp;		
		cout<< "Event :" << event << " Completed ..." << endl;  
		for(Int_t j=0; j<nop; j++){		
			file >> pid[j] >> px[j] >> py[j] >> pz[j] >> m[j] >> x[j] >> y[j] >> z[j] >> time[j] ;
		}
		t->Fill();
	}
		
	f->Write();
	f->Close();
	
cout << "=====================" <<endl;
cout << "Done properly ..." <<endl;
cout << "=====================" <<endl;

}
