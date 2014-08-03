# coding: utf-8

require "mobilywscli/version"

require 'net/https'
require 'net/http'
require 'open-uri'

module Mobilywscli
  
  API_BASE_URI = "http://mobily.ws/api/"
  
  USERNAME  = ENV['MOBILYWS_USERNAME']
  PASSWORD  = ENV['MOBILYWS_PASSWORD']
  SENDER  = ENV['MOBILYWS_SENDER']
  
  class << self; attr_accessor :current_result_message; end
  
  #============================================
  
  # Check for mobilyws gateway status
  def Mobilywscli.send_status
    url = URI.parse("#{API_BASE_URI}sendStatus.php")
    result = result_messages(Net::HTTP.get(url), 0)
    Mobilywscli.current_result_message = result
  end
  
  #============================================
  
  # Check for balance
  def Mobilywscli.get_balance
    url = URI.parse("#{API_BASE_URI}balance.php?mobile=#{USERNAME}&password=#{PASSWORD}")
    result = result_messages(Net::HTTP.get(url), 1)
    Mobilywscli.current_result_message = result
  end
  
  #============================================
  
  # Send message
  def Mobilywscli.send(numbers, message)
    
    message = convert_to_unicode(message)
    
    url = URI.parse(URI.encode("#{API_BASE_URI}msgSend.php?mobile=#{USERNAME}&password=#{PASSWORD}&numbers=#{numbers}&msg=#{message}&sender=#{SENDER}&applicationType=24"))
  
    result = result_messages(Net::HTTP.get(url), 2)
    
    Mobilywscli.current_result_message = result
       
  end
  
  #============================================
  
  # Result messages handler
  def Mobilywscli.result_messages(q, op_type)
    
    # Get current sttaus of mobily gateway
    if op_type == 0
      
      if q == '1'
        result = "خدمة الإرسال متوفرة الآن ويمكن إرسال الرسائل"      
      else
        result = "خدمة الإرسال غير متوفرة الآن"
      end
    
    # Get current balance
    elsif op_type == 1 
      
      case q
      when '1'
        result = "إسم المستخدم غير صحيح فضلا تأكد من أن إسم المستخدم هو نفس الإسم الذي تستخدمه عن الدخول إلى موقع موبايلي"
      when '2'
        result = "كلمة المرور غير صحيحه فضلا تأكد من أن كلمة المرور هو نفسها التي تستخدمها عن الدخول إلى موقع موبايلي"
      when '-1'
        result = " لم يتم التواصل مع خادم (Server) الإرسال موبايلي بنجاح. (قد يكون هناك محاولات إرسال كثيرة تمت معا , أو قد يكون هناك عطل مؤقت طرأ على الخادم إذا إستمرت المشكلة يرجى التواصل مع الدعم الفني)"
      when '-2'
        result = " لم يتم الربط مع قاعدة البيانات (Database) التي تحتوي على حسابك وبياناتك لدى موبايلي. (قد يكون هناك محاولات إرسال كثيرة تمت معا , أو قد يكون هناك عطل مؤقت طرأ على الخادم إذا إستمرت المشكلة يرجى التواصل مع الدعم الفني)"
      else
        current_balance = q.split('/')
        result = "Mobily current balance: #{current_balance[1]} of #{current_balance[0]}"
      end
    
      # Send message  
    elsif op_type == 2
      
      case q
      when '1'
        result = "تم إرسال الرسالة بنجاح"
      when '2'
        result = "الرصيد = 0"
      when '3'
        result = "الرصيد غير كافي"
      when '4'
        result = "رقم الجوال غير متوفر"
      when '5'
        result = "كلمة المرور خاطئة"
      when '6'
        result = "صفحة الإنترنت غير فعالة ، حاول الإرسال من جديد"
      when '13'
        result = "أسم المرسل غير مقبول"
      when '14'
        result = "إسم المرسل المستخدم غير فعال"
      when '15'
        result = "الأرقام المرسل لها غير صحيحية أو فارغة"
      when '16'
        result = "إسم المرسل فارغ"
      when '17'
        result = "نص الرسالة غير مشفر بالشكل الصحيح "
      when '-1'
        result = " لم يتم الربط مع قاعدة البيانات (Database) التي تحتوي على حسابك وبياناتك لدى موبايلي. (قد يكون هناك محاولات إرسال كثيرة تمت معا , أو قد يكون هناك عطل مؤقت طرأ على الخادم إذا إستمرت المشكلة يرجى التواصل مع الدعم الفني)"
      when '-2'
        result = " لم يتم التواصل مع خادم (Server) الإرسال موبايلي بنجاح. (قد يكون هناك محاولات إرسال كثيرة تمت معا , أو قد يكون هناك عطل مؤقت طرأ على الخادم إذا إستمرت المشكلة يرجى التواصل مع الدعم الفني)"
      else
        result = q
      end
      
    end
      
    
  end
 
  #============================================
  
  def Mobilywscli.convert_to_unicode(message)
    
