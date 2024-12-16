void ampt_root2txt(){

	TFile *f = new TFile("ampt.root");
	TTree *t = (TTree*)f->Get("t");
	
	Int_t pid[99999], event, test, nop, npart1, npart2;
	Int_t npart1_el, npart1_inel, npart2_el, npart2_inel;
	
	Float_t temp;
	Float_t b, px[99999], py[99999], pz[99999], m[99999];
	Float_t x[99999], y[99999], z[99999], time[99999];
	
	t->SetBranchAddress("event",&event);
	t->SetBranchAddress("test",&test);
	t->SetBranchAddress("nop",&nop);
	t->SetBranchAddress("npart1",&npart1);
	t->SetBranchAddress("npart2",&npart2);
	t->SetBranchAddress("npart1_el",&npart1_el);
	t->SetBranchAddress("npart1_inel",&npart1_inel);
	t->SetBranchAddress("npart2_el",&npart2_el);
	t->SetBranchAddress("npart2_inel",&npart2_inel);
	t->SetBranchAddress("pid",pid);
	t->SetBranchAddress("b",&b);
	t->SetBranchAddress("px",px);
	t->SetBranchAddress("py",py);
	t->SetBranchAddress("pz",pz);
	t->SetBranchAddress("m",m);
	t->SetBranchAddress("x",x);
	t->SetBranchAddress("y",y);
	t->SetBranchAddress("z",z);
	t->SetBranchAddress("time",time);
	
	ofstream file("ampt_out.dat");
	Int_t nentries = (Int_t)t->GetEntries();
	
	for(Int_t i=0; i<nentries; i++){	
		t->GetEntry(i);
		
		file << event << "\t" << test << "\t" << nop << "\t" << b << "\t" << npart1 << "\t" << npart2 << "\t" << npart1_el << "\t" << npart1_inel << "\t" << npart2_el << "\t" << npart2_inel << "\t" << temp <<endl;		
		cout<< "Event :" << event << " Completed ..." << endl;  
		for(Int_t j=0; j<nop; j++){		
			file << pid[j] << "\t" << px[j] << "\t" << py[j] << "\t" << pz[j] << "\t" << m[j] << "\t" << x[j] << "\t" << y[j] << "\t" << z[j] << "\t" << time[j] <<endl;
		}		
	}

	
cout << "=====================" <<endl;
cout << "Done properly ..." <<endl;
cout << "=====================" <<endl;

}
