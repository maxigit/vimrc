Vim�UnDo� b���q�
�2 �w�´���H����������'  �                                   M�^�    _�                    [        ����                                                                                                                                                                                       �                                                                                                                                 [                     V        M�^�     �  Z  [       %   I  def generate_1dtubes(worksheet, count, barcode_printer, default_values)   $    current_row = SPREADSHEET_OFFSET       tubes = []       self.barcodes = []       +    sanger_ids = generate_sanger_ids(count)   0    study_abbreviation = self.study.abbreviation       samples_data = []           if @column_position_map   @      barcode_position = @column_position_map['SANGER PLATE ID']   C      sample_id_position = @column_position_map['SANGER SAMPLE ID']       else         barcode_position = 0         sample_id_position = 2       end           1.upto(count).each do |i|   &      sample_tube = SampleTube.create!   7      self.barcodes << sample_tube.sanger_human_barcode   h      sanger_sample_id = SangerSampleId.generate_sanger_sample_id!(study_abbreviation, sanger_ids.shift)   Q      worksheet[current_row, barcode_position] = sample_tube.sanger_human_barcode   C      worksheet[current_row, sample_id_position] = sanger_sample_id       J      fill_row_with_default_values(worksheet, current_row, default_values)       #      current_row = current_row + 1         tubes << sample_tube   O      samples_data << [sample_tube.barcode,sanger_sample_id,sample_tube.prefix]       end   C    delayed_sample_tube_sample_creation(samples_data,self.study.id)   6    delayed_generate_asset_requests(tubes, self.study)   	    save!       9    print_stock_tube_labels(barcode_printer,samples_data)     end   =======5�_�                    [        ����                                                                                                                                                                                       f                                                                                                                                 [          �           V        M�^�    �  Z  [       '       @  def delayed_sample_tube_sample_creation(samples_data,study_id)       study_samples_data = []   :    samples_data.each do |barcode,sanger_sample_id,prefix|   G      sample = SampleManifest.create_sample("", self, sanger_sample_id)   7      sample_tube = SampleTube.find_by_barcode(barcode)   !      sample_tube.sample = sample         sample_tube.save!   1      study_samples_data << [study_id, sample.id]       end   ;    self.delayed_generate_study_samples(study_samples_data)     end   <  handle_asynchronously :delayed_sample_tube_sample_creation       H  def delayed_generate_wells(well_data, plate_id, study_id, manifest_id)   &    ActiveRecord::Base.transaction do          wells_to_create = []   "      plate = Plate.find(plate_id)   1      manifest = SampleManifest.find(manifest_id)         study_samples_data = []   3      well_data.each do |position,sanger_sample_id|   M        sample = SampleManifest.create_sample("", manifest, sanger_sample_id)   I        map = Map.find_by_description_and_asset_size(position,plate.size)   E        Well.create!(:plate => plate, :map => map, :sample => sample)   3        study_samples_data << [study_id, sample.id]   	      end   A      manifest.delayed_generate_study_samples(study_samples_data)         plate.save!         plate.reload   /      plate.create_well_attributes(plate.wells)       L      RequestFactory.create_assets_requests(plate.wells.map(&:id), study_id)       end           nil     end   /  handle_asynchronously :delayed_generate_wells       '>>>>>>> Replacing holder by 'new' wells5��