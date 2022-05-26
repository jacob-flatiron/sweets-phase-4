class VendorSweetsController < ApplicationController

        ### testing ###
    # def index
    #     vs = VendorSweet.all
    #     render json: vs, status: 200
    # end

    # def show
    #     vs = VendorSweet.find_by(id: params[:id])
    #     if vs
    #         render json: vs, status: 200 
    #     else
    #         render json: { "error": "VendorSweet not found" }, status: 404
    #     end 
    # end
        ### end testing ###

    def create
        vendorsweet = VendorSweet.create(price: params[:price], vendor_id: params[:vendor_id], sweet_id: params[:sweet_id])
        if vendorsweet.valid?
            render json: vendorsweet, status: 201 
        else
            render json: { "errors": vendorsweet.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        vendorsweet = VendorSweet.find_by(id: params[:id])
        if vendorsweet.valid?
            vendorsweet.destroy
            head :no_content 
        else 
            render json: { "error": "VendorSweet not found" }, status: 404
        end
    end

    # private

    # def vs_params
    #     params.permit[:price, :vendor]
    # end
end