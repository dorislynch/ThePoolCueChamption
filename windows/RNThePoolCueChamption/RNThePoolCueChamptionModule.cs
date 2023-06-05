using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace The.Pool.Cue.Chamption.RNThePoolCueChamption
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNThePoolCueChamptionModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNThePoolCueChamptionModule"/>.
        /// </summary>
        internal RNThePoolCueChamptionModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNThePoolCueChamption";
            }
        }
    }
}
