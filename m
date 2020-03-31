Return-Path: <SRS0=z0fH=5Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4647AC2D0F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 23:03:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2A220787
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 31 Mar 2020 23:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="BYPoPlZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A2A220787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7B158893B;
	Tue, 31 Mar 2020 23:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MblOHaBVlZjT; Tue, 31 Mar 2020 23:03:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4487C88928;
	Tue, 31 Mar 2020 23:03:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C028C1AE2;
	Tue, 31 Mar 2020 23:03:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 864ECC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 23:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7557A85DC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 23:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au7mWpNSyITa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 23:03:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 581B985D7E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 23:03:53 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u4so25030335qkj.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 31 Mar 2020 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=6+Ad8chN8N6NC/ANcuSXXfqOAu/A2JYw1wt09IvHLHk=;
 b=BYPoPlZDMsKi0FSqwT7J8j6e3ZsLsoLTc7e6bIfOvF8i9JfwL7ujted9TDYKSoyCEL
 wss6qyMAAdamEMvjPT/2XG2iacb18LUIARFADHbjQeX9VksO5PqLSbZxbeT06uYN98YF
 4BQopInUjf1ZuGBvv67W/pnS8xy0ztTGyLBWHG33iRK7T52eSeT0vLLjb4bHx9tz2K1J
 qjaQDPDGP9cY7gIqyqz+kGRc8cwjYbjNXKXVcTnXfqmRAg7b9DPF6suxl4WF3fau28jE
 MKGMYopKmx6oqV5ILGl6MO0TDuf9+ewPUKiOVbP6bhHhx5z4ZJtytn/nREN/UCOMjdRj
 jZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=6+Ad8chN8N6NC/ANcuSXXfqOAu/A2JYw1wt09IvHLHk=;
 b=ofWPrwN26uuk5HpZoo7EWEnsqqaXRDCTRUdVl5pS0RJtvhmXqMUhNTg0y9twxE96ai
 Bid8ad9KfqMXlmFAfzjylB1YTQgX13JcaauDmrqoSFk5QKuAHhq8GiMwboPnC7P3UUKS
 nxlX3oC/J3dTgqkjWT/yfwlIFi/fgNe0Eza/CDoWVBr4kxkcCZIiMNyo3Ndny3Ifyx52
 aheSPusQ4d41t9qX01GgPVvo0K79Kukws4aS17E9Ln7vXnLsMV1TEIPs14WTrMVR9zWA
 zH1VsgtthQ68KTXjVy9SamuqkteJoZDEipScm7JxuLFvIZuFBVZZLJE1kXrx88jFROCo
 V2SA==
X-Gm-Message-State: ANhLgQ0WP9niOt1FnqeKhAUxkgiZIPqK+bOEB0MG4lJTHV7V/YVbyt9m
 ZBz3x6zH5lTN5X+akJj4n0UhZg==
X-Google-Smtp-Source: ADFU+vvgq8KvtHWzopj9WKZIu9UuPfUEJEUwl8GnN31YdGOfnI2WhbAP2wY/viaa+nxTOMOBd1yfgw==
X-Received: by 2002:ae9:dd85:: with SMTP id r127mr6295575qkf.58.1585695832139; 
 Tue, 31 Mar 2020 16:03:52 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id j39sm228345qtk.96.2020.03.31.16.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 16:03:51 -0700 (PDT)
Message-ID: <6db0b1a2a521386613489443053a980621c48767.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 31 Mar 2020 20:03:46 -0300
In-Reply-To: <20200331165707.7c708646@lwn.net>
References: <cover.1585693146.git.vitor@massaru.org>
 <637c0379a76fcf4eb6cdde0de3cc727203fd942f.1585693146.git.vitor@massaru.org>
 <20200331165707.7c708646@lwn.net>
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] Documentation: filesystems:
 Convert sysfs-pci to ReST
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

On Tue, 2020-03-31 at 16:57 -0600, Jonathan Corbet wrote:
> On Tue, 31 Mar 2020 19:28:56 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  .../{sysfs-pci.txt => sysfs-pci.rst}          | 40 ++++++++++-----
> > ----
> >  1 file changed, 22 insertions(+), 18 deletions(-)
> >  rename Documentation/filesystems/{sysfs-pci.txt => sysfs-pci.rst}
> > (82%)
> 
> Please supply a changelog with your patches.
> 
> The conversion you have done in this file is incomplete; I suspect
> that
> you have not actually built the docs and seen what the results look
> like.
> There are literal blocks that you have not marked as such, as a
> minimum.
> Please actually do a docs build (after adding this file to index.rst)
> and
> make sure that the output is what you intended.
> 
> One other thing of note...this file dates back to before the Git era,
> and
> while it has seen numerous tweaks since then, it's clearly
> outdated.  Look
> at what's actually under /sys/devices/pci* compared to what's
> documented.
> I will take the conversion without it, but what I would really like
> to see
> would be an effort to document all of the attributes that appear
> there
> with current kernels.
> 
> Thanks,
> 
> jon

Thanks for the review, I will check your comments and correct themif that document is still needed.

BR,
Vitor

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
