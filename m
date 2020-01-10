Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26555C33CA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:10:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4FE20661
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB4sy+pm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4FE20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D26DA86B85;
	Fri, 10 Jan 2020 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5LqOnxswcZo; Fri, 10 Jan 2020 17:10:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82D8486B16;
	Fri, 10 Jan 2020 17:10:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F1A0C1D7D;
	Fri, 10 Jan 2020 17:10:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DEF5C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 28D9A876A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAM7UGgA-EsG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:10:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 32F49876A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:10:40 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bd4so1076923plb.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=iBvXLyc1YHRba12d1qGOEAYppdC7uysd/CuW1Cdr6XE=;
 b=JB4sy+pmPxNmEF/IdqEUR4mvTdV9p7qM1GbSFbiOx+lPHtjw21+yh3LyCdNHutFle3
 oNfFdIM17nKtIUnrPFaH30yfEcIU8rZIxG+HQ/vIxaCBN9wccSmvvDjNUkHOzHW74bbK
 UbDCOFCQcWSEKDM+Zfh8d1OybJn/+DtMAe76/m2XcfjrnXJa4sOR5YPNIONcQNZT/dTM
 wI+E5MsdSSnOUcoVfETiO13aGp/6LYAQx60L27zX4xESNKkyJRm20JTK7go67aubHdrc
 j6yr4ScXzkAXLzEQCLMbRyONEGuwDDMMU7b4Pgz/I0GXhHeDS2+x1jrT8egiJhG1Y1+k
 COVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iBvXLyc1YHRba12d1qGOEAYppdC7uysd/CuW1Cdr6XE=;
 b=PWmdCN2L2vgF/sEO4vSmajBBPCwjgU4CkDZnZdhvTRenAPZBBkgWvCIyBz2fliDYL1
 E0K4idcfGRghvclF/XVifLtasMx8e5l9PwVU08MIOfMJ7eAXXagHdx53p4Fm9B87t3A4
 vzcD6mEeR6pj4z+iLwwNXTNQLKI+CwPKcOhtrauv6mmCiJntR7gGCHoFKdLgx2eK9k8T
 IGfraw7RxMOoNpFMWDE89QK9Fea2WngMGbqgUFzGk+5JiTUrGS/z66SeDK/Oma4rZCia
 UYt/Jre/HAtPGMe1tzB/tEiOyo6pgqn5Gkt3cUO3ZQNKt4ihpzaCvo4d0gWeqzuVi6Hq
 lQKQ==
X-Gm-Message-State: APjAAAVIV7NioQrWulEdFG9aR98v8Y8U1qmF3C2uHYLcdxWC8+6oI1kH
 PZMoOc3hDf7cc+dwUL9Mz/0=
X-Google-Smtp-Source: APXvYqyiUQHL4oDGEs33ymGs27Au9/cwS1DqjKduPQN1wB28qGjOj93x44RdJ71530eJVmu4wl22gQ==
X-Received: by 2002:a17:90a:c583:: with SMTP id
 l3mr6263355pjt.58.1578676239815; 
 Fri, 10 Jan 2020 09:10:39 -0800 (PST)
Received: from workstation-kernel-dev ([103.211.17.220])
 by smtp.gmail.com with ESMTPSA id b8sm3730301pfr.64.2020.01.10.09.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:10:39 -0800 (PST)
Date: Fri, 10 Jan 2020 22:40:33 +0530
From: Amol Grover <frextrite@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <20200110171033.GA23748@workstation-kernel-dev>
References: <20200110132356.27110-1-frextrite@gmail.com>
 <20200110163134.GA18579@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110163134.GA18579@redsun51.ssa.fujisawa.hgst.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-kernel-mentees] [PATCH] drivers: nvme: target: core:
 Pass lockdep expression to RCU lists
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

On Sat, Jan 11, 2020 at 01:31:34AM +0900, Keith Busch wrote:
> On Fri, Jan 10, 2020 at 06:53:58PM +0530, Amol Grover wrote:
> > +#define subsys_lock_held() \
> > +	lockdep_is_held(&subsys->lock)
> 
> This macro requires "struct nvmet_subsys *subsys" was previously declared
> in the function using it, which isn't obvious when looking at the users. I
> don't think that's worth the conciseness.
> 

Hey Keith,
If I understand correctly, you're saying `*subsys` is always declared in the
function using it, right? I too think, this could cause confusion to the person
going through the code, I'll fix it right away.

Thanks
Amol

> > @@ -555,7 +558,8 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
> >  	} else {
> >  		struct nvmet_ns *old;
> >  
> > -		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link) {
> > +		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link,
> > +							subsys_lock_held()) {
> >  			BUG_ON(ns->nsid == old->nsid);
> >  			if (ns->nsid < old->nsid)
> >  				break;
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
