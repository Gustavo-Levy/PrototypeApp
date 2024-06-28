; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [339 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [672 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 258
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 292
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 334
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 209
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 13: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 276
	i32 117431740, ; 14: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 15: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 276
	i32 122350210, ; 16: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 17: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 296
	i32 142721839, ; 18: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 19: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 20: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 21: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 232
	i32 176265551, ; 22: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 23: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 278
	i32 184328833, ; 24: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 25: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 331
	i32 199333315, ; 26: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 332
	i32 205061960, ; 27: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 28: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 230
	i32 220171995, ; 29: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 30: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 252
	i32 230752869, ; 31: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 32: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 33: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 34: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 35: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 180
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 235
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 254
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 251
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 303
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 331
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 221
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 316
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 253
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 315
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 56: _Microsoft.Android.Resource.Designer => 0x17969339 => 335
	i32 403441872, ; 57: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 58: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 327
	i32 441335492, ; 59: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 236
	i32 442565967, ; 60: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 61: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 249
	i32 451504562, ; 62: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 63: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 64: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 65: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 66: System.dll => 0x1bff388e => 164
	i32 476646585, ; 67: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 251
	i32 486930444, ; 68: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 264
	i32 498788369, ; 69: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 70: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 314
	i32 503918385, ; 71: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 308
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 202
	i32 526420162, ; 73: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 74: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 296
	i32 530272170, ; 75: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 76: Microsoft.Extensions.Logging => 0x20216150 => 198
	i32 540030774, ; 77: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 78: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 79: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 80: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 81: Jsr305Binding => 0x213954e7 => 289
	i32 569601784, ; 82: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 287
	i32 571435654, ; 83: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 195
	i32 577335427, ; 84: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 85: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 322
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 618636221, ; 89: K4os.Compression.LZ4.Streams => 0x24dfa3bd => 177
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 241
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 320
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 247
	i32 643868501, ; 93: System.Net => 0x2660a755 => 81
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 283
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 228
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 99: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 302
	i32 690569205, ; 100: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 101: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 298
	i32 693804605, ; 102: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 103: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 104: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 293
	i32 700358131, ; 105: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 106: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 317
	i32 709557578, ; 107: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 305
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 297
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 218
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 326
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 201
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 242
	i32 804008546, ; 119: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 184
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 256
	i32 809851609, ; 122: System.Drawing.Common.dll => 0x30455ad9 => 213
	i32 823281589, ; 123: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 124: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 125: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 126: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 127: Xamarin.AndroidX.Print => 0x3246f6cd => 269
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 131: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 133: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 329
	i32 928116545, ; 134: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 292
	i32 952186615, ; 135: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 297
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 290
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 253
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 983077409, ; 141: MySql.Data.dll => 0x3a989221 => 210
	i32 986514023, ; 142: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 143: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 144: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 145: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 146: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 197
	i32 1001831731, ; 147: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 148: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 273
	i32 1019214401, ; 149: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 150: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 192
	i32 1029334545, ; 151: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 304
	i32 1031528504, ; 152: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 291
	i32 1035644815, ; 153: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 226
	i32 1036536393, ; 154: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 155: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 260
	i32 1067306892, ; 157: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 158: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 159: Xamarin.Kotlin.StdLib => 0x409e66d8 => 294
	i32 1098259244, ; 160: System => 0x41761b2c => 164
	i32 1106973742, ; 161: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 189
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 317
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 259
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 200
	i32 1145483052, ; 165: System.Windows.Extensions.dll => 0x4446af2c => 216
	i32 1149092582, ; 166: Xamarin.AndroidX.Window => 0x447dc2e6 => 286
	i32 1168523401, ; 167: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 323
	i32 1170634674, ; 168: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 169: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 193
	i32 1175144683, ; 170: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 282
	i32 1178241025, ; 171: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 267
	i32 1203215381, ; 172: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 321
	i32 1204270330, ; 173: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 228
	i32 1208641965, ; 174: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 175: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 176: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 319
	i32 1243150071, ; 177: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 287
	i32 1253011324, ; 178: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 179: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 303
	i32 1264511973, ; 180: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 277
	i32 1267360935, ; 181: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 281
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 233
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 298
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 225
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 244
	i32 1309188875, ; 186: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 187: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 286
	i32 1324164729, ; 188: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 189: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 190: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 191: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 333
	i32 1376866003, ; 192: Xamarin.AndroidX.SavedState => 0x52114ed3 => 273
	i32 1379779777, ; 193: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 194: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 195: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 237
	i32 1408764838, ; 196: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 197: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 198: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 199: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 301
	i32 1434145427, ; 200: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 201: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 290
	i32 1439761251, ; 202: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 203: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 204: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 205: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 194
	i32 1457743152, ; 206: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 207: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 208: es\Microsoft.Maui.Controls.resources => 0x57152abe => 307
	i32 1461234159, ; 209: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 210: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 211: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 212: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 227
	i32 1470490898, ; 213: Microsoft.Extensions.Primitives => 0x57a5e912 => 202
	i32 1479771757, ; 214: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 215: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 216: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1487250139, ; 217: K4os.Hash.xxHash => 0x58a5a2db => 178
	i32 1490025113, ; 218: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 274
	i32 1493001747, ; 219: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 311
	i32 1511525525, ; 220: MySqlConnector => 0x5a180c95 => 211
	i32 1514721132, ; 221: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 306
	i32 1521091094, ; 222: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 197
	i32 1536373174, ; 223: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 224: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 225: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 226: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 184
	i32 1550322496, ; 227: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 228: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 326
	i32 1565862583, ; 229: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 230: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 231: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 232: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 233: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 243
	i32 1592978981, ; 234: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 235: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 291
	i32 1601112923, ; 236: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 237: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 238: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 239: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 263
	i32 1622358360, ; 240: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 241: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 285
	i32 1632842087, ; 242: Microsoft.Extensions.Configuration.Json => 0x61533167 => 190
	i32 1635184631, ; 243: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 247
	i32 1636350590, ; 244: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 240
	i32 1639515021, ; 245: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 246: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 247: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 248: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 183
	i32 1657153582, ; 249: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 250: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 279
	i32 1658251792, ; 251: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 288
	i32 1670060433, ; 252: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 235
	i32 1675553242, ; 253: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 254: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 255: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 256: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 257: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 258: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 259: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 295
	i32 1701541528, ; 260: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 261: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 256
	i32 1726116996, ; 262: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 263: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 264: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 231
	i32 1736233607, ; 265: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 324
	i32 1743415430, ; 266: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 302
	i32 1744735666, ; 267: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 268: System.IO.Pipelines.dll => 0x68139a0d => 214
	i32 1746316138, ; 269: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 270: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 271: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 272: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 182
	i32 1763938596, ; 273: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 274: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 275: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 278
	i32 1770582343, ; 276: Microsoft.Extensions.Logging.dll => 0x6988f147 => 198
	i32 1776026572, ; 277: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 278: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 279: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 280: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 318
	i32 1788241197, ; 281: Xamarin.AndroidX.Fragment => 0x6a96652d => 249
	i32 1793755602, ; 282: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 310
	i32 1808609942, ; 283: Xamarin.AndroidX.Loader => 0x6bcd3296 => 263
	i32 1813058853, ; 284: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 294
	i32 1813201214, ; 285: Xamarin.Google.Android.Material => 0x6c13413e => 288
	i32 1818569960, ; 286: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 268
	i32 1818787751, ; 287: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 288: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 289: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 290: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 199
	i32 1829150748, ; 291: System.Windows.Extensions => 0x6d06a01c => 216
	i32 1842015223, ; 292: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 330
	i32 1847515442, ; 293: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 218
	i32 1853025655, ; 294: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 327
	i32 1858542181, ; 295: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 296: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 297: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 309
	i32 1879696579, ; 298: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 299: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 229
	i32 1888955245, ; 300: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 301: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 302: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 303: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 304: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1925302748, ; 305: K4os.Compression.LZ4.dll => 0x72c1c9dc => 176
	i32 1939592360, ; 306: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 307: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 308: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 275
	i32 1968388702, ; 309: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 186
	i32 1983156543, ; 310: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 295
	i32 1985761444, ; 311: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 220
	i32 2003115576, ; 312: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 306
	i32 2011961780, ; 313: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 314: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 260
	i32 2025202353, ; 315: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 301
	i32 2031763787, ; 316: Xamarin.Android.Glide => 0x791a414b => 217
	i32 2045470958, ; 317: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 318: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 188
	i32 2055257422, ; 319: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 255
	i32 2060060697, ; 320: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 321: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 305
	i32 2070888862, ; 322: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 323: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 196
	i32 2079903147, ; 324: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 325: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 326: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 327: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 328: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 329: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 330: Microsoft.Maui => 0x80bd55ad => 207
	i32 2169148018, ; 331: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 313
	i32 2181898931, ; 332: Microsoft.Extensions.Options.dll => 0x820d22b3 => 201
	i32 2192057212, ; 333: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 199
	i32 2193016926, ; 334: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 335: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 299
	i32 2201231467, ; 336: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 337: it\Microsoft.Maui.Controls.resources => 0x839595db => 315
	i32 2217644978, ; 338: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 282
	i32 2222056684, ; 339: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 340: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 264
	i32 2252106437, ; 341: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 342: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 343: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 344: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 187
	i32 2267999099, ; 345: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 219
	i32 2270573516, ; 346: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 309
	i32 2279755925, ; 347: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 271
	i32 2293034957, ; 348: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 349: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 350: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 351: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 319
	i32 2305521784, ; 352: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 353: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 223
	i32 2320631194, ; 354: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 355: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 356: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 357: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 358: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 359: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 186
	i32 2378619854, ; 360: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 361: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 362: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 314
	i32 2401565422, ; 363: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 364: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 246
	i32 2411328690, ; 365: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 180
	i32 2421380589, ; 366: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 367: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 233
	i32 2427813419, ; 368: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 311
	i32 2435356389, ; 369: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 370: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 371: Microsoft.JSInterop.dll => 0x919672ca => 203
	i32 2454642406, ; 372: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 373: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 374: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 375: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 236
	i32 2471841756, ; 376: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 377: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 378: Microsoft.Maui.Controls => 0x93dba8a1 => 205
	i32 2483903535, ; 379: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 380: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2486824558, ; 381: K4os.Hash.xxHash.dll => 0x9439ee6e => 178
	i32 2490993605, ; 382: System.AppContext.dll => 0x94798bc5 => 6
	i32 2498657740, ; 383: BouncyCastle.Cryptography.dll => 0x94ee7dcc => 173
	i32 2501346920, ; 384: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 385: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 258
	i32 2522472828, ; 386: Xamarin.Android.Glide.dll => 0x9659e17c => 217
	i32 2537015816, ; 387: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 179
	i32 2538310050, ; 388: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 389: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 312
	i32 2562349572, ; 390: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 391: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 392: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 259
	i32 2581819634, ; 393: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 281
	i32 2585220780, ; 394: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 395: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 396: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 181
	i32 2589602615, ; 397: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 398: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 193
	i32 2593496499, ; 399: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 321
	i32 2605712449, ; 400: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 299
	i32 2611359322, ; 401: ZstdSharp.dll => 0x9ba62e5a => 300
	i32 2615233544, ; 402: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 250
	i32 2616218305, ; 403: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 200
	i32 2617129537, ; 404: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 405: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 406: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 240
	i32 2624644809, ; 407: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 245
	i32 2626831493, ; 408: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 316
	i32 2627185994, ; 409: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 410: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 411: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 254
	i32 2663391936, ; 412: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 219
	i32 2663698177, ; 413: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 414: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 415: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 416: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 417: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 418: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 183
	i32 2693849962, ; 419: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 420: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 279
	i32 2715334215, ; 421: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 422: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 423: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 424: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 425: Xamarin.AndroidX.Activity => 0xa2e0939b => 221
	i32 2735172069, ; 426: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 427: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 179
	i32 2737747696, ; 428: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 227
	i32 2740948882, ; 429: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 430: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 431: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 322
	i32 2758225723, ; 432: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 206
	i32 2764765095, ; 433: Microsoft.Maui.dll => 0xa4caf7a7 => 207
	i32 2765824710, ; 434: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 435: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 293
	i32 2778768386, ; 436: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 284
	i32 2779977773, ; 437: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 272
	i32 2785988530, ; 438: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 328
	i32 2788224221, ; 439: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 250
	i32 2801831435, ; 440: Microsoft.Maui.Graphics => 0xa7008e0b => 209
	i32 2803228030, ; 441: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 442: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 307
	i32 2810250172, ; 443: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 237
	i32 2819470561, ; 444: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 445: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 446: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 272
	i32 2824502124, ; 447: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 448: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 320
	i32 2833784645, ; 449: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 185
	i32 2838993487, ; 450: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 261
	i32 2841355853, ; 451: System.Security.Permissions => 0xa95ba64d => 215
	i32 2849599387, ; 452: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 453: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 284
	i32 2855708567, ; 454: Xamarin.AndroidX.Transition => 0xaa36a797 => 280
	i32 2861098320, ; 455: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 456: Microsoft.Maui.Essentials => 0xaa8a4878 => 208
	i32 2870099610, ; 457: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 222
	i32 2875164099, ; 458: Jsr305Binding.dll => 0xab5f85c3 => 289
	i32 2875220617, ; 459: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 460: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 248
	i32 2887636118, ; 461: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 462: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 182
	i32 2899753641, ; 463: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 464: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 465: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 466: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 467: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 468: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 196
	i32 2916838712, ; 469: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 285
	i32 2919462931, ; 470: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 471: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 224
	i32 2936416060, ; 472: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 473: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 474: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 475: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 212
	i32 2959614098, ; 476: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 477: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 478: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 479: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 244
	i32 2987532451, ; 480: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 275
	i32 2996846495, ; 481: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 257
	i32 3012788804, ; 482: System.Configuration.ConfigurationManager => 0xb3938244 => 212
	i32 3016983068, ; 483: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 277
	i32 3023353419, ; 484: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 485: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 252
	i32 3025069135, ; 486: K4os.Compression.LZ4.Streams.dll => 0xb44ee44f => 177
	i32 3038032645, ; 487: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 335
	i32 3056245963, ; 488: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 274
	i32 3057625584, ; 489: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 265
	i32 3059408633, ; 490: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 491: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 492: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 493: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 313
	i32 3089219899, ; 494: ZstdSharp => 0xb821c13b => 300
	i32 3090735792, ; 495: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 496: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 497: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 498: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 499: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 500: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 501: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 502: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 503: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 504: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 505: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 506: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 266
	i32 3192346100, ; 507: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 508: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 509: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 510: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 511: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 243
	i32 3213246214, ; 512: System.Security.Permissions.dll => 0xbf863f06 => 215
	i32 3220365878, ; 513: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 514: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 515: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 516: Xamarin.AndroidX.CardView => 0xc235e84d => 231
	i32 3265493905, ; 517: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 518: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 519: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 520: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 521: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 522: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 523: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 524: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 525: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 308
	i32 3316684772, ; 526: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 527: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 241
	i32 3317144872, ; 528: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 529: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 229
	i32 3345895724, ; 530: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 270
	i32 3346324047, ; 531: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 267
	i32 3357674450, ; 532: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 325
	i32 3358260929, ; 533: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 534: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 222
	i32 3362522851, ; 535: Xamarin.AndroidX.Core => 0xc86c06e3 => 238
	i32 3366347497, ; 536: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 537: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 271
	i32 3381016424, ; 538: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 304
	i32 3381033598, ; 539: K4os.Compression.LZ4 => 0xc9867a7e => 176
	i32 3395150330, ; 540: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 541: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 542: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 242
	i32 3406629867, ; 543: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 194
	i32 3421170118, ; 544: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 188
	i32 3428513518, ; 545: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 191
	i32 3429136800, ; 546: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 547: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 548: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 245
	i32 3445260447, ; 549: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 550: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 204
	i32 3463511458, ; 551: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 312
	i32 3464190856, ; 552: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 181
	i32 3467345667, ; 553: MySql.Data => 0xceab7f03 => 210
	i32 3471940407, ; 554: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 555: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 556: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 325
	i32 3484440000, ; 557: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 324
	i32 3485117614, ; 558: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 559: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 560: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 234
	i32 3499097210, ; 561: Google.Protobuf.dll => 0xd08ffc7a => 174
	i32 3500000672, ; 562: Microsoft.JSInterop => 0xd09dc5a0 => 203
	i32 3509114376, ; 563: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 564: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 565: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 566: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 567: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 568: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 569: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 332
	i32 3597029428, ; 570: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 220
	i32 3598340787, ; 571: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3604702656, ; 572: PrototypeApp => 0xd6db65c0 => 0
	i32 3605570793, ; 573: BouncyCastle.Cryptography => 0xd6e8a4e9 => 173
	i32 3608519521, ; 574: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 575: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 576: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 269
	i32 3633644679, ; 577: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 224
	i32 3638274909, ; 578: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 579: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 255
	i32 3643446276, ; 580: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 329
	i32 3643854240, ; 581: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 266
	i32 3645089577, ; 582: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 583: Google.Protobuf => 0xd94bea07 => 174
	i32 3657292374, ; 584: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 187
	i32 3660523487, ; 585: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 586: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 587: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 230
	i32 3684561358, ; 588: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 234
	i32 3689375977, ; 589: System.Drawing.Common => 0xdbe768e9 => 213
	i32 3697841164, ; 590: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 334
	i32 3700866549, ; 591: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 592: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 239
	i32 3716563718, ; 593: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 594: Xamarin.AndroidX.Annotation => 0xdda814c6 => 223
	i32 3722202641, ; 595: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 190
	i32 3724971120, ; 596: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 265
	i32 3732100267, ; 597: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 598: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 185
	i32 3737834244, ; 599: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 600: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 601: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 602: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 189
	i32 3786282454, ; 603: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 232
	i32 3792276235, ; 604: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 605: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 204
	i32 3802395368, ; 606: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 607: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 608: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 609: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 610: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 192
	i32 3844307129, ; 611: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 612: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 613: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 614: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 615: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 616: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 617: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 280
	i32 3888767677, ; 618: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 270
	i32 3889960447, ; 619: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 333
	i32 3896106733, ; 620: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 621: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 238
	i32 3901907137, ; 622: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 623: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 624: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 283
	i32 3928044579, ; 625: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 626: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 627: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 268
	i32 3945713374, ; 628: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 629: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 630: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 226
	i32 3959773229, ; 631: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 257
	i32 3980434154, ; 632: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 328
	i32 3987592930, ; 633: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 310
	i32 4003436829, ; 634: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 635: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 225
	i32 4023392905, ; 636: System.IO.Pipelines => 0xefd01a89 => 214
	i32 4025784931, ; 637: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 638: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 206
	i32 4054681211, ; 639: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 640: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 641: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4079385022, ; 642: MySqlConnector.dll => 0xf32679be => 211
	i32 4094352644, ; 643: Microsoft.Maui.Essentials.dll => 0xf40add04 => 208
	i32 4099507663, ; 644: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 645: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 646: Xamarin.AndroidX.Emoji2 => 0xf479582c => 246
	i32 4102112229, ; 647: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 323
	i32 4125707920, ; 648: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 318
	i32 4126470640, ; 649: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 191
	i32 4127667938, ; 650: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 651: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 652: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 653: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 330
	i32 4151237749, ; 654: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 655: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 656: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 657: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 658: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 659: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 262
	i32 4185676441, ; 660: System.Security => 0xf97c5a99 => 130
	i32 4186190175, ; 661: PrototypeApp.dll => 0xf984315f => 0
	i32 4196529839, ; 662: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 663: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 664: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 239
	i32 4258378803, ; 665: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 261
	i32 4260525087, ; 666: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 667: Microsoft.Maui.Controls.dll => 0xfea12dee => 205
	i32 4274976490, ; 668: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 669: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 262
	i32 4294648842, ; 670: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 195
	i32 4294763496 ; 671: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 248
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [672 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 258, ; 3
	i32 292, ; 4
	i32 48, ; 5
	i32 80, ; 6
	i32 145, ; 7
	i32 30, ; 8
	i32 334, ; 9
	i32 124, ; 10
	i32 209, ; 11
	i32 102, ; 12
	i32 276, ; 13
	i32 107, ; 14
	i32 276, ; 15
	i32 139, ; 16
	i32 296, ; 17
	i32 77, ; 18
	i32 124, ; 19
	i32 13, ; 20
	i32 232, ; 21
	i32 132, ; 22
	i32 278, ; 23
	i32 151, ; 24
	i32 331, ; 25
	i32 332, ; 26
	i32 18, ; 27
	i32 230, ; 28
	i32 26, ; 29
	i32 252, ; 30
	i32 1, ; 31
	i32 59, ; 32
	i32 42, ; 33
	i32 91, ; 34
	i32 180, ; 35
	i32 235, ; 36
	i32 147, ; 37
	i32 254, ; 38
	i32 251, ; 39
	i32 303, ; 40
	i32 54, ; 41
	i32 69, ; 42
	i32 331, ; 43
	i32 221, ; 44
	i32 83, ; 45
	i32 316, ; 46
	i32 253, ; 47
	i32 315, ; 48
	i32 131, ; 49
	i32 55, ; 50
	i32 149, ; 51
	i32 74, ; 52
	i32 145, ; 53
	i32 62, ; 54
	i32 146, ; 55
	i32 335, ; 56
	i32 165, ; 57
	i32 327, ; 58
	i32 236, ; 59
	i32 12, ; 60
	i32 249, ; 61
	i32 125, ; 62
	i32 152, ; 63
	i32 113, ; 64
	i32 166, ; 65
	i32 164, ; 66
	i32 251, ; 67
	i32 264, ; 68
	i32 84, ; 69
	i32 314, ; 70
	i32 308, ; 71
	i32 202, ; 72
	i32 150, ; 73
	i32 296, ; 74
	i32 60, ; 75
	i32 198, ; 76
	i32 51, ; 77
	i32 103, ; 78
	i32 114, ; 79
	i32 40, ; 80
	i32 289, ; 81
	i32 287, ; 82
	i32 195, ; 83
	i32 120, ; 84
	i32 322, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 177, ; 89
	i32 241, ; 90
	i32 320, ; 91
	i32 247, ; 92
	i32 81, ; 93
	i32 136, ; 94
	i32 283, ; 95
	i32 228, ; 96
	i32 8, ; 97
	i32 73, ; 98
	i32 302, ; 99
	i32 155, ; 100
	i32 298, ; 101
	i32 154, ; 102
	i32 92, ; 103
	i32 293, ; 104
	i32 45, ; 105
	i32 317, ; 106
	i32 305, ; 107
	i32 297, ; 108
	i32 109, ; 109
	i32 129, ; 110
	i32 25, ; 111
	i32 218, ; 112
	i32 72, ; 113
	i32 55, ; 114
	i32 46, ; 115
	i32 326, ; 116
	i32 201, ; 117
	i32 242, ; 118
	i32 184, ; 119
	i32 22, ; 120
	i32 256, ; 121
	i32 213, ; 122
	i32 86, ; 123
	i32 43, ; 124
	i32 160, ; 125
	i32 71, ; 126
	i32 269, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 16, ; 131
	i32 53, ; 132
	i32 329, ; 133
	i32 292, ; 134
	i32 105, ; 135
	i32 297, ; 136
	i32 290, ; 137
	i32 253, ; 138
	i32 34, ; 139
	i32 158, ; 140
	i32 210, ; 141
	i32 85, ; 142
	i32 32, ; 143
	i32 12, ; 144
	i32 51, ; 145
	i32 197, ; 146
	i32 56, ; 147
	i32 273, ; 148
	i32 36, ; 149
	i32 192, ; 150
	i32 304, ; 151
	i32 291, ; 152
	i32 226, ; 153
	i32 35, ; 154
	i32 58, ; 155
	i32 260, ; 156
	i32 175, ; 157
	i32 17, ; 158
	i32 294, ; 159
	i32 164, ; 160
	i32 189, ; 161
	i32 317, ; 162
	i32 259, ; 163
	i32 200, ; 164
	i32 216, ; 165
	i32 286, ; 166
	i32 323, ; 167
	i32 153, ; 168
	i32 193, ; 169
	i32 282, ; 170
	i32 267, ; 171
	i32 321, ; 172
	i32 228, ; 173
	i32 29, ; 174
	i32 52, ; 175
	i32 319, ; 176
	i32 287, ; 177
	i32 5, ; 178
	i32 303, ; 179
	i32 277, ; 180
	i32 281, ; 181
	i32 233, ; 182
	i32 298, ; 183
	i32 225, ; 184
	i32 244, ; 185
	i32 85, ; 186
	i32 286, ; 187
	i32 61, ; 188
	i32 112, ; 189
	i32 57, ; 190
	i32 333, ; 191
	i32 273, ; 192
	i32 99, ; 193
	i32 19, ; 194
	i32 237, ; 195
	i32 111, ; 196
	i32 101, ; 197
	i32 102, ; 198
	i32 301, ; 199
	i32 104, ; 200
	i32 290, ; 201
	i32 71, ; 202
	i32 38, ; 203
	i32 32, ; 204
	i32 194, ; 205
	i32 103, ; 206
	i32 73, ; 207
	i32 307, ; 208
	i32 9, ; 209
	i32 123, ; 210
	i32 46, ; 211
	i32 227, ; 212
	i32 202, ; 213
	i32 9, ; 214
	i32 43, ; 215
	i32 4, ; 216
	i32 178, ; 217
	i32 274, ; 218
	i32 311, ; 219
	i32 211, ; 220
	i32 306, ; 221
	i32 197, ; 222
	i32 31, ; 223
	i32 138, ; 224
	i32 92, ; 225
	i32 184, ; 226
	i32 93, ; 227
	i32 326, ; 228
	i32 49, ; 229
	i32 141, ; 230
	i32 112, ; 231
	i32 140, ; 232
	i32 243, ; 233
	i32 115, ; 234
	i32 291, ; 235
	i32 157, ; 236
	i32 76, ; 237
	i32 79, ; 238
	i32 263, ; 239
	i32 37, ; 240
	i32 285, ; 241
	i32 190, ; 242
	i32 247, ; 243
	i32 240, ; 244
	i32 64, ; 245
	i32 138, ; 246
	i32 15, ; 247
	i32 183, ; 248
	i32 116, ; 249
	i32 279, ; 250
	i32 288, ; 251
	i32 235, ; 252
	i32 48, ; 253
	i32 70, ; 254
	i32 80, ; 255
	i32 126, ; 256
	i32 94, ; 257
	i32 121, ; 258
	i32 295, ; 259
	i32 26, ; 260
	i32 256, ; 261
	i32 97, ; 262
	i32 28, ; 263
	i32 231, ; 264
	i32 324, ; 265
	i32 302, ; 266
	i32 149, ; 267
	i32 214, ; 268
	i32 169, ; 269
	i32 4, ; 270
	i32 98, ; 271
	i32 182, ; 272
	i32 33, ; 273
	i32 93, ; 274
	i32 278, ; 275
	i32 198, ; 276
	i32 21, ; 277
	i32 41, ; 278
	i32 170, ; 279
	i32 318, ; 280
	i32 249, ; 281
	i32 310, ; 282
	i32 263, ; 283
	i32 294, ; 284
	i32 288, ; 285
	i32 268, ; 286
	i32 2, ; 287
	i32 134, ; 288
	i32 111, ; 289
	i32 199, ; 290
	i32 216, ; 291
	i32 330, ; 292
	i32 218, ; 293
	i32 327, ; 294
	i32 58, ; 295
	i32 95, ; 296
	i32 309, ; 297
	i32 39, ; 298
	i32 229, ; 299
	i32 25, ; 300
	i32 94, ; 301
	i32 89, ; 302
	i32 99, ; 303
	i32 10, ; 304
	i32 176, ; 305
	i32 87, ; 306
	i32 100, ; 307
	i32 275, ; 308
	i32 186, ; 309
	i32 295, ; 310
	i32 220, ; 311
	i32 306, ; 312
	i32 7, ; 313
	i32 260, ; 314
	i32 301, ; 315
	i32 217, ; 316
	i32 88, ; 317
	i32 188, ; 318
	i32 255, ; 319
	i32 154, ; 320
	i32 305, ; 321
	i32 33, ; 322
	i32 196, ; 323
	i32 116, ; 324
	i32 82, ; 325
	i32 20, ; 326
	i32 11, ; 327
	i32 162, ; 328
	i32 3, ; 329
	i32 207, ; 330
	i32 313, ; 331
	i32 201, ; 332
	i32 199, ; 333
	i32 84, ; 334
	i32 299, ; 335
	i32 64, ; 336
	i32 315, ; 337
	i32 282, ; 338
	i32 143, ; 339
	i32 264, ; 340
	i32 157, ; 341
	i32 41, ; 342
	i32 117, ; 343
	i32 187, ; 344
	i32 219, ; 345
	i32 309, ; 346
	i32 271, ; 347
	i32 131, ; 348
	i32 75, ; 349
	i32 66, ; 350
	i32 319, ; 351
	i32 172, ; 352
	i32 223, ; 353
	i32 143, ; 354
	i32 106, ; 355
	i32 151, ; 356
	i32 70, ; 357
	i32 156, ; 358
	i32 186, ; 359
	i32 121, ; 360
	i32 127, ; 361
	i32 314, ; 362
	i32 152, ; 363
	i32 246, ; 364
	i32 180, ; 365
	i32 141, ; 366
	i32 233, ; 367
	i32 311, ; 368
	i32 20, ; 369
	i32 14, ; 370
	i32 203, ; 371
	i32 135, ; 372
	i32 75, ; 373
	i32 59, ; 374
	i32 236, ; 375
	i32 167, ; 376
	i32 168, ; 377
	i32 205, ; 378
	i32 15, ; 379
	i32 74, ; 380
	i32 178, ; 381
	i32 6, ; 382
	i32 173, ; 383
	i32 23, ; 384
	i32 258, ; 385
	i32 217, ; 386
	i32 179, ; 387
	i32 91, ; 388
	i32 312, ; 389
	i32 1, ; 390
	i32 136, ; 391
	i32 259, ; 392
	i32 281, ; 393
	i32 134, ; 394
	i32 69, ; 395
	i32 181, ; 396
	i32 146, ; 397
	i32 193, ; 398
	i32 321, ; 399
	i32 299, ; 400
	i32 300, ; 401
	i32 250, ; 402
	i32 200, ; 403
	i32 88, ; 404
	i32 96, ; 405
	i32 240, ; 406
	i32 245, ; 407
	i32 316, ; 408
	i32 31, ; 409
	i32 45, ; 410
	i32 254, ; 411
	i32 219, ; 412
	i32 109, ; 413
	i32 158, ; 414
	i32 35, ; 415
	i32 22, ; 416
	i32 114, ; 417
	i32 183, ; 418
	i32 57, ; 419
	i32 279, ; 420
	i32 144, ; 421
	i32 118, ; 422
	i32 120, ; 423
	i32 110, ; 424
	i32 221, ; 425
	i32 139, ; 426
	i32 179, ; 427
	i32 227, ; 428
	i32 54, ; 429
	i32 105, ; 430
	i32 322, ; 431
	i32 206, ; 432
	i32 207, ; 433
	i32 133, ; 434
	i32 293, ; 435
	i32 284, ; 436
	i32 272, ; 437
	i32 328, ; 438
	i32 250, ; 439
	i32 209, ; 440
	i32 159, ; 441
	i32 307, ; 442
	i32 237, ; 443
	i32 163, ; 444
	i32 132, ; 445
	i32 272, ; 446
	i32 161, ; 447
	i32 320, ; 448
	i32 185, ; 449
	i32 261, ; 450
	i32 215, ; 451
	i32 140, ; 452
	i32 284, ; 453
	i32 280, ; 454
	i32 169, ; 455
	i32 208, ; 456
	i32 222, ; 457
	i32 289, ; 458
	i32 40, ; 459
	i32 248, ; 460
	i32 81, ; 461
	i32 182, ; 462
	i32 56, ; 463
	i32 37, ; 464
	i32 97, ; 465
	i32 166, ; 466
	i32 172, ; 467
	i32 196, ; 468
	i32 285, ; 469
	i32 82, ; 470
	i32 224, ; 471
	i32 98, ; 472
	i32 30, ; 473
	i32 159, ; 474
	i32 212, ; 475
	i32 18, ; 476
	i32 127, ; 477
	i32 119, ; 478
	i32 244, ; 479
	i32 275, ; 480
	i32 257, ; 481
	i32 212, ; 482
	i32 277, ; 483
	i32 165, ; 484
	i32 252, ; 485
	i32 177, ; 486
	i32 335, ; 487
	i32 274, ; 488
	i32 265, ; 489
	i32 170, ; 490
	i32 16, ; 491
	i32 144, ; 492
	i32 313, ; 493
	i32 300, ; 494
	i32 125, ; 495
	i32 118, ; 496
	i32 38, ; 497
	i32 115, ; 498
	i32 47, ; 499
	i32 142, ; 500
	i32 117, ; 501
	i32 34, ; 502
	i32 175, ; 503
	i32 95, ; 504
	i32 53, ; 505
	i32 266, ; 506
	i32 129, ; 507
	i32 153, ; 508
	i32 24, ; 509
	i32 161, ; 510
	i32 243, ; 511
	i32 215, ; 512
	i32 148, ; 513
	i32 104, ; 514
	i32 89, ; 515
	i32 231, ; 516
	i32 60, ; 517
	i32 142, ; 518
	i32 100, ; 519
	i32 5, ; 520
	i32 13, ; 521
	i32 122, ; 522
	i32 135, ; 523
	i32 28, ; 524
	i32 308, ; 525
	i32 72, ; 526
	i32 241, ; 527
	i32 24, ; 528
	i32 229, ; 529
	i32 270, ; 530
	i32 267, ; 531
	i32 325, ; 532
	i32 137, ; 533
	i32 222, ; 534
	i32 238, ; 535
	i32 168, ; 536
	i32 271, ; 537
	i32 304, ; 538
	i32 176, ; 539
	i32 101, ; 540
	i32 123, ; 541
	i32 242, ; 542
	i32 194, ; 543
	i32 188, ; 544
	i32 191, ; 545
	i32 163, ; 546
	i32 167, ; 547
	i32 245, ; 548
	i32 39, ; 549
	i32 204, ; 550
	i32 312, ; 551
	i32 181, ; 552
	i32 210, ; 553
	i32 17, ; 554
	i32 171, ; 555
	i32 325, ; 556
	i32 324, ; 557
	i32 137, ; 558
	i32 150, ; 559
	i32 234, ; 560
	i32 174, ; 561
	i32 203, ; 562
	i32 155, ; 563
	i32 130, ; 564
	i32 19, ; 565
	i32 65, ; 566
	i32 147, ; 567
	i32 47, ; 568
	i32 332, ; 569
	i32 220, ; 570
	i32 79, ; 571
	i32 0, ; 572
	i32 173, ; 573
	i32 61, ; 574
	i32 106, ; 575
	i32 269, ; 576
	i32 224, ; 577
	i32 49, ; 578
	i32 255, ; 579
	i32 329, ; 580
	i32 266, ; 581
	i32 14, ; 582
	i32 174, ; 583
	i32 187, ; 584
	i32 68, ; 585
	i32 171, ; 586
	i32 230, ; 587
	i32 234, ; 588
	i32 213, ; 589
	i32 334, ; 590
	i32 78, ; 591
	i32 239, ; 592
	i32 108, ; 593
	i32 223, ; 594
	i32 190, ; 595
	i32 265, ; 596
	i32 67, ; 597
	i32 185, ; 598
	i32 63, ; 599
	i32 27, ; 600
	i32 160, ; 601
	i32 189, ; 602
	i32 232, ; 603
	i32 10, ; 604
	i32 204, ; 605
	i32 11, ; 606
	i32 78, ; 607
	i32 126, ; 608
	i32 83, ; 609
	i32 192, ; 610
	i32 66, ; 611
	i32 107, ; 612
	i32 65, ; 613
	i32 128, ; 614
	i32 122, ; 615
	i32 77, ; 616
	i32 280, ; 617
	i32 270, ; 618
	i32 333, ; 619
	i32 8, ; 620
	i32 238, ; 621
	i32 2, ; 622
	i32 44, ; 623
	i32 283, ; 624
	i32 156, ; 625
	i32 128, ; 626
	i32 268, ; 627
	i32 23, ; 628
	i32 133, ; 629
	i32 226, ; 630
	i32 257, ; 631
	i32 328, ; 632
	i32 310, ; 633
	i32 29, ; 634
	i32 225, ; 635
	i32 214, ; 636
	i32 62, ; 637
	i32 206, ; 638
	i32 90, ; 639
	i32 87, ; 640
	i32 148, ; 641
	i32 211, ; 642
	i32 208, ; 643
	i32 36, ; 644
	i32 86, ; 645
	i32 246, ; 646
	i32 323, ; 647
	i32 318, ; 648
	i32 191, ; 649
	i32 50, ; 650
	i32 6, ; 651
	i32 90, ; 652
	i32 330, ; 653
	i32 21, ; 654
	i32 162, ; 655
	i32 96, ; 656
	i32 50, ; 657
	i32 113, ; 658
	i32 262, ; 659
	i32 130, ; 660
	i32 0, ; 661
	i32 76, ; 662
	i32 27, ; 663
	i32 239, ; 664
	i32 261, ; 665
	i32 7, ; 666
	i32 205, ; 667
	i32 110, ; 668
	i32 262, ; 669
	i32 195, ; 670
	i32 248 ; 671
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
