Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9FBC48BE5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 02:55:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482EA61241
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 02:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482EA61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1322D40249;
	Fri, 18 Jun 2021 02:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uy7Gko5sICNy; Fri, 18 Jun 2021 02:55:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3DB324022B;
	Fri, 18 Jun 2021 02:55:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23535C000D;
	Fri, 18 Jun 2021 02:55:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC091C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 02:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A087283CD4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 02:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVPAydW0qwMK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 02:55:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0BA683CCE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 02:55:03 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id x19so3951546pln.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 19:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oD/lPmbYpR+flY3ngmMvMRUJurU8Z44y+AyucteNA/8=;
 b=G6ta/BMQj9o34vXd7ou/YOIaNZRkgj9MLKZNrM8CDmrPZUN+UhQCb3L0RdA+IjJn5G
 jrk22sYfXarrySBr3qlZ/W2KPEpEKnOa5GU4cxU1iGkSsFuHKHXHEk4T74IGyNxTOt3g
 xMdMluZ1hvTiuYHeyMFaQJnrv7+xBxf6qORGE5iaRmZh0T4mTSw+juXRG2PojvtqzToW
 3NevaUqrq6uqbPZSPoIBKor+pKomn6CCnyyBud9JuFtHWwoZxTxLZOs4OYOUKFXUDbNs
 RiebIW9QEoM/qvkLx6FnkhSlDxwP+hR5oYliUMdHCFb3FQoxQkP6k9Oij9cdmxWe1+7T
 Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oD/lPmbYpR+flY3ngmMvMRUJurU8Z44y+AyucteNA/8=;
 b=mBA1GXUeSrVVy/Jl22Q7fXPyHVqlZeIzTE4bleQ+qUYdE8JHvyt7dJQhly06KtEFm8
 FJbi1KjDFiqmc28kp2Vly39A6tXMxQ6mcBCBifZ7GaHfbpltmqch3hdwu2eWu9ATfShD
 y8q5W7LCn3LjGJHVanpqCUWhSTWbPd2SPww7uxzFyhml+uWhgb2lIqluAf1RianmrsRJ
 R8gUi7ilfVZKCbinkYngUYK60mhqCH61eKjdPrslm36nSiFQSb+diKNRsUs/6fore5qG
 +LY4dIHX1OGm5ZX1lqnkvB97+xiFqYw5w7aeSzzYxRZa2moZB3iGet2FL0CP2hsljwHB
 BD+A==
X-Gm-Message-State: AOAM533Dc1OXc5uyTatB2sWTT5oeVfMOTFUVevT6Y02LsoNrKuLzboPG
 K9Y+M0kDBx+VNfss+X5ZlcY=
X-Google-Smtp-Source: ABdhPJxQtIJ7wA1HP94MBKX8MQ9KWjHMW8rcONoLQSAmQmXf52cl+s1tuhb+aHwu/PmfkqWor3hVow==
X-Received: by 2002:a17:902:ecd1:b029:119:50c6:e449 with SMTP id
 a17-20020a170902ecd1b029011950c6e449mr2764132plh.30.1623984903283; 
 Thu, 17 Jun 2021 19:55:03 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id m1sm6825685pgd.78.2021.06.17.19.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 19:55:02 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] drm: Add a locked version of drm_is_current_master
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-2-desmondcheongzx@gmail.com>
 <YMuAYaZF+qW7GUFT@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <793cf08c-a766-637e-b473-91f6c8de12ec@gmail.com>
Date: Fri, 18 Jun 2021 10:54:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMuAYaZF+qW7GUFT@phenom.ffwll.local>
Content-Language: en-US
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

On 18/6/21 1:03 am, Daniel Vetter wrote:
> On Tue, Jun 15, 2021 at 10:36:44AM +0800, Desmond Cheong Zhi Xi wrote:
>> While checking the master status of the DRM file in
>> drm_is_current_master(), the device's master mutex should be
>> held. Without the mutex, the pointer fpriv->master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could lead to use-after-free errors when the pointer is subsequently
>> dereferenced in drm_lease_owner().
>>
>> The callers of drm_is_current_master() from drm_auth.c hold the
>> device's master mutex, but external callers do not. Hence, we implement
>> drm_is_current_master_locked() to be used within drm_auth.c, and
>> modify drm_is_current_master() to grab the device's master mutex
>> before checking the master status.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index 232abbba3686..c6bf52c310a9 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -61,6 +61,8 @@
>>    * trusted clients.
>>    */
>>   
>> +static bool drm_is_current_master_locked(struct drm_file *fpriv);
> 
> A bit a bikeshed, but we try to avoid forward declarations when they're
> not needed. If you don't want to tear apart drm_is_current_master and the
> _locked version then just move them together.
> 
> Can you pls do that and respin?
> 
> Otherwise looks all great.
> -Daniel
> 
> 

Yeah, I was trying to keep the logic in _locked close to 
drm_is_current_master. But got it, will do.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
