class Open5eApiService 
  def get_monsters(type, cr)
    get_url("/monsters/?type=#{type}&cr__lte=#{cr}")
  end

  def get_magic_items
    get_url("/magicitems/")
  end
  
  def get_spells
    get_url("/spells/?slug__in=&slug__iexact=&slug=&name__iexact=&name=&spell_level=&spell_level__range=&spell_level__gt=&spell_level__gte=&spell_level__lt=&spell_level__lte=3&target_range_sort=&target_range_sort__range=&target_range_sort__gt=&target_range_sort__gte=&target_range_sort__lt=&target_range_sort__lte=&school__iexact=&school=&school__in=&duration__iexact=&duration=&duration__in=&requires_concentration=unknown&requires_verbal_components=unknown&requires_somatic_components=unknown&requires_material_components=unknown&casting_time__iexact=&casting_time=&casting_time__in=&dnd_class__iexact=&dnd_class=&dnd_class__in=&dnd_class__icontains=&document__slug__iexact=&document__slug=&document__slug__in=&level_int=&concentration=&components=&spell_lists_not=")
  end

  def get_armor
    get_url("/armor/")
  end

  def get_weapons
    get_url("/weapons/")
  end

  private
  def conn
    Faraday.new(url: 'https://api.open5e.com')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end