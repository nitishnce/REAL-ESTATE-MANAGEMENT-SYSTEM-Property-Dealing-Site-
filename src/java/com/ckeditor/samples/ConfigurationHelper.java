package com.ckeditor.samples;
 
import java.util.ArrayList;
import java.util.List;
 
import com.ckeditor.CKEditorConfig;
import com.ckeditor.EventHandler;
import com.ckeditor.GlobalEventHandler;
 
public class ConfigurationHelper {
 
 
	public static CKEditorConfig createConfig() {
		CKEditorConfig config = new CKEditorConfig();
		
		config.addConfigValue("toolbar", "{ name: 'links', groups: [ 'links' ] },\n" +
"		{ name: 'insert', groups: [ 'insert' ] },\n" +
"		{ name: 'forms', groups: [ 'forms' ] },\n" +
"		{ name: 'tools', groups: [ 'tools' ] },\n" +
"		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },\n" +
"		{ name: 'others', groups: [ 'others' ] },\n" +
"		'/',\n" +
"		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },\n" +
"		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },\n" +
"		{ name: 'styles', groups: [ 'styles' ] },\n" +
"		{ name: 'colors', groups: [ 'colors' ] },\n" +
"		{ name: 'about', groups: [ 'about' ] }\n" +
"	");
		config.addConfigValue("width","100%");
		return config;
	}
 
	public static EventHandler createEventHandlers() {
		EventHandler handler = new EventHandler();
		handler.addEventHandler("instanceReady","function (ev) { alert(\"Loaded: \" + ev.editor.name); }");
		return handler;
	}
 
	public static GlobalEventHandler createGlobalEventHandlers() {
		GlobalEventHandler handler = new GlobalEventHandler();
		handler.addEventHandler("dialogDefinition","function (ev) {  alert(\"Loading dialog window: \" + ev.data.name); }");
		return handler;
	}
}