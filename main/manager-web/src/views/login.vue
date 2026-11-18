<template>
  <div class="login-page">
    <div class="page-glow glow-one" aria-hidden="true"></div>
    <div class="page-glow glow-two" aria-hidden="true"></div>
    <div class="dot-field" aria-hidden="true"></div>

    <header class="site-header">
      <div class="site-brand">
        <img loading="lazy" alt="Xiaofan" src="@/assets/xiaofan-logo.png" />
        <span class="site-brand-name">XIAOFAN</span>
        <span class="site-brand-divider"></span>
        <span class="site-brand-context">AI DEVICE CLOUD</span>
      </div>

      <el-dropdown
        trigger="click"
        popper-class="mainstream-language-popper"
        @visible-change="handleLanguageDropdownVisibleChange"
      >
        <button class="header-language" type="button" aria-label="Switch language">
          <i class="el-icon-connection"></i>
          <span>{{ currentLanguageText }}</span>
          <i class="el-icon-arrow-down language-arrow"
            :class="{ 'rotate-down': languageDropdownVisible }"></i>
        </button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="changeLanguage('zh_CN')">{{ $t("language.zhCN") }}</el-dropdown-item>
          <el-dropdown-item @click.native="changeLanguage('zh_TW')">{{ $t("language.zhTW") }}</el-dropdown-item>
          <el-dropdown-item @click.native="changeLanguage('en')">{{ $t("language.en") }}</el-dropdown-item>
          <el-dropdown-item @click.native="changeLanguage('de')">{{ $t("language.de") }}</el-dropdown-item>
          <el-dropdown-item @click.native="changeLanguage('vi')">{{ $t("language.vi") }}</el-dropdown-item>
          <el-dropdown-item @click.native="changeLanguage('pt_BR')">{{ $t("language.ptBR") }}</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </header>

    <main class="login-main">
      <section class="intro-panel">
        <div class="intro-eyebrow">
          <span class="eyebrow-dot"></span>
          {{ $t("login.heroEyebrow") }}
        </div>
        <h1 class="intro-title">{{ $t("login.heroTitle") }}</h1>
        <p class="intro-copy">{{ $t("login.heroDescription") }}</p>

        <div class="visual-stage" aria-hidden="true">
          <div class="visual-halo"></div>
          <svg class="network-map" viewBox="0 0 760 340" preserveAspectRatio="none">
            <defs>
              <linearGradient id="networkGradient" x1="0" y1="0" x2="1" y2="0">
                <stop offset="0%" stop-color="#38bdf8" stop-opacity="0.08" />
                <stop offset="45%" stop-color="#4f7cff" stop-opacity="0.45" />
                <stop offset="100%" stop-color="#8b5cf6" stop-opacity="0.08" />
              </linearGradient>
            </defs>
            <path class="network-path path-a" d="M 140 95 C 260 45, 470 35, 650 90" />
            <path class="network-path path-b" d="M 120 250 C 260 315, 500 320, 675 248" />
            <path class="network-path path-c" d="M 140 95 C 190 150, 250 195, 380 170" />
            <path class="network-path path-d" d="M 650 90 C 590 130, 540 160, 380 170" />
            <path class="network-path path-e" d="M 120 250 C 220 210, 280 190, 380 170" />
            <path class="network-path path-f" d="M 675 248 C 580 210, 500 182, 380 170" />
            <circle class="travel-dot dot-a" r="3">
              <animateMotion dur="7s" repeatCount="indefinite" path="M 140 95 C 260 45, 470 35, 650 90" />
            </circle>
            <circle class="travel-dot dot-b" r="2.5">
              <animateMotion dur="9s" begin="1.5s" repeatCount="indefinite" path="M 120 250 C 260 315, 500 320, 675 248" />
            </circle>
            <circle class="travel-dot dot-c" r="2">
              <animateMotion dur="6s" begin="2.4s" repeatCount="indefinite" path="M 650 90 C 590 130, 540 160, 380 170" />
            </circle>
          </svg>

          <div class="orbit orbit-outer"></div>
          <div class="orbit orbit-middle"></div>
          <div class="orbit orbit-inner"></div>

          <div class="core-wrap">
            <div class="core-aura"></div>
            <div class="core-ring"></div>
            <div class="ai-core">AI</div>
          </div>

          <div class="float-chip chip-agents">
            <span class="chip-icon blue"><i class="el-icon-cpu"></i></span>
            <span>Agents</span>
          </div>
          <div class="float-chip chip-devices">
            <span class="chip-icon green"><i class="el-icon-monitor"></i></span>
            <span>Devices</span>
          </div>
          <div class="float-chip chip-tools">
            <span class="chip-icon violet"><i class="el-icon-connection"></i></span>
            <span>MCP Tools</span>
          </div>
          <div class="float-chip chip-models">
            <span class="chip-icon cyan"><i class="el-icon-s-platform"></i></span>
            <span>Models</span>
          </div>

          <div class="signal-wave">
            <span class="signal-label">LIVE SIGNAL</span>
            <div class="wave-bars">
              <i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i>
            </div>
          </div>
        </div>
      </section>

      <section class="auth-panel">
        <div class="auth-card" @keyup.enter="login">
          <div class="auth-card-top">
            <div class="auth-brand-mobile">
              <img loading="lazy" alt="Xiaofan" src="@/assets/xiaofan-logo.png" />
              <span>XIAOFAN <b>AI</b></span>
            </div>
            <div class="secure-badge"><i></i> SECURE ACCESS</div>
          </div>

          <div class="auth-heading">
            <h2>{{ $t("login.title") }}</h2>
            <p>{{ $t("login.signInSubtitle") }}</p>
          </div>

          <div class="login-mode-switch" v-if="enableMobileRegister">
            <button type="button" class="mode-button" :class="{ active: !isMobileLogin }"
              @click="switchLoginType('username')">
              <i class="el-icon-user"></i>
              <span>{{ $t("login.usernameLogin") }}</span>
            </button>
            <button type="button" class="mode-button" :class="{ active: isMobileLogin }"
              @click="switchLoginType('mobile')">
              <i class="el-icon-mobile-phone"></i>
              <span>{{ $t("login.mobileLogin") }}</span>
            </button>
          </div>

          <form class="auth-form" @submit.prevent="login">
            <div v-if="!isMobileLogin" class="field-block">
              <label class="field-label">{{ $t("login.username") }}</label>
              <div class="field-shell">
                <i class="el-icon-user field-icon"></i>
                <el-input v-model="form.username" name="username" autocomplete="username"
                  :placeholder="$t('login.usernamePlaceholder')" />
              </div>
            </div>

            <div v-else class="field-block">
              <label class="field-label">{{ $t("login.mobileLogin") }}</label>
              <div class="mobile-field-row">
                <div class="field-shell area-code-shell">
                  <i class="el-icon-phone field-icon"></i>
                  <el-select v-model="form.areaCode" filterable popper-class="mainstream-select-popper">
                    <el-option v-for="item in mobileAreaList" :key="item.key"
                      :label="`${item.name} (${item.key})`" :value="item.key" />
                  </el-select>
                </div>
                <div class="field-shell">
                  <i class="el-icon-mobile-phone field-icon"></i>
                  <el-input v-model="form.mobile" name="mobile" autocomplete="tel"
                    :placeholder="$t('login.mobilePlaceholder')" />
                </div>
              </div>
            </div>

            <div class="field-block">
              <label class="field-label">{{ $t("login.password") }}</label>
              <div class="field-shell">
                <i class="el-icon-lock field-icon"></i>
                <el-input v-model="form.password" name="password" autocomplete="current-password"
                  type="password" show-password :placeholder="$t('login.passwordPlaceholder')" />
              </div>
            </div>

            <div class="field-block">
              <div class="captcha-row">
                <div class="field-shell">
                  <i class="el-icon-key field-icon"></i>
                  <el-input v-model="form.captcha" name="captcha" autocomplete="off"
                    :placeholder="$t('login.captchaPlaceholder')" />
                </div>
                <button type="button" class="captcha-card"
                  :aria-label="$t('login.captchaPlaceholder')" @click="fetchCaptcha">
                  <img v-if="captchaUrl" :src="captchaUrl" alt="captcha" />
                  <span v-else class="captcha-placeholder"><i class="el-icon-refresh"></i></span>
                </button>
              </div>
            </div>

            <div class="form-meta">
              <button v-if="allowUserRegister" type="button" class="text-action" @click="goToRegister">
                {{ $t("login.register") }}
              </button>
              <span v-else></span>
              <button v-if="enableMobileRegister" type="button" class="text-action"
                @click="goToForgetPassword">
                {{ $t("login.forgetPassword") }}
              </button>
            </div>

            <button class="primary-action" type="submit">
              <span>{{ $t("login.login") }}</span>
              <i class="el-icon-right"></i>
            </button>
          </form>

          <div class="agreement">
            {{ $t("login.agreeTo") }}
            <button type="button" @click="openPage('/user-agreement.html')">{{ $t("login.userAgreement") }}</button>
            {{ $t("login.and") }}
            <button type="button" @click="openPage('/privacy-policy.html')">{{ $t("login.privacyPolicy") }}</button>
          </div>

          <div class="auth-trust">
            <span><i class="el-icon-lock"></i> SM2 encrypted</span>
            <span><i class="el-icon-circle-check"></i> Isolated session</span>
          </div>
        </div>
      </section>
    </main>

    <footer class="login-footer">
      <version-footer />
    </footer>
  </div>
