Rails.configuration.stripe = {
  :publishable_key => 'pk_test_iNUhtFmdEdDRezJTVX38qWiT',
  :secret_key      => 'sk_test_k3XxNWZESaSGhIiyk0FOouT5'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]