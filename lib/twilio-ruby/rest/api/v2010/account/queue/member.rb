##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class QueueContext < InstanceContext
            class MemberList < ListResource
              ##
              # Initialize the MemberList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] queue_sid A 34 character string that uniquely identifies this
              #   queue.
              # @return [MemberList] MemberList
              def initialize(version, account_sid: nil, queue_sid: nil)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    queue_sid: queue_sid
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Queues/#{@solution[:queue_sid]}/Members.json"
              end
              
              ##
              # Lists MemberInstance records from the API as a list.
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
              # Streams MemberInstance records from the API as an Enumerable.
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
              # When passed a block, yields MemberInstance records from the API.
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
              # Retrieve a single page of MemberInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of MemberInstance
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
                return MemberPage.new(@version, response, @solution)
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.MemberList>'
              end
            end
          
            class MemberPage < Page
              ##
              # Initialize the MemberPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @param [String] account_sid The account_sid
              # @param [String] queue_sid A 34 character string that uniquely identifies this
              #   queue.
              # @return [MemberPage] MemberPage
              def initialize(version, response, solution)
                super(version, response)
                
                # Path Solution
                @solution = solution
              end
              
              ##
              # Build an instance of MemberInstance
              # @param [Hash] payload Payload response from the API
              # @return [MemberInstance] MemberInstance
              def get_instance(payload)
                return MemberInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    queue_sid: @solution[:queue_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.MemberPage>'
              end
            end
          
            class MemberContext < InstanceContext
              ##
              # Initialize the MemberContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] queue_sid The Queue in which to find the members
              # @param [String] call_sid The call_sid
              # @return [MemberContext] MemberContext
              def initialize(version, account_sid, queue_sid, call_sid)
                super(version)
                
                # Path Solution
                @solution = {
                    account_sid: account_sid,
                    queue_sid: queue_sid,
                    call_sid: call_sid,
                }
                @uri = "/Accounts/#{@solution[:account_sid]}/Queues/#{@solution[:queue_sid]}/Members/#{@solution[:call_sid]}.json"
              end
              
              ##
              # Fetch a MemberInstance
              # @return [MemberInstance] Fetched MemberInstance
              def fetch
                params = {}
                
                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )
                
                return MemberInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    queue_sid: @solution[:queue_sid],
                    call_sid: @solution[:call_sid],
                )
              end
              
              ##
              # Update the MemberInstance
              # @param [String] url The url
              # @param [String] method The method
              # @return [MemberInstance] Updated MemberInstance
              def update(url: nil, method: nil)
                data = {
                    'Url' => url,
                    'Method' => method,
                }
                
                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )
                
                return MemberInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    queue_sid: @solution[:queue_sid],
                    call_sid: @solution[:call_sid],
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.MemberContext #{context}>"
              end
            end
          
            class MemberInstance < InstanceResource
              ##
              # Initialize the MemberInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The account_sid
              # @param [String] queue_sid A 34 character string that uniquely identifies this
              #   queue.
              # @param [String] call_sid The call_sid
              # @return [MemberInstance] MemberInstance
              def initialize(version, payload, account_sid: nil, queue_sid: nil, call_sid: nil)
                super(version)
                
                # Marshaled Properties
                @properties = {
                    'call_sid' => payload['call_sid'],
                    'date_enqueued' => Twilio.deserialize_rfc2822(payload['date_enqueued']),
                    'position' => payload['position'].to_i,
                    'uri' => payload['uri'],
                    'wait_time' => payload['wait_time'].to_i,
                }
                
                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'queue_sid' => queue_sid,
                    'call_sid' => call_sid || @properties['call_sid'],
                }
              end
              
              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @param [Version] version Version that contains the resource
              # @return [MemberContext] MemberContext for this MemberInstance
              def context
                unless @instance_context
                  @instance_context = MemberContext.new(
                      @version,
                      @params['account_sid'],
                      @params['queue_sid'],
                      @params['call_sid'],
                  )
                end
                @instance_context
              end
              
              def call_sid
                @properties['call_sid']
              end
              
              def date_enqueued
                @properties['date_enqueued']
              end
              
              def position
                @properties['position']
              end
              
              def uri
                @properties['uri']
              end
              
              def wait_time
                @properties['wait_time']
              end
              
              ##
              # Fetch a MemberInstance
              # @return [MemberInstance] Fetched MemberInstance
              def fetch
                context.fetch
              end
              
              ##
              # Update the MemberInstance
              # @param [String] url The url
              # @param [String] method The method
              # @return [MemberInstance] Updated MemberInstance
              def update(url: nil, method: nil)
                context.update(
                    url: url,
                    method: method,
                )
              end
              
              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.MemberInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end