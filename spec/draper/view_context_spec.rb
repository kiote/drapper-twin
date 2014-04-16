require 'spec_helper'

module Draper
  describe ViewContext do
    describe "#view_context" do
      let(:base) { Class.new { def view_context; :controlle_view_context; end } }
      let(:controller) { Class.new(base) { include ViewContext } }

      it "saves the superclass's view context" do
        ViewContext.should_receive(:current=).with(:controller_view_context)
        controller.new.view_context
      end

      it "returns the superclass's view context" do
        expect(controller.new.view_context).to be :controller_view_context
      end

      describe ".controller" do
        it "returns the stored from RequestStore" do
          RequestStore.stub store: {current_controller: :stored_controller}

          expect(ViewContext.controller).to be :stored_controller
        end
      end

      describe ".controller=" do
        it "stores a controller in RequestStore" do
          store = {}
          RequestStore.stub store: store

          ViewContext.controller = :stored_controller
          expect(store[:current_controller]).to be :stored_controller
        end
      end

      describe ".current" do
        it "returns the stored view context from RequestStore" do
          RequestStore.stub store: {current_view_context: :stored_view_context}

          expect(ViewController.current).to be :stored_view_controller
        end

        context "when no view context is stored" do
          
        end
      end
    end
  end
end
