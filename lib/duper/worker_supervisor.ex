defmodule Duper.WorkerSupervisor do
  use DynamicSupervisor

  @me WorkerSupervisor

  def start_link do
    DynamicSupervisor.start_link(__MODULE__, :no_args, @me)
  end

  def init(:no_args) do
    DynamicSupervisor.init(stategy: :one_for_one)
  end

  def add_worker do
    {:ok, pid} = DynamicSupervisor.start_child(@me, Duper.Worker)
  end
end
