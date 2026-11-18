package xiaofan.modules.agent.service;

import xiaofan.modules.agent.entity.AgentChatTitleEntity;

public interface AgentChatTitleService {

    void saveOrUpdateTitle(String sessionId, String title);

    String getTitleBySessionId(String sessionId);
}