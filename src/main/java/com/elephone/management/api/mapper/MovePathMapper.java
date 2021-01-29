package com.elephone.management.api.mapper;

import com.elephone.management.api.dto.MovePathDTO;
import com.elephone.management.config.MapstructConfig;
import com.elephone.management.domain.MovePath;
import org.mapstruct.Mapper;

@Mapper(config = MapstructConfig.class, uses = {StoreMapper.class})
public interface MovePathMapper {
    MovePath fromDTO(MovePathDTO movePathDTO);

    MovePathDTO toDTO(MovePath movePath);
}
