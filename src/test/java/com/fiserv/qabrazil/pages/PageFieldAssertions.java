package com.fiserv.qabrazil.pages;

import com.microsoft.playwright.assertions.LocatorAssertions;
import com.microsoft.playwright.assertions.PlaywrightAssertions;

import java.util.regex.Pattern;

class PageFieldAssertions implements LocatorAssertions {

    private final PageField pageField;
    private final LocatorAssertions delegate;

    PageFieldAssertions(PageField pageField) {
        this.pageField = pageField;
        this.delegate = PlaywrightAssertions.assertThat(pageField.getLocator());
    }

    @Override
    public LocatorAssertions not() {
        return delegate.not();
    }

    @Override
    public void isAttached() {
        delegate.isAttached();
    }

    @Override
    public void isAttached(IsAttachedOptions options) {
        delegate.isAttached(options);
    }

    @Override
    public void isChecked() {
        delegate.isChecked();
    }

    @Override
    public void isChecked(IsCheckedOptions options) {
        delegate.isChecked(options);
    }

    @Override
    public void isDisabled() {
        delegate.isDisabled();
    }

    @Override
    public void isDisabled(IsDisabledOptions options) {
        delegate.isDisabled(options);
    }

    @Override
    public void isEditable() {
        delegate.isEditable();
    }

    @Override
    public void isEditable(IsEditableOptions options) {
        delegate.isEditable(options);
    }

    @Override
    public void isEmpty() {
        delegate.isEmpty();
    }

    @Override
    public void isEmpty(IsEmptyOptions options) {
        delegate.isEmpty(options);
    }

    @Override
    public void isEnabled() {
        delegate.isEnabled();
    }

    @Override
    public void isEnabled(IsEnabledOptions options) {
        delegate.isEnabled(options);
    }

    @Override
    public void isFocused() {
        delegate.isFocused();
    }

    @Override
    public void isFocused(IsFocusedOptions options) {
        delegate.isFocused(options);
    }

    @Override
    public void isHidden() {
        delegate.isHidden();
    }

    @Override
    public void isHidden(IsHiddenOptions options) {
        delegate.isHidden(options);
    }

    @Override
    public void isInViewport() {
        delegate.isInViewport();
    }

    @Override
    public void isInViewport(IsInViewportOptions options) {
        delegate.isInViewport(options);
    }

    @Override
    public void isVisible() {
        pageField.highlightIfPossible();
        delegate.isVisible();
    }

    @Override
    public void isVisible(IsVisibleOptions options) {
        delegate.isVisible(options);
    }

    @Override
    public void containsText(String expected) {
        delegate.containsText(expected);
    }

    @Override
    public void containsText(String expected, ContainsTextOptions options) {
        delegate.containsText(expected, options);
    }

    @Override
    public void containsText(Pattern expected) {
        delegate.containsText(expected);
    }

    @Override
    public void containsText(Pattern expected, ContainsTextOptions options) {
        delegate.containsText(expected, options);
    }

    @Override
    public void containsText(String[] expected) {
        delegate.containsText(expected);
    }

    @Override
    public void containsText(String[] expected, ContainsTextOptions options) {
        delegate.containsText(expected, options);
    }

    @Override
    public void containsText(Pattern[] expected) {
        delegate.containsText(expected);
    }

    @Override
    public void containsText(Pattern[] expected, ContainsTextOptions options) {
        delegate.containsText(expected, options);
    }

    @Override
    public void hasAttribute(String name, String value) {
        delegate.hasAttribute(name, value);
    }

    @Override
    public void hasAttribute(String name, String value, HasAttributeOptions options) {
        delegate.hasAttribute(name, value, options);
    }

    @Override
    public void hasAttribute(String name, Pattern value) {
        delegate.hasAttribute(name, value);
    }

    @Override
    public void hasAttribute(String name, Pattern value, HasAttributeOptions options) {
        delegate.hasAttribute(name, value, options);
    }

