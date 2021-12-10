require "socket"
require 'rack'
require './laba5/CashMachine.rb'

server = TCPServer.new('localhost', 3000)

def array_to_hash(array)
	result = {}
	array.each do |item|
		key = item.split("=")[0]
		value = item.split("=")[1]
		result[key] = value
	end
	result
end

class App
	def call(env)
		req = Rack::Request.new(env)
		params = env["QUERY_PARAMS"]
		cashMachine = CashMachine.new
		case req.path
			when "/"
				[200, { "Content-Type" => "text/html" }, ["ATM accepts the following bills:\n100\n500\n1000\n2000\n5000\nYou can deposit or withdraw no more than 9900 at a time\r\n"]]
			when "/deposit"
				if params.nil? || params["value"].nil?
					[400, { "Content-Type" => "text/html" }, ["You are not entered value for deposit, please try again\r\n"]]
				else
					if cashMachine.deposit(params["value"]) == -1
						[400, { "Content-Type" => "text/html" }, ["You entered the amount less than the minimum, please try again\r\n"]]
					elsif cashMachine.deposit(params["value"]) == -2
						[400, { "Content-Type" => "text/html" }, ["You entered the wrong bill, please try again\r\n"]]
					elsif cashMachine.deposit(params["value"]) == -3
						[400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds the maximum deposit at a time, please try again\r\n"]]
					else
						[200, { "Content-Type" => "text/html" }, ["You are deposited #{params["value"]}\nYour Balance is #{cashMachine.balance}\r\n"]]
					end
				end
			when "/withdraw"
				if params.nil? || params["value"].nil?
					[400, { "Content-Type" => "text/html" }, ["You are not entered value for withdraw, please try again\r\n"]]
				else
					if cashMachine.withdraw(params["value"]) == -1
						[400, { "Content-Type" => "text/html" }, ["You entered the amount less than the minimum, please try again\r\n"]]
					elsif cashMachine.withdraw(params["value"]) == -2
						[400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds your current balance, please try again\r\n"]]
					elsif cashMachine.withdraw(params["value"]) == -3
						[400, { "Content-Type" => "text/html" }, ["You entered the wrong bill, please try again\r\n"]]
					elsif cashMachine.withdraw(params["value"]) == -4
						[400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds the maximum withdraw at a time, please try again\r\n"]]
					else
						[200, { "Content-Type" => "text/html" }, ["You are withdrawed #{params["value"]}\r\nYour Balance is #{cashMachine.balance}\r\n"]]
					end
				end
			when "/balance"
				[200, { "Content-Type" => "text/html" }, ["Your balance is #{cashMachine.balance}", "\r\n"]]
			else
				[404, { "Content-Type" => "text/html" }, ["Not Found this page\r\n"]]
		end
	end
end

app = App.new

while (connection = server.accept)
	request = connection.gets
	method, full_path, http_ver = request.split(' ')
	path, params = full_path.split('?')
	status, headers, body = app.call({
										 'REQUEST_METHOD' => method,
										 'PATH_INFO' => path,
										 'QUERY_PARAMS' => params != nil ? array_to_hash(params.split('&')) : nil
									 })
	connection.print "#{http_ver} #{status} \r\n"
	headers.each do |key, value|
		connection.print "#{key}: #{value}\r\n"
	end
	connection.print "\r\n"
	body.each do |part|
		connection.print part
	end
	connection.close
end
