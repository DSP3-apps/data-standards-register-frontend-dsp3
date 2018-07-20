# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @registers = Register.available.all

    @ready_registers = Register.available.where(register_phase: 'Beta')
    @upcoming_registers = Register.available.where.not(register_phase: 'Beta')
    @organisation_count = @ready_registers.distinct.count(:authority)
  end

  def services_using_registers; end

  def combining_registers; end

  def case_study; end

  def privacy_notice; end

  def cookies; end
end
