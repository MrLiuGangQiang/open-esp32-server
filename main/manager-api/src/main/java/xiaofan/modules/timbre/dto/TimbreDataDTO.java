package xiaofan.modules.timbre.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * 音色表数据DTO
 * 
 * @author zjy
 * @since 2025-3-21
 */
@Data
@Schema(description = "音色表信息")
public class TimbreDataDTO {

    @Schema(description = "语言")
    @NotBlank(message = "{timbre.languages.require}")
    @Size(max = 50, message = "????????50???")
    private String languages;

    @Schema(description = "音色名称")
    @NotBlank(message = "{timbre.name.require}")
    @Size(max = 20, message = "??????????20???")
    private String name;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "参考音频路径")
    private String referenceAudio;

    @Schema(description = "參考文本")
    private String referenceText;

    @Schema(description = "排序")
    @Min(value = 0, message = "{sort.number}")
    private Long sort;

    @Schema(description = "对应 TTS 模型主键")
    @NotBlank(message = "{timbre.ttsModelId.require}")
    @Size(max = 32, message = "TTS??ID??????32???")
    private String ttsModelId;

    @Schema(description = "音色编码")
    @NotBlank(message = "{timbre.ttsVoice.require}")
    @Size(max = 50, message = "??????????50???")
    private String ttsVoice;

    @Schema(description = "音频播放地址")
    private String voiceDemo;
}
