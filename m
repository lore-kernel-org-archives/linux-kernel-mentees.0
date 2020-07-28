Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62422C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:07:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3015720656
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 11:07:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgfX1eh6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3015720656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0556E87C9F;
	Tue, 28 Jul 2020 11:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w21NBBi3XJF9; Tue, 28 Jul 2020 11:07:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E64587C14;
	Tue, 28 Jul 2020 11:07:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C0DBC0050;
	Tue, 28 Jul 2020 11:07:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EDA88C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DBEF787456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o17AsN1gSTRq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:07:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4580186CB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 11:07:19 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id g26so18218645qka.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wLRXskVaKu10kKah7+1ZWwTzJMplfGNwKsb4sfPQ7ak=;
 b=sgfX1eh6PjlazK3wgSHQ415H8m+UBPUU8R3tO4ZsSmhtZdu4jQ2SlzK4HgG1G0tLVE
 8tsuKH1q6TPaQ0PMrI6yt8WL1ek/r6OON4CbtPsXvG3ZfXcmoVUZ8XAliXnL14qphX2k
 fetgg6O4GWNMftHGuWYYAocPoHj+il/WpwHNlXoQnaXKumWPm+Lr0+s8e+qVOBJMYlsK
 t1Oc7wAlp/3ce4lc7aQaepamAIF/PN2KmGcLJJ8TPgiHnf+8ERMU1YNf/FeupwT3HHOO
 59kSCHtT3StU0YukVuenn6vZhohK4+0W/Gov1ibxaV8Fp9X8gJbNqApnjhjosIrZtUtj
 KxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wLRXskVaKu10kKah7+1ZWwTzJMplfGNwKsb4sfPQ7ak=;
 b=tYU1tZ7jZ8jMvfvPnVP3nbYkJcK1Pm3TEqO49oeDQuaQaY8sSVYi1c6Ec7TtehFxeW
 bACKGQUwkH/97bUFI3ZZiIvZ6ykclNA+qFxOJxlghPBCWk9V4JW/xzwK9cDb/uSHqq+g
 QeXzYpXfkCheRTTEAkR3pa0XWXOgiosYcuGPFQX13Uw86cBdMmJTo/Q1pemS1INDP7DU
 EprxDqDgvQTR3WagxH6wMT27SRzk+LNjQ2YqcrkE1pV4VZP9mtwkVXO78wH6hLYqDz8d
 z0yIrgUM34mhxAadn5zfRAQdYHUvPeyWF6NXrLLtG6TFEZ9ZNBi5sk3IogbUQisxg0B8
 Fiqw==
X-Gm-Message-State: AOAM530+atpctIbbYqKXX+gpn4uJU66vjLKHWrrvqZF4MtAlgqZh9VJ/
 7A3Jkt7tR6Eu+/0E7WBLjA==
X-Google-Smtp-Source: ABdhPJz79jz26gc6l5wlMvRcfe2GL/jSAqrMl5vza+n4lcb8srjd1p60ZS+0Fyu2+CaVWeeLYpcouw==
X-Received: by 2002:a37:8a06:: with SMTP id m6mr27080177qkd.191.1595934438341; 
 Tue, 28 Jul 2020 04:07:18 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id g21sm10634593qts.18.2020.07.28.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 04:07:17 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:07:15 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Song Liu <songliubraving@fb.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>
Message-ID: <20200728110715.GA407606@PWN>
References: <20200728022859.381819-1-yepeilin.cs@gmail.com>
 <20200728053604.404631-1-yepeilin.cs@gmail.com>
 <916dbfd3-e601-c4be-41f0-97efc4aaa456@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <916dbfd3-e601-c4be-41f0-97efc4aaa456@iogearbox.net>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 netdev@vger.kernel.org, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@chromium.org>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH net v2] xdp: Prevent
 kernel-infoleak in xsk_getsockopt()
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

On Tue, Jul 28, 2020 at 12:53:59PM +0200, Daniel Borkmann wrote:
> On 7/28/20 7:36 AM, Peilin Ye wrote:
> > xsk_getsockopt() is copying uninitialized stack memory to userspace when
> > `extra_stats` is `false`. Fix it.
> > 
> > Fixes: 8aa5a33578e9 ("xsk: Add new statistics")
> > Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Doing `= {};` is sufficient since currently `struct xdp_statistics` is
> > defined as follows:
> > 
> > struct xdp_statistics {
> > 	__u64 rx_dropped;
> > 	__u64 rx_invalid_descs;
> > 	__u64 tx_invalid_descs;
> > 	__u64 rx_ring_full;
> > 	__u64 rx_fill_ring_empty_descs;
> > 	__u64 tx_ring_empty_descs;
> > };
> > 
> > When being copied to the userspace, `stats` will not contain any
> > uninitialized "holes" between struct fields.
> 
> I've added above explanation to the commit log since it's useful reasoning for later
> on 'why' something has been done a certain way. Applied, thanks Peilin!

Ah, I see. Thank you for reviewing the patch!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
