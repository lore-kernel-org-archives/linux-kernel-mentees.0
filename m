Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D590C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:02:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CC920716
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 16:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ueJ6r87y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CC920716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB0D987EC0;
	Wed, 29 Jan 2020 16:02:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AdpwZQfp6y8; Wed, 29 Jan 2020 16:02:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F33E87E94;
	Wed, 29 Jan 2020 16:02:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C6F7C0881;
	Wed, 29 Jan 2020 16:02:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3083C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 87C9687E97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JO8m80chfQGT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:02:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 145B787E94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 16:02:19 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l24so9060308pgk.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=k8mHbmQQsrXwIuxRQsm7SslFnT6vNFl5PlAX5KpkYSQ=;
 b=ueJ6r87yt1XMC7LlrQYQKxOSAAX09m036BtYkdjlMPVSTIc9L5e/GrpfSdgYh7yz5N
 dHpTkWQFk445H92oj8dND7X+f8wPxXHtnCdMO8vXgpbBEfQR5QMXPI+sTRNDCWL6K5zJ
 0dRGGepvfo0htl11QbrfHI72cNfdlqablwjouQsP34mO6kASH9MmI923RLjPDcQY/KtP
 6KPayDh5Opilunyh8ZF5NLS9mBSH+Uc7Lg/7plRx94f+jZHgNYbY7cAwosX+qX3pR9Ii
 z4YtQn+zVsq5eTaS87NXNR6U8DV6jAWfw7r6R4T74Gr8nc0WEAZwMGQJ6JTM7RjQQ/0F
 V1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=k8mHbmQQsrXwIuxRQsm7SslFnT6vNFl5PlAX5KpkYSQ=;
 b=UxLQclBQmDT1Fv/ae8cFGb0bTk4uya1i10p1WQ3fZEgea3TZEly7BOhWwYn4l1hnI+
 gqorrhWQX11XCcDlX618odIgHjOwUBB3Q7ObzQLrnyaOEvCRWyOZ/OQE4LpJLl3XxcRM
 /of+sze94R2jKZsDxuClonqR2XvxDTodroIv8RSnGazWyKH1JVdufj7GUDS/QQjJKy9T
 3/JKqU5bsaQOINF2R4bmvuc+7VKGskUcyIKGojIl1CHMfdLfIaIEiwSg2qjAwK2EZT/B
 RwO/BjPjiJGpLtXnsu0G5MblIa+/J6ybuX2YDzZhs9C+Glsjz3w8EzEcmaXLJmadVLQr
 AFMw==
X-Gm-Message-State: APjAAAXk81ABDF0aG4yFg4M+yERz318fizy3JAUrxHf8CbnriEaQEmXd
 QC90+oKDAXimBKDjtAoMCQ==
X-Google-Smtp-Source: APXvYqzrD+7oSyDpZl9ImkaISh0MgIPrwKGmgL0z/k1vQvBM6d+UcE9172zZWN39NOmWegWjZopjRA==
X-Received: by 2002:aa7:800e:: with SMTP id j14mr275989pfi.174.1580313733106; 
 Wed, 29 Jan 2020 08:02:13 -0800 (PST)
Received: from madhuparna-HP-Notebook
 ([2402:3a80:1ee5:e7da:cc5e:c7d9:2a24:390])
 by smtp.gmail.com with ESMTPSA id z30sm3274298pff.131.2020.01.29.08.02.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jan 2020 08:02:12 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Wed, 29 Jan 2020 21:32:04 +0530
To: Oleg Nesterov <oleg@redhat.com>
Message-ID: <20200129160204.GA15449@madhuparna-HP-Notebook>
References: <20200128172008.22665-1-madhuparnabhowmik10@gmail.com>
 <20200129123046.GA1726@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129123046.GA1726@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: paulmck@kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, madhuparnabhowmik10@gmail.com, joel@joelfernandes.org,
 christian.brauner@ubuntu.com, linux-kernel-mentees@lists.linuxfoundation.org,
 mingo@kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] exit.c: Fix Sparse errors and
	warnings
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

On Wed, Jan 29, 2020 at 01:30:47PM +0100, Oleg Nesterov wrote:
> On 01/28, madhuparnabhowmik10@gmail.com wrote:
> >
> > kernel/exit.c:626:40: warning: incorrect type in assignment
> > 
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> >  kernel/exit.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/exit.c b/kernel/exit.c
> > index bcbd59888e67..c5a9d6360440 100644
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -623,8 +623,8 @@ static void forget_original_parent(struct task_struct *father,
> >  	reaper = find_new_reaper(father, reaper);
> >  	list_for_each_entry(p, &father->children, sibling) {
> >  		for_each_thread(p, t) {
> > -			t->real_parent = reaper;
> > -			BUG_ON((!t->ptrace) != (t->parent == father));
> > +			rcu_assign_pointer(t->real_parent, reaper);
> 
> Another case when RCU_INIT_POINTER() makes more sense (although to me it
> too looks confusing). We didn't modify the new parent.
>
Alright, I will resend this patch with RCU_INIT_POINTER().

Thank you,
Madhuparna

> Oleg.
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
