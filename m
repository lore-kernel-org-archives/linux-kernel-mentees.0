Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D494C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 03:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4849611AC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 03:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4849611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BBE60644;
	Fri, 18 Jun 2021 03:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WjV0uISZA4Hz; Fri, 18 Jun 2021 03:05:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F79260633;
	Fri, 18 Jun 2021 03:05:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 557ADC000D;
	Fri, 18 Jun 2021 03:05:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA299C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 03:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF1D60633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 03:05:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDnvvFCyz_80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 03:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9845660644
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 03:05:10 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id g22so6618345pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jun 2021 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5Hkc1Bod9XeIHJJRLDjduZE/jHZcAso4vB+S4dzyd3A=;
 b=Kjcy42HJCHBpM0LWBplRFsAQd1+Iv2qTJwbxsL8oRWoeFc8dRWnP4bqO/lpX1qny5F
 sAhnvJfXBj6HJZW4FfXRvjgLnbF5zVp5xZhsr2PBm7LkEjC3KRKBfXeBRPARTIbNxPQK
 631lLr0VPBj93bHbIJAxQXohxwtVcmRNkCm6KZXJYi0DI4A+xCpVasF/MZwj9GlqynW4
 drbP9t1nRR2qR7C8b6lf9ltMdU2g4SeMzj+0DHhk7oe87BsTWRoHVCHrfUITNulDHbME
 g0GrxFjSgWjNW5eDdoMJo0o5tWg/gwxRG+GFJajXe97oqrWMAHognSTMKJJRAFv/Mvv4
 OHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5Hkc1Bod9XeIHJJRLDjduZE/jHZcAso4vB+S4dzyd3A=;
 b=rfVV/39gsrGLwqfa8PENXB7FRM+DDRgThB3fyUJlK7/O8VC8D97xKdvKM0TWSM8kcb
 qpspdKEe4r3Hi3VgoC8Ul0mAu8brFUfddqI0mBnhprqhhECc0XmIVzECLhGDa+M7DyxU
 ipmfB+oBdHiMs9Ao7xQpkhxPnudFa2Szdbwmg9uJ2SjASr0oDOq+gjBNhG4bsYaiwqct
 3p2XuU0ySpDNYHeovwi4O+A/Qxfwun+0bqlPaioO2GDKIZv3CjZH3IaI7YT+qzIvM5Gi
 2niB1I1jceXjarn9xIiNr0ykKJ/PknH6lyWsHZKWHlzlj1kCLdVI8tJ2mTDH15Yenl4s
 3cfA==
X-Gm-Message-State: AOAM530AqbgpGmh+mYbJ7G7AUfaXBGjzc7hV3JuZNXNi/jRnazZhPlAH
 wmEtnSOn/+QfRdjhc09kZ7c=
X-Google-Smtp-Source: ABdhPJz26NHLGsvOBOgNmuPd/Y3RYtrJrpgvkQ3rEBaVG3zDw9JBCXksBI2LY66YF6ehmRCXpKL2ew==
X-Received: by 2002:a62:7b4c:0:b029:2e9:cec2:e252 with SMTP id
 w73-20020a627b4c0000b02902e9cec2e252mr2802617pfc.56.1623985509826; 
 Thu, 17 Jun 2021 20:05:09 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id w18sm6798863pjg.50.2021.06.17.20.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 20:05:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: Protect drm_master pointers in drm_lease.c
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
Date: Fri, 18 Jun 2021 11:05:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMuCYqLafn5sGcFo@phenom.ffwll.local>
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

On 18/6/21 1:12 am, Daniel Vetter wrote:
> On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
>> This patch ensures that the device's master mutex is acquired before
>> accessing pointers to struct drm_master that are subsequently
>> dereferenced. Without the mutex, the struct drm_master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could then lead to use-after-free errors.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> ---
>>   drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
>>   1 file changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>> index da4f085fc09e..3e6f689236e5 100644
>> --- a/drivers/gpu/drm/drm_lease.c
>> +++ b/drivers/gpu/drm/drm_lease.c
>> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>>    */
>>   bool _drm_lease_held(struct drm_file *file_priv, int id)
>>   {
>> +	bool ret;
>> +
>>   	if (!file_priv || !file_priv->master)
>>   		return true;
>>   
>> -	return _drm_lease_held_master(file_priv->master, id);
>> +	mutex_lock(&file_priv->master->dev->master_mutex);
> 
> So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
> I thought file_priv->master is invariant over the lifetime of file_priv.
> So we don't need a lock to check anything here.
> 
> It's the drm_device->master derefence that gets us into trouble. Well also
> file_priv->is_owner is protected by dev->master_mutex.
> 
> So I think with your previous patch all the access here in drm_lease.c is
> ok and already protected? Or am I missing something?
> 
> Thanks, Daniel
> 

My thinking was that file_priv->master is invariant only if it is the 
creator of master. If file_priv->is_master is false, then a call to 
drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates 
a new master for file_priv, and puts the old master.

This could be an issue in _drm_lease_held_master, because we dereference 
master to get master->dev, master->lessor, and master->leases.

With the same reasoning, in other parts of drm_lease.c, if there's an 
access to drm_file->master that's subsequently dereferenced, I added a 
lock around them.

I could definitely be mistaken on this, so apologies if this scenario 
doesn't arise.

Best wishes,
Desmond



_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
