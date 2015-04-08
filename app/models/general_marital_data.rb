class GeneralMaritalData
  attr_reader :data_set_name, :data_set_description, :years_available

  include ActiveModel::Serialization

  def initialize(attributes)
    @data_set_name = attributes[:data_set_name]
    @data_set_description = attributes[:data_set_description]
    @years_available = attributes[:years_available]
  end

  def self.all
    [{ data_set_name: name,
      data_set_description: description,
      years_available: years
    }].map do |data|
      GeneralMaritalData.new(data)
    end
  end

  def self.name
    "Marriages in the Last Year By Sex By Marital Status for the Population 15 Years and Over"
  end

  def self.description
    "The American Community Survey (ACS) is a nationwide survey designed to
    provide communities a fresh look at how they are changing. The ACS
    replaced the decennial census long form in 2010 and thereafter by
    collecting long form type information throughout the decade rather than only
    once every 10 years. Questionnaires are mailed to a sample of addresses to
    obtain information about households -- that is, about each person and the
    housing unit itself. The American Community Survey produces demographic,
    social, housing and economic estimates in the form of 1-year, 3-year and
    5-year estimates based on population thresholds. The strength of the ACS is
    in estimating population and housing characteristics. It produces estimates
    for small areas, including census tracts and population subgroups. Although
    the ACS produces population, demographic and housing unit estimates,it is
    the Census Bureau's Population Estimates Program that produces and
    disseminates the official estimates of the population for the nation,
    states, counties, cities and towns, and estimates of housing units for
    states and counties. For 2010 and other decennial census years, the
    Decennial Census provides the official counts of population and housing
    units."
  end

  def self.years
    years = StateMaritalData.all.map { |record| record.year }.uniq
    "Data available for the following year(s): #{years}"
  end
end
