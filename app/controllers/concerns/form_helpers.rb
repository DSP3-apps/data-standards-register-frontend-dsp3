module FormHelpers
  def set_government_orgs_local_authorities
    registers = {
        'government-organisation': 'name',
        'local-authority-eng': 'official-name',
        'local-authority-sct': 'official-name',
        'local-authority-nir': 'official-name',
        'principal-local-authority': 'official-name',
    }

    @government_orgs_local_authorities = registers.map { |k, v|
      Register.find_by(slug: k)&.records&.where(entry_type: 'user')&.current&.map { |r|
        [
          "#{k}:#{r.key}", r.data[v]
        ]
      }
    }.compact.flatten(1)
  end

  def set_is_government_boolean(params)
    params.merge!(is_government: case params[:is_government]
                                 when 'yes'
                                   true
                                 when 'no'
                                   false
                                 end)
  end
end