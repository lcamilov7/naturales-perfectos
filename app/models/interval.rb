class Interval < ApplicationRecord
  validates :minimum, presence: true
  validates :maximum, presence: true
  validates :maximum, format: { without: /[.,]/, message: 'no puede contener comas ni puntos' }
  validates :minimum, numericality: { greater_than: 0, message: 'debe ser mayor que 0' }
  validates :maximum, numericality: { greater_than: :minimum, message: 'debe ser mayor que el mínimo' }, if: -> { self.minimum.present? }

  def determinar_naturales
    naturales_perfectos = []
    (self.minimum..self.maximum).each do |numero|
      suma_divisores = 0
      (1..numero / 2).each do |i|
        suma_divisores += i if (numero % i).zero?
      end
      naturales_perfectos.push(numero) if suma_divisores == numero
    end
    return naturales_perfectos
  end
end
