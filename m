Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4E8C636C9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 12:44:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602C16121F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602C16121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2021C404D5;
	Wed, 21 Jul 2021 12:44:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrTjZjZxp8s2; Wed, 21 Jul 2021 12:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0BB59404E5;
	Wed, 21 Jul 2021 12:44:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7A0CC0010;
	Wed, 21 Jul 2021 12:44:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C3BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 12:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4EEF40320
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 12:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNc4PIWDd4Pg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 12:44:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 759F34028A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 12:44:05 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 g22-20020a17090a5796b02901763aca3df6so948527pji.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mDcO9rSv0CwDOTDGsBa8hb+peHAKULXX/KhUGTkInL4=;
 b=kdestiJqyqNqzGtl1EryWfBW1Uz/yZjxVWbOGipFz4u/z2i8Zk3oRyrPvByp+Xv0Bl
 bE8u0+zVtNWQ9HrhFjVpH4xMWsl7U2czLVxC309aWdy3MdV4m9JSlU4FL4Yz/l6xUZmf
 vmUvNuUv455pA01iBHeIUq6P83rDbWlvsXFJTWL+2zLI5j0NvSfI3NPcmhDqnFKn7Zvb
 irS76f/DhhabDVLaPJ7isbxp7v7kp5HOBplIdTCXec+Xq89/mlzYtsh0dGeWcFAAb09t
 3vD/cIYoCNxtls34T9zjdr2gwlh/bZ8DBOsQe83NP5KBoXKkoLBonjwI9Mcs0Ju+WQqI
 3ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mDcO9rSv0CwDOTDGsBa8hb+peHAKULXX/KhUGTkInL4=;
 b=XN7dM1nviDnRlWRRxWPgPKxIhlGnuFZ3L+h+Pz+wsa/5aanwWj9QngCEc/wcVGm2Vf
 YyQbTDxMgS23HmZGePRCWjBvdXb/jbsbgqZqha1P+WQLoeGcIvf+ln1gAf6XzTN22RPm
 WlhSqR2AiP6W5yAUXzNOYzYGVk7JKy4W6mjLgep74yPBp7M17dB2VNMVLxeC9l/ccbCv
 f3AOAuZ8kw3gbT1i+6I1cJUT1ZW/6h4ULJo2QTQ/qZ0UM9d63yVaIBf+JLNSbaCVITL5
 fy7XLEXbWMO6GwqDdtn2g4xhKnLuG2K7qwVhFt56mogvp9IWQfI8nSTWHfxN+4rwXWfi
 pkiw==
X-Gm-Message-State: AOAM531Z5Ci0H1eb1WreI05Q2ADsGfKNs0PQ8FdWq/0iQlYohTn+KRJZ
 MxBDMuajDiPWbnRiBxCw1CI=
X-Google-Smtp-Source: ABdhPJwuSl5jkKmRAqUpEfZa0g9xbPiIkWL3vWnhlQtYHubheW20Ucmqo1Xkk8Q4Eoj11/peBJEhLA==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr35697665pjn.90.1626871444841; 
 Wed, 21 Jul 2021 05:44:04 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id mu9sm5290903pjb.26.2021.07.21.05.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 05:44:04 -0700 (PDT)
Subject: Re: [PATCH v8 0/5] drm: address potential UAF bugs with drm_master
 ptrs
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
 <YPcU3wJK7kC5b7kv@phenom.ffwll.local>
 <50c5582b-c674-4ef8-585f-7a3d78a49f85@gmail.com>
 <CAKMK7uGvb3O9Ypd73xZf6bdMcXJyGJw4C7GXGprkZLpN9Gx7qQ@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <52c4207a-6830-01c9-a28c-635c68de3e14@gmail.com>
Date: Wed, 21 Jul 2021 20:43:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGvb3O9Ypd73xZf6bdMcXJyGJw4C7GXGprkZLpN9Gx7qQ@mail.gmail.com>
Content-Language: en-US
Cc: Dave Airlie <airlied@linux.ie>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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

