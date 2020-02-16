Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E20C2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:33:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03F620857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHr0jtmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03F620857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 948B7877A0;
	Sun, 16 Feb 2020 15:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRLeLQkhg+RK; Sun, 16 Feb 2020 15:33:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3DD1875C2;
	Sun, 16 Feb 2020 15:33:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0209C07FF;
	Sun, 16 Feb 2020 15:33:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8468CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6ED29200E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:33:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrEvYTh1zMwG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id D075320034
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:33:31 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id k29so7504902pfp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XIEPrOUEc1xxULTMEXHUWg4Qjw7jq42rfdXNd7KhPm0=;
 b=BHr0jtmdSFo5SLeKbPpnFJoeBLATA6KiCLy+hyrRGKN8KbNvjxZ/J43HsJYCVHOzMd
 Q6OAkwpSXJZFKMuHKPtxMF1X2hmBPsxRa8lhrm0kiUwG00ub0kvx6+9wE8oUBEec2njr
 EPuMwg4LhYMpTptmi8w7XmTHRl4SDsa/QVMzN/543SyYgSHGN7FhJOve5/uD9Fsc3fXP
 leQOPbLTa10oqBFxnrYs1Ynxc59xc7a/nJ7EDhydBtaGVk/kJSgPZ7ZGp8IrUnZO1TN9
 pb8jXvat/htlqWdzY4I6MZdXNjjKe5a8HL6txN9iArq59JtTbjOkiFoUcuYVTNC0PH85
 t04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XIEPrOUEc1xxULTMEXHUWg4Qjw7jq42rfdXNd7KhPm0=;
 b=OLEl0KBTOMWUxkn/sM4K7Kkq6iCz8JBXPcy2S9IYhD2AAp1OUS4JZ75ybGvElywXQe
 cr/2cH7vBNQzsfzcH9qD9RUoRNOw7NA52Fxxrlr38FC6QQxQz8fxM1tAfGyjKVuKisYi
 WvP6YTsa8uVfKfQzf800hQpQX5AuBznmNiCf0VvTOun2K8h5uiyirV9Kv4bV47UtoUKG
 KCd5s6aPwfilckwabSHTGoN+fCAKTtLSgNme/qLa0chQHtT/w1+QWBVBdwMCOVymxiOu
 YQzMqQ65jZlag5eZbkV36UoXseJLG30g26p2mtrY+YxXE+vfDRD/is0lR1wshythzmJY
 rKiw==
X-Gm-Message-State: APjAAAXV9nu6xYr/I/+crpjarcUN3QYP1NBmUrNcYei6Zu7tS04knVhq
 XEhJ8QfPRTDWEfV7qLZ1bw==
X-Google-Smtp-Source: APXvYqxt6ISJAda/OBTeJGQHGHJPXLd2MKMKC3TChnw4o2Ef3kJeSPKe0NBrjzvD4aZJzBf/m1Xw0w==
X-Received: by 2002:a65:6147:: with SMTP id o7mr14233461pgv.442.1581867211415; 
 Sun, 16 Feb 2020 07:33:31 -0800 (PST)
Received: from madhuparna-HP-Notebook ([2402:3a80:d03:50cf:14b2:4950:fe83:57e])
 by smtp.gmail.com with ESMTPSA id m15sm14347484pgn.40.2020.02.16.07.33.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Feb 2020 07:33:30 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sun, 16 Feb 2020 21:03:24 +0530
To: Sven Eckelmann <sven@narfation.org>
Message-ID: <20200216153324.GA4542@madhuparna-HP-Notebook>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
 <3655191.udZcvKk8tv@sven-edge>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3655191.udZcvKk8tv@sven-edge>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, a@unstable.cc, linux-kernel@vger.kernel.org,
 madhuparnabhowmik10@gmail.com, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH] net: batman-adv: Use built-in
	RCU list checking
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

On Sun, Feb 16, 2020 at 04:22:51PM +0100, Sven Eckelmann wrote:
> On Sunday, 16 February 2020 15:47:18 CET madhuparnabhowmik10@gmail.com wrote:
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > hlist_for_each_entry_rcu() has built-in RCU and lock checking.
> > 
> > Pass cond argument to hlist_for_each_entry_rcu() to silence
> > false lockdep warnings when CONFIG_PROVE_RCU_LIST is enabled
> > by default.
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> >  net/batman-adv/translation-table.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> Added with alignment and line length codingstyle fixes [1].
> 
> Can you tell us how you've identified these four hlist_for_each_entry_rcu?
>
Hi Sven,

Thank you for the fixes.
The other hlist_for_each_entry_rcu() are used under the protection of
rcu_read_lock(). We only need to pass the cond when
hlist_for_each_entry_rcu() is used under a
different lock (not under rcu_red_lock()) because according to the current scheme a lockdep splat
is generated when hlist_for_each_entry_rcu() is used outside of
rcu_read_lock() or the lockdep condition (the cond argument) evaluates
to false. So, we need to pass this cond when it is used under the
protection of spinlock or mutex etc. and not required if rcu_read_lock()
is used.

Thank you,
Madhuparna
> Thanks,
> 	Sven
> 
> [1] https://git.open-mesh.org/linux-merge.git/commit/967709ec53a07d1bccbc3716f7e979d3103bd7c5


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
