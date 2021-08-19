Return-Path: <SRS0=yLM5=NK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B954C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 05:32:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA71B60EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Aug 2021 05:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA71B60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 957E460B9E;
	Thu, 19 Aug 2021 05:32:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChfaIMGP3ggi; Thu, 19 Aug 2021 05:32:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9C5F060649;
	Thu, 19 Aug 2021 05:32:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 73247C001A;
	Thu, 19 Aug 2021 05:32:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1AC5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 05:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A9C40797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 05:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e9wwnncvSerh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 05:31:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FD7440578
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Aug 2021 05:31:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso10545945pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Aug 2021 22:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CFAh2ohJN76u6Eruh33dHQq9ass8KChMC1IajJFgPH8=;
 b=HYJgzpgvWaAw7btZx7v+sX1ebqDpXWCM6m12POBpIsuzItZ06SvUkJuPbKSrk3FuUc
 oamxPO8fPNZoUWWvVhUe6rkiV+DYt4vrGo9UKMbe/DJzyAfx8pVYL9oT7wzEDEaT/S91
 MmLakU9Uc62a1+VqiSNx91xei08VB93GtjMoJBPhYeX1dBjzDD3H5aGUw6MbhZ1YAJMp
 edbzJMAQUCan7g7Pb4YcfY8ahN+yNPwK2RvCSSwdgqkVqiEWtb0r94XSsLROR+zdX6oL
 +zvE2OvSSn57qPUP3aFejiG5nF2zHujYVVjjWPVvVKzuYc/oIodXR+Uo9xiPffPqY+S6
 3eMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CFAh2ohJN76u6Eruh33dHQq9ass8KChMC1IajJFgPH8=;
 b=GzUIHI00jD0ognMoZXb2ln7peVZAPmdvnv5J+XHw9l9jtmj0bV/WpZL8bmPzpFtoPz
 Axo9JFhf7PrEr6qw6xCfowDZRQO9FCwI0qC6qCHRexTC5xV9SK4mBD8Z2FfC0s9sUtmB
 GfWYT+5aRBsRIvUUSz+RpNlqPaNMQATSXc8m1/+aHDE4IY0Q7h8+cgfjqOkG6h0qCIDx
 d7+rZbnDym2MaA2IgWR8WpLN4SRiqDIQiWOFC2l5v7y9Qbh1JB7oMaNcEc7k/Vy9SNME
 9vraGZJG7JTm9NqPoNmCQeXMQY2Lyh1mD0UEZkW6D3O2xUaWqNlr8EKs60mwewkyfTJY
 gJDA==
X-Gm-Message-State: AOAM530PRJuyYbfzxeAIMoXPAtE0CYm/1Q+wc3XarqOVVxOYHOKLq49b
 JcPqZoCRlBiupS0vgry3BudBe8gg24dLnUDTUQA=
X-Google-Smtp-Source: ABdhPJzHWe7IqBDZJBR5DhOXYwVbuf1qus5KD/vagYpAW2JTmvesSwzD7dXboeZyB3QuDoSce3EDfQ==
X-Received: by 2002:a17:90a:9f91:: with SMTP id
 o17mr12909893pjp.29.1629351117654; 
 Wed, 18 Aug 2021 22:31:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id s26sm1873118pgv.46.2021.08.18.22.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 22:31:57 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v3 4/9] drm: fix potential null ptr
 dereferences in drm_{auth, ioctl}
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210818073824.1560124-1-desmondcheongzx@gmail.com>
 <20210818073824.1560124-5-desmondcheongzx@gmail.com>
 <YRzcuiQrLFsWowas@phenom.ffwll.local>
 <53a63ac8-f2de-91f7-4e0f-20b0f3f61d52@gmail.com>
 <CAKMK7uG+nqnkNd56WPhze3V=e1ioL0PTLQxveBofQT3gNPB9HA@mail.gmail.com>
Message-ID: <18df91cb-3948-f4f4-d548-8d23107540ae@gmail.com>
Date: Thu, 19 Aug 2021 13:31:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG+nqnkNd56WPhze3V=e1ioL0PTLQxveBofQT3gNPB9HA@mail.gmail.com>
Content-Language: en-US
Cc: Jens Axboe <axboe@kernel.dk>, walter-zh.wu@mediatek.com,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Oleg Nesterov <oleg@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
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

