Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FA6C7619C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:52:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 334D720729
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 15:52:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFOD3H1/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 334D720729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EAEB485C28;
	Sun, 16 Feb 2020 15:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UI6fNGFuvl2X; Sun, 16 Feb 2020 15:52:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75D4D81402;
	Sun, 16 Feb 2020 15:52:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6355DC07FF;
	Sun, 16 Feb 2020 15:52:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1446C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9DB0E85C20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:52:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ekm6FcMCWxI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:52:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 182F581402
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 15:52:51 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d9so7733925pgu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iPFMbfU6diExASqyRYQaLYTU+lXefr7fxHQr7uWuD1Y=;
 b=dFOD3H1/B31VEchMzaUoJ9SUKJtUO6Ioafl/z7DDVOwR6NtDtBMs/13RMPQQzMJ18Y
 c5C04QkzccXncDGICuf/5t/aIGwm7HczFeWtMY+Jo3fy/YcQCQRsbKRTbmcFsW15LoeS
 5M5xHHjjHalh62RK5nUwazqACK6SczFYM1kEOfjlJRCmKpAnWL3N2Dep6gnyRcSdCy0j
 drXeDHCcx1PHXAG2jqXie+iYrkyxLoed7F+tWrFY6O9hhTv2nZuJnslWCSQRk5+QSpNy
 sE6STD6lqxoHPqpbLU3HpctlWUYllldWX66W6Xuc8lCiNKK33NnaGyAvPFFaJicEiWcX
 AudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iPFMbfU6diExASqyRYQaLYTU+lXefr7fxHQr7uWuD1Y=;
 b=efOiuU6duixyBGokhIzEIZ9u9wmvW3s/99tYS86tQkxCEPA4KukxgHvcE6sczHKJTs
 eORREOUxMW0TRfGeRmxbYBOgXE6JTZjjwv4e3vUMe5yWSMDUyrVgsSKz6Ttgci2URotG
 nwL080AmlRcZ9L0BPaNXL6Sq9qXagl2qncTKD2atyw09B1NVjKwDdUmNyYX/OrYj97Hf
 4koHfXd0ACwGIbAGO1NHtyHsIWYgbpthFt2pFsoJ6Utz1yA4GR95Sg4BmfDFhldWqP53
 j+cyni6aWG/iBMZqACCsIbVMz4QsudIvk/Wco3t2lbHc2BnQjyOEejAZyPBF63Ut4MYt
 me6w==
X-Gm-Message-State: APjAAAUPagZCrCtR26LhfvAcZEsW+SfeubyjE7ugCY2AiELOe7GK7tjQ
 Bg5bT6oUSVAYSqGSl9HKug==
X-Google-Smtp-Source: APXvYqx4ANLkD4bX8522tWsKbJuWTodQcLty70mtlhDXz7killP931Qu5hSGCSz5PkBfEfbEtN3CHw==
X-Received: by 2002:aa7:961b:: with SMTP id q27mr12847463pfg.23.1581868370704; 
 Sun, 16 Feb 2020 07:52:50 -0800 (PST)
Received: from madhuparna-HP-Notebook ([2402:3a80:d03:50cf:14b2:4950:fe83:57e])
 by smtp.gmail.com with ESMTPSA id c1sm13631769pfa.51.2020.02.16.07.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Feb 2020 07:52:50 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Sun, 16 Feb 2020 21:22:44 +0530
To: Sven Eckelmann <sven@narfation.org>
Message-ID: <20200216155243.GB4542@madhuparna-HP-Notebook>
References: <20200216144718.2841-1-madhuparnabhowmik10@gmail.com>
 <3655191.udZcvKk8tv@sven-edge>
 <20200216153324.GA4542@madhuparna-HP-Notebook>
 <1634394.jP7ydfi60B@sven-edge>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1634394.jP7ydfi60B@sven-edge>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mareklindner@neomailbox.ch, sw@simonwunderlich.de, netdev@vger.kernel.org,
 b.a.t.m.a.n@lists.open-mesh.org, a@unstable.cc, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
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

On Sun, Feb 16, 2020 at 04:35:54PM +0100, Sven Eckelmann wrote:
> On Sunday, 16 February 2020 16:33:24 CET Madhuparna Bhowmik wrote:
> [...]
> > > Can you tell us how you've identified these four hlist_for_each_entry_rcu?
> >
> > The other hlist_for_each_entry_rcu() are used under the protection of
> > rcu_read_lock(). We only need to pass the cond when
> > hlist_for_each_entry_rcu() is used under a
> > different lock (not under rcu_red_lock()) because according to the current scheme a lockdep splat
> > is generated when hlist_for_each_entry_rcu() is used outside of
> > rcu_read_lock() or the lockdep condition (the cond argument) evaluates
> > to false. So, we need to pass this cond when it is used under the
> > protection of spinlock or mutex etc. and not required if rcu_read_lock()
> > is used.
> 
> I understand this part. I was asking how you've identified them. Did you use 
> any tool for that? coccinelle, sparse, ...
>
Hi,

Not really, I did it manually by inspecting each occurence.
Thank you,
Madhuparna

> Kind regards,
> 	Sven


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
