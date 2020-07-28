Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C8AC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:25:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFBF720759
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 05:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KC1N6Z6h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFBF720759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C556C20796;
	Tue, 28 Jul 2020 05:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0sk2YjauqOM; Tue, 28 Jul 2020 05:25:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 36F571FF59;
	Tue, 28 Jul 2020 05:25:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2601BC0050;
	Tue, 28 Jul 2020 05:25:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53219C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 489CF868CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfOccBpIBx6N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:25:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 915FD868C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 05:25:17 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id dd12so3589179qvb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 22:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uMG2E9ERlheSGqhkueag38fHAjdWXtqM4nID+dc8E/g=;
 b=KC1N6Z6hWjSjz3GGPoqv9xQ5D9wn4C7XIVUQNWu1zBxbmPPOcek1uoJbXhTMFkI7Q4
 mTlOy2b23FMMTL1god2xSgOgahW81J8EBM6oEP2d6T9YEhbVsTWjtiINp9nwoSx0J/zi
 BI9dFdVHMTM3RLdM9wnpiQ7jgEwH9QDqo2aHb2SDpeaeMOVzEO+MTXWtDMjE/x/HnWn4
 uV3DiAQOlmQNf+hVqr3KK48+BS1Ik+0llFVq6kTJZj10wCC0u0ZnOJdW9T9SScK0p+Cm
 DDd1EW6C7FSD5ocoVc9QDGqwUrqSro0j94pH2irvNuUhqqx/EoznyskUrQZ4KR8y2W6r
 wjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uMG2E9ERlheSGqhkueag38fHAjdWXtqM4nID+dc8E/g=;
 b=rG/sgJDQLVf3J90Kks0vO669Uxh3vf85kRLWKxNFOTJkgqzqC5M8DdDAD0S8i4zCcq
 cL0k99XT6L27nFdn7GMgR3qydoeLotVvc3LRLDxpFfzfboqeG7k4fDUkHScV5EHjIlUv
 iC6OAG8Du/8gymNdrBiGiNQ2C05mzKEZVkNcek5g5plC9+INAsY+Q30X7AlFuj6iS3o3
 30pGxyZfRMXpqT4N/dHaTUghtlv1aFBSSqlangTO8/BTTRYNvcnA2H41EdRluhNxUXZq
 kZlcTKoaWrw6MtM2UfNYzGSFdT+rfVn1h8P8KPw/E6WYAiLpr1SkPMXxL0Qm6SqdbKTN
 2Wqg==
X-Gm-Message-State: AOAM532uc82bAzPhT49TWrIPVqLaDr1N6QJTZ8e90zwRjDNhsw2eznd+
 dkJIx3NSJ9anZYvxXUIcyw==
X-Google-Smtp-Source: ABdhPJxEAi3ePhzTiJgG1WNKZ47AnDwjuRfnIggpeFZH5/C/YrbhEcBx+RahM842JsUDgJfcEj76zw==
X-Received: by 2002:a05:6214:2d2:: with SMTP id
 g18mr25385356qvu.215.1595913916460; 
 Mon, 27 Jul 2020 22:25:16 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id b8sm17235205qtg.45.2020.07.27.22.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 22:25:15 -0700 (PDT)
Date: Tue, 28 Jul 2020 01:25:12 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Song Liu <song@kernel.org>
Message-ID: <20200728052512.GA404005@PWN>
References: <20200728022859.381819-1-yepeilin.cs@gmail.com>
 <CAPhsuW7L6KWAM55=oLgQ2MtoJOB9i4mwZHOVF+KJj7W5ht_+YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7L6KWAM55=oLgQ2MtoJOB9i4mwZHOVF+KJj7W5ht_+YQ@mail.gmail.com>
Cc: Song Liu <songliubraving@fb.com>, open list <linux-kernel@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Yonghong Song <yhs@fb.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Networking <netdev@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@chromium.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf <bpf@vger.kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Andrii Nakryiko <andriin@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH net] xdp: Prevent kernel-infoleak
 in xsk_getsockopt()
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

On Mon, Jul 27, 2020 at 10:07:20PM -0700, Song Liu wrote:
> On Mon, Jul 27, 2020 at 7:30 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > xsk_getsockopt() is copying uninitialized stack memory to userspace when
> > `extra_stats` is `false`. Fix it by initializing `stats` with memset().
> >
> > Cc: stable@vger.kernel.org
> 
> 8aa5a33578e9 is not in stable branches yet, so we don't need to Cc stable.
> 
> > Fixes: 8aa5a33578e9 ("xsk: Add new statistics")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> >  net/xdp/xsk.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> > index 26e3bba8c204..acf001908a0d 100644
> > --- a/net/xdp/xsk.c
> > +++ b/net/xdp/xsk.c
> > @@ -844,6 +844,8 @@ static int xsk_getsockopt(struct socket *sock, int level, int optname,
> >                 bool extra_stats = true;
> >                 size_t stats_size;
> >
> > +               memset(&stats, 0, sizeof(stats));
> > +
> 
> xsk.c doesn't include linux/string.h directly, so using memset may break
> build for some config combinations. We can probably just use
> 
> struct xdp_statistics stats = {};

I see. I will send v2 soon. Thank you for reviewing the patch!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
