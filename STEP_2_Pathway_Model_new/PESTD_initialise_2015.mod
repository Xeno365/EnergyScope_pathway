
##########################################
#### Initialisation for 2015 and 2020 ####
##########################################

### electrical capacity ###

fix F['YEAR_2015','PV']:=3.85;
fix F['YEAR_2015','WIND_ONSHORE']:=1.18;
fix F['YEAR_2015','WIND_OFFSHORE']:=0.69;
fix F['YEAR_2015','HYDRO_RIVER']:=0.11;
fix F['YEAR_2015','GEOTHERMAL']:=0;
fix F['YEAR_2015','NUCLEAR']:=5.925;
fix F['YEAR_2015','CCGT']:=3.925;
fix F['YEAR_2015','COAL_US']:=0.47;


# Pour obliger le modèle à importer de l'elec en 2015 sinon il ne le fait pas. Source : eurostat energy balance sheet 2017 edition for 2015, and 2020 edition for 2020 (year 2018 in the document)
subject to elec_import_2015{i in {"ELECTRICITY"}}: sum {t in PERIODS, h in HOUR_OF_PERIOD[t], td in TYPICAL_DAY_OF_PERIOD[t]} (F_t ["YEAR_2015",i,h,td] * t_op [h, td]) = 20940;

#test
subject to uranium_2015{i in {"URANIUM"}}: sum {t in PERIODS, h in HOUR_OF_PERIOD[t], td in TYPICAL_DAY_OF_PERIOD[t]} (F_t ["YEAR_2015",i,h,td] * t_op [h, td]) <= 73750;


### different shares ###

fix Share_mobility_public['YEAR_2015']:=0.199;
fix Share_freight_train['YEAR_2015']:=0.109;
fix Share_freight_boat['YEAR_2015']:=0.156;
fix Share_heat_dhn['YEAR_2015']:=0.02;

### Private mobility ###

let fmin_perc['YEAR_2015',"CAR_DIESEL"] := 0.637;
let fmin_perc['YEAR_2015',"CAR_GASOLINE"] := 0.353;
let fmin_perc['YEAR_2015',"CAR_NG"] := 0.01;
let fmin_perc['YEAR_2015',"CAR_BEV"] := 0;

let fmax_perc['YEAR_2015',"CAR_HEV"] := 0;
let fmax_perc['YEAR_2015',"CAR_PHEV"] := 0;
let fmax_perc['YEAR_2015',"CAR_FUEL_CELL"] := 0;

fix F['YEAR_2015','CAR_GASOLINE']:= 99;
fix F['YEAR_2015','CAR_DIESEL']:=179;
fix F['YEAR_2015','CAR_NG']:=2.9;
fix F['YEAR_2015','CAR_BEV']:=0;
fix F['YEAR_2015','CAR_HEV']:=0;
fix F['YEAR_2015','CAR_PHEV']:=0;
fix F['YEAR_2015','CAR_FUEL_CELL']:=0;

### Public mobility ###

let fmin_perc['YEAR_2015',"BUS_COACH_DIESEL"] := 0.47;
let fmin_perc['YEAR_2015',"BUS_COACH_CNG_STOICH"] := 0.1;
let fmin_perc['YEAR_2015',"TRAIN_PUB"] := 0.385;
let fmin_perc['YEAR_2015',"TRAMWAY_TROLLEY"] := 0.045;

let fmax_perc['YEAR_2015',"BUS_COACH_HYDIESEL"] := 0;
let fmax_perc['YEAR_2015',"BUS_COACH_FC_HYBRIDH2"] := 0;

fix F['YEAR_2015','TRAMWAY_TROLLEY']:=0.48;
fix F['YEAR_2015','BUS_COACH_DIESEL']:=5.7;
fix F['YEAR_2015','BUS_COACH_CNG_STOICH']:=1.3;
fix F['YEAR_2015','TRAIN_PUB']:=5.1;
fix F['YEAR_2015','BUS_COACH_HYDIESEL']:=0;
fix F['YEAR_2015','BUS_COACH_FC_HYBRIDH2']:=0;

### Freight ###

let fmax_perc['YEAR_2015',"BOAT_FREIGHT_NG"] := 0;
let fmax_perc['YEAR_2015',"TRUCK_FUEL_CELL"] := 0;
let fmax_perc['YEAR_2015',"TRUCK_ELEC"] := 0;
let fmax_perc['YEAR_2015',"TRUCK_NG"] := 0;

fix F['YEAR_2015','TRAIN_FREIGHT']:=2.5;
fix F['YEAR_2015','BOAT_FREIGHT_DIESEL']:=10.5;
fix F['YEAR_2015','TRUCK_DIESEL']:=60.2;
fix F['YEAR_2015','BOAT_FREIGHT_NG']:=0;
fix F['YEAR_2015','TRUCK_NG']:=0;
fix F['YEAR_2015','TRUCK_ELEC']:=0;
fix F['YEAR_2015','TRUCK_FUEL_CELL']:=0;

### Decentralised low T heat ###