On 19/8/21 12:33 am, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 5:37 PM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> On 18/8/21 6:11 pm, Daniel Vetter wrote:
>>> On Wed, Aug 18, 2021 at 03:38:19PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> There are three areas where we dereference struct drm_master without
>>>> checking if the pointer is non-NULL.
>>>>
>>>> 1. drm_getmagic is called from the ioctl_handler. Since
>>>> DRM_IOCTL_GET_MAGIC has no ioctl flags, drm_getmagic is run without
>>>> any check that drm_file.master has been set.
>>>>
>>>> 2. Similarly, drm_getunique is called from the ioctl_handler, but
>>>> DRM_IOCTL_GET_UNIQUE has no ioctl flags. So there is no guarantee that
>>>> drm_file.master has been set.
>>>
>>> I think the above two are impossible, due to the refcounting rules for
>>> struct file.
>>>
>>
>> Right, will drop those two parts from the patch.
>>
>>>> 3. drm_master_release can also be called without having a
>>>> drm_file.master set. Here is one error path:
>>>>     drm_open():
>>>>       drm_open_helper():
>>>>         drm_master_open():
>>>>           drm_new_set_master(); <--- returns -ENOMEM,
>>>>                                      drm_file.master not set
>>>>         drm_file_free():
>>>>           drm_master_release(); <--- NULL ptr dereference
>>>>                                      (file_priv->master->magic_map)
>>>>
>>>> Fix these by checking if the master pointers are NULL before use.
>>>>
>>>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_auth.c  | 16 ++++++++++++++--
>>>>    drivers/gpu/drm/drm_ioctl.c |  5 +++++
>>>>    2 files changed, 19 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
>>>> index f9267b21556e..b7230604496b 100644
>>>> --- a/drivers/gpu/drm/drm_auth.c
>>>> +++ b/drivers/gpu/drm/drm_auth.c
>>>> @@ -95,11 +95,18 @@ EXPORT_SYMBOL(drm_is_current_master);
>>>>    int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>>>>    {
>>>>       struct drm_auth *auth = data;
>>>> +    struct drm_master *master;
>>>>       int ret = 0;
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>> +    master = file_priv->master;
>>>> +    if (!master) {
>>>> +            mutex_unlock(&dev->master_mutex);
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>>       if (!file_priv->magic) {
>>>> -            ret = idr_alloc(&file_priv->master->magic_map, file_priv,
>>>> +            ret = idr_alloc(&master->magic_map, file_priv,
>>>>                               1, 0, GFP_KERNEL);
>>>>               if (ret >= 0)
>>>>                       file_priv->magic = ret;
>>>> @@ -355,8 +362,12 @@ void drm_master_release(struct drm_file *file_priv)
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>>       master = file_priv->master;
>>>> +
>>>> +    if (!master)
>>>> +            goto unlock;
>>>
>>> This is a bit convoluted, since we're in the single-threaded release path
>>> we don't need any locking for file_priv related things. Therefore we can
>>> pull the master check out and just directly return.
>>>
>>> But since it's a bit surprising maybe a comment that this can happen when
>>> drm_master_open in drm_open_helper fails?
>>>
>>
>> Sounds good. This can actually also happen in the failure path of
>> mock_drm_getfile if anon_inode_getfile fails. I'll leave a short note
>> about both of them.
>>
>>> Another option, and maybe cleaner, would be to move the drm_master_release
>>> from drm_file_free into drm_close_helper. That would be fully symmetrical
>>> and should also fix the bug here?
>>> -Daniel
>>>
>> Hmmm maybe the first option to move the check out of the lock might be
>> better. If I'm not wrong, we would otherwise also need to move
>> drm_master_release into drm_client_close.
> 
> Do we have to?
> 
> If I haven't missed anything, the drm_client stuff only calls
> drm_file_alloc and doesn't set up a master. So this should work?
> -Daniel
> 

Ahhhh ok yes, I understand what's going on better now. I think you're 
right, moving drm_master_release into drm_close_helper should fix all 
the places it can go wrong.

>>
>>>
>>>> +
>>>>       if (file_priv->magic)
>>>> -            idr_remove(&file_priv->master->magic_map, file_priv->magic);
>>>> +            idr_remove(&master->magic_map, file_priv->magic);
>>>>
>>>>       if (!drm_is_current_master_locked(file_priv))
>>>>               goto out;
>>>> @@ -379,6 +390,7 @@ void drm_master_release(struct drm_file *file_priv)
>>>>               drm_master_put(&file_priv->master);
>>>>               spin_unlock(&dev->master_lookup_lock);
>>>>       }
>>>> +unlock:
>>>>       mutex_unlock(&dev->master_mutex);
>>>>    }
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>>>> index 26f3a9ede8fe..4d029d3061d9 100644
>>>> --- a/drivers/gpu/drm/drm_ioctl.c
>>>> +++ b/drivers/gpu/drm/drm_ioctl.c
>>>> @@ -121,6 +121,11 @@ int drm_getunique(struct drm_device *dev, void *data,
>>>>
>>>>       mutex_lock(&dev->master_mutex);
>>>>       master = file_priv->master;
>>>> +    if (!master) {
>>>> +            mutex_unlock(&dev->master_mutex);
>>>> +            return -EINVAL;
>>>> +    }
>>>> +
>>>>       if (u->unique_len >= master->unique_len) {
>>>>               if (copy_to_user(u->unique, master->unique, master->unique_len)) {
>>>>                       mutex_unlock(&dev->master_mutex);
>>>> --
>>>> 2.25.1
>>>>
>>>
>>
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
