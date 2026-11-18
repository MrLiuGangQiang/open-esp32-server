package xiaofan.modules.agent.service;

import xiaofan.common.page.PageData;
import xiaofan.common.service.BaseService;
import xiaofan.modules.agent.dto.AgentSnapshotPageDTO;
import xiaofan.modules.agent.entity.AgentSnapshotEntity;
import xiaofan.modules.agent.vo.AgentSnapshotVO;

public interface AgentSnapshotService extends BaseService<AgentSnapshotEntity> {
    void createSnapshot(String agentId, String source);

    PageData<AgentSnapshotVO> page(String agentId, AgentSnapshotPageDTO params);

    AgentSnapshotVO getSnapshot(String agentId, String snapshotId);

    void restoreSnapshot(String agentId, String snapshotId, String currentStateToken);

    void deleteSnapshot(String agentId, String snapshotId);

    Integer getCurrentVersionNo(String agentId);

    void deleteByAgentId(String agentId);

    long redactLegacySnapshots();
}
