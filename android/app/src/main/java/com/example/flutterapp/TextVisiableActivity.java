package com.example.flutterapp;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Build;
import android.text.TextUtils;
import android.view.Display;
import android.view.Gravity;
import android.view.ViewGroup;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * create by ${user} on ${date}
 * 邮箱613239283@qq.com
 * 实现 Flutter 和 Android 原生调用
 */
public class TextVisiableActivity implements MethodChannel.MethodCallHandler{
    private Activity activity;
    private TextView textView;
    private WebView webView;
    public static final String PLUGIN_TEXT = "text_plugin";

    @TargetApi(Build.VERSION_CODES.ECLAIR_MR1)
    public TextVisiableActivity(Activity activity) {
        this.activity = activity;
        textView = new TextView(activity);
        webView = new WebView(activity);

        webView.getSettings().setJavaScriptEnabled(true);
        webView.getSettings().setLoadWithOverviewMode(true);
        webView.getSettings().setCacheMode(WebSettings.LOAD_NO_CACHE);
        webView.getSettings().setLoadsImagesAutomatically(true);// 加载网页中的图片
        webView.getSettings().setUseWideViewPort(true); //设置使用视图的宽端口
        webView.getSettings().setAllowFileAccess(true);// 可以读取文件缓存(manifest生效)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            webView.getSettings().setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);
        }

    }

    /**
     * 注册插件  这个插件一定要在 MainActivity 中实现注册
     * 不然不能实现 Flutter 访问原生
     * @param registrar
     */
    public static void registerWith(PluginRegistry.Registrar registrar){
        final MethodChannel channel = new MethodChannel(registrar.messenger(), PLUGIN_TEXT);
        channel.setMethodCallHandler(new TextVisiableActivity(registrar.activity()));

    }


    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        Toast.makeText(activity,"方法"+methodCall.argument("textValue"),Toast.LENGTH_LONG).show();

        FrameLayout.LayoutParams params = buildLayoutParams(methodCall);
        LinearLayout linearLayout = new LinearLayout(activity);
        linearLayout.setOrientation(LinearLayout.VERTICAL);
        final TextView titleView = new TextView(activity);
        titleView.setSingleLine(true);
        titleView.setEllipsize(TextUtils.TruncateAt.END);
        titleView.setTextColor(Color.parseColor("#FFFFFF"));
        titleView.setPadding(dp2px(activity, 10), dp2px(activity, 20), dp2px(activity, 10), 0);
        ViewGroup.LayoutParams titleViewParams = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT);
        titleView.setLayoutParams(titleViewParams);
        titleView.setText("我是标题");
        titleView.setGravity(Gravity.CENTER);
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp2px(activity, 70));
        titleView.setLayoutParams(layoutParams);
        titleView.setBackgroundColor(Color.parseColor("#4876FF"));

        //linearLayout.addView(titleView);


        linearLayout.addView(webView);

        activity.addContentView(linearLayout, params);

//        this.textView.setTextSize(22);
//        this.textView.setTextColor(Color.parseColor("#323232"));
//        textView.setText(""+(Integer) methodCall.argument("textValue"));

        webView.setWebViewClient(new MyWebViewClient(activity, new WebClientLoadListener() {
            @Override
            public void loadFinished(String title, boolean isError) {
                titleView.setText(title);
            }
        }));

        webView.loadUrl(methodCall.argument("textValue").toString());

    }

    public class MyWebViewClient extends WebViewClient {
        private final WebClientLoadListener loadListener;
        Activity activity;

        private boolean isError;

        public MyWebViewClient(Activity activity, WebClientLoadListener loadListener) {
            this.activity = activity;
            this.loadListener = loadListener;
        }

        @Override
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            return super.shouldOverrideUrlLoading(view, url);
        }

        @Override
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            super.onPageStarted(view, url, favicon);
            isError = false;
        }

        @Override
        public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
            super.onReceivedError(view, request, error);
            isError = true;
        }

        /**
         * 界面加载完后回调
         *
         * @param view
         * @param url
         */
        @Override
        public void onPageFinished(WebView view, String url) {
            String title = view.getTitle(); // 获取网页标题
            loadListener.loadFinished(title, isError);
            super.onPageFinished(view, url);
        }

    }

    public interface WebClientLoadListener {
        void loadFinished(String title, boolean isError);
    }


    @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR2)
    private FrameLayout.LayoutParams buildLayoutParams(MethodCall call) {
        Map<String, Number> rc = call.argument("rect");
        FrameLayout.LayoutParams params;
        if (rc != null) {
            params = new FrameLayout.LayoutParams(
                    dp2px(activity, rc.get("width").intValue()), dp2px(activity, rc.get("height").intValue()));
            params.setMargins(dp2px(activity, rc.get("left").intValue()), dp2px(activity, rc.get("top").intValue()),
                    0, 0);
        } else {
            Display display = activity.getWindowManager().getDefaultDisplay();
            Point size = new Point();
            display.getSize(size);
            int width = size.x;
            int height = size.y;
            params = new FrameLayout.LayoutParams(width, height);
        }
        return params;
    }


    private int dp2px(Context context, float dp) {
        final float scale = context.getResources().getDisplayMetrics().density;
        return (int) (dp * scale + 0.5f);
    }

}
