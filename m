Return-Path: <SRS0=6KHC=JU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC985C43460
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:56:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C2F761075
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C2F761075
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E877D6064F;
	Fri, 23 Apr 2021 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqjRj3hxfqjs; Fri, 23 Apr 2021 20:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD847605EF;
	Fri, 23 Apr 2021 20:56:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDE94C000E;
	Fri, 23 Apr 2021 20:56:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27904C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 086386064F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSyOV_67omcO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:56:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5DA8605EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:56:28 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id h141so973188iof.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JwpEMfsFJcI5faK7sa42v6n59XW+1jdGvUyeeBhOqjo=;
 b=DRV0si9bOzUTGGgpFw81OQNtdjhTfuUuEd36od41RbPd0935mr0YEfMgMVBeBXwrgh
 Vr0p82y6/uujl53uFleN8IzDiDtQDnhNdTEET3ubWalfMmFxNQA/htqAllppkgTm2v1i
 1QSZj65QwbqgtwdqPu6RzY98fiEpTxH3VMbdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JwpEMfsFJcI5faK7sa42v6n59XW+1jdGvUyeeBhOqjo=;
 b=ea4fFIXmmJL5Cdek0OWIbyUSNByg3U1Xgmsl0o+C10/W2hiMpKpJ1/CCXf7WRuLiRs
 Kxq6Wli5GstF/C4KyTfhfru2fCk9jTnOZyKVbnAt0Wrg+BHQrbG2UhRt5rx2xL1+R9Mt
 +ycogDXaJSq40wg/xrJNnV3OXAno2VVCI8I0+CxcHNmkEmpjxbEMEdAQPq9peSiFMAxP
 6WQsa8UR95aWMY2uZL8yWlkRafyw6CXh8I79BrvyKJ7ZiSA819GJxNH0C1p1CeVuYvJe
 rArzDyXwW3BxAh/GIfEnriFxyPwjU1QDasEzqCVZHQhXyo6405V6i8f+NP2QrATL56Us
 AD9w==
X-Gm-Message-State: AOAM530/iWCQZqt76hOgXIOVYykwg2dT82TpxOZTStsrhCa/dJF2Px37
 Y+8PCI28AnEa+P/+2AFtr+4B4seu
X-Google-Smtp-Source: ABdhPJwPFhOZfkLgpA2WhkYn60vEUYJlEOndpDA/3CaVxIsGBexe2up5WTxKUVSDSOyP3qIRUYCKIA==
X-Received: by 2002:a02:a69a:: with SMTP id j26mr5343989jam.5.1619211387969;
 Fri, 23 Apr 2021 13:56:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id m8sm3056064ilc.13.2021.04.23.13.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:56:27 -0700 (PDT)
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
To: Pavel Skripkin <paskripkin@gmail.com>, hverkuil-cisco@xs4all.nl
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
 <20210422215511.01489adb@gmail.com>
 <36f126fc-6a5e-a078-4cf0-c73d6795a111@linuxfoundation.org>
 <20210423234458.3f754de2@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4c22cfa5-5702-6181-0f9a-d1d8d4041156@linuxfoundation.org>
Date: Fri, 23 Apr 2021 14:56:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423234458.3f754de2@gmail.com>
Content-Language: en-US
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Atul Gopinathan <atulgopinathan@gmail.com>, mchehab@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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

On 4/23/21 2:44 PM, Pavel Skripkin wrote:
> Hi!
> 
> On Fri, 23 Apr 2021 14:19:15 -0600
> Shuah Khan <skhan@linuxfoundation.org> wrote:
>> On 4/22/21 12:55 PM, Pavel Skripkin wrote:
>>> Hi!
>>>
>>> On Thu, 22 Apr 2021 21:37:42 +0530
>>> Atul Gopinathan <atulgopinathan@gmail.com> wrote:
>>>> During probing phase of a gspca driver in "gspca_dev_probe2()", the
>>>> stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
>>>> hdcs_1020 and pb_0100) that allocate memory for their respective
>>>> sensor which is passed to the "sd->sensor_priv" field. During the
>>>> same probe routine, after "sensor_priv" allocation, there are
>>>> chances of later functions invoked to fail which result in the
>>>> probing routine to end immediately via "goto out" path. While
>>>> doing so, the memory allocated earlier for the sensor isn't taken
>>>> care of resulting in memory leak.
>>>>
>>>> Fix this by adding operations to the gspca, stv06xx and down to the
>>>> sensor levels to free this allocated memory during gspca probe
>>>> failure.
>>>>
>>>> -
>>>> The current level of hierarchy looks something like this:
>>>>
>>>> 	gspca (main driver) represented by struct gspca_dev
>>>> 	   |
>>>> ___________|_____________________________________
>>>> |	|	|	|	|		| (subdrivers)
>>>> 			|			  represented
>>>>    			stv06xx			  by
>>>> "struct sd" |
>>>>    	 _______________|_______________
>>>>    	 |	|	|	|	|  (sensors)
>>>> 	 	|			|
>>>>    		hdcs_1x00/1020		pb01000
>>>> 			|_________________|
>>>> 				|
>>>> 			These three sensor variants
>>>> 			allocate memory for
>>>> 			"sd->sensor_priv" field.
>>>>
>>>> Here, "struct gspca_dev" is the representation used in the top
>>>> level. In the sub-driver levels, "gspca_dev" pointer is cast to
>>>> "struct sd*", something like this:
>>>>
>>>> 	struct sd *sd = (struct sd *)gspca_dev;
>>>>
>>>> This is possible because the first field of "struct sd" is
>>>> "gspca_dev":
>>>>
>>>> 	struct sd {
>>>> 		struct gspca_dev;
>>>> 		.
>>>> 		.
>>>> 	}
>>>>
>>>> Therefore, to deallocate the "sd->sensor_priv" fields from
>>>> "gspca_dev_probe2()" which is at the top level, the patch creates
>>>> operations for the subdrivers and sensors to be invoked from the
>>>> gspca driver levels. These operations essentially free the
>>>> "sd->sensor_priv" which were allocated by the "config" and
>>>> "init_controls" operations in the case of stv06xx sub-drivers and
>>>> the sensor levels.
>>>>
>>>> This patch doesn't affect other sub-drivers or even sensors who
>>>> never allocate memory to "sensor_priv". It has also been tested by
>>>> syzbot and it returned an "OK" result.
>>>>
>>>> https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
>>>> -
>>>>
>>>> Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
>>>> subdriver.") Cc: stable@vger.kernel.org
>>>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>>>> Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>>>> Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>>>> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
>>>
>>> AFAIK, something similar is already applied to linux-media tree
>>> https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25
>>>
>>
>> Pavel,
>>
>> Does the above handle the other drivers hdcs_1x00/1020 and pb01000?
>>
>> Atul's patch handles those cases. If thoese code paths need to be
>> fixes, Atul could do a patch on top of yours perhaps?
>>
>> thanks,
>> -- Shuah
>>
>>
> 
> It's not my patch. I've sent a patch sometime ago, but it was reject
> by Mauro (we had a small discussion on linux-media mailing-list), then
> Hans wrote the patch based on my leak discoverage.
> 

Yes my bad. :)

> I added Hans to CC, maybe, he will help :)
> 

Will wait for Hans to take a look.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
