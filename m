Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57358C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 21:53:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE62F21D20
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 21:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BjoKxTy1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k3Osk55T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE62F21D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9FA2D86B0A;
	Thu, 24 Sep 2020 21:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QHYC92Z0bRtU; Thu, 24 Sep 2020 21:53:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EE0C86B90;
	Thu, 24 Sep 2020 21:53:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08A51C0859;
	Thu, 24 Sep 2020 21:53:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34C14C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 21:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E60F3204B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 21:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mws1nzhZIU2P
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 21:53:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id DD3DE20469
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 21:53:49 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600984426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=50ls+vBq+FfTMVSndh/JUjpk9M8gYW0WEmaHS52ov8k=;
 b=BjoKxTy1U6UgZenE4M+pedzTdDBWmjQjQobkRZ5JK4lp1hYD1pfZm3CE/cIgodrnxeCktm
 TdMByqmjJxy4enCTDib0fm6j4Vk6BpKGDfXLwzOeodvasek+5B55/FneJPmWlLppzJ9Mpr
 H1dMhMm9NN4/n+McjtE6vNahwMzEgazKwiuPh5fHdOo2KD98HmawEYn5aLZkQm1EMT3TCa
 D+OmRqgoUd3e43vMDMwycVh/JTdVIWrnY3I440zpS4gzEZXJdiBruez/KOab/1wv7+BhF4
 RT65yv/uHvDsGUuW1DPergoCvEzHnmdO78CKOgwuejWsAfwOMKO9lfNlzG7TSg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600984426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=50ls+vBq+FfTMVSndh/JUjpk9M8gYW0WEmaHS52ov8k=;
 b=k3Osk55T4BVLeOs/VuJRBYoV8EVmF++pnR29w1CC/rwV5NEARaHvp4iSy1FBHeDCIevC4W
 /AYlGdBVgp8Vq7Dg==
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <6d5383a3ec02d89dd05797c3ae158aebdc0c88ae.camel@perches.com>
Date: Thu, 24 Sep 2020 23:53:46 +0200
Message-ID: <87r1qqvo2d.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Andy Whitcroft <apw@shadowen.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] coccinelle: Convert comma to
	semicolons (was Re: [PATCH] checkpatch: Add test for comma
	use that should be semicolon)
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

On Thu, Sep 24 2020 at 13:33, Joe Perches wrote:
> On Thu, 2020-09-24 at 22:19 +0200, Thomas Gleixner wrote:
>> On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
>> > On Fri, 21 Aug 2020, Joe Perches wrote:
>> > > True enough for a general statement, though the coccinelle
>> > > script Julia provided does not change a single instance of
>> > > for loop expressions with commas.
>> > > 
>> > > As far as I can tell, no logic defect is introduced by the
>> > > script at all.
>> > 
>> > The script has a rule to ensure that what is changed is part of a top
>> > level statement that has the form e1, e2;.  I put that in to avoid
>> > transforming cases where the comma is the body of a macro, but it protects
>> > against for loop headers as well.
>> 
>> Right. I went through the lot and did not find something dodgy. Except
>> for two hunks this still applies. Can someone please send a proper patch
>> with changelog/SOB etc. for this?
>
> Treewide?
>
> Somebody no doubt would complain, but there
> _really should_ be some mechanism for these
> trivial and correct treewide changes...

There are lots of mechanisms:

 - Andrew picks such changes up

 - With a few competent eyeballs on it (reviewers) this can go thorugh
   the trivial tree as well. It's more than obvious after all.

 - Send the script to Linus with a proper change log attached and ask
   him to run it.

 - In the worst case if nobody feels responsible, I'll take care.

All of the above is better than trying to get the attention of a
gazillion of maintainters.

Thanks,

        tglx
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
