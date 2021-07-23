Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52606C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 06:44:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B7160ED7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 06:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8B7160ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7A9606D9;
	Fri, 23 Jul 2021 06:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1TTggC-zJpK; Fri, 23 Jul 2021 06:44:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB44E6066F;
	Fri, 23 Jul 2021 06:44:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5EAAC001A;
	Fri, 23 Jul 2021 06:44:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FDE3C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 06:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F2A40161
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 06:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UB3wbSgsyiNX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 06:44:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14CDE40153
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 06:44:41 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so7584086pjm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JtVRhU77ke1jykJUlx44YgtyrOvEU41Pb5DTJX/92t8=;
 b=YICsHnOycxoxkOgj0f0hjRbEP9/EY2rkWi/vMtZq7CjO4baIqSowmIcWA3Httq8u0T
 9VTxJKZo/Uze4wwTZMDFowZR7eq6Xi5NGBR4XR69N0PhPkflgn9kz5ICkPWPi1UKzDGp
 M2B3tekHiBZBL23dNaDN/fjKudWdmkxIYvIrvSMQJpm2vUXfh7PjlVxD3OpUodCsj3E3
 OtIxeEVpX3fSMNV8S8PoGC/66JqXT3qxwXBNBjfyyj0/2tTanARkAuMkZBCegz5Ygqjb
 e6NDLDE4vh8wtcAEDrC0uE0EOfWYMAC+vxcxNrjV85kTVU4syxEyEikhxxv/cQWF67ny
 g/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JtVRhU77ke1jykJUlx44YgtyrOvEU41Pb5DTJX/92t8=;
 b=dVpTmTY5Li0KMMZpaXxQLjLHTg2xWRz/PZWIWocHjjQQ8zDjxRl/i51zZFQJI9tGBZ
 ygxVGM1NzcDzBPFp6u54j/PxzIsrz3pbn4YT0Ls14uBouQm8nQq2Kw+Hkj8aXKCkIfvh
 V0O9+Juo6zMLl3nla3SxOGxCQKQck+5YKZSDgWGalrstqMdYexMfTlHLULbhO1ox1RZW
 PrLR4IiQtP3cjAm8X7wpCs5z12jesYMwZmGl8D+a8AKCE2x84eDt3T+0CVH9FpY9NitS
 d4HU9kZfNSz34/HQMGO1tQrApIqp7sloFXypNBawb4REHJza2SC+WTbK8CTiheFsXfnD
 rssQ==
X-Gm-Message-State: AOAM532kezjF2CjQ1zLHAlhyY5MWK48NwmjPqhGA/ZGadOsP5qRT8jzB
 DGpeugnd+LvcJD+3XpK99QLBwk1iDgf8ivSe/9s=
X-Google-Smtp-Source: ABdhPJz9iplYhIwZU1EW3jCgZDLvrZ1Zvw9a2ACvz4RyKBOSbBtaaNTJgPvIr9uWhLuDw5FJaj2vmw==
X-Received: by 2002:a17:90b:3a92:: with SMTP id
 om18mr3315626pjb.33.1627022681207; 
 Thu, 22 Jul 2021 23:44:41 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id u14sm28466293pga.93.2021.07.22.23.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:44:40 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
To: Zack Rusin <zackr@vmware.com>, linux-graphics-maintainer@vmware.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-4-desmondcheongzx@gmail.com>
 <b27a2e80-c912-15eb-e78b-c8b6f3993930@vmware.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <cb3ea66e-7f59-c057-06ea-7ddca4329a7c@gmail.com>
Date: Fri, 23 Jul 2021 14:44:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b27a2e80-c912-15eb-e78b-c8b6f3993930@vmware.com>
Content-Language: en-US
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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

On 23/7/21 3:17 am, Zack Rusin wrote:
> On 7/22/21 5:29 AM, Desmond Cheong Zhi Xi wrote:
>> drm_file.master should be protected by either drm_device.master_mutex
>> or drm_file.master_lookup_lock when being dereferenced. However,
>> drm_master_get is called on unprotected file_priv->master pointers in
>> vmw_surface_define_ioctl and vmw_gb_surface_define_internal.
>>
>> This is fixed by replacing drm_master_get with drm_file_get_master.
>>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> 
> Reviewed-by: Zack Rusin <zackr@vmware.com>
> 
> Thanks for taking the time to fix this. Apart from the clear logic 
> error, do you happen to know under what circumstances would this be hit? 
> We have someone looking at writing some vmwgfx specific igt tests and I 
> was wondering if I could add this to the list.
> 
> z

Hi Zack,

Thanks for the review.

For some context, the use-after-free happens when there's a race between 
accessing the value of drm_file.master, and a call to 
drm_setmaster_ioctl. If drm_file is not the creator of master, then the 
ioctl allocates a new master for drm_file and puts the old master.

Thus for example, the old value of drm_file.master could be freed in 
between getting the value of file_priv->master, and the call to 
drm_master_get.

I'm not entirely sure whether this scenario is a good candidate for a test?

For further reference, the issue was originally caught by Syzbot here:
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

And from the logs it seems that the reproducer set up a race between 
DRM_IOCTL_GET_UNIQUE and DRM_IOCTL_SET_MASTER. So possibly a race 
between VMW_CREATE_SURFACE and DRM_IOCTL_SET_MASTER could trigger the 
same bug.

Best wishes,
Desmond

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