let fmin_perc['YEAR_2015',"DEC_BOILER_OIL"] := 0.484;
let fmin_perc['YEAR_2015',"DEC_BOILER_GAS"] := 0.396;
let fmin_perc['YEAR_2015',"DEC_BOILER_WOOD"] := 0.1;
let fmin_perc['YEAR_2015',"DEC_COGEN_GAS"] := 0.007;
let fmin_perc['YEAR_2015',"DEC_HP_ELEC"] := 0.011;
let fmin_perc['YEAR_2015',"DEC_SOLAR"] := 0.002;

let fmax_perc['YEAR_2015',"DEC_COGEN_OIL"] := 0;
let fmax_perc['YEAR_2015',"DEC_THHP_GAS"] := 0;
let fmax_perc['YEAR_2015',"DEC_DIRECT_ELEC"] := 0;
let fmax_perc['YEAR_2015',"DEC_ADVCOGEN_H2"] := 0;
let fmax_perc['YEAR_2015',"DEC_ADVCOGEN_GAS"] := 0;

fix F['YEAR_2015','DEC_HP_ELEC']:=0.7;
fix F['YEAR_2015','DEC_COGEN_GAS']:=0.4;
fix F['YEAR_2015','DEC_BOILER_GAS']:=21.5;
fix F['YEAR_2015','DEC_BOILER_WOOD']:=5.5;
fix F['YEAR_2015','DEC_BOILER_OIL']:=26;
fix F['YEAR_2015','DEC_SOLAR']:=0.6;
fix F['YEAR_2015','DEC_COGEN_OIL']:=0;
fix F['YEAR_2015','DEC_THHP_GAS']:=0;
fix F['YEAR_2015','DEC_DIRECT_ELEC']:=0;
fix F['YEAR_2015','DEC_ADVCOGEN_H2']:=0;
fix F['YEAR_2015','DEC_ADVCOGEN_GAS']:=0;

### DHN low T heat ###

let fmin_perc['YEAR_2015',"DHN_COGEN_GAS"] := 0.594;
let fmin_perc['YEAR_2015',"DHN_COGEN_WOOD"] := 0.066;
let fmin_perc['YEAR_2015',"DHN_COGEN_WASTE"] := 0.141;
let fmin_perc['YEAR_2015',"DHN_BOILER_GAS"] := 0.139;
let fmin_perc['YEAR_2015',"DHN_BOILER_OIL"] := 0.007;
let fmin_perc['YEAR_2015',"DHN_HP_ELEC"] := 0.044;

let fmax_perc['YEAR_2015',"DHN_BOILER_WOOD"] := 0;
let fmax_perc['YEAR_2015',"DHN_DEEP_GEO"] := 0; # normalement 1% mais hyp que pas de geo en belgique
let fmax_perc['YEAR_2015',"DHN_SOLAR"] := 0; # not in the thesis of gauthier limpens but in the snakey diagram

fix F['YEAR_2015','DHN_HP_ELEC']:=0.051;
fix F['YEAR_2015','DHN_COGEN_GAS']:=0.4;
fix F['YEAR_2015','DHN_COGEN_WOOD']:=0.06;
fix F['YEAR_2015','DHN_COGEN_WASTE']:=0.07;
fix F['YEAR_2015','DHN_BOILER_GAS']:=0.4;
fix F['YEAR_2015','DHN_BOILER_OIL']:=0.08;
fix F['YEAR_2015','DHN_BOILER_WOOD']:=0;
fix F['YEAR_2015','DHN_DEEP_GEO']:=0;
fix F['YEAR_2015','DHN_SOLAR']:=0;

### High T heat ###

let fmin_perc['YEAR_2015',"IND_BOILER_GAS"] := 0.358;
let fmin_perc['YEAR_2015',"IND_BOILER_COAL"] := 0.3;
let fmin_perc['YEAR_2015',"IND_BOILER_OIL"] := 0.2;
let fmin_perc['YEAR_2015',"IND_COGEN_GAS"] := 0.086;
let fmin_perc['YEAR_2015',"IND_COGEN_WASTE"] := 0.056;

let fmax_perc['YEAR_2015',"IND_BOILER_WOOD"] := 0;
let fmax_perc['YEAR_2015',"IND_BOILER_WASTE"] := 0;
let fmax_perc['YEAR_2015',"IND_COGEN_WOOD"] := 0;
let fmax_perc['YEAR_2015',"IND_DIRECT_ELEC"] := 0;

fix F['YEAR_2015','IND_COGEN_GAS']:=0.9;
fix F['YEAR_2015','IND_COGEN_WASTE']:=0.6;
fix F['YEAR_2015','IND_BOILER_GAS']:=3.1;
fix F['YEAR_2015','IND_BOILER_OIL']:=1.8;
fix F['YEAR_2015','IND_BOILER_COAL']:=2.8;
fix F['YEAR_2015','IND_BOILER_WOOD']:=0;
fix F['YEAR_2015','IND_BOILER_WASTE']:=0;
fix F['YEAR_2015','IND_COGEN_WOOD']:=0;
fix F['YEAR_2015','IND_DIRECT_ELEC']:=0;
