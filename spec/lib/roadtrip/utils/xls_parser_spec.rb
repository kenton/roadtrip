require_relative '../../../../lib/roadtrip/utils/xls_parser'

describe RoadTrip::XLSParser do

  def output_hash
    {"2012"=>{"Acura"=>{"TSX"=>{:city=>19, :highway=>28}, "RL"=>{:city=>17, :highway=>24}, "TL 2WD"=>{:city=>20, :highway=>29}, "TL 4WD"=>{:city=>17, :highway=>25}, "TSX WAGON"=>{:city=>22, :highway=>30}, "RDX 2WD"=>{:city=>19, :highway=>24}, "MDX 4WD"=>{:city=>16, :highway=>21}, "RDX 4WD"=>{:city=>17, :highway=>22}, "ZDX 4WD"=>{:city=>16, :highway=>23}}, "Aston Martin Lagonda Ltd"=>{"V12 Vantage"=>{:city=>11, :highway=>17}, "V8 Vantage"=>{:city=>13, :highway=>19}, "V8 Vantage S"=>{:city=>14, :highway=>21}, "DB9"=>{:city=>11, :highway=>17}, "DBS"=>{:city=>11, :highway=>17}, "Virage"=>{:city=>13, :highway=>18}, "Rapide"=>{:city=>13, :highway=>19}}, "Audi"=>{"R8"=>{:city=>12, :highway=>19}, "R8 Spyder"=>{:city=>12, :highway=>19}, "TT ROADSTER QUATTRO"=>{:city=>23, :highway=>31}, "A5 Cabriolet"=>{:city=>22, :highway=>30}, "A5 Cabriolet quattro"=>{:city=>21, :highway=>29}, "A5 QUATTRO"=>{:city=>21, :highway=>31}, "S5"=>{:city=>14, :highway=>22}, "S5 Cabriolet"=>{:city=>17, :highway=>26}, "TT COUPE QUATTRO"=>{:city=>23, :highway=>31}, "TTRS COUPE"=>{:city=>18, :highway=>25}, "A4"=>{:city=>22, :highway=>30}, "A4 QUATTRO"=>{:city=>21, :highway=>31}, "S4"=>{:city=>18, :highway=>27}, "A6"=>{:city=>25, :highway=>33}, "A6 quattro"=>{:city=>19, :highway=>28}, "A7 quattro"=>{:city=>18, :highway=>28}, "A8"=>{:city=>18, :highway=>28}, "A8 L"=>{:city=>18, :highway=>28}, "A8L"=>{:city=>14, :highway=>21}, "A3"=>{:city=>21, :highway=>30}, "A3 QUATTRO"=>{:city=>21, :highway=>28}, "A4 AVANT QUATTRO"=>{:city=>21, :highway=>29}, "Q5"=>{:city=>18, :highway=>23}, "Q7"=>{:city=>16, :highway=>22}}, "Azure Dynamics Incorporated"=>{"Transit Connect Electric Van"=>{:city=>62, :highway=>62}, "Transit Connect Electric Wagon"=>{:city=>62, :highway=>62}}, "Bentley Motors Ltd."=>{"Continental Supersports"=>{:city=>12, :highway=>19}, "Continental GTC"=>{:city=>11, :highway=>19}, "Continental Supersports Convt"=>{:city=>12, :highway=>19}, "Continental GT"=>{:city=>12, :highway=>19}, "Continental Flying Spur"=>{:city=>11, :highway=>19}, "Mulsanne"=>{:city=>11, :highway=>18}}, "BMW"=>{"Z4 sDrive28i"=>{:city=>23, :highway=>34}, "Z4 sDrive35i"=>{:city=>19, :highway=>26}, "Z4 sDrive35is"=>{:city=>17, :highway=>24}, "128Ci Convertible"=>{:city=>18, :highway=>28}, "128i"=>{:city=>18, :highway=>28}, "135i"=>{:city=>20, :highway=>28}, "135i Convertible"=>{:city=>19, :highway=>28}, "328Ci Convertible"=>{:city=>17, :highway=>26}, "328i Coupe"=>{:city=>18, :highway=>28}, "328i Coupe xDrive"=>{:city=>17, :highway=>25}, "335Ci Convertible"=>{:city=>19, :highway=>28}, "335i Coupe"=>{:city=>19, :highway=>28}, "335i Coupe xDrive"=>{:city=>19, :highway=>27}, "335is Convertible"=>{:city=>18, :highway=>26}, "335is Coupe"=>{:city=>18, :highway=>26}, "M3 Convertible"=>{:city=>13, :highway=>20}, "M3 Coupe"=>{:city=>14, :highway=>20}, "328i"=>{:city=>23, :highway=>34}, "335i"=>{:city=>20, :highway=>30}, "640i Convertible"=>{:city=>21, :highway=>31}, "640i Coupe"=>{:city=>23, :highway=>33}, "650i Convertible"=>{:city=>15, :highway=>22}, "650i Coupe"=>{:city=>15, :highway=>22}, "650i Coupe xDrive"=>{:city=>15, :highway=>20}, "528i"=>{:city=>23, :highway=>34}, "528i xDrive"=>{:city=>22, :highway=>32}, "535i"=>{:city=>20, :highway=>30}, "535i xDrive"=>{:city=>21, :highway=>30}, "550i"=>{:city=>15, :highway=>22}, "550i xDrive"=>{:city=>15, :highway=>20}, "ActiveHybrid 7"=>{:city=>17, :highway=>24}, "535i Gran Turismo"=>{:city=>19, :highway=>28}, "535i xDrive Gran Turismo"=>{:city=>18, :highway=>27}, "550i Gran Turismo"=>{:city=>15, :highway=>22}, "550i xDrive Gran Turismo"=>{:city=>15, :highway=>19}, "740i"=>{:city=>17, :highway=>25}, "740Li"=>{:city=>17, :highway=>25}, "750i"=>{:city=>15, :highway=>22}, "750i xDrive"=>{:city=>14, :highway=>20}, "750Li"=>{:city=>14, :highway=>22}, "750Li xDrive"=>{:city=>14, :highway=>20}, "760Li"=>{:city=>13, :highway=>19}, "ActiveHybrid 7L"=>{:city=>17, :highway=>24}, "Alpina B7 LWB"=>{:city=>14, :highway=>22}, "Alpina B7 LWB xDrive"=>{:city=>14, :highway=>20}, "Alpina B7 SWB"=>{:city=>14, :highway=>22}, "Alpina B7 SWB xDrive"=>{:city=>14, :highway=>20}, "328i Sport Wagon"=>{:city=>17, :highway=>26}, "328i xDrive Sport Wagon"=>{:city=>17, :highway=>25}, "X3 xDrive28i"=>{:city=>19, :highway=>25}, "X3 xDrive35i"=>{:city=>19, :highway=>26}, "X5 xDrive35d"=>{:city=>19, :highway=>26}, "X5 xDrive35i"=>{:city=>16, :highway=>23}, "X5 xDrive50i"=>{:city=>14, :highway=>20}, "X5 xDriveM"=>{:city=>12, :highway=>17}, "X6 xDrive35i"=>{:city=>16, :highway=>23}, "X6 xDrive50i"=>{:city=>14, :highway=>20}, "X6 xDriveM"=>{:city=>12, :highway=>17}}, "Bugatti"=>{"Veyron"=>{:city=>8, :highway=>15}}, "Buick"=>{"VERANO"=>{:city=>21, :highway=>32}, "LACROSSE"=>{:city=>17, :highway=>27}, "LACROSSE AWD"=>{:city=>16, :highway=>26}, "REGAL"=>{:city=>19, :highway=>31}, "ENCLAVE FWD"=>{:city=>17, :highway=>24}, "ENCLAVE AWD"=>{:city=>16, :highway=>22}}}}
  end

  describe "#parse" do
    it "parses an .xlsx file" do
      parser = RoadTrip::XLSParser.new("spec/data/2012.xlsx")
      parser.should be
    end

    # think about whether this stuff needs to be in XLSParser or Vehicle
    # I think it should go in XLSParser, with that object injected as a dependency that Vehicle has

    it "returns a hash of all vehicle makes and models" do
      parser = RoadTrip::XLSParser.new("spec/data/2012.xlsx")
      parser.to_hash.should == output_hash
        
    end

    # want something that looks like this:

    vehicles = {
                 :chevrolet      => {
                   :corvette  => {:city => 15, :highway => 25},
                   :silverado => {:city => 10, :highway => 20},
                   :suburban  => {:city => 30, :highway => 40}
                 },
                 :honda          => {},
                 :isuzu          => {},
                 :jeep           => {},
                 :kia            => {},
                 :lamborghini    => {},
                 :mazda          => {}
               }
  end
end
