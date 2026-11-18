<template>
  <div class="rich-text-editor" :class="{ 'is-disabled': disabled }">
    <div class="rich-toolbar">
      <button type="button" title="加粗" @mousedown.prevent="exec('bold')"><strong>B</strong></button>
      <button type="button" title="斜体" @mousedown.prevent="exec('italic')"><em>I</em></button>
      <button type="button" title="下划线" @mousedown.prevent="exec('underline')"><u>U</u></button>
      <button type="button" title="删除线" @mousedown.prevent="exec('strikeThrough')"><s>S</s></button>
      <span class="toolbar-divider"></span>
      <button type="button" title="无序列表" @mousedown.prevent="exec('insertUnorderedList')">• 列表</button>
      <button type="button" title="有序列表" @mousedown.prevent="exec('insertOrderedList')">1. 列表</button>
      <span class="toolbar-divider"></span>
      <button type="button" title="清除格式" @mousedown.prevent="exec('removeFormat')">清除格式</button>
      <button
        v-if="aiSummaryEnabled"
        type="button"
        class="toolbar-ai-summary"
        :disabled="disabled || aiSummaryLoading"
        @click="$emit('ai-summary')"
      >
        <i v-if="aiSummaryLoading" class="el-icon-loading"></i>
        {{ aiSummaryLoading ? aiSummaryLoadingLabel : aiSummaryLabel }}
      </button>
    </div>
    <div
      ref="editor"
      class="rich-content"
      contenteditable="true"
      :data-placeholder="placeholder"
      @input="handleInput"
      @blur="handleInput"
      @keydown="handleKeydown"
    ></div>
  </div>
</template>

<script>
const ALLOWED_TAGS = new Set([
  "P", "BR", "DIV", "STRONG", "B", "EM", "I", "U", "S", "STRIKE", "UL", "OL", "LI"
]);

export default {
  name: "RichTextEditor",
  props: {
    value: { type: String, default: "" },
    placeholder: { type: String, default: "" },
    disabled: { type: Boolean, default: false },
    aiSummaryEnabled: { type: Boolean, default: false },
    aiSummaryLoading: { type: Boolean, default: false },
    aiSummaryLabel: { type: String, default: "AI总结" },
    aiSummaryLoadingLabel: { type: String, default: "总结中..." }
  },
  mounted() {
    this.$refs.editor.innerHTML = this.sanitize(this.value || "");
  },
  watch: {
    value(newValue) {
      const html = this.sanitize(newValue || "");
      if (html !== this.$refs.editor.innerHTML) {
        this.$refs.editor.innerHTML = html;
      }
    },
    disabled() {
      this.$refs.editor.contentEditable = this.disabled ? "false" : "true";
    }
  },
  methods: {
    sanitize(html) {
      const container = document.createElement("div");
      container.innerHTML = html || "";

      const walk = node => {
        [...node.childNodes].forEach(child => {
          if (child.nodeType === Node.COMMENT_NODE) {
            child.remove();
            return;
          }
          if (child.nodeType === Node.TEXT_NODE) return;
          if (child.nodeType !== Node.ELEMENT_NODE) {
            child.remove();
            return;
          }
          walk(child);
          if (!ALLOWED_TAGS.has(child.tagName)) {
            const fragment = document.createDocumentFragment();
            while (child.firstChild) fragment.appendChild(child.firstChild);
            child.replaceWith(fragment);
            return;
          }
          [...child.attributes].forEach(attr => child.removeAttribute(attr.name));
        });
      };

      walk(container);
      return container.innerHTML;
    },
    plainText(html) {
      const container = document.createElement("div");
      container.innerHTML = html || "";
      return container.textContent.replace(/\s+/g, " ").trim();
    },
    exec(command) {
      if (this.disabled) return;
      this.$refs.editor.focus();
      document.execCommand(command, false, null);
      this.handleInput();
    },
    handleInput() {
      const html = this.sanitize(this.$refs.editor.innerHTML);
      this.$emit("input", html);
    },
    handleKeydown(event) {
      if (event.key === "Enter" && !event.shiftKey) {
        event.preventDefault();
        document.execCommand("insertLineBreak");
        this.handleInput();
      }
    },
    focus() {
      this.$refs.editor.focus();
    },
    insertText(text) {
      this.$refs.editor.focus();
      document.execCommand("insertText", false, text);
      this.handleInput();
    }
  }
};
</script>

<style scoped>
.rich-text-editor {
  text-align: left;
  border: 1px solid #dcdfe6;
  border-radius: 5px;
  background: #fff;
  overflow: hidden;
}

.rich-toolbar {
  justify-content: flex-start;
  display: flex;
  align-items: center;
  gap: 4px;
  padding: 6px 8px;
  border-bottom: 1px solid #e4e7ed;
  background: #f7f9fc;
}

.rich-toolbar button {
  min-width: 30px;
  padding: 3px 8px;
  border: 0;
  border-radius: 4px;
  background: transparent;
  color: #606266;
  font-size: 12px;
  cursor: pointer;
}

.rich-toolbar button:hover {
  color: #5778ff;
  background: #edf2ff;
}

.rich-toolbar button.toolbar-ai-summary {
  color: #5778ff;
  font-weight: 600;
}

.rich-toolbar button.toolbar-ai-summary i {
  margin-right: 4px;
}

.rich-toolbar button.toolbar-ai-summary:disabled {
  color: #9aa3c7;
  background: transparent;
  cursor: not-allowed;
  opacity: 0.8;
}

.toolbar-divider {
  width: 1px;
  height: 18px;
  margin: 0 4px;
  background: #dcdfe6;
}

.rich-content {
  text-align: left;
  min-height: 180px;
  max-height: 340px;
  padding: 10px 12px;
  overflow-y: auto;
  color: #606266;
  font-size: 14px;
  line-height: 1.6;
  outline: none;
  word-break: break-word;
}

.rich-content:empty::before {
  color: #c0c4cc;
  content: attr(data-placeholder);
}

.rich-content :deep(strong) { font-weight: 700; }
.rich-content :deep(ul),
.rich-content :deep(ol) { padding-left: 20px; margin: 6px 0; }

.is-disabled .rich-content {
  background: #f5f7fa;
  cursor: not-allowed;
}
</style>
