Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EFEC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Jul 2023 16:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68CE41777;
	Thu, 13 Jul 2023 16:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A68CE41777
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=DYpXodO4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPJcYDsuW6H7; Thu, 13 Jul 2023 16:19:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7BA7740503;
	Thu, 13 Jul 2023 16:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BA7740503
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57601C0071;
	Thu, 13 Jul 2023 16:19:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91CA0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 16:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AD5742091
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 16:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AD5742091
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=DYpXodO4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0r3a2yA2JlCq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 16:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F944208F
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73F944208F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 16:19:53 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-346434c7793so807935ab.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1689265192; x=1691857192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yrN07XWKTw27hJf4DQtCkE+QAWeAXoL+rcUi556/Mm0=;
 b=DYpXodO43imF9JwUQTV/FjuCdo7lZMgWJdu3JXFpAhIK8lEU2XpZZkUpAI8SzX88pp
 uVmcz+tEb291eyTinDuUI0OxhFn1xjjKfHoXNzgiTvtgyfxTFgfzmhYn7gW84mddF7K0
 LXVnUm5YlZtQBeyxCDiXJ87BD+W4khCNJWVxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689265192; x=1691857192;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yrN07XWKTw27hJf4DQtCkE+QAWeAXoL+rcUi556/Mm0=;
 b=dVf811fyIr0KLncuMMPzXZTTog6/qzEG8iUX3px5sIb9GSneN2V+8lYuG9fz/QVbi9
 cyhB+52YQLj4AdEAuVhmBBkx+ItZUUvMFELUwiwUQkGyHs7Ig7+MuHfgqKSF2wcHe9i3
 z3NWuqxuYC+UMpUSZWaZPAUu6CUET4Z3Wssty6bubtH3jmZ1GDtHw7JhYYJpSer5MbAm
 mKUPFDpn8FiRWCw4qunJggfUD+BwEQnqcsnSUFzHyex4d+LetsNhlo+F2U4zMFXVuXh+
 OXF9i339/8efnOw6ysBfTUxqAKIlQ7TQgeqDJVGIieEV/wIvmEFobbe0FqDIz6ggWxQY
 iyCA==
X-Gm-Message-State: ABy/qLYEpRvKCo87H6PAhRL+ClKZBAKkgzRzIkE2zy0b8pynQ9seTDbY
 nhgg41D1XF+ICBr2csXAHvFdrgf/
X-Google-Smtp-Source: APBJJlE5NqUxx/u5vSNneFZxWLdoCMCPs9L8jq9fRxf1CiYhvh03WPfpBQIz9eeVnn8Yp6EO4IOwgw==
X-Received: by 2002:a92:2e03:0:b0:345:69b3:ba41 with SMTP id
 v3-20020a922e03000000b0034569b3ba41mr1422021ile.2.1689265192372; 
 Thu, 13 Jul 2023 09:19:52 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 n3-20020a92d9c3000000b00347748906f4sm247287ilq.7.2023.07.13.09.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 09:19:51 -0700 (PDT)
Message-ID: <3044734d-c5ba-7e45-77f0-6667f59b9b55@linuxfoundation.org>
Date: Thu, 13 Jul 2023 10:19:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] selftests: rtc: Improves rtctest error handling.
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Atul Kumar Pant <atulpant.linux@gmail.com>
References: <20230625164748.22458-1-atulpant.linux@gmail.com>
 <20230630140843d6a4b3c2@mail.local>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230630140843d6a4b3c2@mail.local>
Cc: a.zummo@towertech.it, shuah@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 6/30/23 08:08, Alexandre Belloni wrote:
> On 25/06/2023 22:17:48+0530, Atul Kumar Pant wrote:
>> When running the rtctest if we pass wrong rtc device file as an argument
>> the test fails expectedly, but prints the logs that are not useful
>> to point out the issue.
>> To handle this, the patch adds a checks to verify if the rtc_file is valid.
>>
>> Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
>> ---
>>
>> changes since v2:
>>      Changed error message when rtc file does not exist.
>>
>> changes since v1:
>>      Removed check for uid=0
>>      If rtc file is invalid, then exit the test.
>>

Missing mailing lists - please resend with cc to linux-kselftest
and linux-kernel mailing lists. Hint: Run get_maintainers script

thanks,
-- Shuah

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
