xml.html do
  xml.head do
    xml.title 'Customers List'
  end
  xml.body do
    customers.each do |customer|
      xml.dl do
        xml.dt 'Name:'
        xml.dd customer['name']
        xml.dt 'Age:'
        xml.dd customer['age']
        xml.dt 'Address:'
        xml.dd do
          [
            customer['zip'],
            customer['country'],
            customer['city'],
            customer['address']
          ].join("\n")
        end
        xml.dt 'Employer:'
        xml.dd customer['employer']
      end
    end
  end
end