On 21/7/21 6:29 pm, Daniel Vetter wrote:
> On Wed, Jul 21, 2021 at 6:12 AM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>> On 21/7/21 2:24 am, Daniel Vetter wrote:
>>> On Mon, Jul 12, 2021 at 12:35:03PM +0800, Desmond Cheong Zhi Xi wrote:
>>>> Hi,
>>>>
>>>> In the previous thread on this series we decided to remove a patch that was violating a lockdep requirement in drm_lease. In addition to this change, I took a closer look at the CI logs for the Basic Acceptance Tests and noticed that another regression was introduced. The new patch 2 is a response to this.
>>>>
>>>> Overall, this series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
>>>> https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
>>>>
>>>> The series is broken up into five patches:
>>>>
>>>> 1. Move a call to drm_is_current_master() out from a section locked by &dev->mode_config.mutex in drm_mode_getconnector(). This patch does not apply to stable.
>>>>
>>>> 2. Move a call to drm_is_current_master() out from the RCU read-side critical section in drm_clients_info().
>>>>
>>>> 3. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c.
>>>>
>>>> 4. Serialize drm_file.master by introducing a new spinlock that's held whenever the value of drm_file.master changes.
>>>>
>>>> 5. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are not freed during use.
>>>>
>>>> v7 -> v8:
>>>> - Remove the patch that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find. This patch violated an existing lockdep requirement as reported by the intel-gfx CI.
>>>> - Added a new patch that moves a call to drm_is_current_master out from the RCU critical section in drm_clients_info. This was reported by the intel-gfx CI.
>>>>
>>>> v6 -> v7:
>>>> - Modify code alignment as suggested by the intel-gfx CI.
>>>> - Add a new patch to the series that adds a new lock to serialize drm_file.master, in response to the lockdep splat by the intel-gfx CI.
>>>> - Update drm_file_get_master to use the new drm_file.master_lock instead of drm_device.master_mutex, in response to the lockdep splat by the intel-gfx CI.
>>>>
>>>> v5 -> v6:
>>>> - Add a new patch to the series that moves the call to _drm_lease_held out from the section locked by &dev->mode_config.idr_mutex in __drm_mode_object_find.
>>>> - Clarify the kerneldoc for dereferencing drm_file.master, as suggested by Daniel Vetter.
>>>> - Refactor error paths with goto labels so that each function only has a single drm_master_put(), as suggested by Emil Velikov.
>>>> - Modify comparisons to NULL into "!master", as suggested by the intel-gfx CI.
>>>>
>>>> v4 -> v5:
>>>> - Add a new patch to the series that moves the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex.
>>>> - Additionally, added a missing semicolon to the patch, caught by the intel-gfx CI.
>>>>
>>>> v3 -> v4:
>>>> - Move the call to drm_is_current_master in drm_mode_getconnector out from the section locked by &dev->mode_config.mutex. As suggested by Daniel Vetter. This avoids a circular lock lock dependency as reported here https://patchwork.freedesktop.org/patch/440406/
>>>> - Inside drm_is_current_master, instead of grabbing &fpriv->master->dev->master_mutex, we grab &fpriv->minor->dev->master_mutex to avoid dereferencing a null ptr if fpriv->master is not set.
>>>> - Modify kerneldoc formatting for drm_file.master, as suggested by Daniel Vetter.
>>>> - Additionally, add a file_priv->master NULL check inside drm_file_get_master, and handle the NULL result accordingly in drm_lease.c. As suggested by Daniel Vetter.
>>>>
>>>> v2 -> v3:
>>>> - Move the definition of drm_is_current_master and the _locked version higher up in drm_auth.c to avoid needing a forward declaration of drm_is_current_master_locked. As suggested by Daniel Vetter.
>>>> - Instead of leaking drm_device.master_mutex into drm_lease.c to protect drm_master pointers, add a new drm_file_get_master() function that returns drm_file->master while increasing its reference count, to prevent drm_file->master from being freed. As suggested by Daniel Vetter.
>>>>
>>>> v1 -> v2:
>>>> - Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov.
>>>
>>> Apologies for the delay, I missed your series. Maybe just ping next time
>>> around there's silence.
>>>
>>> Looks all great, merged to drm-misc-next. Given how complex this was I'm
>>> vary of just pushing this to -fixes without some solid testing.
>>>
>>
>> Hi Daniel,
>>
>> Thanks for merging, more testing definitely sounds good to me.
>>
>>> One thing I noticed is that drm_is_current_master could just use the
>>> spinlock, since it's only doing a read access. Care to type up that patch?
>>>
>>
>> I thought about this too, but I'm not sure if that's the best solution.
>>
>> drm_is_current_master calls drm_lease_owner which then walks up the tree
>> of master lessors. The spinlock protects the master of the current drm
>> file, but subsequent lessors aren't protected without holding the
>> device's master mutex.
> 
> But this isn't a fpriv->master pointer, but a master->lessor pointer.
> Which should never ever be able to change (we'd have tons of uaf bugs
> around drm_lease_owner otherwise). So I don't think there's anything
> that dev->master_lock protects here that fpriv->master_lookup_lock
> doesn't protect already?
> 
> Or am I missing something?
>  > The comment in the struct drm_master says it's protected by
> mode_config.idr_mutex, but that only applies to the idrs and lists I
> think.
> 

Ah you're right, I also completely forgot that lessees hold a reference 
to their lessor so nothing will be freed as long as the spinlock is 
held. I'll prepare that patch then, thanks for pointing it out.

>>> Also, do you plan to look into that idea we've discussed to flush pending
>>> access when we revoke a master or a lease? I think that would be really
>>> nice improvement here.
>>> -Daniel
>>>
>>
>> Yup, now that the potential UAFs are addressed (hopefully), I'll take a
>> closer look and propose a patch for this.
> 
> Thanks a lot.
> -Daniel
> 
>>
>> Best wishes,
>> Desmond
>>
>>>>
>>>> Desmond Cheong Zhi Xi (5):
>>>>     drm: avoid circular locks in drm_mode_getconnector
>>>>     drm: avoid blocking in drm_clients_info's rcu section
>>>>     drm: add a locked version of drm_is_current_master
>>>>     drm: serialize drm_file.master with a new spinlock
>>>>     drm: protect drm_master pointers in drm_lease.c
>>>>
>>>>    drivers/gpu/drm/drm_auth.c      | 93 ++++++++++++++++++++++++---------
>>>>    drivers/gpu/drm/drm_connector.c |  5 +-
>>>>    drivers/gpu/drm/drm_debugfs.c   |  3 +-
>>>>    drivers/gpu/drm/drm_file.c      |  1 +
>>>>    drivers/gpu/drm/drm_lease.c     | 81 +++++++++++++++++++++-------
>>>>    include/drm/drm_auth.h          |  1 +
>>>>    include/drm/drm_file.h          | 18 +++++--
>>>>    7 files changed, 152 insertions(+), 50 deletions(-)
>>>>
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
