class IntervalsController < ApplicationController
  # Desactivamos la protección del token de veriricación para poder hacer peticiones
  # con curl o con Postman, pero en entornos de producción debe eliminarse obligatoriamente
  # y realizar las peticiones sacando el token del navegador y agregandolo al header de la
  # petición
  skip_before_action :verify_authenticity_token

  # Definimos una nueva instancia de Interval para captar los datos en el form
  # que se encuentra en la vista correspondiente al método (new.html.erb)
  def new
    @interval = Interval.new
  end

  # Creamos la instancia de interval recibiendo los params pasados desde el form
  # y filtrados por el método de seguridad interval_params
  # luego explicamos el comportamiento de la petición al método create dependiendo
  # del formato requerido, HTML o JSON
  def create
    @interval = Interval.new(interval_params)
    respond_to do |format|
      if @interval.save
        format.html { redirect_to result_path }
        format.json { render json: @interval.to_json(only: %i[minimum maximum results]), status: 200 }
      else
        puts @interval.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interval.errors, status: :unprocessable_entity }
      end
    end
  end

  # Metodo usado para la vista correspondiendo mostrar los resultados del interval
  # acabado de crear
  def result
    @interval = Interval.last
  end

  # Este método es invocado cuando se da en el botón de probar de nuevo, se deja
  # comentado la linea 41 en caso de requerir persistencia o no de la información
  def again
    # Interval.destroy_all

    respond_to do |format|
      format.html { redirect_to new_interval_path }
      format.json { head :no_content }
    end
  end

  private

  # Metodo privado para permitir pasar parámetros desde un form
  def interval_params
    params.require(:interval).permit(:minimum, :maximum)
  end
end
## NT-2
