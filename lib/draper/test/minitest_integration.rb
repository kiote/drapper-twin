class Draper::TestCase
  register_spec_type(self) do |desc|
    desc < Draper::Decorator || desc < Draper::CollectionDeocrator if desc.is_a?(Class)
  end
  register_spec_type(/Decorator( ?Test)?\z/i, self)
end