    @Override
    public void hasClass(String expected) {
        delegate.hasClass(expected);
    }

    @Override
    public void hasClass(String expected, HasClassOptions options) {
        delegate.hasClass(expected, options);
    }

    @Override
    public void hasClass(Pattern expected) {
        delegate.hasClass(expected);
    }

    @Override
    public void hasClass(Pattern expected, HasClassOptions options) {
        delegate.hasClass(expected, options);
    }

    @Override
    public void hasClass(String[] expected) {
        delegate.hasClass(expected);
    }

    @Override
    public void hasClass(String[] expected, HasClassOptions options) {
        delegate.hasClass(expected, options);
    }

    @Override
    public void hasClass(Pattern[] expected) {
        delegate.hasClass(expected);
    }

    @Override
    public void hasClass(Pattern[] expected, HasClassOptions options) {
        delegate.hasClass(expected, options);
    }

    @Override
    public void hasCount(int count) {
        delegate.hasCount(count);
    }

    @Override
    public void hasCount(int count, HasCountOptions options) {
        delegate.hasCount(count, options);
    }

    @Override
    public void hasCSS(String name, String value) {
        delegate.hasCSS(name, value);
    }

    @Override
    public void hasCSS(String name, String value, HasCSSOptions options) {
        delegate.hasCSS(name, value, options);
    }

    @Override
    public void hasCSS(String name, Pattern value) {
        delegate.hasCSS(name, value);
    }

    @Override
    public void hasCSS(String name, Pattern value, HasCSSOptions options) {
        delegate.hasCSS(name, value, options);
    }

    @Override
    public void hasId(String id) {
        delegate.hasId(id);
    }

    @Override
    public void hasId(String id, HasIdOptions options) {
        delegate.hasId(id, options);
    }

    @Override
    public void hasId(Pattern id) {
        delegate.hasId(id);
    }

    @Override
    public void hasId(Pattern id, HasIdOptions options) {
        delegate.hasId(id, options);
    }

    @Override
    public void hasJSProperty(String name, Object value) {
        delegate.hasJSProperty(name, value);
    }

    @Override
    public void hasJSProperty(String name, Object value, HasJSPropertyOptions options) {
        delegate.hasJSProperty(name, value, options);
    }

    @Override
    public void hasText(String expected) {
        delegate.hasText(expected);
    }

    @Override
    public void hasText(String expected, HasTextOptions options) {
        delegate.hasText(expected, options);
    }

    @Override
    public void hasText(Pattern expected) {
        delegate.hasText(expected);
    }

    @Override
    public void hasText(Pattern expected, HasTextOptions options) {
        delegate.hasText(expected, options);
    }

    @Override
    public void hasText(String[] expected) {
        delegate.hasText(expected);
    }

    @Override
    public void hasText(String[] expected, HasTextOptions options) {
        delegate.hasText(expected, options);
    }

    @Override
    public void hasText(Pattern[] expected) {
        delegate.hasText(expected);
    }

    @Override
    public void hasText(Pattern[] expected, HasTextOptions options) {
        delegate.hasText(expected, options);
    }

    @Override
    public void hasValue(String value) {
        delegate.hasValue(value);
    }

    @Override
    public void hasValue(String value, HasValueOptions options) {
        delegate.hasValue(value, options);
    }

    @Override
    public void hasValue(Pattern value) {
        delegate.hasValue(value);
    }

    @Override
    public void hasValue(Pattern value, HasValueOptions options) {
        delegate.hasValue(value, options);
    }

    @Override
    public void hasValues(String[] values) {
        delegate.hasValues(values);
    }

    @Override
    public void hasValues(String[] values, HasValuesOptions options) {
        delegate.hasValues(values, options);
    }

    @Override
    public void hasValues(Pattern[] values) {
        delegate.hasValues(values);
    }

    @Override
    public void hasValues(Pattern[] values, HasValuesOptions options) {
        delegate.hasValues(values, options);
    }
}
