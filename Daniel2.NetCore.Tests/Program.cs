using System;
using System.IO;
using System.Runtime.InteropServices;
using Cinecoder.Interop;

namespace Daniel2.NetCore.Tests
{
    class Program
    {
        [DllImport("Cinecoder", PreserveSig = true)]
        private static extern int Cinecoder_CreateClassFactory([MarshalAs(UnmanagedType.Interface)] out ICC_ClassFactory f);

        [DllImport("Cinecoder", PreserveSig = true)]
        private static extern CC_VERSION_INFO Cinecoder_GetVersion();

        [DllImport("Cinecoder", PreserveSig = true)]
        public static extern int Cinecoder_SetErrorHandler([MarshalAs(UnmanagedType.Interface)] ICC_ErrorHandler err,
            [MarshalAs(UnmanagedType.Interface)] out ICC_ErrorHandler old);

        [DllImport("Cinecoder", PreserveSig = true)]
        public static extern int Cinecoder_GetErrorHandler([MarshalAs(UnmanagedType.Interface)] out ICC_ErrorHandler err);
        
        [DllImport("Cinecoder", PreserveSig = false)]
        [return: MarshalAs(UnmanagedType.LPStr)]
        public static extern string Cinecoder_GetErrorString(int error);

        private static ICC_ClassFactory _factory;
        private static ICC_Settings _settings;
        private static ICC_VideoEncoder _encoder;

        //License valid thru 15/11/2018
        internal const string Companyname = "cinegy";
        internal const string Licensekey = "RWEYZ6YKREC5YFSJYECDWHJYASGFYNPJY3SDW45HFBZNG77PT2TMZ64ERC9GZENF";
        
        static void Main(string[] args)
        {
            try
            {
                var version = Cinecoder_GetVersion();
                Console.WriteLine($"Cinecoder Version : {version.VersionHi}.{version.VersionLo}.{version.EditionNo}.{version.RevisionNo}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Probem getting cinecoder version: {ex.Message}");
            }

            try
            {
                var result = Cinecoder_CreateClassFactory(out _factory);

                if (result != 0)
                {
                    Console.WriteLine($"Cannot create Cinecoder factory - error code: {result}");
                }

                _factory.AssignLicense(Companyname, Licensekey);

                _encoder = (ICC_VideoEncoder)_factory.CreateInstanceByName("DanielVideoEncoder");

                if (_encoder == null)
                {
                    Console.WriteLine("Returned encoder instance is null");
                    return;
                }

                Console.WriteLine($"Got a Cinecoder Encoder: (timebase {_encoder.TimeBase})");

            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception creating Cinecoder factory, assigning license or instancing encoder: {ex.Message}");
            }

            Console.WriteLine("Hit enter to exit");
            Console.ReadLine();
        }
    }
}
