<template>
  <el-dialog :visible.sync="visibleInternal" :title="$t('capability.deviceAccountTitle')" width="720px" @closed="handleClosed">
    <div v-loading="loading">
      <div v-for="item in forms" :key="item.serverId" class="account-item">
        <div class="account-header">
          <div class="server-name">{{ item.serverName }}</div>
          <el-switch v-model="item.enabled" :active-value="1" :inactive-value="0" />
        </div>
        <el-form label-width="90px" class="account-form">
          <el-form-item :label="$t('capability.username')">
            <el-input v-model="item.username" autocomplete="off" />
          </el-form-item>
          <el-form-item :label="$t('capability.password')">
            <el-input v-model="item.password" show-password autocomplete="new-password" :placeholder="$t('capability.passwordKeep')" />
          </el-form-item>
        </el-form>
      </div>
      <el-empty v-if="!loading && !forms.length" :description="$t('capability.empty')" />
    </div>
    <template #footer>
      <el-button @click="visibleInternal = false">{{ $t('common.cancel') }}</el-button>
      <el-button type="primary" :loading="saving" @click="save">{{ $t('roleConfig.saveConfig') }}</el-button>
    </template>
  </el-dialog>
</template>

<script>
import Api from "@/apis/api";

export default {
  name: "DeviceMcpAccountDialog",
  props: {
    visible: { type: Boolean, default: false },
    macAddress: { type: String, default: "" },
  },
  data() {
    return {
      visibleInternal: false,
      loading: false,
      saving: false,
      servers: [],
      forms: [],
    };
  },
  watch: {
    visible(value) {
      this.visibleInternal = value;
      if (value && this.macAddress) this.load();
    },
  },
  methods: {
    async load() {
      this.loading = true;
      Api.model.getMcpServers({}, async ({ data }) => {
        if (data.code !== 0) {
          this.loading = false;
          this.$message.error(data.msg || this.$t('capability.loadFailed'));
          return;
        }
        this.servers = (data.data || []).filter(item => item.enabled === 1);
        Api.model.getDeviceMcpAccounts(this.macAddress, ({ data }) => {
          this.loading = false;
          if (data.code !== 0) {
            this.$message.error(data.msg || this.$t('capability.loadFailed'));
            return;
          }
          const saved = data.data || [];
          this.forms = this.servers.map(server => {
            const current = saved.find(item => item.serverId === server.id);
            return {
              serverId: server.id,
              serverName: server.name,
              username: current ? current.username : "",
              password: "",
              enabled: current ? current.enabled : 1,
            };
          });
        });
      });
    },
    save() {
      this.saving = true;
      const payload = {
        macAddress: this.macAddress,
        accounts: this.forms.map(item => ({
          serverId: item.serverId,
          username: item.username,
          password: item.password,
          enabled: item.enabled,
        })),
      };
      Api.model.saveDeviceMcpAccounts(payload, ({ data }) => {
        this.saving = false;
        if (data.code === 0) {
          this.$message.success(this.$t('capability.saveSuccess'));
          this.visibleInternal = false;
        } else {
          this.$message.error(data.msg || this.$t('capability.saveFailed'));
        }
      });
    },
    handleClosed() {
      this.$emit('update:visible', false);
    },
  },
};
</script>

<style scoped>
.account-item {
  margin-bottom: 18px;
  padding-bottom: 16px;
  border-bottom: 1px solid #ebeef5;
}
.account-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 12px;
}
.server-name {
  font-weight: 600;
}
.account-form {
  padding-right: 12px;
}
</style>