</template>

<script>
import Api from "@/apis/api";
import VersionFooter from "@/components/VersionFooter.vue";
import i18n, { changeLanguage } from "@/i18n";
import { getUUID, goToPage, showDanger, showSuccess, sm2Encrypt, validateMobile } from "@/utils";
import { mapState } from "vuex";

export default {
  name: "login",
  components: { VersionFooter },
  computed: {
    ...mapState({
      allowUserRegister: (state) => state.pubConfig.allowUserRegister,
      enableMobileRegister: (state) => state.pubConfig.enableMobileRegister,
      mobileAreaList: (state) => state.pubConfig.mobileAreaList,
      sm2PublicKey: (state) => state.pubConfig.sm2PublicKey,
    }),
    currentLanguage() {
      return i18n.locale || "zh_CN";
    },
    currentLanguageText() {
      switch (this.currentLanguage) {
        case "zh_CN": return this.$t("language.zhCN");
        case "zh_TW": return this.$t("language.zhTW");
        case "en": return this.$t("language.en");
        case "de": return this.$t("language.de");
        case "vi": return this.$t("language.vi");
        case "pt_BR": return this.$t("language.ptBR");
        default: return this.$t("language.zhCN");
      }
    },
  },
  data() {
    return {
      form: { username: "", password: "", captcha: "", captchaId: "", areaCode: "+86", mobile: "" },
      captchaUuid: "",
      captchaUrl: "",
      isMobileLogin: false,
      languageDropdownVisible: false,
    };
  },
  mounted() {
    this.fetchCaptcha();
    this.$store.dispatch("fetchPubConfig").then(() => {
      this.isMobileLogin = this.enableMobileRegister;
    });
  },
  methods: {
    openPage(url) {
      const lang = this.$i18n ? this.$i18n.locale : "zh_CN";
      if (!lang.startsWith("zh")) url = url.replace(".html", "-en.html");
      window.open(url, "_blank");
    },
    fetchCaptcha() {
      const token = localStorage.getItem("token");
      if (token) {
        if (this.$route.path !== "/home") this.$router.push("/home");
        return;
      }
      this.captchaUuid = getUUID();
      Api.user.getCaptcha(this.captchaUuid, (res) => {
        if (res.status === 200) {
          const blob = new Blob([res.data], { type: res.data.type });
          if (this.captchaUrl) URL.revokeObjectURL(this.captchaUrl);
          this.captchaUrl = URL.createObjectURL(blob);
        } else {
          showDanger("验证码加载失败，点击刷新");
        }
      });
    },
    handleLanguageDropdownVisibleChange(visible) {
      this.languageDropdownVisible = visible;
    },
    changeLanguage(lang) {
      changeLanguage(lang);
      this.languageDropdownVisible = false;
      this.$message.success({ message: this.$t("message.success"), showClose: true });
    },
    switchLoginType(type) {
      this.isMobileLogin = type === "mobile";
      this.form.username = "";
      this.form.mobile = "";
      this.form.password = "";
      this.form.captcha = "";
      this.fetchCaptcha();
    },
    validateInput(input, messageKey) {
      if (!input.trim()) {
        showDanger(this.$t(messageKey));
        return false;
      }
      return true;
    },
    getUserInfo() {
      Api.user.getUserInfo(({ data }) => {
        if (data.code === 0) {
          this.$store.commit("setUserInfo", data.data);
          goToPage("/home");
        } else {
          showDanger("用户信息获取失败");
        }
      });
    },
    async login() {
      if (this.isMobileLogin) {
        if (!validateMobile(this.form.mobile, this.form.areaCode)) {
          showDanger(this.$t("login.requiredMobile"));
          return;
        }
        this.form.username = this.form.areaCode + this.form.mobile;
      } else if (!this.validateInput(this.form.username, "login.requiredUsername")) {
        return;
      }
      if (!this.validateInput(this.form.password, "login.requiredPassword")) return;
      if (!this.validateInput(this.form.captcha, "login.requiredCaptcha")) return;

      let encryptedPassword;
      try {
        encryptedPassword = sm2Encrypt(this.sm2PublicKey, this.form.captcha + this.form.password);
      } catch (error) {
        console.error("Password encryption failed:", error);
        showDanger(this.$t("sm2.encryptionFailed"));
        return;
      }

      this.form.captchaId = this.captchaUuid;
      Api.user.login(
        {
          username: this.form.username,
          password: encryptedPassword,
          captchaId: this.form.captchaId,
        },
        ({ data }) => {
          showSuccess(this.$t("login.loginSuccess"));
          this.$store.commit("setToken", JSON.stringify(data.data));
          this.getUserInfo();
        },
        (err) => showDanger(err.data.msg || "登录失败")
      );
      setTimeout(() => this.fetchCaptcha(), 1000);
    },
    goToRegister() { goToPage("/register"); },
    goToForgetPassword() { goToPage("/retrieve-password"); },
  },
};
</script>
<style lang="scss" scoped>
.login-page {
  position: relative;
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  min-height: 100dvh;
  overflow-x: hidden;
  color: #111827;
  background:
    radial-gradient(circle at 78% 6%, rgba(84, 105, 255, 0.1), transparent 28%),
    radial-gradient(circle at 8% 78%, rgba(0, 183, 255, 0.07), transparent 28%),
    linear-gradient(180deg, #fafbfc 0%, #f5f7fa 100%);
  font-family: "Inter", "SF Pro Display", "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
  isolation: isolate;
}

.login-page *,
.login-page *::before,
.login-page *::after { box-sizing: border-box; }

.page-glow {
  position: absolute;
  z-index: -1;
  border-radius: 50%;
  filter: blur(100px);
  pointer-events: none;
}

.glow-one { top: -180px; right: 9%; width: 420px; height: 420px; background: rgba(84, 105, 255, 0.12); }
.glow-two { bottom: -220px; left: 4%; width: 460px; height: 460px; background: rgba(0, 183, 255, 0.08); }

.dot-field {
  position: absolute;
  inset: 0;
  z-index: -2;
  background-image: radial-gradient(rgba(15, 23, 42, 0.09) 0.7px, transparent 0.7px);
  background-size: 24px 24px;
  mask-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.65), transparent 78%);
  opacity: 0.42;
  pointer-events: none;
}

