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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D8FC433ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:19:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29ABD613D8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Apr 2021 20:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29ABD613D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6D57400EF;
	Fri, 23 Apr 2021 20:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-9YPWQhsZ7W; Fri, 23 Apr 2021 20:19:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A380C400B5;
	Fri, 23 Apr 2021 20:19:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD5FC000E;
	Fri, 23 Apr 2021 20:19:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76BA0C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E49083396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHjY6NNbjYdI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2311083126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 20:19:18 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso13385420otp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Apr 2021 13:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1NPesUHck/PXytWUMZaL5H3tigSX17N3XIw4EegWTo=;
 b=h/zj34eMbFVxnsOvC1DnFfdHinWG50GkumzwQGZ3MZu0ke7Lr1+JaFtFTDV5XOMqgb
 YRBq6VuCEXA8EBgdPhBKdI8oQ+W1EfSjN+mznToiU1mQ0PHbX7CJj/DLoXjr/0DPhu53
 nqx6oFLPXP+PI2JuGA23gyWv8SY61CY5Ie7jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1NPesUHck/PXytWUMZaL5H3tigSX17N3XIw4EegWTo=;
 b=kM71nt7cXI91YN+A+g9dLIsBfpSxGLyUxOyKY362XGezZDK9ErYV0/EB/0G5Cxx2QX
 IOIUf0o5wHB9if6X5GkHlN1LcJVBBb6qQ94CYbWxwDfT0Qa1MlPGppcbEweTpSbutZDT
 IgaystSry14t0X4wzINQYqspVCsu1weCWJWWzlSwDO7hAynVoq12UMxczFap8bqlHZZ7
 6avtbvzRysniNdPJFix2oJ6WAU6gxgCXkEV8csVFHbBub0y3ZJuRDrRYLPNHXT+l/lyt
 PxfuVX/FVCXPAJFT/UMVYGpxsUunQIlNmH7nHEF7JARCXoHMAz58mN4Q2l5cw4kSD3ql
 oW1Q==
X-Gm-Message-State: AOAM533Qb3zrirmxkoCTWf6cpdvsEaKbcCxe3d+Lc32JGMAr43nizrsc
 7iauPCUwODVLVVyZ8vkuR1BTQq/A
X-Google-Smtp-Source: ABdhPJxveYdA31BMuoApMGii8ccA7nrQElJ5ZWPWnXUmpT+f0qLEMUCiESWam2UcuOfjVW+ktXgpRA==
X-Received: by 2002:a9d:6483:: with SMTP id g3mr4825315otl.332.1619209157176; 
 Fri, 23 Apr 2021 13:19:17 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id o20sm1364829oos.19.2021.04.23.13.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:19:16 -0700 (PDT)
Subject: Re: [PATCH] media: gspca: stv06xx: Fix memleak in stv06xx subdrivers
To: Pavel Skripkin <paskripkin@gmail.com>,
 Atul Gopinathan <atulgopinathan@gmail.com>
References: <20210422160742.7166-1-atulgopinathan@gmail.com>
 <20210422215511.01489adb@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <36f126fc-6a5e-a078-4cf0-c73d6795a111@linuxfoundation.org>
Date: Fri, 23 Apr 2021 14:19:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422215511.01489adb@gmail.com>
Content-Language: en-US
Cc: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, mchehab@kernel.org,
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

On 4/22/21 12:55 PM, Pavel Skripkin wrote:
> Hi!
> 
> On Thu, 22 Apr 2021 21:37:42 +0530
> Atul Gopinathan <atulgopinathan@gmail.com> wrote:
>> During probing phase of a gspca driver in "gspca_dev_probe2()", the
>> stv06xx subdrivers have certain sensor variants (namely, hdcs_1x00,
>> hdcs_1020 and pb_0100) that allocate memory for their respective
>> sensor which is passed to the "sd->sensor_priv" field. During the
>> same probe routine, after "sensor_priv" allocation, there are chances
>> of later functions invoked to fail which result in the probing
>> routine to end immediately via "goto out" path. While doing so, the
>> memory allocated earlier for the sensor isn't taken care of resulting
>> in memory leak.
>>
>> Fix this by adding operations to the gspca, stv06xx and down to the
>> sensor levels to free this allocated memory during gspca probe
>> failure.
>>
>> -
>> The current level of hierarchy looks something like this:
>>
>> 	gspca (main driver) represented by struct gspca_dev
>> 	   |
>> ___________|_____________________________________
>> |	|	|	|	|		| (subdrivers)
>> 			|			  represented
>>   			stv06xx			  by "struct
>> sd" |
>>   	 _______________|_______________
>>   	 |	|	|	|	|  (sensors)
>> 	 	|			|
>>   		hdcs_1x00/1020		pb01000
>> 			|_________________|
>> 				|
>> 			These three sensor variants
>> 			allocate memory for
>> 			"sd->sensor_priv" field.
>>
>> Here, "struct gspca_dev" is the representation used in the top level.
>> In the sub-driver levels, "gspca_dev" pointer is cast to "struct sd*",
>> something like this:
>>
>> 	struct sd *sd = (struct sd *)gspca_dev;
>>
>> This is possible because the first field of "struct sd" is
>> "gspca_dev":
>>
>> 	struct sd {
>> 		struct gspca_dev;
>> 		.
>> 		.
>> 	}
>>
>> Therefore, to deallocate the "sd->sensor_priv" fields from
>> "gspca_dev_probe2()" which is at the top level, the patch creates
>> operations for the subdrivers and sensors to be invoked from the gspca
>> driver levels. These operations essentially free the "sd->sensor_priv"
>> which were allocated by the "config" and "init_controls" operations in
>> the case of stv06xx sub-drivers and the sensor levels.
>>
>> This patch doesn't affect other sub-drivers or even sensors who never
>> allocate memory to "sensor_priv". It has also been tested by syzbot
>> and it returned an "OK" result.
>>
>> https://syzkaller.appspot.com/bug?id=ab69427f2911374e5f0b347d0d7795bfe384016c
>> -
>>
>> Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New
>> subdriver.") Cc: stable@vger.kernel.org
>> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
>> Reported-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>> Tested-by: syzbot+990626a4ef6f043ed4cd@syzkaller.appspotmail.com
>> Signed-off-by: Atul Gopinathan <atulgopinathan@gmail.com>
> 
> AFAIK, something similar is already applied to linux-media tree
> https://git.linuxtv.org/media_tree.git/commit/?id=4f4e6644cd876c844cdb3bea2dd7051787d5ae25
> 

Pavel,

Does the above handle the other drivers hdcs_1x00/1020 and pb01000?

Atul's patch handles those cases. If thoese code paths need to be fixes,
Atul could do a patch on top of yours perhaps?

thanks,
-- Shuah


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
