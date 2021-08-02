Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649C2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 08:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FCAC610A2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 08:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FCAC610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D14D9838AF;
	Mon,  2 Aug 2021 08:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3ErNdBCenwn; Mon,  2 Aug 2021 08:26:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EA704838CC;
	Mon,  2 Aug 2021 08:26:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4479C001B;
	Mon,  2 Aug 2021 08:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B91A9C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEDAB60688
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ecjro0WICuo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DA2060677
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 08:26:20 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id gn26so29596309ejc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 01:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=dsziZdy5Ow5D8gopZOaZ5R2Y9q2Zn8W3l7iLlmn9U8Q=;
 b=c2CitCQI2D0p8lStmugnZTg3EBE0fiWkS2a2WI99GRh4AHvZngehWksh//Fk0dyeqs
 jZYKE/Yv8snD1NXwE21uuKFZ4secH6AltcuGRo/TawavWWF2SIBYjip5p1/63h4lsyxB
 0fjn6qDkkokkr5BBTytsNUgwWbsroAXTQhWVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=dsziZdy5Ow5D8gopZOaZ5R2Y9q2Zn8W3l7iLlmn9U8Q=;
 b=DWgtAFYvCZJlXVWd2gaB1Wvytlm7E/hxOI8Q+0kEw5c64YPeeJAFrvYXz4Yem+jBnr
 9y55D9K0Qry26YOFYv0u2rAAd4XDnucuu7BdRYYQor6h/BdRk9wWp8oPr4HYmLYY/ofG
 0YRRG5+4Q2rej3b8H/3cfGd2uwOL1dGTkYshfWYWnVZKwoZvOI6B+aAhRibxEYRP1f8O
 zBUbM8u0FxaawO4VqKAVPZ+FK/GaDxF4tug0d7njy/egn3zpqtvoDLtNx7KPvdFzUBup
 j7AYQ9yMQTPCouEXUsf5XrZ2xumRS6jTayOKDCAIJxq5xtFoxoRzrMUi6MN88Dpmmgiz
 WGoQ==
X-Gm-Message-State: AOAM533xaLP3Abx7SlJBbZwlyr74d25UtZRDtTv+RzG0TcfGEALMsfCV
 sAzXB4ukZ0PhxPT2YTCD7chPKA==
X-Google-Smtp-Source: ABdhPJx/Y5AN+J27nGPtVIm7eKpEVMtxXL+seU+GKR4/npXEszZqv05aJbTr3NsEhmHTZ4BpFBsQOQ==
X-Received: by 2002:a17:906:af86:: with SMTP id
 mj6mr11196318ejb.144.1627892778556; 
 Mon, 02 Aug 2021 01:26:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id de49sm4160066ejc.34.2021.08.02.01.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 01:26:18 -0700 (PDT)
Date: Mon, 2 Aug 2021 10:26:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2 0/2] locking/lockdep, drm: apply new lockdep assert in
 drm_auth.c
Message-ID: <YQesKIRQKYyTFyxJ@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, longman@redhat.com,
 boqun.feng@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731082458.1962043-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Cc: tzimmermann@suse.de, airlied@linux.ie, boqun.feng@gmail.com,
 maarten.lankhorst@linux.intel.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, peterz@infradead.org, mingo@redhat.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, longman@redhat.com,
 will@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Jul 31, 2021 at 04:24:56PM +0800, Desmond Cheong Zhi Xi wrote:
> Hi,
> 
> Following a discussion on the patch ("drm: use the lookup lock in
> drm_is_current_master") [1], Peter Zijlstra proposed new lockdep_assert
> helpers to make it convenient to compose lockdep checks together.
> 
> This series includes the patch that introduces the new lockdep helpers,
> then utilizes these helpers in drm_is_current_master_locked in the
> following patch.
> 
> v1 -> v2:
> Patch 2:
> - Updated the kerneldoc on the lock design of drm_file.master to explain
> the use of lockdep_assert(). As suggested by Boqun Feng.
> 
> Link: https://lore.kernel.org/lkml/20210722092929.244629-2-desmondcheongzx@gmail.com/ [1]

Can you pls also cc: this to intel-gfx so the local CI there can pick it
up and verify? Just to check we got it all.
-Daniel


> 
> Best wishes,
> Desmond
> 
> Desmond Cheong Zhi Xi (1):
>   drm: add lockdep assert to drm_is_current_master_locked
> 
> Peter Zijlstra (1):
>   locking/lockdep: Provide lockdep_assert{,_once}() helpers
> 
>  drivers/gpu/drm/drm_auth.c |  6 +++---
>  include/drm/drm_file.h     |  4 ++++
>  include/linux/lockdep.h    | 41 +++++++++++++++++++-------------------
>  3 files changed, 28 insertions(+), 23 deletions(-)
> 
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
