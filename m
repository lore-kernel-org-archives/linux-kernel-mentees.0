Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA4DC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 20:19:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 892022396E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 20:19:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GWue+NIu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hlFfk2k9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 892022396E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CE562E101;
	Thu, 24 Sep 2020 20:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ezqk-szFKvPh; Thu, 24 Sep 2020 20:19:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E15520469;
	Thu, 24 Sep 2020 20:19:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AF96C0890;
	Thu, 24 Sep 2020 20:19:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3EBCC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8B9B1863AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 20:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ph57TD4fUxY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 20:19:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 303CE8623F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 20:19:07 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600978743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3Ao4b3S2fuWHiT8hpHEfpFg0aMIND0J6gnDyFzzIBY=;
 b=GWue+NIuBy3soO1ehVcKQ0rhV7iiszDX+YP1KJTAEHVSQgmEr0exmzz2J4MqZGx4Tot8v8
 8C99zKaMGY8rEap5ElRRH/06ZSQjK6d6vwbjOJqJfeehwbYfmX7IpWovnqQcgtcbvYgKPg
 2k6LtR9J88o8a248c1eTOqHQxUs1RZEC6bGhNNrfLzWQ9Kb25k8rCNLH5rZ0/DxA/klLMX
 dq38wVBZLcSs/SJ60pToFbYt22R/DQI37BaLdTWyJrdrXTUiUf9BTY3WEruM2pFuU4d2D9
 4MZLzbhGq3AIgEh22Y3zH3CDM0C2rd84Obf+bamKY7UiKUjRnb5PV+TvZ0ZhEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600978743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K3Ao4b3S2fuWHiT8hpHEfpFg0aMIND0J6gnDyFzzIBY=;
 b=hlFfk2k9cjx+noi/lmUByUkYc4oJUkZkwXH/rwvb2cEdWBlfBMkm9XXGEhDEwmjZrwUf/E
 JrImDs46jCfPfLCQ==
To: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
In-Reply-To: <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
 <162653.1598067338@turing-police>
 <3836b482434bd0b9a609959d3696cc6113a93f2f.camel@perches.com>
 <alpine.DEB.2.22.394.2008220905460.3150@hadrien>
Date: Thu, 24 Sep 2020 22:19:03 +0200
Message-ID: <87tuvn6i88.fsf@nanos.tec.linutronix.de>
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

On Sat, Aug 22 2020 at 09:07, Julia Lawall wrote:
> On Fri, 21 Aug 2020, Joe Perches wrote:
>> True enough for a general statement, though the coccinelle
>> script Julia provided does not change a single instance of
>> for loop expressions with commas.
>>
>> As far as I can tell, no logic defect is introduced by the
>> script at all.
>
> The script has a rule to ensure that what is changed is part of a top
> level statement that has the form e1, e2;.  I put that in to avoid
> transforming cases where the comma is the body of a macro, but it protects
> against for loop headers as well.

Right. I went through the lot and did not find something dodgy. Except
for two hunks this still applies. Can someone please send a proper patch
with changelog/SOB etc. for this?

And of course that script really wants to be part of the kernel cocci
checks to catch further instances.

Thanks,

        tglx
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
