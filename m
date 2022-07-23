Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CBC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 14:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBDA60F58;
	Sat, 23 Jul 2022 14:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBDA60F58
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=VffJB7Ml;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=VffJB7Ml
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UYllkr8nrXvq; Sat, 23 Jul 2022 14:50:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6543360AD1;
	Sat, 23 Jul 2022 14:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6543360AD1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB31C0035;
	Sat, 23 Jul 2022 14:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 890FDC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CBF960F47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:50:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CBF960F47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G2qsAIN5RmU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:50:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF76260AD1
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [96.44.175.130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF76260AD1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1658587851;
 bh=rdXu9LN/zAdNX0uOk+wFkFqFAj3SIkSwTTiQs3IjqvQ=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=VffJB7MlpUC4ZDSW4HI075M4hgSq6XZbAusnUaKXWfrVDZ2tXtxmJgwqfYWTzzOjc
 iM5qmHBmLY6uWrhswXWgyDoYowFmMJHYZPQymLJgwJDrClidXLbz7HNv7rPjf4QhRq
 IauO8NssFtEJlgzKkvXAbR78fRoQwvlaQUPI5pUI=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 90EA91281845;
 Sat, 23 Jul 2022 10:50:51 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id JVY4S5aeAk8F; Sat, 23 Jul 2022 10:50:51 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1658587851;
 bh=rdXu9LN/zAdNX0uOk+wFkFqFAj3SIkSwTTiQs3IjqvQ=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=VffJB7MlpUC4ZDSW4HI075M4hgSq6XZbAusnUaKXWfrVDZ2tXtxmJgwqfYWTzzOjc
 iM5qmHBmLY6uWrhswXWgyDoYowFmMJHYZPQymLJgwJDrClidXLbz7HNv7rPjf4QhRq
 IauO8NssFtEJlgzKkvXAbR78fRoQwvlaQUPI5pUI=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown
 [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 85F79128182C;
 Sat, 23 Jul 2022 10:50:50 -0400 (EDT)
Message-ID: <f58c2c8a157714e1860caee9bb005ec469ddb72e.camel@HansenPartnership.com>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Siddh Raman Pant <code@siddh.me>, Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 23 Jul 2022 10:50:49 -0400
In-Reply-To: <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
References: <20220723135035.199188-1-code@siddh.me>
 <YtwAHGISvlgXgXZM@kroah.com>
 <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
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

On Sat, 2022-07-23 at 20:05 +0530, Siddh Raman Pant wrote:
> On Sat, 23 Jul 2022 19:35:16 +0530  Greg KH <
> gregkh@linuxfoundation.org> wrote:
> > That does not explain why this change is needed.  What problem does
> > this solve?  Why use RCU if you don't have to?  What functionality
> > did you just change in this commit and why?
> 
> We can avoid a race condition wherein some process tries to access
> them while they are being freed. For instance, the comment on
> `watch_queue_clear()` also states that:
>         /*
>          * Remove all the watches that are contributory to a
> queue.  This has the
>          * potential to race with removal of the watches by the
> destruction of the
>          * objects being watched or with the distribution of
> notifications.
>          */
> And an RCU read critical section is initiated in that function, so we
> should use kfree_rcu() to not unintentionally free it while it is in
> the critical section.

That doesn't apply in this case, does it?  watch and wlist are locally
allocated and neither has been made externally visible if the error leg
is taken, so they should just be locally freed, which is what the code
was doing before this proposed patch.

James


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
