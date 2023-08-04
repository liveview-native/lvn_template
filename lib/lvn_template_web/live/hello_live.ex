defmodule LvnTemplateWeb.HelloLive do
  use Phoenix.LiveView
  use LiveViewNative.LiveView

  @impl true
  def render(%{platform_id: :swiftui} = assigns) do
    ~SWIFTUI"""
    <VStack>
      <Text modclass="font-weight-semibold">Hello iOS!</Text>
    </VStack>
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="text-slate-800 bg-slate-50 h-screen w-screen grid grid-cols-1 gap-1 content-center items-center text-center">
      <div class="font-semibold mb-1">Hello web!</div>
    </div>
    """
  end

  def modclass(native, "font-weight-" <> font_weight) do
    font_weight(native, String.to_existing_atom(font_weight))
  end
end
