class Interval < ApplicationRecord
  # Validaciones para los atributos minimum y maximum de la instancia de interval
  validates :minimum, presence: { message: 'no puede estar en blanco' }
  validates :maximum, presence: { message: 'no puede estar en blanco' }
  validates :minimum, numericality: { greater_than: 0, message: 'debe ser mayor que 0' }
  validates :maximum, numericality: { greater_than: :minimum, message: 'debe ser mayor que el mínimo' }, if: -> { self.minimum.present? }
  # Despues de validar activamos este callback que crea el atributo results basado en los atributos
  # minimum y maximum
  after_validation :determinar_naturales

  # Este método de clase contiene la lógica del ejericio
  def determinar_naturales
    (self.minimum..self.maximum).each do |numero|
      suma_divisores = 0
      (1..numero / 2).each do |i|
        suma_divisores += i if (numero % i).zero?
      end
      self.results.push(numero) if suma_divisores == numero
    end
  end
end
