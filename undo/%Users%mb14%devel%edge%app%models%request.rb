Vim�UnDo� *H܌���;����\��ٮ�:����CΊw                                     M�>�    _�                     �       ����                                                                                                                                                                                                                                                                                                                                                             M�>�     �   �   �          �  named_scope :located_old, lambda {|*location_id| { :joins => :asset, :conditions =>  ['assets.holder_id = ? and assets.holder_type = ?', location_id[0], Location.name] } }5�_�                     �        ����                                                                                                                                                                                                                                                                                                                            �          �         V       M�>�    �   �   �          :  named_scope :holder_located_old, lambda { |*location_id|       {   �      :joins => ["INNER JOIN assets ON assets.id = asset_id", "INNER JOIN assets AS  asset_holder ON asset_holder.id = assets.holder_id"],   �      :conditions =>  ['asset_holder.holder_id = ? and asset_holder.holder_type = ? and assets.holder_type = ?', location_id[0], Location.name, Asset.name]       }     }5��