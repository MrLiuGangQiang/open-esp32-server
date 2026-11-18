"""Characterization tests for core/utils/textUtils.py."""
from core.utils.textUtils import (
    get_emoji_whitelist,
    is_emoji_enabled,
    is_emoji,
    is_punctuation_or_emoji,
    get_string_no_punctuation_or_emoji,
    check_emoji,
)


def test_is_emoji_returns_true_for_smile():
    assert is_emoji("🙂") is True


def test_is_emoji_returns_false_for_ascii_letter():
    assert is_emoji("a") is False


def test_is_emoji_returns_false_for_chinese_char():
    assert is_emoji("你") is False


def test_is_punctuation_or_emoji_for_chinese_comma():
    assert is_punctuation_or_emoji("，") is True


def test_is_punctuation_or_emoji_for_space():
    assert is_punctuation_or_emoji(" ") is True


def test_is_punctuation_or_emoji_for_letter_is_false():
    assert is_punctuation_or_emoji("a") is False


def test_get_string_no_punctuation_or_emoji_strips_both_sides():
    assert get_string_no_punctuation_or_emoji("， 你好 。") == "你好"


def test_get_string_no_punctuation_or_emoji_no_punctuation():
    assert get_string_no_punctuation_or_emoji("你好") == "你好"


def test_get_string_no_punctuation_or_emoji_empty_string():
    assert get_string_no_punctuation_or_emoji("") == ""


def test_check_emoji_removes_emoji_keeps_text():
    assert check_emoji("hi 😀 there") == "hi  there"


def test_check_emoji_removes_newlines():
    assert check_emoji("a\nb") == "ab"

def test_emoji_enabled_defaults_to_true():
    assert is_emoji_enabled({}) is True


def test_emoji_can_be_disabled_by_config():
    assert is_emoji_enabled({"emoji": {"enabled": False}}) is False
    assert is_emoji_enabled({"emoji": {"enabled": "false"}}) is False


def test_emoji_whitelist_can_be_configured():
    smile = chr(0x1F642)
    thinking = chr(0x1F914)
    config = {"emoji": {"list": [smile, thinking]}}
    assert get_emoji_whitelist(config) == [smile, thinking]


def test_emoji_mapping_can_be_extended():
    from core.utils import textUtils

    test_emoji = chr(0x1F9EA)
    smile = chr(0x1F642)
    config = {"emoji": {"mapping": {test_emoji: "testing"}}}
    _, mapping, _ = textUtils._get_emoji_settings(config)
    assert mapping[test_emoji] == "testing"
    assert mapping[smile] == "happy"
