function wavelet = ondita(nombre, orden)
%
% Coeficientes de la ondita 'nombre' del orden especificado
%
% f = ondita(nombre, orden);
%
% f es un vector con los coeficientes correspondientes
%
% Argumentos válidos:
% - nombre = Haar
% - nombre = Daubechies 
% -- orden = 1, orden = 2, orden = 3, orden = 4, orden = 5, orden = 6 
% - nombre = Symlets
% -- orden = 2, orden = 3, orden = 4, orden = 5, orden = 6
% - nombre = Coiflets
% -- orden = 1, orden = 2, orden = 3, orden = 4
% - nombre = Meyer
%
% 03/07 - Leandro D. Vignolo
%

format long % seteo la precisión de octave

switch nombre
     case {'haar' 'Haar' 'HAAR'}
	wavelet = [0.5 0.5];

     case {'daubechies' 'Daubechies' 'DAUBECHIES'} % daubechies
	switch orden
        	case {1}
		wavelet = [0.50000000000000   0.50000000000000];
        	case {2}
		wavelet = [0.341506   0.591506   0.158494  -0.091506];	
        	case {3}
		wavelet = [0.23523360389270   0.57055845791731   0.32518250026371  -0.09546720778426 ...
			    -0.06041610415535   0.02490874986589];
        	case {4}
		wavelet = [0.16290171402562   0.50547285754565   0.44610006912319  -0.01978751311791 ...
			    -0.13225358368437   0.02180815023739  0.02325180053556  -0.00749349466513];
        	case {5}
		wavelet = [0.11320949129173   0.42697177135271   0.51216347213016   0.09788348067375 ...
			   -0.17132835769133  -0.02280056594205   0.05485132932108  -0.00441340005433 ...
			   -0.00889593505093   0.00235871396920];
		case {6}
		wavelet = [0.07887121600143   0.34975190703757   0.53113187994121   0.22291566146505 ...
			    -0.15999329944587  -0.09175903203003   0.06894404648720   0.01946160485396 ...
			    -0.02233187416548   0.00039162557603   0.00337803118151  -0.00076176690258];
        	otherwise
		error ('La Ondita no está disponible en el orden solicitado.');
	end

     case {'symlets' 'Symlets' 'SYMLETS'}  % symlets
	switch orden
        	case {2}
		wavelet = [0.34150635094644   0.59150635094625   0.15849364905388  -0.09150635094593];
        	case {3}
		wavelet = [0.23523360389270   0.57055845791731   0.32518250026371  -0.09546720778426 ...
			   -0.06041610415535   0.02490874986589];
        	case {4}
		wavelet = [0.02278517294800  -0.00891235072085  -0.07015881208950   0.21061726710200  ...
			    0.56832912170500  0.35186953432800  -0.02095548256255  -0.05357445070900];
        	case {5}
		wavelet = [0.01381607647893  -0.01492124993438  -0.12397568130675   0.01173946156807  ...
			   0.44829082419092   0.51152648344605   0.14099534842729  -0.02767209305836  ...
			   0.02087343221079   0.01932739797744];
		case {6}
		wavelet = [-0.00551593375469   0.00124996104639   0.03162528132994  -0.01489187564922  ...
			   -0.05136248493090   0.23895218566605   0.55694639196396   0.34722898647835  ... 
			   -0.03416156079324  -0.08343160770584   0.00246830618592   0.01089235016328];
        	otherwise
		error ('La Ondita no está disponible en el orden solicitado.');
	end

     case {'coiflets' 'Coiflets' 'COIFLETS'}  % coiflets
	switch orden
        	case {1}
		wavelet = [-0.05142972847100   0.23892972847100   0.60285945694200   0.27214054305800 ...
			   -0.05142972847100 -0.01107027152900];
        	case {2}
		wavelet = [0.01158759673900  -0.02932013798000  -0.04763959031000   0.27302104653500  ...
			   0.57468239385700    0.29486719369600  -0.05408560709200  -0.04202648046100  ...
			   0.01674441016300   0.00396788361300   -0.00128920335600  -0.00050950539900];
        	case {3}
		wavelet = [-0.00268241867100   0.00550312670900   0.01658356047900  -0.04650776447900  ...
			   -0.04322076356000   0.28650333527400   0.56128525687000   0.30298357177300  ...
			   -0.05077014075500  -0.05819625076200   0.02443409432100   0.01122924096200  ...
			   -0.00636960101100  -0.00182045891600   0.00079020510100   0.00032966517400  ...
			   -0.00005019277500  -0.00002446573400];
        	case {4}
		wavelet = [0.00063096104600  -0.00115222485200  -0.00519452402600   0.01136245924400  ...
			   0.01886723537800  -0.05746423442900  -0.03965264851700   0.29366739089500  ...
			   0.55312645256200   0.30715732619800  -0.04711273886500  -0.06803812705100  ...
			   0.02781364015300   0.01773583743800  -0.01075631851700  -0.00400101288600  ...
			   0.00265266594600   0.00089559452900  -0.00041650057100  -0.00018382976900  ...
			   0.00004408035400   0.00002208285700  -0.00000230494200  -0.00000126217500];
        	otherwise
		error ('La Ondita no está disponible en el orden solicitado.');
	end

     case {'meyer' 'Meyer' 'MEYER'} % Discrete Meyer
	wavelet =[ -0.00000106754713   0.00000090422391   0.00000031790474  -0.00000148249686 ...
		    0.00000121850207   0.00000049361831  -0.00000203604729   0.00000168513902 ...
		    0.00000069474288  -0.00000298242491   0.00000237128175   0.00000118420622 ...
		   -0.00000426703335   0.00000342066573   0.00000169867277  -0.00000675732600 ...
		    0.00000510285152   0.00000342881336  -0.00001004580737   0.00000742738297 ...
		    0.00000437527643  -0.00001728026560   0.00001421735152   0.00001060201359 ...
		   -0.00003283006737   0.00002286874237   0.00002645260683  -0.00007267567236 ...
		    0.00001729720150   0.00010586335588  -0.00005345218770  -0.00009893345543 ...
		   -0.00006612354762   0.00011397832190   0.00060775793536  -0.00040883876416 ...
		   -0.00191072028190   0.00155193926157   0.00427481806225  -0.00451609544333 ...
		   -0.00780973483285   0.01078401534427   0.01230639736499  -0.02269391137934 ...
		   -0.01719808438302   0.04501954358581   0.02165247163319  -0.09383060025865 ...
		   -0.02478286152969   0.31402235238643   0.52591095141626   0.31402235238643 ...
		   -0.02478286152969  -0.09383060025865   0.02165247163319   0.04501954358581 ...
		   -0.01719808438302  -0.02269391137934   0.01230639736499   0.01078401534427 ...
		   -0.00780973483285  -0.00451609544333   0.00427481806225   0.00155193926157 ...
		   -0.00191072028190  -0.00040883876416   0.00060775793536   0.00011397832190 ...
		   -0.00006612354762  -0.00009893345543  -0.00005345218770   0.00010586335588 ...
		    0.00001729720150  -0.00007267567236   0.00002645260683   0.00002286874237 ...
		   -0.00003283006737   0.00001060201359   0.00001421735152  -0.00001728026560 ...
		    0.00000437527643   0.00000742738297  -0.00001004580737   0.00000342881336 ...
		    0.00000510285152  -0.00000675732600   0.00000169867277   0.00000342066573 ...
		   -0.00000426703335   0.00000118420622   0.00000237128175  -0.00000298242491 ...
		    0.00000069474288   0.00000168513902  -0.00000203604729   0.00000049361831 ...
		    0.00000121850207  -0.00000148249686   0.00000031790474   0.00000090422391 ...
		   -0.00000106754713  0];

     otherwise
     error ('La Ondita solicitada no está disponible.');
end % switch
wavelet=fliplr(wavelet)/norm(wavelet);
end % function