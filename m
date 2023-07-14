Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693E6C001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 14 Jul 2023 13:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E82F960E25;
	Fri, 14 Jul 2023 13:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E82F960E25
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Itkrll0R
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GS1zkd17Bdf7; Fri, 14 Jul 2023 13:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C1BC560AFF;
	Fri, 14 Jul 2023 13:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1BC560AFF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 989EDC0071;
	Fri, 14 Jul 2023 13:57:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF8F4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8506960D6B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8506960D6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S99fnhtXUcxH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:57:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA05F60AFF
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA05F60AFF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 13:57:25 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1b3f722fdafso1555705fac.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Jul 2023 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689343044; x=1691935044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TfUrNaYcqNZhEYinnWCBKO+r1h4U75pLbDj1kOxOsMw=;
 b=Itkrll0RJysYvFtjk0RjuY+b+Tl/aRm/kMQ7BnrsAZtVU2lUMk+N5/p+7FE4bZjIUx
 STLdGxGFCBlosnc6HK7N8S2DuqnWux51ojiaeqJZrC2dS1KX+kCKcLwoGiYKLlV+2bL2
 hqfCaKRjugNvG5ObEVGadgZ7pS24BiNaxWm3b71sPBLGeWyLX4KRKG4xceF1+Yz+Zmrd
 iDNicZQA64Pvwn5EZHXFW+wlRLVgQbgfo3pY9NHyugq6vfnzbDxpdk1v28U+Jx7eWUX1
 KDfHYr0osT+s9ozuz4ycZIF9LB+83vFT2ZQEkVLQphmPlfrg/cTG7LEk0AB0n3VQwlwE
 095g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689343044; x=1691935044;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfUrNaYcqNZhEYinnWCBKO+r1h4U75pLbDj1kOxOsMw=;
 b=CGk+1gMqhjVRvQPtUgpzJIcPAjqUUYgugmClZxFNgeYo5TZV5EjvRDhohWmf8oJ0+z
 yBmB97HEFi6W58OLFlYzPyS4yQf139d9tmANYsWzzAdI+5duf4Y9NEXB3j6vHZqlj4sl
 bybWW9n+1r+5GxjlUotR1IuvQanBqqWgqrT5oyUPz+du60MbDxjLFXHqoMBelGQfM0CJ
 mTCb/1vb+PEgEeHVojty6X+yS9fm596O+MQVbHsLrSOV3wgEpydDBfV/vlUqXYCg/L6R
 sLvOYCa2q4vhrpQ/b02bHm5H3hRghvBSTHSzdbMa3Q95vfViq4RyEKL2ZnFxjs2TP3cz
 pOUg==
X-Gm-Message-State: ABy/qLZCf+8/XIkRmEakZPWiTBiT4GplXDymxNVPbiUfSs2INGblvH7E
 bcah4ExkZmTSBJOFKlKk2Kc=
X-Google-Smtp-Source: APBJJlGy0BKKwjBMdzDGfbeswYUnFStzyfDbsModAk0FFK0ECQhxoQaJ27hqqw/IoC+lApzhYIuPpA==
X-Received: by 2002:a05:6870:b694:b0:19e:b8e0:1434 with SMTP id
 cy20-20020a056870b69400b0019eb8e01434mr6639612oab.8.1689343044511; 
 Fri, 14 Jul 2023 06:57:24 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a636f0a000000b004ff6b744248sm7550904pgc.48.2023.07.14.06.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jul 2023 06:57:24 -0700 (PDT)
Message-ID: <e62f481d-f939-a12b-7f8a-ec1db95c7b8e@gmail.com>
Date: Fri, 14 Jul 2023 20:57:21 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/counter: Add checking directory exists for make
 clean
To: William Breathitt Gray <william.gray@linaro.org>
References: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
 <ZKtZ1WB9LdszbxU+@fedora>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <ZKtZ1WB9LdszbxU+@fedora>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, rongtao@cestc.cn,
 ricardo@pardini.net
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi William, the race condition possibility is a good point. Thanks for
suggesting me. Will send a new version with using `rm -df` instead and
add the appropriate CC lists. Thank you!

On 7/10/23 08:07, William Breathitt Gray wrote:
> On Fri, Jul 07, 2023 at 09:08:35PM +0700, Anh Tuan Phan wrote:
>> rmdir requires the directory exist so it causes "make -C tools clean"
>> failed if someone only builds other tools but not counter. This commit
>> adds checking the directory exist before doing rmdir.
>>
>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>> ---
>>  tools/counter/Makefile | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
>> index a0f4cab71fe5..2907f3b3094b 100644
>> --- a/tools/counter/Makefile
>> +++ b/tools/counter/Makefile
>> @@ -40,7 +40,9 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
>>  clean:
>>  	rm -f $(ALL_PROGRAMS)
>>  	rm -rf $(OUTPUT)include/linux/counter.h
>> -	rmdir -p $(OUTPUT)include/linux
>> +	@if [ -d $(OUTPUT)include/linux ]; then \
>> +		rmdir -p $(OUTPUT)include/linux; \
>> +	fi
>>  	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
>>
>>  install: $(ALL_PROGRAMS)
>> -- 
>> 2.34.1
> 
> Hi Anh,
> 
> Please CC <linux-iio@vger.kernel.org> and <linux-kernel@vger.kernel.org>
> as well in the future so Counter users and developers can become aware
> of relevant patches.
> 
> One worry I have with this approach is the possible race condition where
> the check for existence succeeds but the directory is deleted by another
> agent before our rmdir executes. However, I'm not sure how we could
> achieve such behavior atomically to prevent the issue.
> 
> One alternative I've considered is perhaps a single find command to
> search for and delete empty directories:
> 
>     find $(or $(OUTPUT),.) -type d -empty -delete
> 
> But this will delete directories not created by the makefile which I
> consider an unexpected behavior for the user (or at least very rude of
> the script to do).
> 
> Perhaps we should delete the directory tree explicitly:
> 
>     rm -df $(OUTPUT)include/linux
>     rm -df $(OUTPUT)include
> 
> Although we lose the symmetry of rmdir to our previous mkdir, this
> should prevent the race condition issue and succeed whether the
> directories still exist or not.
> 
> William Breathitt Gray
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
