##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Pricing < Domain
      class V1 < Version
        class VoiceList < ListResource
          class CountryList < ListResource
            ##
            # Initialize the CountryList
            # @param [Version] version Version that contains the resource
            # @return [CountryList] CountryList
            def initialize(version)
              super(version)
              
              # Path Solution
              @solution = {}
              @uri = "/Voice/Countries"
            end
            
            ##
            # Lists CountryInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams CountryInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  page_size: limits[:page_size],
              )
              
              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end
            
            ##
            # When passed a block, yields CountryInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to read the
            #                       limit with the most efficient page size, i.e. min(limit, 1000)
            def each
              limits = @version.read_limits
              
              page = self.page(
                  page_size: limits[:page_size],
              )
              
              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end
            
            ##
            # Retrieve a single page of CountryInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of CountryInstance
            def page(page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return CountryPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Pricing.V1.CountryList>'
            end
          end
        
          class CountryPage < Page
            ##
            # Initialize the CountryPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [CountryPage] CountryPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of CountryInstance
            # @param [Hash] payload Payload response from the API
            # @return [CountryInstance] CountryInstance
            def get_instance(payload)
              return CountryInstance.new(
                  @version,
                  payload,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Pricing.V1.CountryPage>'
            end
          end
        
          class CountryContext < InstanceContext
            ##
            # Initialize the CountryContext
            # @param [Version] version Version that contains the resource
            # @param [String] iso_country The iso_country
            # @return [CountryContext] CountryContext
            def initialize(version, iso_country)
              super(version)
              
              # Path Solution
              @solution = {
                  iso_country: iso_country,
              }
              @uri = "/Voice/Countries/#{@solution[:iso_country]}"
            end
            
            ##
            # Fetch a CountryInstance
            # @return [CountryInstance] Fetched CountryInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return CountryInstance.new(
                  @version,
                  payload,
                  iso_country: @solution[:iso_country],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Pricing.V1.CountryContext #{context}>"
            end
          end
        
          class CountryInstance < InstanceResource
            ##
            # Initialize the CountryInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] iso_country The iso_country
            # @return [CountryInstance] CountryInstance
            def initialize(version, payload, iso_country: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'country' => payload['country'],
                  'iso_country' => payload['iso_country'],
                  'url' => payload['url'],
                  'outbound_prefix_prices' => payload['outbound_prefix_prices'],
                  'inbound_call_prices' => payload['inbound_call_prices'],
                  'price_unit' => payload['price_unit'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'iso_country' => iso_country || @properties['iso_country'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [CountryContext] CountryContext for this CountryInstance
            def context
              unless @instance_context
                @instance_context = CountryContext.new(
                    @version,
                    @params['iso_country'],
                )
              end
              @instance_context
            end
            
            def country
              @properties['country']
            end
            
            def iso_country
              @properties['iso_country']
            end
            
            def outbound_prefix_prices
              @properties['outbound_prefix_prices']
            end
            
            def inbound_call_prices
              @properties['inbound_call_prices']
            end
            
            def price_unit
              @properties['price_unit']
            end
            
            def url
              @properties['url']
            end
            
            ##
            # Fetch a CountryInstance
            # @return [CountryInstance] Fetched CountryInstance
            def fetch
              context.fetch
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Pricing.V1.CountryInstance #{values}>"
            end
          end
        end
      end
    end
  end
end