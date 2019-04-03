
package com.valerit.trainingpeaks;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNTrainingPeaksModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNTrainingPeaksModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNTrainingPeaks";
  }

/*
* */
  @ReactMethod
  public void login(String client_id, String redirect_uri, String response_type, String scope, Boolean isSandbox) {
    String sandboxUrl = "https://oauth.sandbox.trainingpeaks.com/OAuth/Authorize";
    String productionUrl = "https://oauth.trainingpeaks.com/OAuth/Authorize";

    response_type = response_type == null ? "code" : response_type;
    scope = scope == null ? "events:write,events:read,athlete:profile" : scope;

    if (client_id == null) {
      Log.e("rn-tp:", "client_id missing!");
      return;
    }

    if (redirect_uri == null) {
      Log.e("rn-tp:", "redirect_uri missing!");
      return;
    }

    Uri intentUri = Uri.parse(isSandbox ? sandboxUrl : productionUrl)
            .buildUpon()
            .appendQueryParameter("client_id", client_id)
            .appendQueryParameter("redirect_uri", redirect_uri)
            .appendQueryParameter("response_type", response_type)
            .appendQueryParameter("scope", scope)
            .build();

    Intent intent = new Intent(Intent.ACTION_VIEW, intentUri);
    intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    ReactContext context = getReactApplicationContext();
    context.startActivity(intent);
  }
}
