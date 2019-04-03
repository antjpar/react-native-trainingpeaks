
package com.valerit.trainingpeaks;

import com.facebook.react.bridge.ReactApplicationContext;
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
}