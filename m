Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A41C11F68
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 00:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B794361D5D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 00:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B794361D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 811F683AA3;
	Wed, 30 Jun 2021 00:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nBvjJkZ5OagY; Wed, 30 Jun 2021 00:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A7E5183A91;
	Wed, 30 Jun 2021 00:16:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CD14C0010;
	Wed, 30 Jun 2021 00:16:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D389EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 00:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C693E4052F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 00:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4cZ5FOMCOjf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 00:16:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DE6D404A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 00:16:23 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so788470otl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Jun 2021 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
 b=XKDqX3TPtx+FM7XOGFT5ZxxIRnOGdcF7kmoOpeRxvJSLbMexAdV711roiibP4qR76q
 KT76AWQgueP1tZo03SIm3YWwMpUcHfF3jKmNbrm+XwvnbzZDcmGbFiVFNkv6db1TtrGf
 DGIgsilQzPkOKh0TKSnJ/MGueuZFhCQB0kSIwOb7CU2RSO+5GT8JMUvUWELpgGhRJYG9
 zoc5Yq/PetkBCi9nvCuSFE/DIJWYVnn3GuAIuwPrXnWt/OeNTOE4Nyy9uMPdS1gSGmHA
 5Kz2gJgQjVrKojgqR6WDet/Di5tgLLQqlXIJ5jyoS8fTZSk0PyD1Z5K52Gjezw/vmrK+
 qiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TeU+3+BSYIPpIeuTqgZDRxi1yeuqH6v4tOX7y63fgHw=;
 b=MT992DK8PRghD319KfEWq9KkG8ayUIO6eR1I/fb26SX53lpzR77LrAM4fBxmo78ecs
 wSJalpsRqYAMK+EEmeZCrI/15PzPjEstzFj0XpcWp/gLl1th+7KMs9m/kEmI09GKlU/f
 jnnv6e+RtIJSRJQ5RkKCewq+ygDN8ll1m21CDSnBMXoahGG4cTuGqeg54V1Wgujfv6SQ
 ofmdgfWgvn48zPF/CE3otWvi8lP3H0e5HzXKAKHmlBgfUtWqahB6vCiEU2/3cdjKfTni
 L9HLmY+NbuqwR0foSc7Y1d70g8UHKxk4q0f3ZbFETuDVp9/zQQxeabAShjfRX+3ygzkV
 8OQA==
X-Gm-Message-State: AOAM533vokKj05X6B+BDS+FT/q7ihsDRkGY0qVOOjylr6CGPVdAgEH7/
 4CFGkC8VqG8LGOJFM+Q2hXuo8SEL20LeP1aD0Jk=
X-Google-Smtp-Source: ABdhPJx34XXa9kHNh6uvHXEDImmKhDaL6BZO5KazFWN+0la39xePneKq3e4T3vbCD/IXdwpTxTXiC0j8xj4riZHpj8M=
X-Received: by 2002:a9d:1b41:: with SMTP id l59mr6810295otl.8.1625012182689;
 Tue, 29 Jun 2021 17:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210629033706.20537-1-desmondcheongzx@gmail.com>
 <20210629033706.20537-4-desmondcheongzx@gmail.com>
In-Reply-To: <20210629033706.20537-4-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 30 Jun 2021 01:16:10 +0100
Message-ID: <CACvgo514T=PZCWwhNsYqCC504SJ+2WivcRtmHhDoKsWMSLFU4A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm: protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
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

Hi Desmond,

Couple of small suggestions, with those the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

On Tue, 29 Jun 2021 at 04:38, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:

> @@ -128,13 +137,20 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>         struct drm_master *master;
>         bool ret;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return true;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return true;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return true;

Let's add a "ret = true; goto unlock;" here, so we can have a single
drm_master_put() in the function.
Nearly all code paths touched by this patch already follow this approach.

> @@ -154,10 +170,16 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>         int count_in, count_out;
>         uint32_t crtcs_out = 0;
>
> -       if (!file_priv || !file_priv->master || !file_priv->master->lessor)
> +       if (!file_priv)
>                 return crtcs_in;
>
> -       master = file_priv->master;
> +       master = drm_file_get_master(file_priv);
> +       if (master == NULL)
> +               return crtcs_in;
> +       if (!master->lessor) {
> +               drm_master_put(&master);
> +               return crtcs_in;

Ditto

Thanks
Emil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
