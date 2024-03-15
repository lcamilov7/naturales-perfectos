class Interval < ApplicationRecord
  validates :minimum, presence: { message: 'no puede estar en blanco' }
  validates :maximum, presence: { message: 'no puede estar en blanco' }
  validates :minimum, numericality: { greater_than: 0, message: 'debe ser mayor que 0' }
  validates :maximum, numericality: { greater_than: :minimum, message: 'debe ser mayor que el mínimo' }, if: -> { self.minimum.present? }
  after_validation :determinar_naturales

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
