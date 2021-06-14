Return-Path: <SRS0=+j5t=LI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED71FC47094
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Jun 2021 19:09:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8D161042
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Jun 2021 19:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8D161042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E706404FB;
	Mon, 14 Jun 2021 19:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu6F7CQh2_LH; Mon, 14 Jun 2021 19:09:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2E84340500;
	Mon, 14 Jun 2021 19:09:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C80CC000D;
	Mon, 14 Jun 2021 19:09:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74F4EC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 642FB83BBB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2K7qquZVvI-H
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:09:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D562C83BBA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:09:34 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id k71so4392092vka.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uMc4URnnV+tfXvNhamKWfB2liJJVFr5aYUr1EsM52gA=;
 b=tiKwMdAaMX3CQD5jTxTChA0MD3dY/jEv8DUJFllkv59ExYYvlbiw3kXxGb7/PN0gkH
 kt0rlzo0k+xB/ol8V+Gwx/CIW1KIEr40B5NxaGGDPQh4QmB8O2zvUCs9sMAOervWV5QU
 jmXeCa7C8zFqEzkESA32yxjXRePmNFbStsAe7yulacEN85HJWKd5/GGfgtdejSHiWgXN
 5Ji4Ia+M2zaVyvO3w7WP9ofssgfOfQ9rDTg+fWZO1BrOLdWwZ1XCScm5dpjTyEIZseI5
 b9yoiIoo7P93rKELTQPxXqQOdeFyVFuCuObfAhnpWHer2MKf5+/gTpJY33q+gpgkkusw
 3nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uMc4URnnV+tfXvNhamKWfB2liJJVFr5aYUr1EsM52gA=;
 b=sT04/fSqYMcCoskkOH3MtRe2S+aSsdlVmF6AcRQD4xue8028xlLgmrCTuj/2qz9SNz
 wvamc7MP5DBvcBatgkHe/2/QHmsULDiOfVQhd8yNFNVOxHAqpX16YCw5U0YR9eZ6KzwV
 n+qM25KTZKYI9lAIHXl+Nkj17VIVtoCOoBZgR12cRfCH2YCUXJWBCfWF6Rfqg3K63oVN
 GqZNKOi73tFAF+LFqhtnkzoPatg+sC/XAMjkHNewimQ07Hl1v4yToyRzxX3IRFmuNwOb
 1AU/D4zU2Lxgc4b3CoX1Pp3SjjEHeUt690ND0AaUYY3EJVmXlQ+myZo/L8JITffEJdL6
 hh2w==
X-Gm-Message-State: AOAM533OsjQgMS3p9L9wtlBTu4L9V/WK6OQhrDvSfH7I8G4T2WG4Bsel
 aLL1knlwTE/93CNp/xpZfiSipUaKjtYxAmykltM=
X-Google-Smtp-Source: ABdhPJxNPk2Ta8ZZVvy0EEGmzM9l4SHEbYT66VTYgFz6piDBUXdGTwFY1Ytf6VseBiX971f4q0QCfFpWPyVZyaci6ek=
X-Received: by 2002:a1f:4594:: with SMTP id s142mr542586vka.16.1623697773669; 
 Mon, 14 Jun 2021 12:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-2-desmondcheongzx@gmail.com>
In-Reply-To: <20210612125426.6451-2-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 14 Jun 2021 20:09:22 +0100
Message-ID: <CACvgo50kL=0dz6Jpt5BDLXYq+XTMhMy9=Pu7qeqDmsy_bgKsdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add a locked version of drm_is_current_master
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> While checking the master status of the DRM file in
> drm_is_current_master(), the device's master mutex should be
> held. Without the mutex, the pointer fpriv->master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could lead to use-after-free errors when the pointer is subsequently
> dereferenced in drm_lease_owner().
>
> The callers of drm_is_current_master() from drm_auth.c hold the
> device's master mutex, but external callers do not. Hence, we implement
> drm_is_current_master_locked() to be used within drm_auth.c, and
> modify drm_is_current_master() to grab the device's master mutex
> before checking the master status.
>
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
