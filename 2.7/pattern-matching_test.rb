require "test/unit"
require "json"

def json_handler(json)
  case JSON.parse(json, symbolize_names: true)
  in {success: true, items: items}
    puts "[MATCH] items: #{items.inspect}"
    items
  in {success: false, error: {message: error_message}}
    puts "[MATCH] error: #{error_message.inspect}"
    error_message
  else
    puts "[NOT MATCH] didn't match: #{json}"
    raise ArgumentError.new(json)
  end
end

class PatternMatchingSample < Test::Unit::TestCase
  def test_handle_success
    json = <<~JSON
    {
      "success": true,
      "items": [
        {
          "id": 1,
          "name": "Hoge"
        }
      ]
    }
  JSON

  assert_equal json_handler(json), [{id: 1, name: "Hoge"}]
  end

  def test_handle_error
    json = <<~JSON
      {
        "success": false,
        "error": {
          "message": "hogehoge"
        }
      }
    JSON

    assert_equal json_handler(json), "hogehoge"
  end

  def test_no_match
    json = <<~JSON
      {
        "success": true
      }
    JSON

    assert_raises(ArgumentError) { json_handler(json) }
  end
end
