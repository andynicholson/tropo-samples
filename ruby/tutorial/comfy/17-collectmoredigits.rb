## -------------
## Tutorial 17 - collecting more digits with more varities
## -------------
call = Tropo::TropoCall.new($incomingCall)
call.answer

## ask for a single digit

result = call.ask 'Hello.  Please enter any single digit', :choices => '[1 DIGIT]'

if result.name == 'choice'
  call.say 'Great, you said ' + result.value
end


## ask for a 5 digit long ZIP code

result = call.ask 'Hello.  Please enter your 5 digit ZIP code', :choices => '[5 DIGITS]'

if result.name == 'choice'
  call.say 'Great, you said ' + result.value
end


## Digits work with speech or touch-tone input...

result = call.ask 'Hello.  Please say or enter your 5 digit ZIP code', :choices => '[5 DIGITS]'

if result.name == 'choice'
  call.say 'Great, you said ' + result.value
end

	
## ask for 1 to 6 digit long an account ID

result = call.ask 'Please enter your account ID followed by the pound key.', :choices => '[1-6 DIGITS]'

if result.name == 'choice'
  call.say 'Great, you said ' + result.value
end

## ask for a US phone number 7 digits without area code, 10 digits with
	
result = call.ask 'Please enter your 7 to 10 digit U.S. phone number', :choices => '[7-10 DIGITS]'

if result.name == 'choice'
  call.say 'Great, you said ' + result.value
end

## digit collection also supports all other ask properties and event handlers
## collect 3 digits.  Reask up to 3 times.  Use a 7 second timeout...

call.ask 'Now please enter a number between 1 and 999', :choices => '[1-3 DIGITS]', :repeat => 3, :timeout => 7 do |link|
    
  link.on :choice do |event|
    call.log 'result name ' + event.name 
    call.log 'number is ' + event.value
    call.say 'Great, you said ' + event.value
  end
    
  link.on :bad_choice do |event|
    call.say 'Im sorry, I did not understand your response.'
  end
    
  link.on :timeout do |event|
    call.say 'Im sorry, I did not hear anything.'
  end

end

call.hangup