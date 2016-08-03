##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Trunking < Domain
      class V1 < Version
        class TrunkContext < InstanceContext
          class OriginationUrlList < ListResource
            ##
            # Initialize the OriginationUrlList
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [OriginationUrlList] OriginationUrlList
            def initialize(version, trunk_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/OriginationUrls"
            end
            
            ##
            # Retrieve a single page of OriginationUrlInstance records from the API.
            # Request is executed immediately.
            # @param [String] weight The weight
            # @param [String] priority The priority
            # @param [Boolean] enabled The enabled
            # @param [String] friendly_name The friendly_name
            # @param [String] sip_url The sip_url
            # @return [OriginationUrlInstance] Newly created OriginationUrlInstance
            def create(weight: nil, priority: nil, enabled: nil, friendly_name: nil, sip_url: nil)
              data = {
                  'Weight' => weight,
                  'Priority' => priority,
                  'Enabled' => enabled,
                  'FriendlyName' => friendly_name,
                  'SipUrl' => sip_url,
              }
              
              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )
              
              return OriginationUrlInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end
            
            ##
            # Lists OriginationUrlInstance records from the API as a list.
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
            # Streams OriginationUrlInstance records from the API as an Enumerable.
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
            # When passed a block, yields OriginationUrlInstance records from the API.
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
            # Retrieve a single page of OriginationUrlInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of OriginationUrlInstance
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
              return OriginationUrlPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Trunking.V1.OriginationUrlList>'
            end
          end
        
          class OriginationUrlPage < Page
            ##
            # Initialize the OriginationUrlPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] trunk_sid The trunk_sid
            # @return [OriginationUrlPage] OriginationUrlPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of OriginationUrlInstance
            # @param [Hash] payload Payload response from the API
            # @return [OriginationUrlInstance] OriginationUrlInstance
            def get_instance(payload)
              return OriginationUrlInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Trunking.V1.OriginationUrlPage>'
            end
          end
        
          class OriginationUrlContext < InstanceContext
            ##
            # Initialize the OriginationUrlContext
            # @param [Version] version Version that contains the resource
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [OriginationUrlContext] OriginationUrlContext
            def initialize(version, trunk_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  trunk_sid: trunk_sid,
                  sid: sid,
              }
              @uri = "/Trunks/#{@solution[:trunk_sid]}/OriginationUrls/#{@solution[:sid]}"
            end
            
            ##
            # Fetch a OriginationUrlInstance
            # @return [OriginationUrlInstance] Fetched OriginationUrlInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return OriginationUrlInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
                  sid: @solution[:sid],
              )
            end
            
            ##
            # Deletes the OriginationUrlInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              return @version.delete('delete', @uri)
            end
            
            ##
            # Update the OriginationUrlInstance
            # @param [String] weight The weight
            # @param [String] priority The priority
            # @param [Boolean] enabled The enabled
            # @param [String] friendly_name The friendly_name
            # @param [String] sip_url The sip_url
            # @return [OriginationUrlInstance] Updated OriginationUrlInstance
            def update(weight: nil, priority: nil, enabled: nil, friendly_name: nil, sip_url: nil)
              data = {
                  'Weight' => weight,
                  'Priority' => priority,
                  'Enabled' => enabled,
                  'FriendlyName' => friendly_name,
                  'SipUrl' => sip_url,
              }
              
              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )
              
              return OriginationUrlInstance.new(
                  @version,
                  payload,
                  trunk_sid: @solution[:trunk_sid],
                  sid: @solution[:sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Trunking.V1.OriginationUrlContext #{context}>"
            end
          end
        
          class OriginationUrlInstance < InstanceResource
            ##
            # Initialize the OriginationUrlInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] trunk_sid The trunk_sid
            # @param [String] sid The sid
            # @return [OriginationUrlInstance] OriginationUrlInstance
            def initialize(version, payload, trunk_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'sid' => payload['sid'],
                  'trunk_sid' => payload['trunk_sid'],
                  'weight' => payload['weight'].to_i,
                  'enabled' => payload['enabled'],
                  'sip_url' => payload['sip_url'],
                  'friendly_name' => payload['friendly_name'],
                  'priority' => payload['priority'].to_i,
                  'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                  'url' => payload['url'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'trunk_sid' => trunk_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [OriginationUrlContext] OriginationUrlContext for this OriginationUrlInstance
            def context
              unless @instance_context
                @instance_context = OriginationUrlContext.new(
                    @version,
                    @params['trunk_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def sid
              @properties['sid']
            end
            
            def trunk_sid
              @properties['trunk_sid']
            end
            
            def weight
              @properties['weight']
            end
            
            def enabled
              @properties['enabled']
            end
            
            def sip_url
              @properties['sip_url']
            end
            
            def friendly_name
              @properties['friendly_name']
            end
            
            def priority
              @properties['priority']
            end
            
            def date_created
              @properties['date_created']
            end
            
            def date_updated
              @properties['date_updated']
            end
            
            def url
              @properties['url']
            end
            
            ##
            # Fetch a OriginationUrlInstance
            # @return [OriginationUrlInstance] Fetched OriginationUrlInstance
            def fetch
              context.fetch
            end
            
            ##
            # Deletes the OriginationUrlInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end
            
            ##
            # Update the OriginationUrlInstance
            # @param [String] weight The weight
            # @param [String] priority The priority
            # @param [Boolean] enabled The enabled
            # @param [String] friendly_name The friendly_name
            # @param [String] sip_url The sip_url
            # @return [OriginationUrlInstance] Updated OriginationUrlInstance
            def update(weight: nil, priority: nil, enabled: nil, friendly_name: nil, sip_url: nil)
              context.update(
                  weight: weight,
                  priority: priority,
                  enabled: enabled,
                  friendly_name: friendly_name,
                  sip_url: sip_url,
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Trunking.V1.OriginationUrlInstance #{values}>"
            end
          end
        end
      end
    end
  end
end