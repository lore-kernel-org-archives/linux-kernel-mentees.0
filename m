Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C8DC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 14:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 423094136B;
	Sat, 23 Jul 2022 14:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 423094136B
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HCcdBKY2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irEbSdF1QMSl; Sat, 23 Jul 2022 14:43:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 06C46410A4;
	Sat, 23 Jul 2022 14:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C46410A4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBEADC0035;
	Sat, 23 Jul 2022 14:43:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A518C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D81684051E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D81684051E
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=HCcdBKY2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zQbHvWmOY2Zb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:43:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D79740496
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D79740496
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:43:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60055B8015A;
 Sat, 23 Jul 2022 14:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB44C341C0;
 Sat, 23 Jul 2022 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1658587395;
 bh=K8azZb2qkyv6voRZ6WF1fjauRYoudrM7tfG/bw1s03g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HCcdBKY2vICpMx1OoWFd+YSvcsmnePg56LwozW2WDLrRKMPZd3OBSvjuIx2bsyshJ
 DvTDIHSvZLRyQ45A2C+i4WbsfUhmYpBWD5MejPbqZrY2ZF3t9UO4NeTw3pHfO6HzZP
 +77tmypez5z4rah/9I3tF7mm55oSAA5jcxi86Mu4=
Date: Sat, 23 Jul 2022 16:43:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
Message-ID: <YtwI/3/Qp3lSKuls@kroah.com>
References: <20220723135035.199188-1-code@siddh.me>
 <YtwAHGISvlgXgXZM@kroah.com>
 <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Sat, Jul 23, 2022 at 08:05:27PM +0530, Siddh Raman Pant wrote:
> On Sat, 23 Jul 2022 19:35:16 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> > That does not explain why this change is needed.  What problem does this
> > solve?  Why use RCU if you don't have to?  What functionality did you
> > just change in this commit and why?
> 
> We can avoid a race condition wherein some process tries to access them while
> they are being freed. For instance, the comment on `watch_queue_clear()` also
> states that:
>         /*
>          * Remove all the watches that are contributory to a queue.  This has the
>          * potential to race with removal of the watches by the destruction of the
>          * objects being watched or with the distribution of notifications.
>          */
> And an RCU read critical section is initiated in that function, so we should
> use kfree_rcu() to not unintentionally free it while it is in the critical
> section.

You need to explain all of this in a changelog text.  Don't say what you
do, but say why you are doing it.

> > And how was this tested?
> 
> It compiles locally for me, and I used syzbot on this along with testing the
> other `watch_queue_clear` patch, which generated no errors.

How does the watch queue stuff relate to this keyctl logic?

Again, be specific as to why you are doing things.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
