Return-Path: <SRS0=f3wf=LM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CF6C49EA2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:54:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1041E610C7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Jun 2021 16:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1041E610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8E874011F;
	Fri, 18 Jun 2021 16:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FldWfxFhP4G0; Fri, 18 Jun 2021 16:54:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DA39C400CA;
	Fri, 18 Jun 2021 16:54:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B224CC000D;
	Fri, 18 Jun 2021 16:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5340DC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420B183D9A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:54:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVHFdo-NpYQ5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:54:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828DF83D89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 16:54:16 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h12so4976671plf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Jun 2021 09:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xqb9Co+VDdnzhP4HmuWmFOP87/1Nlp2SE27mSELnEKY=;
 b=rfGV6WIX6p5f8iVX3njmvRVVp651Nn9WjPcdMBErf4I5MsoJaUhmQUEhYXi5nDl2pP
 oPT4VBl4QjZAbOnZ7gJxQ2hTre+u5AWTYpPsNFUEE0dIvA+tlHL7U8Xy7eh4yxPSDFeS
 dG5GKH8AoDrR8e4SinoRGPJYK4/+xYNq91TqfNYZ5aVMXSu4QW4x/TEs0JQc11k/DJk4
 m3j5lbrSgMByCuRQKrXos4Qr59uqV2q8AHtT4RVe+2AmIX+JM2h+IWuGOKoOTAwsxOBA
 mpFQQRAfNKA/rknpPM9Nhc+Ldkb3ai1gq2NiEWeaTSHwcaZ8yg7zDOYr0QAtsuhmZ4ZP
 wXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xqb9Co+VDdnzhP4HmuWmFOP87/1Nlp2SE27mSELnEKY=;
 b=byOtxFa/YQPyDm4DGTp8TPBYylhHrJ5d/G8eWOFMhquytFdo1VBCVndoG4GAeULKAS
 a4Uo5N/oYSFIsWU4FbKZEMIo9PRX+ASwiJPmqCLldVIpJL6OC0krc2uCdOOSa8Mp4ZTg
 /uhDlJ9qCSZZquOyTfIF9q8TEN6HOngQWny/Uw1R+UTHaTY5at45gH6cIsskHhLwRQCU
 gmw8a0Wabz9jGTuQa+1XTJ0SFUrMEvyYQxQ9K2b1/z1f9UGTJz/3QIKj5O0TqhtNsbBI
 YJdrIIl0BTJ6ODPHrPQ1Ok343YUUq9ijDjrhG4Kr32i7RKAKs7Tstdgm98cwjWoZR5vF
 9Heg==
X-Gm-Message-State: AOAM532NYpsVPuw1t7XJgjqpy8ry+tugSPUTu3Y4Lj7iVem8+sn2s9xb
 8mb4rwIzXh9ukigLHV7NZGw=
X-Google-Smtp-Source: ABdhPJzf5vzP9b+X18fG1iHvtzN8o/UKwTq45GhZi2rLxKUgERrbZvVUEL0qTYORWMPbGuSTxbY8yA==
X-Received: by 2002:a17:90b:393:: with SMTP id
 ga19mr11884428pjb.182.1624035255912; 
 Fri, 18 Jun 2021 09:54:15 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id in22sm5090639pjb.57.2021.06.18.09.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 09:54:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-3-desmondcheongzx@gmail.com>
 <YMuCYqLafn5sGcFo@phenom.ffwll.local>
 <c384d835-d910-5b04-e88c-a7878ce6d37d@gmail.com>
 <CAKMK7uE-3S_vOm7DsqFyvHngSTwoc5ibzt46-9FcC550Qd9+jw@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <a43b752e-e823-01ea-9902-1c5e173aa6bf@gmail.com>
Date: Sat, 19 Jun 2021 00:54:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE-3S_vOm7DsqFyvHngSTwoc5ibzt46-9FcC550Qd9+jw@mail.gmail.com>
Content-Language: en-US
Cc: Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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

