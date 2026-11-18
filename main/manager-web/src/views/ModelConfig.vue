<template>
  <div class="welcome">
    <HeaderBar />

    <div class="operation-bar">
      <h2 class="page-title">{{ pageTitle }}</h2>
      <div class="action-group">
        <div class="search-group" v-if="activeTab !== 'mcp'">
          <el-input
            :placeholder="$t('modelConfig.searchPlaceholder')"
            v-model="search"
            class="search-input"
            clearable
            @keyup.enter.native="handleSearch"
            style="width: 240px"
          />
          <el-button class="btn-search" @click="handleSearch">
            {{ $t("modelConfig.search") }}
          </el-button>
        </div>
      </div>
    </div>

    <!-- 娑撹缍嬮崘鍛啇 -->
    <div class="main-wrapper">
      <div class="content-panel">
        <!-- 瀹革缚鏅剁€佃壈鍩?-->
        <el-menu
          :default-active="activeTab"
          class="nav-panel"
          @select="handleMenuSelect"
          style="background-size: cover; background-position: center"
        >
          <el-menu-item index="vad">
            <span class="menu-text">{{ $t("modelConfig.vad") }}</span>
          </el-menu-item>
          <el-menu-item index="asr">
            <span class="menu-text">{{ $t("modelConfig.asr") }}</span>
          </el-menu-item>
          <el-menu-item index="llm">
            <span class="menu-text">{{ $t("modelConfig.llm") }}</span>
          </el-menu-item>
          <el-menu-item index="vllm">
            <span class="menu-text">{{ $t("modelConfig.vllm") }}</span>
          </el-menu-item>
          <el-menu-item index="intent">
            <span class="menu-text">{{ $t("modelConfig.intent") }}</span>
          </el-menu-item>
          <el-menu-item index="tts">
            <span class="menu-text">{{ $t("modelConfig.tts") }}</span>
          </el-menu-item>
          <el-menu-item index="memory">
            <span class="menu-text">{{ $t("modelConfig.memory") }}</span>
          </el-menu-item>
          <el-menu-item index="rag">
            <span class="menu-text">{{ $t("modelConfig.rag") }}</span>
          </el-menu-item>
          <el-menu-item index="mcp">
            <span class="menu-text">{{ $t("capability.mcp") }}</span>
          </el-menu-item>
        </el-menu>

        <!-- 閸欏厖鏅堕崘鍛啇 -->
        <div class="content-area">
          <template v-if="activeTab !== 'mcp'">
          <el-card class="model-card" shadow="never">
            <el-table
              key="model-table"
              ref="modelTable"
              style="width: 100%"
              v-loading="loading"
              :element-loading-text="$t('modelConfig.loading')"
              element-loading-spinner="el-icon-loading"
              element-loading-background="rgba(255, 255, 255, 0.7)"
              :header-cell-style="{ background: 'transparent' }"
              :data="modelList"
              class="transparent-table"
              header-row-class-name="table-header"
              :header-cell-class-name="headerCellClassName"
              @selection-change="handleSelectionChange"
            >
              <el-table-column
                type="selection"
                width="55"
                align="center"
                :cell-class-name="selectionCellClassName"
              ></el-table-column>
              <el-table-column
                :label="$t('modelConfig.modelId')"
                prop="id"
                align="center"
              ></el-table-column>
              <el-table-column
                :label="$t('modelConfig.modelName')"
                prop="modelName"
                align="center"
              ></el-table-column>
              <el-table-column :label="$t('modelConfig.provider')" align="center">
                <template slot-scope="scope">
                  {{ scope.row.configJson.type || $t("modelConfig.unknown") }}
                </template>
              </el-table-column>
              <el-table-column :label="$t('modelConfig.isEnabled')" align="center">
                <template slot-scope="scope">
                  <el-tooltip
                    v-if="scope.row.isDefault === 1 && scope.row.isEnabled === 1"
                    :content="$t('modelConfig.defaultModelCannotDisable')"
                    placement="top"
                    effect="light"
                  > 
                    <el-switch
                      v-model="scope.row.isEnabled"
                      active-color="#5778ff"
                      inactive-color="#DCDFE6"
                      :active-value="1"
                      :inactive-value="0"
                      disabled
                      @change="handleStatusChange(scope.row)"
                    />
                  </el-tooltip>
                  <el-switch
                    v-else
                    v-model="scope.row.isEnabled"
                    active-color="#5778ff"
                    inactive-color="#DCDFE6"
                    :active-value="1"
                    :inactive-value="0"
                    @change="handleStatusChange(scope.row)"
                  />
                </template>
              </el-table-column>
              <el-table-column :label="$t('modelConfig.isDefault')" align="center">
                <template slot-scope="scope">
                  <el-switch
                    v-model="scope.row.isDefault"
                    active-color="#5778ff"
                    inactive-color="#DCDFE6"
                    :active-value="1"
                    :inactive-value="0"
                    @change="handleDefaultChange(scope.row)"
                  />
                </template>
              </el-table-column>
              <el-table-column
                v-if="activeTab === 'tts'"
                :label="$t('modelConfig.voiceManagement')"
                align="center"
              >
                <template slot-scope="scope">
                  <el-button
                    type="text"
                    size="mini"
                    @click="openTtsDialog(scope.row)"
                    class="voice-management-btn"
                  >
                    {{ $t("modelConfig.voiceManagement") }}
                  </el-button>
                </template>
              </el-table-column>
              <el-table-column
                :label="$t('modelConfig.action')"
                align="center"
                width="210px"
              >
                <template slot-scope="scope">
                  <el-button
                    type="text"
                    size="mini"
                    @click="editModel(scope.row)"
                    class="edit-btn"
                  >
                    {{ $t("modelConfig.edit") }}
                  </el-button>
                  <el-button
                    type="text"
                    size="mini"
                    @click="duplicateModel(scope.row)"
                    class="edit-btn"
                  >
                    {{ $t("modelConfig.duplicate") }}
                  </el-button>
                  <el-button
                    type="text"
                    size="mini"
                    @click="deleteModel(scope.row)"
                    class="delete-btn"
                  >
                    {{ $t("modelConfig.delete") }}
                  </el-button>
                </template>
              </el-table-column>
            </el-table>
            <div class="table-footer">
              <div class="batch-actions">
                <CustomButton :icon="isAllSelected ? 'el-icon-circle-close' : 'el-icon-circle-check'" type="default" size="small" @click="selectAll">
                  {{
                    isAllSelected
                      ? $t("modelConfig.deselectAll")
                      : $t("modelConfig.selectAll")
                  }}
                </CustomButton>
                <CustomButton icon="el-icon-plus" type="add" size="small" @click="addModel">
                  {{ $t("modelConfig.add") }}
                </CustomButton>
                <CustomButton
                  type="delete"
                  size="small"
                  icon="el-icon-delete"
                  @click="batchDelete"
                >
                  {{ $t("modelConfig.delete") }}
                </CustomButton>
              </div>
              <CustomPagination
                :total="total"
                :current-page="currentPage"
                :page-size="pageSize"
                :page-size-options="pageSizeOptions"
                @size-change="handlePageSizeChange"
                @page-change="handlePageChange"
              />
            </div>
          </el-card>
          </template>

          <el-card v-else class="model-card" shadow="never">
            <el-table
              ref="mcpTable"
              v-loading="mcpLoading"
              :data="mcpServers"
              :key="`mcp-table-${mcpServers.map(item => `${item.id}:${item.enabled}`).join('|')}`"
              row-key="id"
              class="transparent-table mcp-table"
              style="width: 100%"
              @selection-change="handleMcpSelectionChange"
            >
              <el-table-column type="selection" width="55" align="center" fixed />
              <el-table-column :label="$t('capability.name')" min-width="220" fixed>
                <template slot-scope="scope">
                  <div class="mcp-name">
                    <strong :title="scope.row.name">{{ scope.row.name }}</strong>
                  </div>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.description')" min-width="260" show-overflow-tooltip>
                <template slot-scope="scope">{{ stripHtml(scope.row.description) || '-' }}</template>
              </el-table-column>
              <el-table-column :label="$t('capability.connection')" min-width="360">
                <template slot-scope="scope">
                  <div class="mcp-connection">
                    <code :title="mcpConnection(scope.row)">{{ mcpConnection(scope.row) }}</code>
                    <el-button type="text" size="mini" icon="el-icon-document-copy" @click.stop="copyMcpConnection(scope.row)" />
                  </div>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.transport')" width="115" align="center">
                <template slot-scope="scope">
                  <el-tag size="small" effect="plain">{{ formatMcpTransport(scope.row.transport) }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.authMode')" width="130" align="center">
                <template slot-scope="scope">
                  <el-tag :type="mcpAuthTag(scope.row)" size="small">{{ mcpAuthLabel(scope.row) }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.deviceBindings')" width="125" align="center">
                <template slot-scope="scope">
                  <span class="mcp-count">{{ scope.row.enabledDeviceAccountCount || 0 }}/{{ scope.row.deviceAccountCount || 0 }}</span>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.authorizedAgents')" width="115" align="center">
                <template slot-scope="scope">{{ scope.row.agentCount || 0 }}</template>
              </el-table-column>
              <el-table-column :label="$t('capability.status')" width="140" align="center">
                <template slot-scope="scope">
                  <el-tag :type="mcpStatusTag(scope.row)" size="small">{{ mcpStatusText(scope.row) }}</el-tag>
                </template>
              </el-table-column>
              <el-table-column :label="$t('capability.toolCount')" width="90" align="center">
                <template slot-scope="scope">
                  {{ mcpTestResults[scope.row.id] ? mcpTestResults[scope.row.id].toolCount || 0 : '-' }}
                </template>
              </el-table-column>
              <el-table-column :label="$t('modelConfig.isEnabled')" width="100" align="center">
                <template slot-scope="scope">
                  <el-switch v-model="scope.row.enabled" :active-value="1" :inactive-value="0" @change="toggleMcp(scope.row)" />
                </template>
              </el-table-column>
              <el-table-column :label="$t('modelConfig.action')" width="175" align="center" fixed="right">
                <template slot-scope="scope">
                  <el-button type="text" size="mini" :loading="testingId === scope.row.id" @click="testMcp(scope.row)">{{ $t('capability.test') }}</el-button>
                  <el-button type="text" size="mini" @click="openMcpDialog(scope.row)">{{ $t('modelConfig.edit') }}</el-button>
                  <el-button type="text" size="mini" class="delete-btn" @click="deleteMcp(scope.row)">{{ $t('modelConfig.delete') }}</el-button>
                </template>
              </el-table-column>
            </el-table>
            <div class="table-footer">
              <div class="batch-actions">
                <CustomButton
                  :icon="isAllMcpSelected ? 'el-icon-circle-close' : 'el-icon-circle-check'"
                  type="default"
                  size="small"
                  :disabled="!mcpServers.length"
                  @click="toggleMcpSelectAll"
                >
                  {{ isAllMcpSelected ? $t('modelConfig.deselectAll') : $t('modelConfig.selectAll') }}
                </CustomButton>
                <CustomButton icon="el-icon-plus" type="add" size="small" @click="openMcpDialog()">
                  {{ $t('capability.add') }}
                </CustomButton>
                <CustomButton
                  icon="el-icon-delete"
                  type="delete"
                  size="small"
                  :disabled="!selectedMcpServers.length"
                  :loading="mcpDeleting"
                  @click="batchDeleteMcp"
                >
                  {{ $t('modelConfig.delete') }}
                </CustomButton>
                <CustomButton icon="el-icon-upload2" type="default" size="small" @click="importDialogVisible = true">
                  {{ $t('capability.importStd') }}
                </CustomButton>
                <CustomButton icon="el-icon-refresh" type="default" size="small" :loading="mcpLoading" @click="loadMcpServers">
                  {{ $t('common.refresh') }}
                </CustomButton>
              </div>
              <div class="mcp-footer-meta">
                <span v-if="selectedMcpServers.length" class="mcp-selected-count">
                  {{ $t('capability.selectedItems', { selected: selectedMcpServers.length, total: mcpServers.length }) }}
                </span>
                <span>{{ $t('capability.totalCount', { count: mcpServers.length }) }}</span>
              </div>
            </div>

            <CustomDialog
              :visible.sync="mcpDialogVisible"
              :title="mcpForm.id ? $t('capability.edit') : $t('capability.add')"
              width="720px"
              :confirm-loading="mcpSaving"
              @confirm="saveMcp"
            >
              <el-form :model="mcpForm" label-position="right" class="mcp-form">
                <el-form-item :label="$t('capability.name')">
                  <el-input v-model="mcpForm.name" maxlength="100" />
                </el-form-item>
                <el-form-item :label="$t('capability.description')">
                  <div class="description-editor">
                    <RichTextEditor
                      v-model="mcpForm.description"
                      :placeholder="$t('capability.descriptionIntentHint')"
                      :ai-summary-enabled="true"
                      :ai-summary-loading="aiSummarizing"
                      :ai-summary-label="$t('capability.aiSummarize')"
                      :ai-summary-loading-label="$t('capability.aiSummarize')"
                      @ai-summary="summarizeMcpDescription"
                    />
                  </div>
                </el-form-item>
                <el-form-item :label="$t('capability.authBoundary')">
                  <el-radio-group v-model="mcpForm.authMode">
                    <el-radio-button label="server">{{ $t('capability.serverAuth') }}</el-radio-button>
                    <el-radio-button label="client">{{ $t('capability.clientAuth') }}</el-radio-button>
                  </el-radio-group>
                </el-form-item>
                <el-form-item :label="$t('capability.transport')">
                  <el-select v-model="mcpForm.transport" style="width: 100%">
                    <el-option label="Streamable HTTP" value="streamable-http" />
                    <el-option label="SSE" value="sse" />
                    <el-option label="STDIO" value="stdio" />
                  </el-select>
                </el-form-item>
                <template v-if="mcpForm.transport === 'stdio'">
                  <el-form-item :label="$t('capability.command')">
                    <el-input v-model="mcpForm.command" placeholder="npx" />
                  </el-form-item>
                  <el-form-item :label="$t('capability.argsJson')">
                    <el-input v-model="mcpForm.argsJson" type="textarea" :rows="3" placeholder='["-y", "@modelcontextprotocol/server-xxx"]' />
                  </el-form-item>
                  <el-form-item :label="$t('capability.envJson')">
                    <el-input v-model="mcpForm.envJson" type="textarea" :rows="3" placeholder='{&quot;API_KEY&quot;:&quot;xxx&quot;}' />
                  </el-form-item>
                </template>
                <template v-else>
                  <el-form-item :label="$t('capability.endpoint')">
                    <el-input v-model="mcpForm.endpoint" placeholder="https://example.com/mcp" />
                  </el-form-item>
                  <el-form-item v-if="mcpForm.authMode === 'server'" :label="$t('capability.mcpAccessToken')">
                    <el-input
                      v-model="mcpForm.authToken"
                      show-password
                      autocomplete="new-password"
                      placeholder="Bearer xxx"
                    />
                    <p class="auth-token-hint">{{ $t('capability.mcpAccessTokenHint') }}</p>
                  </el-form-item>
                  <template v-else>
                    <el-form-item :label="$t('capability.deviceToken')">
                      <el-alert
                        :title="$t('capability.clientAuthHint')"
                        type="info"
                        :closable="false"
                        class="auth-token-hint"
                      />
                    </el-form-item>
                    <el-form-item :label="$t('capability.testToken')">
                      <el-input
                        v-model="mcpForm.testToken"
                        show-password
                        autocomplete="new-password"
                        :placeholder="mcpForm.hasTestToken ? $t('capability.testTokenSavedKeep') : $t('capability.testTokenOptional')"
                      />
                      <p class="auth-token-hint">{{ $t('capability.testTokenHint') }}</p>
                    </el-form-item>
                  </template>
                </template>
                <el-form-item :label="$t('modelConfig.isEnabled')">
                  <el-switch v-model="mcpForm.enabled" :active-value="1" :inactive-value="0" />
                </el-form-item>
              </el-form>
              <template #footer>
                <el-button :loading="dialogTesting" @click="testMcpForm">{{ $t('capability.test') }}</el-button>
                <el-button @click="mcpDialogVisible = false">{{ $t('common.cancel') }}</el-button>
                <el-button type="primary" :loading="mcpSaving" @click="saveMcp">{{ $t('common.confirm') }}</el-button>
              </template>
            </CustomDialog>

            <CustomDialog
              :visible.sync="importDialogVisible"
              :title="$t('capability.importStdTitle')"
              width="760px"
              :confirm-loading="importing"
              @confirm="importStandardJson"
            >
              <el-alert :title="$t('capability.importStdHint')" type="info" :closable="false" class="import-hint" />
              <el-input v-model="standardJson" type="textarea" :rows="14" placeholder='{&quot;mcpServers&quot;:{&quot;xxx&quot;:{&quot;command&quot;:&quot;npx&quot;,&quot;args&quot;:[&quot;-y&quot;,&quot;xxx&quot;]}}}' />
            </CustomDialog>

            <CustomDialog
              :visible.sync="testResultVisible"
              :title="$t('capability.testResult')"
              width="780px"
              :footer="false"
              custom-class="mcp-test-dialog"
            >
              <div v-if="mcpTestResult" class="mcp-test">
                <div class="result-banner" :class="mcpTestResult.connected ? 'success' : 'error'">
                  <i :class="mcpTestResult.connected ? 'el-icon-connection' : 'el-icon-warning-outline'" />
                  <div class="result-copy">
                    <strong>{{ mcpTestResult.connected ? $t('capability.connected') : $t('capability.failed') }}</strong>
                    <p v-if="!mcpTestResult.connected">{{ mcpTestResult.message }}</p>
                    <p v-else>{{ mcpTestResult.toolCount || 0 }} {{ $t('capability.toolCount') }}</p>
                  </div>
                </div>

                <div v-if="mcpTestResult.connected" class="summary-grid">
                  <div class="summary-card">
                    <span>{{ $t('capability.serverName') }}</span>
                    <strong :title="mcpTestResult.serverName">{{ mcpTestResult.serverName || '-' }}</strong>
                  </div>
                  <div class="summary-card">
                    <span>{{ $t('capability.protocolVersion') }}</span>
                    <strong :title="mcpTestResult.protocolVersion">{{ mcpTestResult.protocolVersion || '-' }}</strong>
                  </div>
                  <div class="summary-card">
                    <span>{{ $t('capability.toolCount') }}</span>
                    <strong>{{ mcpTestResult.toolCount || 0 }}</strong>
                  </div>
                </div>

                <div v-if="mcpTestResult.connected && (mcpTestResult.tools || []).length" class="tools-panel">
                  <div class="tools-header">
                    <div class="tools-title">
                      <span>{{ $t('capability.toolCount') }}</span>
                      <small>{{ filteredMcpTools.length }} / {{ mcpTestResult.tools.length }}</small>
                    </div>
                    <el-input
                      v-model="mcpToolFilter"
                      size="small"
                      clearable
                      prefix-icon="el-icon-search"
                      :placeholder="$t('mcpToolCall.searchFunction')"
                    />
                  </div>
                  <div class="tools-scroll">
                    <div v-for="tool in filteredMcpTools" :key="tool.name" class="tool-card">
                      <div class="tool-name" :title="tool.name">{{ tool.name }}</div>
                      <p class="tool-desc" :title="tool.description">{{ tool.description || '-' }}</p>
                    </div>
                    <div v-if="!filteredMcpTools.length" class="tools-empty">
                      {{ $t('mcpToolCall.noResults') }}
                    </div>
                  </div>
                </div>
              </div>
            </CustomDialog>
          </el-card>
        </div>
      </div>

      <ModelEditDialog
        :modelType="activeTab"
        :visible.sync="editDialogVisible"
        :modelData="editModelData"
        @save="handleModelSave"
      />
      <TtsModel
        :visible.sync="ttsDialogVisible"
        :ttsModelId="selectedTtsModelId"
        :modelConfig="selectedModelConfig"
      />
      <AddModelDialog
        :modelType="activeTab"
        :visible.sync="addDialogVisible"
        @confirm="handleAddConfirm"
      />
    </div>
    <el-footer>
      <version-footer />
    </el-footer>
  </div>
</template>

<script>
import Api from "@/apis/api";
import AddModelDialog from "@/components/AddModelDialog.vue";
import HeaderBar from "@/components/HeaderBar.vue";
import ModelEditDialog from "@/components/ModelEditDialog.vue";
import TtsModel from "@/components/TtsModel.vue";
import CustomPagination from "@/components/CustomPagination.vue";
import CustomButton from "@/components/CustomButton.vue";
import CustomDialog from "@/components/CustomDialog.vue";
import RichTextEditor from "@/components/RichTextEditor.vue";
import VersionFooter from "@/components/VersionFooter.vue";
export default {
  components: { HeaderBar, ModelEditDialog, TtsModel, AddModelDialog, VersionFooter, CustomPagination, CustomButton, CustomDialog, RichTextEditor },
  data() {
    return {
      addDialogVisible: false,
      activeTab: "llm",
      search: "",
      editDialogVisible: false,
      editModelData: {},
      ttsDialogVisible: false,
      selectedTtsModelId: "",
      modelList: [],
      pageSizeOptions: [10, 20, 50, 100],
      currentPage: 1,
      pageSize: 10,
      total: 0,
      selectedModels: [],
      isAllSelected: false,
      loading: false,
      selectedModelConfig: {},
      mcpServers: [],
      selectedMcpServers: [],
      mcpLoading: false,
      mcpSaving: false,
      mcpDeleting: false,
      aiSummarizing: false,
      mcpDialogVisible: false,
      mcpForm: { id: '', name: '', description: '', endpoint: '', transport: 'streamable-http', command: '', argsJson: '[]', envJson: '{}', headersJson: '{}', authToken: '', authMode: 'server', testToken: '', hasTestToken: false, enabled: 1 },
      testingId: null,
      dialogTesting: false,
      mcpTestResults: {},
      mcpTestResult: null,
      mcpToolFilter: '',
      testResultVisible: false,
      importDialogVisible: false,
      importing: false,
      standardJson: '',
    };
  },

  created() {
    this.loadData();
  },

  mounted() {
    // 閸︺劎绮嶆禒鑸靛瘯鏉炶棄鎮楃涵顔荤箽鐞涖劌銇旂紙鏄忕槯閺傚洦婀板锝団€橀弰鍓с仛
    setTimeout(() => {
      this.updateSelectionHeaderText();
    }, 100);
  },

  updated() {
    // 閸︺劎绮嶆禒鑸垫纯閺傛澘鎮楅柌宥嗘煀鐠佸墽鐤嗙悰銊ャ仈缂堟槒鐦ч弬鍥ㄦ拱
    this.updateSelectionHeaderText();
  },

  computed: {
    isAllMcpSelected() {
      return this.mcpServers.length > 0 && this.selectedMcpServers.length === this.mcpServers.length;
    },
    pageTitle() {
      return this.activeTab === 'mcp' ? this.$t('capability.mcp') : this.$t('modelConfig.' + this.activeTab);
    },
    filteredMcpTools() {
      const tools = this.mcpTestResult?.tools || [];
      const keyword = this.mcpToolFilter.trim().toLowerCase();
      if (!keyword) return tools;
      return tools.filter(tool =>
        [tool.name, tool.description]
          .filter(Boolean)
          .some(value => value.toLowerCase().includes(keyword))
      );
    },
    modelTypeText() {
      return (
        this.$t("modelConfig." + this.activeTab) || this.$t("modelConfig.modelConfig")
      );
    },
  },

  methods: {
    // Refresh the translated selection column header.
    updateSelectionHeaderText() {
      const thElement = document.querySelector(`.el-table__header th:nth-child(1) .cell`);
      if (thElement) {
        thElement.setAttribute("data-content", this.$t("modelConfig.select"));
      }
    },
    handlePageSizeChange(val) {
      this.pageSize = val;
      this.currentPage = 1;
      this.loadData();
    },
    openTtsDialog(row) {
      this.selectedTtsModelId = row.id;
      this.selectedModelConfig = row;
      this.ttsDialogVisible = true;
    },
    headerCellClassName({ column, columnIndex }) {
      if (columnIndex === 0) {
        return "custom-selection-header";
      }
      return "";
    },
    selectionCellClassName({ row, column, rowIndex, columnIndex }) {
      // 閸欘亜顕悰銊ャ仈鐞涘矁顔曠純鐢ta-content
      if (rowIndex === undefined) {
        // Ensure DOM has rendered.
        setTimeout(() => {
          const thElement = document.querySelector(
            `.el-table__header th:nth-child(1) .cell`
          );
          if (thElement) {
            thElement.setAttribute("data-content", this.$t("modelConfig.select"));
          }
        }, 0);
      }
      return "";
    },
    handleMenuSelect(index) {
      this.activeTab = index;
      this.currentPage = 1;
      this.pageSize = 10;
      if (index === 'mcp') {
        this.loadMcpServers();
      } else {
        this.loadData();
      }
    },
    async loadMcpServers() {
      this.mcpLoading = true;
      Api.model.getMcpServers({}, async ({ data }) => {
        if (data.code === 0) {
          this.mcpServers = data.data || [];
          this.selectedMcpServers = [];
          this.mcpLoading = false;
        } else {
          this.mcpServers = [];
          this.mcpLoading = false;
          this.$message.error(data.msg || this.$t('capability.loadFailed'));
        }
      });
    },
    mcpConnection(row) {
      if (row.transport === 'stdio') {
        return [row.command, ...(row.args || [])].filter(Boolean).join(' ');
      }
      return row.endpoint || '-';
    },
    formatMcpTransport(transport) {
      if (transport === 'stdio') return 'STDIO';
      if (transport === 'sse') return 'SSE';
      return 'HTTP';
    },
    mcpAuthMode(row) {
      const mode = (row.authMode || '').toLowerCase();
      if (mode === 'server' || mode === 'client') return mode;
      const authType = ((row.authConfig || {}).authType || '').toLowerCase();
      if (authType === 'cloudpivot_password') return 'client';
      if (Object.keys(row.headers || {}).length) return 'server';
      return 'none';
    },
    mcpAuthLabel(row) {
      const mode = this.mcpAuthMode(row);
      if (mode === 'server') return this.$t('capability.serverAuth');
      if (mode === 'client') return this.$t('capability.clientAuth');
      if (mode === 'headers') return this.$t('capability.headerAuth');
      return this.$t('capability.noAuth');
    },
    mcpAuthTag(row) {
      const mode = this.mcpAuthMode(row);
      if (mode === 'client') return 'warning';
      if (mode === 'headers') return '';
      return 'info';
    },
    stripHtml(value) {
      const text = String(value || '')
        .replace(/<[^>]*>/g, ' ')
        .replace(/&nbsp;/gi, ' ')
        .replace(/&amp;/gi, '&')
        .replace(/&lt;/gi, '<')
        .replace(/&gt;/gi, '>');
      return text.replace(/\s+/g, ' ').trim();
    },
    objectKeys(value) {
      return value && typeof value === 'object' ? Object.keys(value) : [];
    },
    mcpStatusText(row) {
      if (this.mcpAuthMode(row) === 'client') {
        return this.$t('capability.deviceTestPending');
      }
      const result = this.mcpTestResults[row.id];
      if (!result) return this.$t('capability.notTested');
      return result.connected ? this.$t('capability.connected') : this.$t('capability.failed');
    },
    mcpStatusTag(row) {
      if (this.mcpAuthMode(row) === 'client') return 'warning';
      return this.mcpTestResults[row.id] && this.mcpTestResults[row.id].connected ? 'success' : 'info';
    },
    mcpToolNames(row) {
      return ((this.mcpTestResults[row.id] || {}).tools || []).map(tool => tool.name).filter(Boolean);
    },
    async copyMcpConnection(row) {
      const value = this.mcpConnection(row);
      try {
        if (navigator.clipboard && window.isSecureContext) {
          await navigator.clipboard.writeText(value);
        } else {
          const textarea = document.createElement('textarea');
          textarea.value = value;
          textarea.style.position = 'fixed';
          textarea.style.opacity = '0';
          document.body.appendChild(textarea);
          textarea.select();
          document.execCommand('copy');
          document.body.removeChild(textarea);
        }
        this.$message.success(this.$t('capability.copySuccess'));
      } catch (e) {
        this.$message.error(this.$t('capability.copyFailed'));
      }
    },
    extractBearerToken(headers) {
      const entry = Object.entries(headers || {}).find(([key]) => key.toLowerCase() === 'authorization');
      const value = String(entry?.[1] || '').trim();
      if (!value) return '';
      return /^bearer\s+/i.test(value) ? value.replace(/^bearer\s+/i, '').trim() : value;
    },
    openMcpDialog(row) {
      this.mcpForm = row
        ? {
            ...row,
            authMode: this.mcpAuthMode(row) === 'client' ? 'client' : 'server',
            argsJson: JSON.stringify(row.args || [], null, 2),
            envJson: JSON.stringify(row.env || {}, null, 2),
            headersJson: JSON.stringify(row.headers || {}, null, 2),
            authToken: this.extractBearerToken(row.headers || {}),
            testToken: '',
            hasTestToken: row.hasTestToken === true,
          }
        : {
            id: '', name: '', description: '', endpoint: '', transport: 'streamable-http',
            command: '', argsJson: '[]', envJson: '{}', headersJson: '{}', authToken: '', authMode: 'server', testToken: '', hasTestToken: false, enabled: 1,
          };
      this.mcpDialogVisible = true;
    },
    parseStandardConfig(text) {
      let parsed = JSON.parse(text);
      if (Array.isArray(parsed)) return parsed;
      if (parsed && typeof parsed === 'object' && parsed.mcpServers && typeof parsed.mcpServers === 'object') {
        parsed = parsed.mcpServers;
      }
      if (!parsed || typeof parsed !== 'object' || Array.isArray(parsed)) {
        throw new Error('invalid root');
      }
      return Object.entries(parsed).map(([name, config]) => {
        if (!config || typeof config !== 'object') throw new Error('invalid server');
        const standardHeaders = config.headers && typeof config.headers === 'object' ? config.headers : {};
        const hasAuthorization = Object.keys(standardHeaders).some(key => key.toLowerCase() === 'authorization');
        const item = {
          name,
          description: config.description || `${name} MCP service`,
          authMode: hasAuthorization ? 'server' : 'client',
          enabled: config.enabled === false ? 0 : 1,
        };
        if (config.command) {
          item.transport = 'stdio';
          item.command = config.command;
          item.args = Array.isArray(config.args) ? config.args : [];
          item.env = config.env || {};
          item.endpoint = null;
          item.headers = {};
        } else if (config.url) {
          const rawType = (config.type || config.transport || '').toString();
          const guessed = /sse/i.test(config.url) ? 'sse' : 'streamable-http';
          item.transport = ['http', 'sse', 'streamable-http'].includes(rawType)
            ? (rawType === 'http' ? 'streamable-http' : rawType)
            : guessed;
          item.endpoint = config.url;
          item.command = null;
          item.args = [];
          item.env = {};
          item.headers = standardHeaders;
        } else {
          throw new Error(`server ${name} has neither command nor url`);
        }
        return item;
      });
    },
    async importStandardJson() {
      let rows;
      try {
        rows = this.parseStandardConfig(this.standardJson);
      } catch (e) {
        this.$message.error(this.$t('capability.invalidStdJson'));
        return;
      }
      if (!rows.length) {
        this.$message.warning(this.$t('capability.emptyStdJson'));
        return;
      }
      this.importing = true;
      let success = 0;
      const failures = [];
      for (const row of rows) {
        await new Promise(resolve => {
          Api.model.createMcpServer(row, ({ data }) => {
            if (data.code === 0) {
              success += 1;
            } else {
              const reason = data.msg || this.$t('capability.saveFailed');
              failures.push(`${row.name}: ${reason}`);
              console.error(reason, row.name);
            }
            resolve();
          });
        });
      }
      this.importing = false;
      if (success) {
        this.$message.success(this.$t('capability.importSuccess', { count: success }));
        this.loadMcpServers();
      }
      if (failures.length) {
        this.$message.error(`${this.$t('capability.saveFailed')}: ${failures.join('; ')}`);
        if (!success) return;
      }
      this.importDialogVisible = false;
      this.standardJson = '';
    },
    buildMcpPayload() {
      const authMode = this.mcpForm.authMode === 'client' ? 'client' : 'server';
      const baseForm = { ...this.mcpForm };
      if (authMode !== 'client') {
        delete baseForm.testToken;
        delete baseForm.hasTestToken;
        delete baseForm.testUsername;
        delete baseForm.testPassword;
        delete baseForm.hasTestPassword;
      }
      let extraHeaders = {};
      const token = String(this.mcpForm.authToken || '').trim();
      if (authMode === 'server' && token) {
        extraHeaders.Authorization = /^bearer\s+/i.test(token) ? token : `Bearer ${token}`;
      }
      try {
        const advancedHeaders = this.mcpForm.headersJson ? JSON.parse(this.mcpForm.headersJson) : {};
        Object.entries(advancedHeaders || {}).forEach(([key, value]) => {
          if (key.toLowerCase() !== 'authorization') extraHeaders[key] = value;
        });
      } catch (e) {
        this.$message.error(this.$t('capability.invalidHeadersJson'));
        return null;
      }
      if (this.mcpForm.transport === 'stdio') {
        try {
          const args = JSON.parse(this.mcpForm.argsJson || '[]');
          const env = JSON.parse(this.mcpForm.envJson || '{}');
          if (!Array.isArray(args)) throw new Error('args must be an array');
          return { ...baseForm, authMode, endpoint: null, headers: {}, args, env };
        } catch (e) {
          this.$message.error(this.$t('capability.invalidStdioJson'));
          return null;
        }
      }
      return { ...baseForm, authMode, headers: extraHeaders };
    },
    async testMcp(row, silent = false) {
      const payload = row ? { ...row } : this.buildMcpPayload();
      if (!payload) return;
      if (!silent) {
        this.testingId = row ? row.id : '__dialog__';
        this.dialogTesting = !row;
      }
      try {
        await new Promise(resolve => {
          Api.model.testMcpServer(payload, ({ data }) => {
            const result = data.code === 0
              ? data.data
              : { connected: false, message: data.msg || this.$t('capability.testFailed') };
            if (row && row.id) this.mcpTestResults[row.id] = result;
            if (!silent) {
              this.mcpTestResult = result;
              this.mcpToolFilter = '';
              this.testResultVisible = true;
            }
            resolve();
          });
        });
      } finally {
        if (!silent) {
          this.testingId = null;
          this.dialogTesting = false;
        }
      }
    },
    hasMcpTestAuth(payload) {
      if (payload.authMode !== 'client') return true;
      return !!String(payload.testToken || '').trim() || payload.hasTestToken === true;
    },
    requireMcpTestAuth(payload) {
      if (this.hasMcpTestAuth(payload)) return true;
      this.$message.warning(this.$t('capability.testAuthRequired'));
      return false;
    },
    async summarizeMcpDescription() {
      const rawPayload = this.buildMcpPayload();
      if (!rawPayload || !this.requireMcpTestAuth(rawPayload)) return;
      const payload = {
        ...rawPayload,
        description: this.stripHtml(rawPayload.description),
      };
      this.aiSummarizing = true;
      try {
        await new Promise(resolve => {
          Api.model.describeMcpServer(payload, ({ data }) => {
            if (data.code === 0 && data.data?.description) {
              this.$set(this.mcpForm, 'description', data.data.description);
              this.$message.success(this.$t('capability.aiSummarizeSuccess'));
            } else {
              this.$message.error(data.msg || this.$t('capability.aiSummarizeFailed'));
            }
            resolve();
          });
        });
      } catch (e) {
        this.$message.error(this.$t('capability.aiSummarizeFailed'));
      } finally {
        this.aiSummarizing = false;
      }
    },
    testMcpForm() {
      const payload = this.buildMcpPayload();
      if (!payload || !this.requireMcpTestAuth(payload)) return;
      this.testMcp(null);
    },
    saveMcp() {
      const payload = this.buildMcpPayload();
      if (!payload) return;
      this.mcpSaving = true;
      const done = ({ data }) => {
        this.mcpSaving = false;
        if (data.code === 0) {
          this.mcpDialogVisible = false;
          this.loadMcpServers();
        } else {
          this.$message.error(data.msg || this.$t('capability.saveFailed'));
        }
      };
      if (this.mcpForm.id) {
        Api.model.updateMcpServer(this.mcpForm.id, payload, done);
      } else {
        Api.model.createMcpServer(payload, done);
      }
    },
    toggleMcp(row) {
      const payload = { ...row, headers: row.headers || {} };
      Api.model.updateMcpServer(row.id, payload, ({ data }) => {
        if (data.code !== 0) {
          this.$message.error(data.msg || this.$t('capability.saveFailed'));
        }
        this.loadMcpServers();
      });
    },
    handleMcpSelectionChange(selection) {
      this.selectedMcpServers = selection || [];
    },
    toggleMcpSelectAll() {
      const table = this.$refs.mcpTable;
      if (!table || !this.mcpServers.length) return;
      if (this.isAllMcpSelected) {
        table.clearSelection();
      } else {
        table.toggleAllSelection();
      }
    },
    async batchDeleteMcp() {
      if (!this.selectedMcpServers.length || this.mcpDeleting) return;
      try {
        await this.$confirm(this.$t('capability.confirmDelete'), this.$t('message.info'), { type: 'warning' });
      } catch (e) {
        return;
      }
      this.mcpDeleting = true;
      let failed = 0;
      for (const row of this.selectedMcpServers) {
        await new Promise(resolve => {
          Api.model.deleteMcpServer(row.id, ({ data }) => {
            if (data.code !== 0) failed += 1;
            resolve();
          });
        });
      }
      this.mcpDeleting = false;
      if (failed) {
        this.$message.error(this.$t('modelConfig.deleteFailed'));
      } else {
        this.$message.success(this.$t('modelConfig.batchDeleteSuccess'));
      }
      await this.loadMcpServers();
    },
    deleteMcp(row) {
      this.$confirm(this.$t('capability.confirmDelete'), this.$t('message.info'), { type: 'warning' }).then(() => {
        Api.model.deleteMcpServer(row.id, ({ data }) => {
          if (data.code === 0) {
            this.loadMcpServers();
          } else {
            this.$message.error(data.msg || this.$t('modelConfig.deleteFailed'));
          }
        });
      }).catch(() => {});
    },
    handleSearch() {
      this.currentPage = 1;
      this.loadData();
    },
    // 閹靛綊鍣洪崚鐘绘珟
    batchDelete() {
      if (this.selectedModels.length === 0) {
        this.$message.warning(this.$t("modelConfig.selectModelsFirst"));
        return;
      }

      this.$confirm(this.$t("modelConfig.confirmBatchDelete"), this.$t("message.info"), {
        confirmButtonText: this.$t("common.confirm"),
        cancelButtonText: this.$t("common.cancel"),
        type: "warning",
      })
        .then(() => {
          const deletePromises = this.selectedModels.map(
            (model) =>
              new Promise((resolve) => {
                Api.model.deleteModel(model.id, ({ data }) => resolve(data.code === 0));
              })
          );

          Promise.all(deletePromises).then((results) => {
            if (results.every(Boolean)) {
              this.$message.success({
                message: this.$t("modelConfig.batchDeleteSuccess"),
                showClose: true,
              });
              this.loadData();
            } else {
              this.$message.error({
                message: this.$t("modelConfig.partialDeleteFailed"),
                showClose: true,
              });
            }
          });
        })
        .catch(() => {
          this.$message.info(this.$t("modelConfig.deleteCancelled"));
        });
    },
    addModel() {
      this.addDialogVisible = true;
    },
    editModel(model) {
      this.editModelData = JSON.parse(JSON.stringify(model));
      this.editDialogVisible = true;
    },
    duplicateModel(model) {
      this.editModelData = JSON.parse(JSON.stringify(model));
      this.editModelData.duplicateMode = true;
      this.editDialogVisible = true;
    },
    // Delete a model after confirmation.
deleteModel(model) {
      this.$confirm(this.$t("modelConfig.confirmDelete"), this.$t("message.info"), {
        confirmButtonText: this.$t("common.confirm"),
        cancelButtonText: this.$t("common.cancel"),
        type: "warning",
      })
        .then(() => {
          Api.model.deleteModel(model.id, ({ data }) => {
            if (data.code === 0) {
              this.$message.success({
                message: this.$t("modelConfig.deleteSuccess"),
                showClose: true,
              });
              this.loadData();
            } else {
              this.$message.error({
                message: data.msg || this.$t("modelConfig.deleteFailed"),
                showClose: true,
              });
            }
          });
        })
        .catch(() => {
          this.$message.info(this.$t("modelConfig.deleteCancelled"));
        });
    },
    handlePageChange(page) {
      this.currentPage = page;
      this.loadData();
    },
    handleModelSave({ provideCode, formData, done }) {
      const modelType = this.activeTab;
      const id = formData.id;

      if (this.editModelData.duplicateMode) {
        formData.id = "";
        Api.model.addModel({ modelType, provideCode, formData }, ({ data }) => {
          if (data.code === 0) {
            this.$message.success(this.$t("modelConfig.duplicateSuccess"));
            this.loadData();
            this.editDialogVisible = false;
          } else {
            this.$message.error(data.msg || this.$t("modelConfig.duplicateFailed"));
          }
          done && done(); // Close loading state.
        });
      } else {
        Api.model.updateModel({ modelType, provideCode, id, formData }, ({ data }) => {
          if (data.code === 0) {
            this.$message.success(this.$t("modelConfig.saveSuccess"));
            this.loadData();
            this.editDialogVisible = false;
          } else {
            this.$message.error(data.msg || this.$t("modelConfig.saveFailed"));
          }
          done && done(); // Close loading state.
        });
      }
    },
    selectAll() {
      if (this.isAllSelected) {
        this.$refs.modelTable.clearSelection();
      } else {
        this.$refs.modelTable.toggleAllSelection();
      }
    },
    handleSelectionChange(val) {
      this.selectedModels = val;
      this.isAllSelected = val.length === this.modelList.length;
      if (val.length === 0) {
        this.isAllSelected = false;
      }
    },

    // 閺傛澘顤冨Ο鈥崇€烽柊宥囩枂
    handleAddConfirm(newModel) {
      const params = {
        modelType: this.activeTab,
        provideCode: newModel.provideCode,
        formData: {
          ...newModel,
          isDefault: newModel.isDefault ? 1 : 0,
          isEnabled: newModel.isEnabled ? 1 : 0,
          configJson: newModel.configJson,
        },
      };

      Api.model.addModel(params, ({ data }) => {
        if (data.code === 0) {
          this.$message.success({
            message: this.$t("modelConfig.addSuccess"),
            showClose: true,
          });
          this.loadData();
        } else {
          this.$message.error({
            message: data.msg || this.$t("modelConfig.addFailed"),
            showClose: true,
          });
        }
      });
    },
    // Load model configuration data.
    loadData() {
    // 閼惧嘲褰囧Ο鈥崇€烽柊宥囩枂閸掓銆?    loadData() {
      // Start loading.
      this.loading = true;
      const params = {
        modelType: this.activeTab,
        modelName: this.search,
        page: this.currentPage,
        limit: this.pageSize,
      };

      Api.model.getModelList(params, ({ data }) => {
        this.loading = false; // 缂佹挻娼崝鐘烘祰
        if (data.code === 0) {
          this.modelList = data.data.list;
          this.total = data.data.total;
        } else {
          this.$message.error(data.msg || this.$t("modelConfig.fetchModelsFailed"));
        }
      });
    },
    // Handle model enabled/disabled changes.
    handleStatusChange(model) {
      const newStatus = model.isEnabled ? 1 : 0;
      const originalStatus = model.isEnabled;

      model.isEnabled = !model.isEnabled;

      Api.model.updateModelStatus(model.id, newStatus, ({ data }) => {
        if (data.code === 0) {
          this.$message.success(
            newStatus === 1
              ? this.$t("modelConfig.enableSuccess")
              : this.$t("modelConfig.disableSuccess")
          );
          // Keep the new status.
          model.isEnabled = newStatus;

          this.loadData();
        } else {
          // Restore the original status on failure.
          model.isEnabled = originalStatus;
          this.$message.error(data.msg || this.$t("modelConfig.operationFailed"));
        }
      });
    },
    handleDefaultChange(model) {
      Api.model.setDefaultModel(model.id, ({ data }) => {
        if (data.code === 0) {
          this.$message.success(this.$t("modelConfig.setDefaultSuccess"));
          this.loadData();
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.el-switch {
  height: 23px;
}

::v-deep .el-table tr {
  background: transparent;
}

.welcome {
  min-width: 900px;
  min-height: 506px;
  height: 100vh;
  display: flex;
  position: relative;
  flex-direction: column;
  background-size: cover;
  background: #eff4ff;
  -webkit-background-size: cover;
  -o-background-size: cover;
}

.main-wrapper {
  // 妞ゅ爼鍎?63px 鎼存洟鍎?35px 閺屻儴顕?2px
  height: calc(100vh - 63px - 35px - 72px);
  margin: 0 22px;
  border-radius: 15px;
  position: relative;
}

.operation-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 24px;
}

.page-title {
  font-size: 24px;
  margin: 0;
}

.content-panel {
  flex: 1;
  display: flex;
  overflow: hidden;
  height: 100%;
  border-radius: 15px;
  background: transparent;
}

.nav-panel {
  min-width: 242px;
  height: 100%;
  box-sizing: border-box;
  overflow-y: auto;
  border-right: 1px solid #ebeef5;
  background: linear-gradient(
      120deg,
      rgba(107, 140, 255, 0.3) 0%,
      rgba(169, 102, 255, 0.3) 25%,
      transparent 60%
    ),
    url("../assets/model/model.png") no-repeat center / cover;
  padding: 16px 0;
  flex-shrink: 0;
  display: flex;
  flex-direction: column;
}

.nav-panel .el-menu-item {
  height: 50px;
  flex-shrink: 0;
  background: #e9f0ff;
  line-height: 50px;
  border-radius: 4px 0 0 4px !important;
  transition: all 0.3s;
  display: flex !important;
  justify-content: flex-end;
  padding-right: 12px !important;
  width: fit-content;
  margin: 8px 0 8px auto;
  min-width: unset;
}

.nav-panel .el-menu-item.is-active {
  background: #5778ff;
  position: relative;
  padding-left: 40px !important;
}

.nav-panel .el-menu-item.is-active::before {
  content: "";
  position: absolute;
  left: 15px;
  top: 50%;
  transform: translateY(-50%);
  width: 13px;
  height: 13px;
  background: #fff;
  border-radius: 50%;
  box-shadow: 0 0 4px rgba(64, 158, 255, 0.5);
}

.menu-text {
  font-size: 14px;
  color: #606266;
  text-align: right;
  width: 100%;
  padding-right: 8px;
}

.content-area {
  flex: 1;
  padding: 24px 24px 0;
  height: 100%;
  min-width: 600px;
  overflow: hidden;
  background-color: white;
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
}

.action-group {
  display: flex;
  align-items: center;
  gap: 16px;
}

.search-group {
  display: flex;
  gap: 10px;
}

.search-input {
  width: 240px;
}

.btn-search {
  background: linear-gradient(135deg, #6b8cff, #a966ff);
  border: none;
  color: white;
}

.btn-search:hover {
  opacity: 0.9;
  transform: translateY(-1px);
}

::v-deep .search-input .el-input__inner {
  border-radius: 4px;
  border: 1px solid #dcdfe6;
  background-color: white;
  transition: border-color 0.2s;
}

::v-deep .search-input .el-input__inner:focus {
  border-color: #6b8cff;
  outline: none;
}

// .data-table {
//   border-radius: 6px;
//   overflow: hidden;
//   background-color: transparent !important;
// }

// .data-table ::v-deep .el-table__row {
//   background-color: transparent !important;
// }

.table-header th {
  background-color: transparent !important;
  color: #606266;
  font-weight: 600;
}

.mcp-top-actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

.mcp-table {
  flex: 1 1 auto;
  min-height: 0;
  overflow: auto;
  border: 1px solid #e4e9f4;
  border-radius: 10px;
  background: #fff;
}

.mcp-name {
  min-width: 0;
}

.mcp-name strong {
  display: block;
  color: #252c43;
  font-size: 14px;
  line-height: 1.35;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.mcp-id {
  display: block;
  margin-top: 4px;
  color: #8b93b5;
  font-family: ui-monospace, SFMono-Regular, Consolas, monospace;
  font-size: 11px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.mcp-description {
  color: #666f8d;
  font-size: 12px;
  line-height: 1.5;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.mcp-connection {
  display: flex;
  align-items: center;
  min-width: 0;
  max-width: 560px;
}

.description-editor {
  width: 100%;
}

.auth-token-hint {
  width: 100%;
  margin: 6px 0 0;
  color: #8b93b5;
  font-size: 12px;
  line-height: 1.5;
  text-align: left;
}

.mcp-form {
  display: grid;
  grid-template-columns: max-content minmax(0, 1fr);
  column-gap: 12px;
  row-gap: 18px;
  align-items: start;
  width: 100%;
  text-align: left;
}

.mcp-form ::v-deep .el-form-item {
  display: contents;
  margin: 0;
}

.mcp-form ::v-deep .el-form-item::before,
.mcp-form ::v-deep .el-form-item::after {
  content: none;
}

.mcp-form ::v-deep .el-form-item__label {
  grid-column: 1;
  justify-self: end;
  width: auto !important;
  margin: 0;
  padding: 9px 0 0;
  color: #3d4566;
  font-weight: 600;
  line-height: 22px;
  text-align: right;
  white-space: nowrap;
}

.mcp-form ::v-deep .el-form-item__content {
  grid-column: 2;
  align-self: start;
  justify-self: stretch;
  min-width: 0;
  margin-left: 0 !important;
  text-align: left;
}

.mcp-form ::v-deep .el-radio-group {
  display: inline-flex;
  justify-content: flex-start;
  white-space: nowrap;
}

.mcp-form ::v-deep .auth-token-hint {
  margin: 6px 0 0;
}

.description-editor .editor-actions {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  margin-top: 8px;
  white-space: nowrap;
}

.mcp-connection code {
  flex: 1;
  min-width: 0;
  padding: 5px 8px;
  border: 1px solid #e3e8f5;
  border-radius: 6px;
  background: #f7f9fc;
  color: #33415e;
  font-family: ui-monospace, SFMono-Regular, Consolas, monospace;
  font-size: 12px;
  line-height: 1.45;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.mcp-count {
  color: #33415e;
  font-weight: 600;
}

.mcp-detail {
  padding: 14px 18px 16px 56px;
}

.mcp-detail-warning {
  margin-bottom: 12px;
}

.mcp-detail-grid {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 10px;
}

.mcp-detail-item {
  min-width: 0;
  padding: 10px 12px;
  border: 1px solid #e4e9f4;
  border-radius: 8px;
  background: #fff;
  box-sizing: border-box;
}

.mcp-detail-item.is-wide {
  grid-column: span 2;
}

.mcp-detail-item span {
  display: block;
  color: #7a819d;
  font-size: 12px;
}

.mcp-detail-item strong {
  display: block;
  margin-top: 4px;
  color: #26304a;
  font-size: 13px;
  line-height: 1.45;
  word-break: break-all;
}

.mcp-detail-item code {
  display: block;
  margin-top: 4px;
  color: #26304a;
  font-family: ui-monospace, SFMono-Regular, Consolas, monospace;
  font-size: 12px;
  line-height: 1.5;
  word-break: break-all;
  white-space: pre-wrap;
}

.mcp-tool-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-top: 6px;
}

.mcp-footer-meta {
  color: #8b93b5;
  font-size: 12px;
  white-space: nowrap;
}

.table-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  // padding: 16px 0;
  width: 100%;
  flex-shrink: 0;
  min-height: 60px;
  background: white;
}

// .batch-actions {
//   display: flex;
//   gap: 8px;
// }

// .batch-actions .el-button {
//   min-width: 72px;
//   height: 32px;
//   padding: 7px 12px 7px 10px;
//   font-size: 12px;
//   border-radius: 4px;
//   line-height: 1;
//   font-weight: 500;
//   border: none;
//   transition: all 0.3s ease;
//   box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
// }

// .batch-actions .el-button:hover {
//   transform: translateY(-1px);
//   box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
// }

// .batch-actions .el-button--primary {
//   background: #5f70f3 !important;
//   color: white;
// }

// .batch-actions .el-button--success {
//   background: #5bc98c;
//   color: white;
// }

// .batch-actions .el-button--danger {
//   background: #fd5b63;
//   color: white;
// }

// .batch-actions .el-button:first-child {
//   background: linear-gradient(135deg, #409eff, #6b8cff);
//   border: none;
//   color: white;
// }

// .batch-actions .el-button:first-child:hover {
//   background: linear-gradient(135deg, #3a8ee6, #5a7cff);
// }

.el-table th ::v-deep .el-table__cell {
  overflow: hidden;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
  background-color: transparent !important;
}

::v-deep .el-table .custom-selection-header .cell .el-checkbox__inner {
  display: none !important;
}

::v-deep .el-table .custom-selection-header .cell::before {
  content: attr(data-content);
  display: block;
  text-align: center;
  line-height: 32px;
  /* 鐠佸墽鐤嗛崥鍫モ偓鍌滄畱鐞涘矂鐝敍宀€鈥樻穱婵囨瀮閺堫剙鐣弫瀛樻▔缁€?*/
  color: black;
  margin-top: 0;
  /* 缁夊娅庨崣顖濆厴鐎佃壈鍤ч崑蹇曅╅惃鍕瑐鏉堢绐?*/
  height: 32px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
}

.custom-selection-header .cell {
  position: relative;
}

/* 瀹歌尙些闂勩倕褰查懗钘夊閸濆秵鏋冮張顒佹▔缁€铏规畱缁岃桨鍚夐崗鍐 */

::v-deep .el-table__body .el-checkbox__inner {
  display: inline-block !important;
  background: #ffffff;
}

::v-deep .el-table thead th:not(:first-child) .cell {
  color: #303133 !important;
}

::v-deep .nav-panel .el-menu-item.is-active .menu-text {
  color: #fff !important;
}


.el-button img {
  height: 1em;
  vertical-align: middle;
  padding-right: 2px;
  padding-bottom: 2px;
}

::v-deep .el-checkbox__inner {
  border-color: #cfcfcf !important;
  transition: all 0.2s ease-in-out;
}

::v-deep .el-checkbox__input.is-checked .el-checkbox__inner {
  background-color: #5f70f3;
  border-color: #5f70f3;
}

.voice-management-btn {
  background: #9db3ea;
  color: white;
  min-width: 68px;
  line-height: 14px;
  white-space: nowrap;
  transition: all 0.3s;
  border-radius: 10px;
}

.voice-management-btn:hover {
  background: #8aa2e0;
  /* 閹剙浠犻弮鍫曨杹閼规彃濮炲ǎ?*/
  transform: scale(1.05);
}

::v-deep .el-table .el-table-column--selection .cell {
  padding-left: 15px !important;
}

::v-deep .el-table .el-table__fixed-right .cell {
  padding-right: 15px !important;
}

.edit-btn,
.delete-btn {
  margin: 0 8px;
  color: #7079aa !important;
}

::v-deep .el-table .cell {
  padding-left: 10px;
  padding-right: 10px;
}

.model-card {
  background: white;
  flex: 1;
  display: flex;
  flex-direction: column;
  border: none;
  box-shadow: none;
  overflow: hidden;
}

.model-card ::v-deep .el-card__body {
  padding: 0;
  display: flex;
  flex-direction: column;
  flex: 1;
  overflow: hidden;
}
:deep(.transparent-table) {
    background: white;
    flex: 1;
    width: 100%;
    display: flex;
    flex-direction: column;

    .el-table__body-wrapper {
        flex: 1;
        overflow-y: auto;
        max-height: none !important;
    }

    .el-table__header-wrapper {
        flex-shrink: 0;
    }

    .el-table__header th {
        background: white !important;
        color: black;
        font-weight: 600;
        height: 40px;
        padding: 8px 0;
        font-size: 14px;
        border-bottom: 1px solid #e4e7ed;
    }

    .el-table__body tr {
        background-color: white;

        td {
            border-top: 1px solid rgba(0, 0, 0, 0.04);
            border-bottom: 1px solid rgba(0, 0, 0, 0.04);
            padding: 8px 0;
            height: 40px;
            color: #606266;
            font-size: 14px;
        }
    }

    .el-table__row:hover>td {
        background-color: #f5f7fa !important;
    }

    &::before {
        display: none;
    }
}


::v-deep .el-loading-mask {
  background-color: rgba(255, 255, 255, 0.6) !important;
  backdrop-filter: blur(2px);
}

::v-deep .el-loading-spinner .circular {
  width: 28px;
  height: 28px;
}

::v-deep .el-loading-spinner .path {
  stroke: #6b8cff;
}

::v-deep .el-loading-text {
  color: #6b8cff !important;
  font-size: 14px;
  margin-top: 8px;
}

::v-deep .mcp-test-dialog {
  max-width: calc(100vw - 32px);
  border-radius: 14px;
  overflow: hidden;
  box-shadow: 0 18px 50px rgba(32, 44, 86, 0.22);
}

::v-deep .mcp-test-dialog .el-dialog__header {
  padding: 20px 24px 14px;
  border-bottom: 1px solid #edf0f7;
}

::v-deep .mcp-test-dialog .el-dialog__title {
  color: #202636;
  font-size: 17px;
  font-weight: 600;
}

::v-deep .mcp-test-dialog .el-dialog__body {
  padding: 20px 24px 22px;
}

.mcp-test {
  display: flex;
  flex-direction: column;
  gap: 16px;
  max-height: min(72vh, 820px);
}

.result-banner {
  display: flex;
  align-items: center;
  gap: 14px;
  min-height: 66px;
  padding: 14px 18px;
  border-radius: 12px;
  box-sizing: border-box;
}

.result-banner.success {
  color: #166b4e;
  background: linear-gradient(100deg, rgba(91, 201, 140, .2), rgba(91, 201, 140, .05));
  border: 1px solid rgba(91, 201, 140, .45);
}

.result-banner.error {
  color: #a93636;
  background: linear-gradient(100deg, rgba(253, 91, 99, .14), rgba(253, 91, 99, .04));
  border: 1px solid rgba(253, 91, 99, .38);
}

.result-banner i {
  width: 34px;
  height: 34px;
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  border-radius: 10px;
  background: rgba(255, 255, 255, .78);
}

.result-copy strong {
  display: block;
  font-size: 15px;
  line-height: 1.4;
}

.result-copy p {
  margin: 2px 0 0;
  font-size: 12px;
  line-height: 1.5;
  opacity: .82;
}

.summary-grid {
  display: grid;
  grid-template-columns: minmax(0, 1.4fr) minmax(0, 1fr) 90px;
  gap: 10px;
}

.summary-card {
  min-width: 0;
  padding: 12px 14px;
  border: 1px solid #e6eaf4;
  border-radius: 10px;
  background: #fafbff;
  box-sizing: border-box;
}

.summary-card span {
  display: block;
  color: #7a819d;
  font-size: 12px;
}

.summary-card strong {
  display: block;
  margin-top: 4px;
  color: #242b42;
  font-size: 14px;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.tools-panel {
  display: flex;
  flex-direction: column;
  min-height: 0;
  border: 1px solid #e6eaf4;
  border-radius: 12px;
  overflow: hidden;
}

.tools-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 16px;
  padding: 12px 14px;
  background: #fafbff;
  border-bottom: 1px solid #e6eaf4;
}

.tools-title {
  color: #242b42;
  font-size: 14px;
  font-weight: 600;
  white-space: nowrap;
}

.tools-title small {
  margin-left: 8px;
  color: #7a819d;
  font-size: 12px;
  font-weight: 500;
}

.tools-header .el-input {
  width: 230px;
}

.tools-scroll {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
  align-content: start;
  gap: 10px;
  min-height: 120px;
  max-height: calc(min(72vh, 820px) - 230px);
  padding: 14px;
  overflow: auto;
  box-sizing: border-box;
  background: #fff;
}

.tool-card {
  min-width: 0;
  padding: 11px 12px;
  border: 1px solid #e7ebf5;
  border-radius: 9px;
  background: #fff;
  transition: border-color .2s, box-shadow .2s, transform .2s;
}

.tool-card:hover {
  border-color: rgba(95, 112, 243, .48);
  box-shadow: 0 5px 14px rgba(64, 80, 181, .08);
  transform: translateY(-1px);
}

.tool-name {
  color: #2a3250;
  font-family: ui-monospace, SFMono-Regular, Consolas, monospace;
  font-size: 12px;
  font-weight: 600;
  line-height: 1.45;
  word-break: break-word;
}

.tool-desc {
  margin: 6px 0 0;
  color: #6d7590;
  font-size: 12px;
  line-height: 1.55;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.tools-empty {
  grid-column: 1 / -1;
  padding: 28px 0;
  color: #7a819d;
  text-align: center;
  font-size: 13px;
}

@media (max-width: 720px) {
  .summary-grid,
  .mcp-detail-grid {
    grid-template-columns: 1fr;
  }

  .mcp-detail-item.is-wide {
    grid-column: auto;
  }

  .tools-header {
    align-items: stretch;
    flex-direction: column;
  }

  .tools-header .el-input {
    width: 100%;
  }
}
</style>
