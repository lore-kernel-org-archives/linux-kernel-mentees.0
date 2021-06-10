Return-Path: <SRS0=bMK4=LE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738B5C48BE0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B180613BD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 10 Jun 2021 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B180613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D639A40162;
	Thu, 10 Jun 2021 17:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjIOilhd5UBt; Thu, 10 Jun 2021 17:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C3BB240544;
	Thu, 10 Jun 2021 17:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 988B7C001C;
	Thu, 10 Jun 2021 17:49:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 785F3C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53A134060C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tpnTDDZlSyck
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9EA54060A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 17:49:21 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id c1so2332428vsh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 10 Jun 2021 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MDcrEuTfbpypbWBozQCqe1ZKWSisJkXlaXl1ma/eVpk=;
 b=sIVhKJzSJcid/btpVwrgFWr6EZyqasxBCn5OPC4c80X1QeYjcTd3zYZQ1s/ecpOdV1
 JM8KMcokb2Pji4BKQ2UHgRUMJ748NZgKb76oEoYCtCTfLurhBj2bFq9LZOf95FYKXUSF
 PfkoaryH+rR+oOWw8Vsfp6ioSZ7JFIX/CVX2x1CAvjtXa3dmIOUnf/zj9fWwEY4NTV5k
 IBGrLdc7xiwvO6iAs7WItbLhbBcQ8DaPkMkZtX4ko/eW8uRuL4OE8NQOdf1gdr4mZ1gz
 rA55vaUBVLltZGfYAdjiDCcu16utzxTNytZ+irh72WXej1QjxAEGaxyKHjnuQiiocB+6
 q8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MDcrEuTfbpypbWBozQCqe1ZKWSisJkXlaXl1ma/eVpk=;
 b=Id8lc+8L0bYw+r4TRAM0sa/D+urOdtD2eh5L320HCdLVJ0tbG/ZUnK4KKYuWgidwYT
 GLuJwvJsrShOVjFXcO/JJibyTc9FtZTYSbkrrrWAni4Lu5tfckiPwJ5x6cyKu2kxCNR1
 tsP2d/HIAyNluXkjJerH8+d3RZwKrL4Yw86dQaLw/AodcfZ3/U1fcaR/Maoc095hBfpT
 Z4uBcytZvWKASClCiPvxtZLzLG09N7pD3pZnXX/bMWwTN5WKMmV8okDgJoRh4CnSg3oS
 djn6hc0NdQqtuFFY2N3y9gf5t8Zds6s8BfkJCrY7BzMEq82K88jww4tfs0IoPI4SIYbA
 TBsw==
X-Gm-Message-State: AOAM531yPEGSU0EpGPDeUquUBTOjK1wJ28CT5CTbk9QMf1WINWNX/FJA
 ftih+ghuZptAR0rw7/3x1DzXjCysjWy+Qu+YcHU=
X-Google-Smtp-Source: ABdhPJwiJzZejt4ctNUz1DGv9m+IhPcLuILHjl39bvbb9N3Nj4g+TaMXH2XKjHw2qSrOhMBAJkZFWEuSLIiGI+vXZvo=
X-Received: by 2002:a67:878a:: with SMTP id j132mr6463110vsd.18.1623347360746; 
 Thu, 10 Jun 2021 10:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210609092119.173590-1-desmondcheongzx@gmail.com>
 <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
In-Reply-To: <YMHlLQHRLWgWlXTs@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 10 Jun 2021 18:49:09 +0100
Message-ID: <CACvgo53xvUD-YgU_rhG3GDg18jygwAP78aj8OJd457SEFpAf7g@mail.gmail.com>
Subject: Re: [PATCH] drm: Lock pointer access in drm_master_release()
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 skhan@linuxfoundation.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, 
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Thu, 10 Jun 2021 at 11:10, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jun 09, 2021 at 05:21:19PM +0800, Desmond Cheong Zhi Xi wrote:
> > This patch eliminates the following smatch warning:
> > drivers/gpu/drm/drm_auth.c:320 drm_master_release() warn: unlocked access 'master' (line 318) expected lock '&dev->master_mutex'
> >
> > The 'file_priv->master' field should be protected by the mutex lock to
> > '&dev->master_mutex'. This is because other processes can concurrently
> > modify this field and free the current 'file_priv->master'
> > pointer. This could result in a use-after-free error when 'master' is
> > dereferenced in subsequent function calls to
> > 'drm_legacy_lock_master_cleanup()' or to 'drm_lease_revoke()'.
> >
> > An example of a scenario that would produce this error can be seen
> > from a similar bug in 'drm_getunique()' that was reported by Syzbot:
> > https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803
> >
> > In the Syzbot report, another process concurrently acquired the
> > device's master mutex in 'drm_setmaster_ioctl()', then overwrote
> > 'fpriv->master' in 'drm_new_set_master()'. The old value of
> > 'fpriv->master' was subsequently freed before the mutex was unlocked.
> >
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>
> Thanks a lot. I've done an audit of this code, and I found another
> potential problem in drm_is_current_master. The callers from drm_auth.c
> hold the dev->master_mutex, but all the external ones dont. I think we
> need to split this into a _locked function for use within drm_auth.c, and
> the exported one needs to grab the dev->master_mutex while it's checking
> master status. Ofc there will still be races, those are ok, but right now
> we run the risk of use-after free problems in drm_lease_owner.
>
Note that some code does acquire the mutex via
drm_master_internal_acquire - so we should be careful.
As mentioned elsewhere - having a _locked version of
drm_is_current_master sounds good.

Might as well throw a lockdep_assert_held_once in there just in case :-P

Happy to help review the follow-up patches.
-Emil
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