On 18/6/21 5:12 pm, Daniel Vetter wrote:
> On Fri, Jun 18, 2021 at 5:05 AM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>> On 18/6/21 1:12 am, Daniel Vetter wrote:
>>> On Tue, Jun 15, 2021 at 10:36:45AM +0800, Desmond Cheong Zhi Xi wrote:
>>>> This patch ensures that the device's master mutex is acquired before
>>>> accessing pointers to struct drm_master that are subsequently
>>>> dereferenced. Without the mutex, the struct drm_master may be freed
>>>> concurrently by another process calling drm_setmaster_ioctl(). This
>>>> could then lead to use-after-free errors.
>>>>
>>>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
>>>>    1 file changed, 43 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
>>>> index da4f085fc09e..3e6f689236e5 100644
>>>> --- a/drivers/gpu/drm/drm_lease.c
>>>> +++ b/drivers/gpu/drm/drm_lease.c
>>>> @@ -107,10 +107,16 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>>>>     */
>>>>    bool _drm_lease_held(struct drm_file *file_priv, int id)
>>>>    {
>>>> +    bool ret;
>>>> +
>>>>       if (!file_priv || !file_priv->master)
>>>>               return true;
>>>>
>>>> -    return _drm_lease_held_master(file_priv->master, id);
>>>> +    mutex_lock(&file_priv->master->dev->master_mutex);
>>>
>>> So maybe we have a bug somewhere, and the kerneldoc isn't 100% clear, but
>>> I thought file_priv->master is invariant over the lifetime of file_priv.
>>> So we don't need a lock to check anything here.
>>>
>>> It's the drm_device->master derefence that gets us into trouble. Well also
>>> file_priv->is_owner is protected by dev->master_mutex.
>>>
>>> So I think with your previous patch all the access here in drm_lease.c is
>>> ok and already protected? Or am I missing something?
>>>
>>> Thanks, Daniel
>>>
>>
>> My thinking was that file_priv->master is invariant only if it is the
>> creator of master. If file_priv->is_master is false, then a call to
>> drm_setmaster_ioctl will invoke drm_new_set_master, which then allocates
>> a new master for file_priv, and puts the old master.
>>
>> This could be an issue in _drm_lease_held_master, because we dereference
>> master to get master->dev, master->lessor, and master->leases.
>>
>> With the same reasoning, in other parts of drm_lease.c, if there's an
>> access to drm_file->master that's subsequently dereferenced, I added a
>> lock around them.
>>
>> I could definitely be mistaken on this, so apologies if this scenario
>> doesn't arise.
> 
> You're right, I totally missed that setmaster can create a new master
> instance. And the kerneldoc for drm_file->master doesn't explain this
> and mention that we must hold drm_device.master_mutex while looking at
> that pointer. Can you pls do a patch which improves the documentation
> for that?
> 

Sounds good, I'll add it to the patch series.

> Now for the patch itself I'm not entirely sure what we should do.
> Leaking the dev->master_mutex into drm_lease.c just because of the
> setmaster ioctl is kinda unsightly. And we don't really care about the
> fpriv->master changing under us, we only need to make sure it doesn't
> get freed. And drm_master is refcounted already.
> 
> So alternative solution: We add a drm_file_get_master() function which
> calls drm_master_get under the lock, and we use that instead of
> directly derefencing drm_file->master? Ofc then needs drm_master_put
> instead of mutex_unlock. Kerneldoc should then also point at this new
> function as the correct way to look at drm_file->master state.
> 
> This way it's 100% clear we're dealing with a lifetime issue and not a
> consistency issues.
> 
> What do you think?
> -Daniel
> 

Makes sense to me, since the drm master itself holds the lease, as long 
as it isn't freed while we're using it, there's no need to prevent the 
value of fpriv->master from changing after we access it in drm_lease.c.

I was going to say that it may be unclear when to use the

	master = drm_file_get_master(file_priv);
	...
	drm_master_put(&master);

pattern, versus when to use

	mutex_lock(&dev->master_mutex);
	master = file_priv->master;
	...
	mutex_unlock(&dev->master_mutex);

. The second pattern, for example, is used in drm_getunique, and also in 
drm_setversion which calls drm_set_busid.

But on closer inspection, it's clearer to me now that those functions 
need the master_mutex because they access protected fields such as 
unique and unique_len.

Would it then be correct to state in the kerneldoc that 
drm_file_get_master() should be used to look at drm_file->master only if 
we aren't already holding master_mutex + have no other need to grab 
master_mutex?

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
