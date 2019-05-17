# frozen_string_literal: true

# Gateway to NHTSA vPIC API
module VpicApiGateway
  BASE_URL = 'https://vpic.nhtsa.dot.gov'

  # Looks up vehicle by provided VIN in vPIC API
  def self.decode_vin_values(vin)
    response = connection.get("/api/vehicles/decodevinvalues/#{vin}?format=json")
    result = JSON.parse(response.body)
    result['Results'].first
  rescue StandardError => e
    puts "Error occurred! #{e.message}"
  end

  def self.connection
    if Rails.env.test?
      stubs = Faraday::Adapter::Test::Stubs.new
      stubs.get('/api/vehicles/decodevinvalues/1FBHE31H5SHB27779?format=json') { [200, {}, STUB_RESPONSE.to_json] }
      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    else
      Faraday.new(url: BASE_URL)
    end
  end

  STUB_RESPONSE =
    {
      'Count' => 131,
      'Message' => 'Results returned successfully',
      'SearchCriteria' => 'VIN(s): 1FBHE31H5SHB27779',
      'Results' => [
        {
          'BrakeSystemType' => 'Hydraulic',
          'DaytimeRunningLight' => '',
          'DestinationMarket' => '',
          'DisplacementCC' => '5751.859464',
          'DisplacementCI' => '351',
          'DisplacementL' => '5.8',
          'Doors' => '',
          'DriveType' => '4x2',
          'ElectrificationLevel' => '',
          'EngineConfiguration' => 'V-Shaped',
          'EngineCylinders' => '8',
          'EngineHP' => '205',
          'EngineHP_to' => '210',
          'EngineKW' => '152.8685',
          'EngineManufacturer' => 'Ford',
          'ErrorCode' => '0 - VIN decoded clean. Check Digit (9th position) is correct',
          'ForwardCollisionWarning' => '',
          'FuelInjectionType' => '',
          'FuelTypePrimary' => 'Gasoline',
          'Make' => 'FORD',
          'Manufacturer' => 'FORD MOTOR COMPANY, USA',
          'ManufacturerId' => '976',
          'ManufacturerType' => '',
          'Model' => 'E-350',
          'ModelYear' => '1995',
          'OtherBusInfo' => '',
          'OtherEngineInfo' => 'Fuel Injection Type: Electronic Fuel Injection',
          'PlantCity' => 'Lorain',
          'PlantCompanyName' => '',
          'PlantCountry' => 'United States (USA)',
          'PlantState' => 'Ohio',
          'SeatBeltsAll' => 'Manual',
          'Series' => 'XL',
          'Series2' => '',
          'TopSpeedMPH' => '',
          'TransmissionStyle' => '',
          'Trim' => 'Super Duty Wagon',
          'Trim2' => '',
          'Turbo' => '',
          'VIN' => '1FBHE31H5SHB27779',
          'ValveTrainDesign' => '',
          'VehicleType' => 'BUS'
        }
      ]
    }.freeze
end
