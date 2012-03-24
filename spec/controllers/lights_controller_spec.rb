require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LightsController do

  # This should return the minimal set of attributes required to create a valid
  # Light. As you add validations to Light, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all lights as @lights" do
      light = Light.create! valid_attributes
      get :index
      assigns(:lights).should eq([light])
    end
  end

  describe "GET show" do
    it "assigns the requested light as @light" do
      light = Light.create! valid_attributes
      get :show, :id => light.id.to_s
      assigns(:light).should eq(light)
    end
  end

  describe "GET new" do
    it "assigns a new light as @light" do
      get :new
      assigns(:light).should be_a_new(Light)
    end
  end

  describe "GET edit" do
    it "assigns the requested light as @light" do
      light = Light.create! valid_attributes
      get :edit, :id => light.id.to_s
      assigns(:light).should eq(light)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Light" do
        expect {
          post :create, :light => valid_attributes
        }.to change(Light, :count).by(1)
      end

      it "assigns a newly created light as @light" do
        post :create, :light => valid_attributes
        assigns(:light).should be_a(Light)
        assigns(:light).should be_persisted
      end

      it "redirects to the created light" do
        post :create, :light => valid_attributes
        response.should redirect_to(Light.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved light as @light" do
        # Trigger the behavior that occurs when invalid params are submitted
        Light.any_instance.stub(:save).and_return(false)
        post :create, :light => {}
        assigns(:light).should be_a_new(Light)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Light.any_instance.stub(:save).and_return(false)
        post :create, :light => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested light" do
        light = Light.create! valid_attributes
        # Assuming there are no other lights in the database, this
        # specifies that the Light created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Light.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => light.id, :light => {'these' => 'params'}
      end

      it "assigns the requested light as @light" do
        light = Light.create! valid_attributes
        put :update, :id => light.id, :light => valid_attributes
        assigns(:light).should eq(light)
      end

      it "redirects to the light" do
        light = Light.create! valid_attributes
        put :update, :id => light.id, :light => valid_attributes
        response.should redirect_to(light)
      end
    end

    describe "with invalid params" do
      it "assigns the light as @light" do
        light = Light.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Light.any_instance.stub(:save).and_return(false)
        put :update, :id => light.id.to_s, :light => {}
        assigns(:light).should eq(light)
      end

      it "re-renders the 'edit' template" do
        light = Light.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Light.any_instance.stub(:save).and_return(false)
        put :update, :id => light.id.to_s, :light => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested light" do
      light = Light.create! valid_attributes
      expect {
        delete :destroy, :id => light.id.to_s
      }.to change(Light, :count).by(-1)
    end

    it "redirects to the lights list" do
      light = Light.create! valid_attributes
      delete :destroy, :id => light.id.to_s
      response.should redirect_to(lights_url)
    end
  end

end