Deface::Override.new(
  :virtual_path => 'spree/products/show',
  :name => 'add_link_to_mark_product_as_favorite',
  :insert_after => "div[itemprop='after-fav']",
  :text => %Q{
    <% if spree_user_signed_in? && spree_current_user.has_favorite_product?(@product.id) %>
      <div class="favourite-product col-xs-12 col-md-12">
        <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
        <%= link_to Spree.t(:unmark_as_favorite), favorite_product_path(:id => @product.id), :method => :delete, :remote => true, :class => 'favorite_link' %>
      </div>
    <% else %>
      <div class="favourite-product col-xs-12 col-md-12">
        <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
        <%= link_to Spree.t(:mark_as_favorite), favorite_products_path(:id => @product.id), :method => :post, :remote => spree_user_signed_in?, :class => 'favorite_link' %>
      </div>
    <% end %>
  }
)
