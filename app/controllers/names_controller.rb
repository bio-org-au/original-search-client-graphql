# frozen_string_literal: true

# Controller
class NamesController < ApplicationController
  def history
    request =
      "#{DATA_SERVER}/v1?query=#{name_history_query(params['id']).delete(' ')}"
    json = HTTParty.get(request).to_json
    @history = JSON.parse(json, object_class: OpenStruct)
  end

  private

  def name_history_query(id)
    <<~HEREDOC
      {
        name(id: #{id})
        {
          id,
          simple_name,
          full_name,
          full_name_html,
          name_history,
          {
            name_usages
            {
              instance_id,
               name_id,
               reference_id,
               citation,
               page,
               page_qualifier,
               year,
               standalone,
               synonyms
               {
                 id,
                 full_name,
                 instance_type,
                 has_label,
                 of_label,
                 page,
                 page_qualifier
               }
            }
          }
        }
      }
    HEREDOC
  end
end
