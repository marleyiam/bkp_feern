require 'csv'

class CSVSerializer
  attr_reader :subscriptions

  def initialize(params = {})
    @subscriptions = params.fetch(:subscriptions)
  end

  def serialize
    result = CSV.generate do |csv|
      csv << header

      @subscriptions.each do |s|
        csv << [s.nome, s.cargo, s.cpf, s.empresa, s.endereco, s.email, s.telefone, s.skype, s.twitter, s.facebook]
      end
    end

    result
  end

  def header
    ['NOME','CARGO','CPF','EMPRESA','ENDERECO','EMAIL','TELEFONE','SKYPE','TWITTER','FACEBOOK']
  end
end