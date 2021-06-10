Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0779C47094
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 15:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55AB06136D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 15:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55AB06136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2178F60A4D;
	Thu, 10 Jun 2021 15:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3fCbLG4WH5v; Thu, 10 Jun 2021 15:21:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 47C3260850;
	Thu, 10 Jun 2021 15:21:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27218C000D;
	Thu, 10 Jun 2021 15:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7595C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A889F83C46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:21:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEThtPX75n7Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:21:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4EEE83AF9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 15:21:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so3944105pjs.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FuMYH+W4A5O7+Tews5dUBZThHa9L7Mfi17lH81DY2zM=;
 b=geW08CQPQBOVBMMTrnm4QUFNszNlWY3MoOiwGTuxU4NxJ7MI2P5D3oCLIMfMw0dMy+
 x+MAOJ9JGVdJiaP1cAH7u2dY8eX8FzNnaEPEresoL8Y0KlYO/JAWlw9i0Pap8ssR4A8h
 pXah6TYAeLM6CpQIP4weQ4x92R5zT/1f8OHYjrFFyL2CAJ6jpBTnuxhLsHs2o/UQCBvr
 LscT4VJWLKBGredrdp958uDKi4IuaIIuZrliAXNigqpz7BebZtMAOc2k1Uz8XzPE5JcG
 wrlGJe8bndU79Igoq2Yb2IcvMCqi1Nag+DNg47+6VQVynXTqVvEdK5F1KDX6wljdI0Td
 AnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuMYH+W4A5O7+Tews5dUBZThHa9L7Mfi17lH81DY2zM=;
 b=VBUWL47qdRaPRoZ0wl2XYTsu3OLYc6rDrCaNFZ/EjkPuP9FBgwzQrWZkG99ukB0Rm/
 O+StC/3si/4tRKZclU5M4gzPxvVcXprYsthnRBgv0lHDVbk3zsUpobGuxQ68klk8O+gG
 BIgof0BV80X3Fmw4H7VrpCtl7QTaq5ZrFJjCMrkvY0JqE9MWEm6HlNRnGaA3wWTsgJ5t
 HzbIvNKCx7m7t+kanptRR1LIZELFgtveUIxLJaa0tlASFOjPbrtB8oTK5AZ5XEM3vLQF
 XonupzkUNmR9CaSIvkFLTpTxB5XqvH9Uuaem4EqNwrDkAUjpvKLKkLCOr6RnJf6G1Djq
 jbDg==
X-Gm-Message-State: AOAM531rF2CXiY/SWUmupe4lpEbBqKSOOMm+fuK31Bj1Pus92AoPOGck
 efu0C+sUqq1LJj9dcxnfqRA=
X-Google-Smtp-Source: ABdhPJwY3Ac4NGkGa69ARb226Snl9c/IgAMvA5T4R/MfkCVsafMp2WO5EMJAHpECCzDhwmOKZgu58w==
X-Received: by 2002:a17:90a:1b8f:: with SMTP id
 w15mr3847687pjc.101.1623338504011; 
 Thu, 10 Jun 2021 08:21:44 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id d92sm2920355pjk.38.2021.06.10.08.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:21:43 -0700 (PDT)
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <f16f4123-bd0b-f09c-ddf1-7197c841b588@gmail.com>
Date: Thu, 10 Jun 2021 23:21:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
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

On 10/6/21 6:10 pm, Daniel Vetter wrote:
> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
>> This patch eliminates the following smatch warning:
>> drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
>>
>> The 'file_priv->master' field should be protected by the mutex lock to
>> '&dev->master_mutex'. This is because other processes can concurrently
>> modify this field and free the current 'file_priv->master'
>> pointer. This could result in a use-after-free error when 'master' is
>> dereferenced in subsequent function calls to
>> 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
>>
>> An example of a scenario that would produce this error can be seen
>> from a similar bug in 'drm_getunique()' that was reported by Syzbot:
>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>
>> In the Syzbot report, another process concurrently acquired the
>> device's master mutex in 'drm_setmaster_ioctl()', then overwrote
>> 'fpriv->master' in 'drm_new_set_master()'. The old value of
>> 'fpriv->master' was subsequently freed before the mutex was unlocked.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Thanks a lot. I've done an audit of this code, and I found another
> potential problem in drm_is_current_master. The callers from drm_auth.c
> hold the dev->master_mutex, but all the external ones dont. I think we
> need to split this into a _locked function for use within drm_auth.c, and
> the exported one needs to grab the dev->master_mutex while it's checking
> master status. Ofc there will still be races, those are ok, but right now
> we run the risk of use-after free problems in drm_lease_owner.
> 
> Are you up to do that fix too?
> 

Hi Daniel,

Thanks for the pointer, I'm definitely up for it!

> I think the drm_lease.c code also needs an audit, there we'd need to make
> sure that we hold hold either the lock or a full master reference to avoid
> the use-after-free issues here.
>

I'd be happy to look into drm_lease.c as well.

> Patch merged to drm-misc-fixes with cc: stable.
> -Daniel
> 
>> ---
>>   drivers/gpu/drm/drm_auth.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>> index f00e5abdbbf4..b59b26a71ad5 100644
>> --- a/drivers/gpu/drm/drm_auth.c
>> +++ b/drivers/gpu/drm/drm_auth.c
>> @@ -315,9 +315,10 @@ int drm_master_open(struct drm_file *file_priv)
>>   void drm_master_release(struct drm_file *file_priv)
>>   {
>>   	struct drm_device *dev = file_priv->minor->dev;
>> -	struct drm_master *master = file_priv->master;
>> +	struct drm_master *master;
>>
>>   	mutex_lock(&dev->master_mutex);
>> +	master = file_priv->master;
>>   	if (file_priv->magic)
>>   		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>>   
>> -- 
>> 2.25.1
>>
> 

 From what I can see, there are other places in the kernel that could 
use the _locked version of drm_is_current_master as well, such as 
drm_mode_getfb in drm_framebuffer.c. I'll take a closer look, and if the 
changes make sense I'll prepare a patch series for them.

Best wishes,
Desmond

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
