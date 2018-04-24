class Roadmap

  def get_roadmap (chain_id)
    id = chain_id
    response = self.class.get(api_endpoint("roadmaps/#{id}"), headers: {"content_type" => 'application/json', "authorization" => @auth_token })
    roadmap = JSON.parse(response.body)
  end

  def get_checkpoint (checkpoint_id)
    id = checkpoint_id
    response = self.class.get(api_endpoint("checkpoints/#{id}"), headers: {"content_type" => 'application/json', "authorization" => @auth_token })
    checkpoint = JSON.parse(response.body)
  end

end