chrarray = {
  
"،" => "060D" ,
"؛"=> "061B",
"؟"=> "061F",
"ء"=> "0621",
"آ"=> "0622",
"أ"=> "0623",
"ؤ"=> "0624",
"إ"=> "0625",
"ئ"=> "0626",
"ا"=> "0627",
"ب"=> "0628",
"ة"=> "0629",
"ت"=> "062A",
"ث"=> "062B",
"ج"=> "062C",
"ح"=> "062D",
"خ"=> "062E",
"د"=> "062F",
"ذ" => "0630",
"ر"=> "0631",
"ز"=> "0632",
"س"=> "0633",
"ش"=> "0634",
"ص"=> "0635",
"ض"=> "0636",
"ط"=> "0637",
"ظ"=> "0638",
"ع"=> "0639",
"غ"=> "063A",
"ف"=> "0641",
"ق"=> "0642",
"ك"=> "0643",
"ل"=> "0644",
"م"=> "0645",
"ن"=> "0646",
"ه"=> "0647",
"و"=> "0648",
"ى"=> "0649",
"ي"=> "064A",
"ـ" => "0640",
"ً" => "064B",
"ٌ"=> "064C",
"ٍ"=> "064D",
"َ"=> "064E",
"ُ"=> "064F",
"ِ"=> "0650",
"ّ"=> "0651",
"ْ"=> "0652",
"!"=> "0021",
'""'=> "0022",
"#"=> "0023",
"$"=> "0024",
"%"=> "0025",
"&"=> "0026",
"'"=> "0027",
"("=> "0028",
")"=> "0029",
"*"=> "002A",
"+"=> "002B",
","=> "002C",
"-"=> "002D",
"."=> "002E",
"/"=> "002F",
"0"=> "0030",
"1"=> "0031",
"2"=> "0032",
"3"=> "0033",
"4"=> "0034",
"5"=> "0035",
"6"=> "0036",
"7"=> "0037",
"8"=> "0038",
"9"=> "0039",
":"=> "003A",
""=> "003B",
"<"=> "003C",
"="=> "003D",
">"=> "003E",
"?"=> "003F",
"@"=> "0040",
"A"=> "0041",
"B"=> "0042",
"C"=> "0043",
"D"=> "0044",
"E"=> "0045",
"F"=> "0046",
"G"=> "0047",
"H"=> "0048",
"I"=> "0049",
"J"=> "004A",
"K"=> "004B",
"L"=> "004C",
"M"=> "004D",
"N"=> "004E",
"O"=> "004F",
"P"=> "0050",
"Q"=> "0051",
"R"=> "0052",
"S"=> "0053",
"T"=> "0054",
"U"=> "0055",
"V"=> "0056",
"W"=> "0057",
"X"=> "0058",
"Y"=> "0059",
"Z"=> "005A",
'["    "('=> "005B",
"\\"=> "005C",
']"    ")'=> "005D",
"^"=> "005E",
"_"=> "005F",
"`"=> "0060",
"a"=> "0061",
"b"=> "0062",
"c"=> "0063",
"d"=> "0064",
"e"=> "0065",
"f"=> "0066",
"g"=> "0067",
"h"=> "0068",
"i"=> "0069",
"j"=> "006A",
"k"=> "006B",
"l"=> "006C",
"m"=> "006D",
"n"=> "006E",
"o"=> "006F",
"p"=> "0070",
"q"=> "0071",
"r"=> "0072",
"s"=> "0073",
"t"=> "0074",
"u"=> "0075",
"v"=> "0076",
"w"=> "0077",
"x"=> "0078",
"y"=> "0079",
"z"=> "007A",
"{"=> "007B",
"|"=> "007C",
"}"=> "007D",
"~"=> "007E",
"©"=> "00A9",
"®"=> "00AE",
"÷"=> "00F7",
"×"=> "00F7",
"§"=> "00A7",
"\r"=> "000A",
" " => "0020"
        
        }
        
        result = ''
          
        message.chars.to_a.map { |x|
          if chrarray.has_key?(x)
            result += chrarray[x]    	
          else
            x
          end	
  
        }.join
          
        result
        
  end
  
  
  #============================================
end

__END__

  export MOBILYWS_USERNAME="966566666666"
  
  export MOBILYWS_PASSWORD="8223510"
  
  export MOBILYWS_SENDER="MOHAMMED"
  