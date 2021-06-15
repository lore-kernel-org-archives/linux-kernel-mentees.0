Return-Path: <SRS0=6pMY=LJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE9CC2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6636141E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6636141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C660683A73;
	Tue, 15 Jun 2021 02:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZbKm-yFFjUy; Tue, 15 Jun 2021 02:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EB99E83A72;
	Tue, 15 Jun 2021 02:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C35B5C000E;
	Tue, 15 Jun 2021 02:15:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F397C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 368D583A73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSuKIc_1Eut8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:15:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9321D83A72
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:15:35 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e20so10227552pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bb+UZyvF103OTFB+0oPWDOXa4REu4kZb3WG5Dmt+tLs=;
 b=djhNl/bpEcNYfgOtTfUrpPCUBgvF5eX69I7/ZWGqOVvSpEWM6gcZ0URW4tIVQQnhWC
 6SVFL5enr0JvmIqakrJWdsfNkQFFp9mlZ1pgp2NWAz/R+gIdABlQkbKe9MBtNV6hO7Tz
 tny8vYeBX8DFxcRNA71AlLIKkm8+F3IEAw9JnxyX1pdZcplCm6J3r0/jJjvh/wQXWoQL
 EVQoWohGLrQRT4xc2bv3StU7lOYi71HGdQo3OkAU90H3NnGvrp9hPZv2kuEFubIHOEZL
 gi5FxCspuhjq3QTuLxAbzwQJdI1BO4n4G2OZ9wu4yDzhTcfpQXGtNi4irnwT3r8+sZHm
 qerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bb+UZyvF103OTFB+0oPWDOXa4REu4kZb3WG5Dmt+tLs=;
 b=TPGrHliRuP9m09+ruwtsGpR88PlPD2W56xJ3U3hYrBSWC7Y444EIiYvTPiLFxw+BN2
 I8aR/SJyRsHg5/y78QG/HjOSVukxq60RRDpw4oXFY0M+yPHTIwpte3iHc5CsT/0j6jMf
 tcRdE2/g0olTcpEGDEK86PVB1gk3BsTuMzwHL8RVW39pjWx6zk37pBdkCWl/fLtUkret
 +Dg8UKQveRLpRfK8pcRNBNXXzWdqqu4oChMMeVs7MFapz2KZIV2tZg+V9vXGtvLxYXJV
 sk5EA1gIYnhvHYdB3VwiaZNEry6PjZVACo6wnvF3g8nd+xW6J28VZKk/Zf1vKTsu6b+Z
 7iIw==
X-Gm-Message-State: AOAM532HACrS8L7Uz7yZ9f94J1nOP/3f35Xj5Bxxj/FGzerNiYv7qCay
 cYvVDxCil3Mz+aDsTxnL2uYJqBhS/N8OFhQp2mE=
X-Google-Smtp-Source: ABdhPJzbMNp+OJh6qTIIxfA2u8gNSm96l1xJmy6ecfpAeYhxlOm0wk0kQKK7cE5allybroyVbt6jag==
X-Received: by 2002:a63:d511:: with SMTP id c17mr1255540pgg.219.1623723334490; 
 Mon, 14 Jun 2021 19:15:34 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a9sm628494pjm.51.2021.06.14.19.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 19:15:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-3-desmondcheongzx@gmail.com>
 <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <7bd0d514-efc6-8118-0b28-dfa0bcf5d842@gmail.com>
Date: Tue, 15 Jun 2021 10:15:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
Content-Language: en-US
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>,
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

On 15/6/21 3:41 am, Emil Velikov wrote:
> On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> This patch ensures that the device's master mutex is acquired before
>> accessing pointers to struct drm_master that are subsequently
>> dereferenced. Without the mutex, the struct drm_master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could then lead to use-after-free errors.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
> 
> <snip>
> 
>> @@ -578,6 +594,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>          /* Hook up the fd */
>>          fd_install(fd, lessee_file);
>>
>> +       mutex_unlock(&dev->master_mutex);
> 
> I was going to suggest pushing the unlock call further up - after the
> drm_lease_create call. Although that would make the error path rather
> messy, so let's keep it as-is.
> 
> <snip>
> 
>> @@ -662,7 +684,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>          struct drm_mode_get_lease *arg = data;
>>          __u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>>          __u32 count_objects = arg->count_objects;
>> -       struct drm_master *lessee = lessee_priv->master;
>> +       struct drm_master *lessee;
>>          struct idr *object_idr;
>>          int count;
>>          void *entry;
>> @@ -678,8 +700,10 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>
>>          DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>>
>> +       mutex_lock(&dev->master_mutex);
> 
> As-is we're dereferencing an uninitialised pointer in DRM_DEBUG_LEASE.
> Move the lock and assignment before the DRM_DEBUG_LEASE, just like
> you've done in the list ioctl.
> 
> With this fix, the patch is;
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> -Emil
> 


Good catch, thanks for the feedback Emil. I'll fix this up in a v2 patchset.

Best wishes,
Desmond
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
