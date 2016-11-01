require 'either'


def validate(request)
  if request == "pippo"
    p "A"
    Success[true]
  else
    p "B"
    Failure[:no_pippo]
  end
end

def search(validated)
  if validated == true
    p "C"
    Success[:indeed]
  else
    p "D"
    Failure[:no_way]
  end
end

def serialize(search_result)
  p "E"
  Success[:done]
end

p validate('pippo')
 .bind(->(validated) { search(validated) })
 .bind(->(search_result) { serialize(search_result) })

p validate('pluto')
  .either(success: ->(validated) { search(validated) }, failure: ->(search_result) { serialize(search_result) })
