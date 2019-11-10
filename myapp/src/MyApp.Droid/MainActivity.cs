using System;
using System.Diagnostics;
using System.Threading.Tasks;

using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Runtime;

using Xamarin.Forms;
using Xamarin.Forms.Platform.Android;

using MyApp;

namespace MyApp.Droid
{
    [Activity(Name = "com.mycompany.myapp.MainActivity",
              Label = "MyApp",
              MainLauncher = true,
              LaunchMode = LaunchMode.SingleTop,
              ScreenOrientation=ScreenOrientation.Portrait,
              ConfigurationChanges = ConfigChanges.ScreenSize)]
    public class MainActivity : FormsAppCompatActivity
    {
        protected override void OnCreate(Bundle bundle)
        {
            // TabLayoutResource = Resource.Layout.Tabbar;
            // ToolbarResource = Resource.Layout.Toolbar;

            base.OnCreate(bundle);
            Forms.Init(this, bundle);
            Xamarin.Essentials.Platform.Init(this, bundle);
            LoadApplication(new App());
        }
    }
}