.site-header {
  position: relative;
  z-index: 3;
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: min(1320px, 100%);
  margin: 0 auto;
  padding: 28px 38px 18px;
}

.site-brand { display: flex; align-items: center; gap: 11px; min-width: 0; }

.site-brand img {
  width: 38px;
  height: 38px;
  padding: 3px;
  object-fit: contain;
  border: 1px solid rgba(15, 23, 42, 0.08);
  border-radius: 11px;
  background: #ffffff;
  box-shadow: 0 8px 20px rgba(15, 23, 42, 0.06);
}

.site-brand-name { color: #111827; font-size: 14px; font-weight: 700; letter-spacing: 0.14em; }
.site-brand-divider { width: 1px; height: 16px; margin: 0 2px; background: #d9dee8; }
.site-brand-context { color: #7c889b; font-size: 10px; font-weight: 600; letter-spacing: 0.12em; }

.header-language {
  display: inline-flex;
  align-items: center;
  gap: 7px;
  height: 36px;
  padding: 0 12px;
  border: 1px solid #e0e4eb;
  border-radius: 9px;
  color: #596579;
  background: rgba(255, 255, 255, 0.72);
  font-family: inherit;
  font-size: 11px;
  cursor: pointer;
  backdrop-filter: blur(12px);
  transition: border-color 0.18s ease, background 0.18s ease, color 0.18s ease;
}

.header-language:hover,
.header-language:focus-visible { border-color: #c7d2fe; color: #1d4ed8; background: #ffffff; outline: none; }

.language-arrow { font-size: 10px; transition: transform 0.2s ease; }
.rotate-down { transform: rotate(180deg); }

.login-main {
  position: relative;
  z-index: 1;
  display: grid;
  grid-template-columns: minmax(0, 1.25fr) minmax(400px, 0.75fr);
  gap: clamp(48px, 6vw, 96px);
  align-items: center;
  width: min(1320px, 100%);
  flex: 1;
  margin: 0 auto;
  padding: 32px 38px 42px;
}

.intro-panel { align-self: center; min-width: 0; text-align: left; }
.intro-eyebrow { display: flex; align-items: center; gap: 8px; color: #596579; font-size: 10px; font-weight: 700; letter-spacing: 0.16em; text-transform: uppercase; }
.eyebrow-dot { width: 7px; height: 7px; border-radius: 50%; background: #2563eb; box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.09); }

.intro-title {
  max-width: 720px;
  margin: 20px 0 18px;
  color: #0f172a;
  font-size: clamp(42px, 4.1vw, 66px);
  font-weight: 620;
  letter-spacing: -0.055em;
  line-height: 1.04;
}

.intro-copy { max-width: 620px; margin: 0; color: #657186; font-size: 15px; line-height: 1.75; }

.visual-stage {
  position: relative;
  width: min(760px, 100%);
  height: 350px;
  margin-top: 18px;
  isolation: isolate;
}

.visual-stage::before {
  content: "";
  position: absolute;
  inset: 6% 4%;
  z-index: -2;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(78, 120, 255, 0.12), rgba(83, 207, 255, 0.05) 45%, transparent 70%);
  filter: blur(24px);
}

.visual-halo {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 300px;
  height: 300px;
  border-radius: 50%;
  background: conic-gradient(from 90deg, transparent, rgba(56, 189, 248, 0.16), transparent 34%, rgba(139, 92, 246, 0.14), transparent 72%);
  filter: blur(12px);
  transform: translate(-50%, -50%);
  animation: halo-spin 18s linear infinite;
}

.network-map {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  overflow: visible;
}

.network-path {
  fill: none;
  stroke: url(#networkGradient);
  stroke-width: 1;
  stroke-dasharray: 3 8;
  animation: line-flow 16s linear infinite;
}

.travel-dot {
  fill: #2563eb;
  filter: drop-shadow(0 0 6px rgba(37, 99, 235, 0.55));
}

.dot-b { fill: #10b981; filter: drop-shadow(0 0 6px rgba(16, 185, 129, 0.5)); }
.dot-c { fill: #8b5cf6; filter: drop-shadow(0 0 6px rgba(139, 92, 246, 0.5)); }

.orbit {
  position: absolute;
  top: 50%;
  left: 50%;
  border-radius: 50%;
  border: 1px solid rgba(37, 99, 235, 0.1);
}

.orbit-outer {
  width: 300px;
  height: 300px;
  border-style: dashed;
  animation: orbit-spin 34s linear infinite;
}

.orbit-middle {
  width: 232px;
  height: 232px;
  border-color: rgba(0, 157, 220, 0.14);
  animation: orbit-spin 24s linear infinite reverse;
}

.orbit-inner {
  width: 164px;
  height: 164px;
  border-color: rgba(37, 99, 235, 0.18);
  box-shadow: 0 0 45px rgba(37, 99, 235, 0.07);
}

.core-wrap {
  position: absolute;
  top: 50%;
  left: 50%;
  display: grid;
  place-items: center;
  width: 140px;
  height: 140px;
  transform: translate(-50%, -50%);
}

.core-aura {
  position: absolute;
  inset: 10px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(69, 160, 255, 0.28), rgba(86, 111, 255, 0.08) 50%, transparent 70%);
  filter: blur(15px);
  animation: core-pulse 4s ease-in-out infinite;
}

.core-ring {
  position: absolute;
  inset: 22px;
  border: 1px solid rgba(61, 139, 255, 0.24);
  border-radius: 50%;
  box-shadow: inset 0 0 22px rgba(83, 179, 255, 0.12), 0 0 30px rgba(37, 99, 235, 0.08);
}

.ai-core {
  position: relative;
  z-index: 1;
  display: grid;
  place-items: center;
  width: 72px;
  height: 72px;
  border: 1px solid rgba(255, 255, 255, 0.72);
  border-radius: 50%;
  color: #ffffff;
  background: radial-gradient(circle at 34% 28%, #b7f4ff 0%, #65c8ff 20%, #397cff 55%, #25449a 100%);
  box-shadow: 0 16px 34px rgba(37, 99, 235, 0.24), inset 0 1px 0 rgba(255, 255, 255, 0.48);
  font-size: 18px;
  font-weight: 700;
  letter-spacing: -0.04em;
  animation: core-float 4.6s ease-in-out infinite;
}

.float-chip {
  position: absolute;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  height: 38px;
  padding: 0 12px 0 7px;
  border: 1px solid rgba(15, 23, 42, 0.08);
  border-radius: 12px;
  color: #344054;
  background: rgba(255, 255, 255, 0.82);
  box-shadow: 0 14px 34px rgba(15, 23, 42, 0.08), inset 0 1px 0 rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(16px);
  font-size: 10px;
  font-weight: 600;
  animation: chip-float 6s ease-in-out infinite;
}

.chip-icon {
  display: grid;
  place-items: center;
  width: 26px;
  height: 26px;
  border-radius: 8px;
  font-size: 11px;
}

.chip-icon.blue { color: #2563eb; background: #eef4ff; }
.chip-icon.green { color: #059669; background: #ecfdf5; }
.chip-icon.violet { color: #7c3aed; background: #f5f3ff; }
.chip-icon.cyan { color: #0284c7; background: #ecfeff; }

.chip-agents { top: 16%; left: 8%; }
.chip-devices { top: 23%; right: 9%; animation-delay: -1.4s; }
.chip-tools { right: 16%; bottom: 20%; animation-delay: -2.8s; }
.chip-models { bottom: 18%; left: 15%; animation-delay: -4.1s; }

.signal-wave {
  position: absolute;
  bottom: 3%;
  left: 50%;
  display: flex;
  align-items: center;
  gap: 10px;
  height: 38px;
  padding: 0 13px;
  border: 1px solid rgba(15, 23, 42, 0.07);
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.74);
  box-shadow: 0 12px 30px rgba(15, 23, 42, 0.06);
  transform: translateX(-50%);
  backdrop-filter: blur(14px);
}

.signal-label {
  color: #7b8799;
  font-family: "Cascadia Code", "SFMono-Regular", Consolas, monospace;
  font-size: 7px;
  letter-spacing: 0.12em;
}

.wave-bars {
  display: flex;
  align-items: center;
  gap: 2px;
  height: 18px;
}

.wave-bars i {
  display: block;
  width: 2px;
  height: 5px;
  border-radius: 2px;
  background: linear-gradient(to top, #2563eb, #38bdf8);
  animation: wave-pulse 1.4s ease-in-out infinite;
}

.wave-bars i:nth-child(2n) { animation-delay: -0.2s; }
.wave-bars i:nth-child(3n) { animation-delay: -0.45s; }
.wave-bars i:nth-child(4n) { animation-delay: -0.65s; }
.wave-bars i:nth-child(5n) { animation-delay: -0.9s; }

@keyframes halo-spin {
  from { transform: translate(-50%, -50%) rotate(0deg); }
  to { transform: translate(-50%, -50%) rotate(360deg); }
}

@keyframes orbit-spin {
  from { transform: translate(-50%, -50%) rotate(0deg); }
  to { transform: translate(-50%, -50%) rotate(360deg); }
}

@keyframes line-flow {
  from { stroke-dashoffset: 0; }
  to { stroke-dashoffset: -120; }
}

@keyframes core-pulse {
  0%, 100% { opacity: 0.6; transform: scale(0.94); }
  50% { opacity: 1; transform: scale(1.08); }
}

@keyframes core-float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-4px); }
}

@keyframes chip-float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-6px); }
}

@keyframes wave-pulse {
  0%, 100% { height: 5px; opacity: 0.55; }
  50% { height: 17px; opacity: 1; }
}

.auth-panel { display: flex; justify-content: flex-end; align-self: center; }

.auth-card {
  width: min(100%, 438px);
  padding: 26px 28px 22px;
  border: 1px solid rgba(15, 23, 42, 0.09);
  border-radius: 18px;
  background: rgba(255, 255, 255, 0.88);
  box-shadow:
    0 32px 80px rgba(15, 23, 42, 0.12),
    0 2px 8px rgba(15, 23, 42, 0.04),
    inset 0 1px 0 rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(22px);
}

.auth-card-top { display: flex; align-items: center; justify-content: space-between; min-height: 28px; }
.auth-brand-mobile { display: none; align-items: center; gap: 8px; color: #111827; font-size: 12px; font-weight: 700; letter-spacing: 0.1em; }
.auth-brand-mobile img { width: 30px; height: 30px; object-fit: contain; }
.auth-brand-mobile b { color: #2563eb; }

.secure-badge {
  display: inline-flex;
  align-items: center;
  gap: 5px;
  margin-left: auto;
  color: #7b8799;
  font-family: "Cascadia Code", "SFMono-Regular", Consolas, monospace;
  font-size: 8px;
  letter-spacing: 0.08em;
}

.secure-badge i {
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background: #10b981;
  box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.09);
}

.auth-heading { padding: 25px 0 22px; text-align: left; }
.auth-heading h2 { margin: 0; color: #0f172a; font-size: 34px; font-weight: 650; letter-spacing: -0.045em; line-height: 1.1; }
.auth-heading p { margin: 9px 0 0; color: #7a8698; font-size: 12px; line-height: 1.6; }

.login-mode-switch {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 3px;
  margin-bottom: 20px;
  padding: 3px;
  border: 1px solid #edf0f4;
  border-radius: 10px;
  background: #f7f8fa;
}

.mode-button {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  min-height: 36px;
  padding: 0 10px;
  border: 0;
  border-radius: 7px;
  color: #8b97a9;
  background: transparent;
  font-family: inherit;
  font-size: 10px;
  cursor: pointer;
  transition: all 0.18s ease;
}

.mode-button:hover { color: #475467; }

.mode-button.active {
  color: #1f2937;
  background: #ffffff;
  box-shadow: 0 1px 3px rgba(15, 23, 42, 0.08), inset 0 0 0 1px rgba(15, 23, 42, 0.04);
}

.auth-form { display: flex; flex-direction: column; gap: 15px; }
.field-block { display: flex; flex-direction: column; gap: 7px; }
.field-label { align-self: flex-start; color: #667085; font-size: 10px; font-weight: 600; }

.field-shell {
  display: flex;
  align-items: center;
  gap: 10px;
  min-width: 0;
  height: 48px;
  padding: 0 13px;
  border: 1px solid #dfe4eb;
  border-radius: 10px;
  background: #ffffff;
  box-shadow: 0 1px 2px rgba(15, 23, 42, 0.02);
  transition: border-color 0.18s ease, box-shadow 0.18s ease;
}

.field-shell:focus-within {
  border-color: #93a4c7;
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.07);
}

.field-icon { flex-shrink: 0; color: #98a2b3; font-size: 14px; }
.field-shell:focus-within .field-icon { color: #4f6b95; }
.field-shell :deep(.el-input), .field-shell :deep(.el-select) { flex: 1; min-width: 0; }

.field-shell :deep(.el-input__inner) {
  height: 46px;
  padding: 0;
  border: 0;
  color: #1f2937;
  background: transparent;
  font-family: inherit;
  font-size: 12px;
  text-align: left;
}

.field-shell :deep(.el-input__inner::placeholder) { color: #a2acba; }
.field-shell :deep(.el-input__suffix) { color: #98a2b3; }
.field-shell :deep(.el-select .el-input__inner) { cursor: pointer; }
.field-shell :deep(.el-select .el-input__suffix) { color: #98a2b3; }
.mobile-field-row { display: grid; grid-template-columns: 150px minmax(0, 1fr); gap: 9px; }
.area-code-shell { padding-right: 8px; }
.captcha-row { display: grid; grid-template-columns: minmax(0, 1fr) 150px; gap: 9px; }

.captcha-card {
  display: grid;
  place-items: center;
  height: 48px;
  padding: 3px 5px;
  overflow: hidden;
  border: 1px solid #dfe4eb;
  border-radius: 10px;
  background: #ffffff;
  cursor: pointer;
}

.captcha-card img { display: block; width: 100%; height: 100%; object-fit: contain; }
.captcha-placeholder { color: #8fa0b6; font-size: 17px; }

.form-meta { display: flex; align-items: center; justify-content: space-between; min-height: 16px; margin-top: -2px; }
.text-action { padding: 0; border: 0; color: #2563eb; background: transparent; font-family: inherit; font-size: 10px; cursor: pointer; }
.text-action:hover, .text-action:focus-visible { color: #1d4ed8; outline: none; }

.primary-action {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 9px;
  height: 49px;
  margin-top: 2px;
  border: 0;
  border-radius: 10px;
  color: #ffffff;
  background: linear-gradient(135deg, #111827 0%, #1f3a8a 100%);
  box-shadow: 0 12px 26px rgba(15, 23, 42, 0.18);
  font-family: inherit;
  font-size: 12px;
  font-weight: 600;
  letter-spacing: 0.02em;
  cursor: pointer;
  transition: transform 0.18s ease, box-shadow 0.18s ease, filter 0.18s ease;
}

.primary-action:hover { transform: translateY(-1px); box-shadow: 0 16px 32px rgba(15, 23, 42, 0.24); filter: brightness(1.06); }
.primary-action:active { transform: translateY(0); }
.primary-action:focus-visible { outline: 2px solid #93c5fd; outline-offset: 3px; }
.primary-action i { font-size: 11px; }

.agreement {
  margin-top: 16px;
  color: #9aa5b5;
  font-size: 9px;
  line-height: 1.7;
  text-align: center;
}

.agreement button {
  padding: 0;
  border: 0;
  color: #2563eb;
  background: transparent;
  font-family: inherit;
  font-size: inherit;
  cursor: pointer;
}

.agreement button:hover { color: #1d4ed8; }

.auth-trust {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 18px;
  margin-top: 20px;
  padding-top: 15px;
  border-top: 1px solid #edf0f4;
  color: #9aa5b5;
  font-size: 8px;
}

.auth-trust span { display: inline-flex; align-items: center; gap: 5px; }
.auth-trust i { color: #8794a7; font-size: 9px; }
.login-footer { position: relative; z-index: 2; padding: 0 24px 14px; }
.login-footer :deep(.copyright) { padding: 0; }
.login-footer :deep(.footer-content) { color: #9aa5b5; font-size: 9px; letter-spacing: 0.02em; }
.login-footer :deep(.beian-text) { color: #9aa5b5; font-size: 9px; }
.login-footer :deep(.beian-link) { opacity: 0.8; }
@media (max-width: 1180px) {
  .login-main { grid-template-columns: minmax(0, 1fr) 405px; gap: 42px; padding-inline: 28px; }
  .site-header { padding-inline: 28px; }
  .intro-title { font-size: clamp(40px, 4.5vw, 58px); }
  .product-frame { margin-top: 30px; }
}

@media (max-width: 960px) {
  .login-page { overflow-y: auto; }
  .login-main {
    display: flex;
    flex-direction: column;
    gap: 22px;
    width: min(640px, 100%);
    padding: 24px 22px 30px;
  }
  .intro-panel { display: block !important; text-align: left; }
  .intro-title { max-width: 640px; margin: 14px 0 10px; font-size: clamp(30px, 7vw, 42px); }
  .intro-copy { max-width: 600px; font-size: 13px; }
  .visual-stage { height: 250px; margin-top: 8px; margin-bottom: -42px; transform: scale(0.82); transform-origin: top center; }
  .auth-panel { justify-content: center; }
  .auth-card { width: min(480px, 100%); }
  .auth-card-top { display: none; }
  .site-header { padding: 20px 22px 10px; }
  .login-footer { padding-bottom: 18px; }
}

@media (max-width: 560px) {
  .site-header { padding-inline: 14px; }
  .site-brand-context, .site-brand-divider { display: none; }
  .site-brand-name { font-size: 12px; }
  .site-brand img { width: 34px; height: 34px; }
  .header-language { height: 34px; padding-inline: 9px; }
  .header-language span { max-width: 86px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
  .login-main { padding: 20px 12px 20px; }
  .intro-title { font-size: clamp(28px, 9vw, 36px); }
  .intro-copy { display: none; }
  .visual-stage { height: 220px; margin-bottom: -56px; transform: scale(0.72); }
  .auth-card { padding: 22px 18px 20px; border-radius: 15px; }
  .auth-heading { padding: 22px 0 20px; }
  .auth-heading h2 { font-size: 31px; }
  .mobile-field-row { grid-template-columns: 122px minmax(0, 1fr); }
  .captcha-row { grid-template-columns: minmax(0, 1fr) 142px; }
  .auth-trust { gap: 11px; flex-wrap: wrap; }
  .login-footer { padding-inline: 10px; }
  .login-footer :deep(.footer-content) { flex-wrap: wrap; justify-content: center; text-align: center; }
}

@media (prefers-reduced-motion: reduce) {
  .visual-halo, .orbit, .ai-core, .float-chip, .network-path, .wave-bars i { animation: none; }
  .travel-dot { display: none; }
  .header-language, .mode-button, .field-shell, .primary-action { transition: none; }
}
</style>

<style lang="scss">
.mainstream-language-popper.el-popper,
.mainstream-select-popper.el-popper {
  border: 1px solid #e3e8ef !important;
  background: #ffffff !important;
  box-shadow: 0 14px 32px rgba(15, 23, 42, 0.12) !important;
}

.mainstream-language-popper .popper__arrow::after,
.mainstream-select-popper .popper__arrow::after {
  border-bottom-color: #ffffff !important;
}

.mainstream-language-popper .el-dropdown-menu { background: transparent; }

.mainstream-language-popper .el-dropdown-menu__item,
.mainstream-select-popper .el-select-dropdown__item {
  color: #596579;
  font-size: 12px;
}

.mainstream-language-popper .el-dropdown-menu__item:hover,
.mainstream-language-popper .el-dropdown-menu__item:focus,
.mainstream-select-popper .el-select-dropdown__item.hover,
.mainstream-select-popper .el-select-dropdown__item:hover {
  color: #1d4ed8;
  background: #f5f8ff;
}

.mainstream-select-popper .el-select-dropdown__item.selected { color: #1d4ed8; }
</style>
