class Reservation < ApplicationRecord
  belongs_to :flat
  belongs_to :client, class_name: 'User', foreign_key: 'user_id'

# validates > pas de conflit avec d'autres résa + inclus dans la fourchette du flate
# end

end
