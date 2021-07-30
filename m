Return-Path: <SRS0=S3mN=MW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34379C4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 06:08:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED4B60F4B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Jul 2021 06:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DED4B60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6BA383B95;
	Fri, 30 Jul 2021 06:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFtyQliM5kRN; Fri, 30 Jul 2021 06:08:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D16F383B8D;
	Fri, 30 Jul 2021 06:08:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9851C001A;
	Fri, 30 Jul 2021 06:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A3C1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 06:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 638D960624
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 06:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QVGnYvU3YaIE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 06:08:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73474600B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Jul 2021 06:08:43 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id l18so10074734ioh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 23:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Ri7dUSHGhZY2tYqQt9WHv9mXFUqQVec2u9T6YNhEc0=;
 b=Hk2KvJDgF8BJlfdnAPgnRP/64Cvj3rjXJWTFLSCoZY/ulCK5cfAHu+GC9R4s7dLjv1
 SXHgg2P9e0oNTWauzALeEwhhgk7/ggHIrfoPq5Hc4GLwG5+674MQaxWTTLZfh8kQYH3u
 wRzKOWzkcViy4HqhhNIDX9GvLhBCGlyUuB3pFZll1Jq/g9fA0sRFvyxYUmn0ysfs+k7e
 kiBLhsEaBtULrp0PPxxD26BqJnbn2pIG1idgl1mwnIqecv6rweC1oMXKtpafQ5lK2wKC
 uc2X/BH7V5R++ZQlwxav7Hgkd044IyHr5yyySjtzMem0IwpJtbVOj6Zi0KOoxJ0vA7uE
 NvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Ri7dUSHGhZY2tYqQt9WHv9mXFUqQVec2u9T6YNhEc0=;
 b=mB9OnFMUGiba2RgFDsH6MoA1+iMGIk9j9JZV3V3lRBC1iV+j3kAPjtRKqNrNunMJvG
 3EsqXFWpbFTfMkzmTf/J/AHM9P7bdngt5JDOwAtHkc+gqgmnA5AFpruypcR1UW6t5QVf
 7/b4rEpOQcwnrTgAn/uyW/lKrhQADfUAtHeANZKstkD6toSDCEGAHHHZlYrCw4tQ5dvl
 MFpOoLIPkAngSihNiH+RV/zL6e4Dnx0EIBqIqx70lgAJ8TcmkSsW7bkxzrTvQzOq1Yuo
 eBckvfv0MxaHhAZ6rYd8kI5ZcazKdBT/09q4fuuCcNh10HWJecKcYdj+lzbQkVoRX+26
 nN8A==
X-Gm-Message-State: AOAM532z5kFqKQDPPZ/yiU7PTYcRU5fnE6uoqq9niNiu16LpZRC1qq6U
 koOUut1LUnkS6JUH9kEtECE=
X-Google-Smtp-Source: ABdhPJyvbk1qFvusNWnTRZMt8D4ZQbtWZ8pYKwuXWyNI5nEsznwSugT2hpZqY56lkSflsl9dw+S/zg==
X-Received: by 2002:a05:6602:218c:: with SMTP id
 b12mr1100588iob.82.1627625322651; 
 Thu, 29 Jul 2021 23:08:42 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id k4sm452212ior.55.2021.07.29.23.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 23:08:42 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 395E327C0054;
 Fri, 30 Jul 2021 02:08:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 30 Jul 2021 02:08:41 -0400
X-ME-Sender: <xms:ZpcDYX-C7wr8cjhSKq4JR-P_97ZSNgD9_wQWx6irRJ39x5GtIfQimg>
 <xme:ZpcDYTvGQo53XeLl4sr-xdEbcbXcZZUO7TO55mP7md2OYlU3JAf6fWah8FqSJly1E
 xqbqyItL8J1wp8AWQ>
X-ME-Received: <xmr:ZpcDYVDBS3A5BU2_dYrIbuMClFiKw-Dyp6Mb--rkumQHs1OOIvgD6vt1tkG0mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheeggdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhm
 rghilhdrtghomheqnecuggftrfgrthhtvghrnhepvdelieegudfggeevjefhjeevueevie
 etjeeikedvgfejfeduheefhffggedvgeejnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsoh
 hnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhg
 peepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:ZpcDYTebkroJ3dzWUOIvs0XyWbp942eAM9EjIsoS9rpxtiqaXlDIPw>
 <xmx:ZpcDYcNE1ywBbw5FlGyFO4BC19vzjqFp3Li20lmyV41WCoGERWuisw>
 <xmx:ZpcDYVkVGn4knw8H1fwjffd7ezjZ8UkP6P4x7Dvms5zWQg5zMiwdDQ>
 <xmx:aZcDYTmd_Kq16_ZsH3d7aQFuM0nmosDdUZiKtxtqfzNuEvMiP7lmXFNzKM0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jul 2021 02:08:38 -0400 (EDT)
Date: Fri, 30 Jul 2021 14:08:13 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH 2/2] drm: add lockdep assert to
 drm_is_current_master_locked
Message-ID: <YQOXTW8kSHdNjhiY@boqun-archlinux>
References: <20210730041515.1430237-1-desmondcheongzx@gmail.com>
 <20210730041515.1430237-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730041515.1430237-3-desmondcheongzx@gmail.com>
Cc: tzimmermann@suse.de, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, peterz@infradead.org,
 mingo@redhat.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 longman@redhat.com, will@kernel.org,
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

On Fri, Jul 30, 2021 at 12:15:15PM +0800, Desmond Cheong Zhi Xi wrote:
> In drm_is_current_master_locked, accessing drm_file.master should be
> protected by either drm_file.master_lookup_lock or
> drm_device.master_mutex. This was previously awkward to assert with
> lockdep.
> 
> Following patch ("locking/lockdep: Provide lockdep_assert{,_once}()
> helpers"), this assertion is now convenient so we add it in.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 9c24b8cc8e36..6f4d7ff23c80 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -63,9 +63,9 @@
>  
>  static bool drm_is_current_master_locked(struct drm_file *fpriv)
>  {
> -	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> -	 * should be held here.
> -	 */
> +	lockdep_assert_once(lockdep_is_held(&fpriv->master_lookup_lock) ||
> +			    lockdep_is_held(&fpriv->minor->dev->master_mutex));
> +

I think it's better to also add the lockdep_assert() of & (i.e. both
held) in the updater side, and have comments pointing to each other.

Is it convenient to do in this patchset? If the updater side doesn't
need to put the lockdep_assert() (maybe the lock acquire code and the
update code are in the same function), it's still better to add some
comments like:

	/*
	 * To update drm_file.master, both drm_file.master_lookup_lock
	 * and drm_device.master_mutex are needed, therefore holding
	 * either of them is safe and enough for the read side.
	 */

Just feel it's better to explain the lock design either in the
lockdep_assert() or comments.

Regards,
Boqun

>  	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
>  }
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
