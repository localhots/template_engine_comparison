module TagzTemplates
  class Big < Base
    def render
      html_{
        head_{
          title_ 'Customers List'
        }
        body_{
          @customers.each{ |customer|
            dl_{
              dt_ 'Name:'
              dd_ customer['name']
              dt_ 'Age:'
              dd_ customer['age']
              dt_ 'Address:'
              dd_{
                [
                  customer['zip'],
                  customer['country'],
                  customer['city'],
                  customer['address']
                ].join("\n")
              }
              dt_ 'Employer:'
              dd_ customer['employer']
            }
          }
        }
      }
    end
  end
end
