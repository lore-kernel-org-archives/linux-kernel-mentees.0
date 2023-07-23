Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0597C001DE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Jul 2023 15:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEB860B1D;
	Sun, 23 Jul 2023 15:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AEB860B1D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oBQ6EFoL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96RDNwI14WD0; Sun, 23 Jul 2023 15:02:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 42FA760AEE;
	Sun, 23 Jul 2023 15:02:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42FA760AEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C5FEC0072;
	Sun, 23 Jul 2023 15:02:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC034C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 15:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABAEC410A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 15:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABAEC410A0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=oBQ6EFoL
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzjaWwdXOJtH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 15:01:55 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65311409EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 15:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65311409EF
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666eba6f3d6so1968007b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Jul 2023 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690124514; x=1690729314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhw7aS6Ttjq7iKZtaXUkeoqYKQnM4Kk9jkRz0JOQFyU=;
 b=oBQ6EFoLo43YeFslZ93d+KzKQaPDIYxvUgtovPitsGtHDSjDw56vKDMo4hlh9obkvk
 x/vHfXMu+HFUtODWkGmX/do1OT3suz720aqbGczxyCiEO6AVPXCg89FqBg5vEG/vNd+7
 qywV3ABWwmDQduJshw71HluWwvlmP84gKQHeb6vVZq+SPubhpLRE3TUZNCftXRwAqLzy
 Xgg03sLKGkxsmjUI9O8wK9bLH+Fa297ZvEzdDp9sKi523Gg7eZITXRxQD2fAA2b0rqdq
 7p04DFmRU0+izkO4UzRvnUlAtBjryTwNwZ7Fz6ttNw2VQjbEo6BoFaOs89kDN/sjt03o
 bbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690124514; x=1690729314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhw7aS6Ttjq7iKZtaXUkeoqYKQnM4Kk9jkRz0JOQFyU=;
 b=i8DMEElnqJOXOwAh8wQalTcYkaCeS3p7VJ+p/CAdd+n9epSxcuSWEfELhxTGH1/yQY
 4tmbeKfsJ0ouYZkvSmumgoBjdvr9r0GaXEx8AfuUW0DZCac1ZQdtUdexWcsPnT8c9d+y
 EGsu1zZbNkQsmwD858Q7VWOukZhvoWr5fzYEnZ8+EgnAo1OuWPY/1T7OpAhhpvbMDN9J
 ocnnTGBMpyT+TKOJqG5PYpn4yqSldfIIcP+pDTZWLhZT4jc4XHVYCoZFi/5pwShHNVhz
 ZRkKKKIXuVanEZ7UsEAkA1WcmEYZwOvgkslL+4B7WdBO2165Zib61VZKczj3CiO/ZmRi
 CzPQ==
X-Gm-Message-State: ABy/qLakDLZIQZBhztAaaV57PtGtlZ9/MAvPo/hbvgqactvru3PExgWz
 G7DRxW9WhfsHvvyH90/DxSY=
X-Google-Smtp-Source: APBJJlGrkZbZAI+0i5agNXdNgChDuEbW7rB1bs1hj8u6UREjJr2lAAv6r87GAWsZ6e0Co0w02/ODyA==
X-Received: by 2002:a05:6a00:114c:b0:680:ddd6:7d8b with SMTP id
 b12-20020a056a00114c00b00680ddd67d8bmr5134675pfm.15.1690124514220; 
 Sun, 23 Jul 2023 08:01:54 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 bn9-20020a056a00324900b00678afd48250sm6019234pfb.218.2023.07.23.08.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 08:01:53 -0700 (PDT)
Message-ID: <8f5a91f4-2b4e-9007-99d3-bf69b776b708@gmail.com>
Date: Sun, 23 Jul 2023 22:01:50 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] tools/counter: Makefile: Replace rmdir by rm to avoid
 make,clean failure
To: William Breathitt Gray <wbg@kernel.org>
References: <d4080db5-1825-2848-079a-8bb674d8ee44@gmail.com>
 <ZLqDwg44UFNrrQfZ@ishi>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <ZLqDwg44UFNrrQfZ@ishi>
Cc: ricardo@pardini.net, linux-iio@vger.kernel.org, william.gray@linaro.org,
 linux-kernel@vger.kernel.org, rongtao@cestc.cn,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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



On 7/21/23 20:10, William Breathitt Gray wrote:
> On Sun, Jul 16, 2023 at 10:44:56PM +0700, Anh Tuan Phan wrote:
>> Use rm -df instead of rmdir -p since rmdir requires the directory exist
>> so it causes "make -C tools clean" failed if someone only builds other
>> tools but not counter.
>>
>> Fixes: 228354ed692f ("tools/counter: Makefile: Remove lingering
>> 'include' directories on make clean")
> 
> Hi Anh,
> 
> Tags should span a single line even if they are long. This is minor
> enough that I will clean it as I pick up the patch so no need to worry
> about it this time. In the future, run script/checkpatch.pl on your
> patches to catch these type of mistakes that are easy to miss.
> 
> I'll queue this patch for the counter-fixes branch.
> 
> Thanks,
> 
> William Breathitt Gray
> 

Thanks for helping me correct the patch, will run the script in the future.

Best,
Anh

>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>> ---
>> Changes from v1:
>> - Use rm -df instead of checking the directory exists
>> - Add Fixes tag
>> - Update the patch title
>> Reference:
>> - v1:
>> https://lore.kernel.org/all/362e127d-6018-5fc6-247b-3c729b99d946@gmail.com/
>> ---
>>  tools/counter/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
>> index a0f4cab71fe5..b2c2946f44c9 100644
>> --- a/tools/counter/Makefile
>> +++ b/tools/counter/Makefile
>> @@ -40,7 +40,8 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
>>  clean:
>>  	rm -f $(ALL_PROGRAMS)
>>  	rm -rf $(OUTPUT)include/linux/counter.h
>> -	rmdir -p $(OUTPUT)include/linux
>> +	rm -df $(OUTPUT)include/linux
>> +	rm -df $(OUTPUT)include
>>  	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
>>
>>  install: $(ALL_PROGRAMS)
>> -- 
>> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
