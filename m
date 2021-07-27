Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F80C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 12:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB81061AA6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 12:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB81061AA6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D60C83163;
	Tue, 27 Jul 2021 12:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id od8xN9rqTn9C; Tue, 27 Jul 2021 12:57:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BF89E824EE;
	Tue, 27 Jul 2021 12:57:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB964C001A;
	Tue, 27 Jul 2021 12:57:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F1B8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 12:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E201400DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 12:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fwx5aM6Iw2yK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 12:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47D70400BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 12:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1627390641; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Ph09f6rm2jcNN4IR0E5c2MFbFILqJFuVJwwa13nyIgNk2zLM1cbayWyeoBs3RhqC6Sd9D/cN1SgQ177xGHJSwnBaZTjUS9vy/XKiBh24ThxEFjp18OuEIFCW9AZnt6ALLL+15b9LQ2Phry0+y4kbYhAaKx6SQVjKdA0gi+T992s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1627390641;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=U3cO4WuqdcXOSb6ekH15gDiYlvqP0dTXsEWCt7m7MZA=; 
 b=BY81B/5YdJmWx4nDi38wstGUQ2xfO9Mg0iTQMWwStR6hP/Q7lX9pJl/PNn9+gBotI3KanA2FZyC0PC33w5xQb7bPM9Aic8ulq+Sd9hQscCOUgx6xxcRpdYfzNnSklnkghCOWdU2GI66H4x12jeaKFKlqjCnXFNWSUhvlcTnXpcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627390641; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=U3cO4WuqdcXOSb6ekH15gDiYlvqP0dTXsEWCt7m7MZA=;
 b=PQCwMaDqBqA4KOs89/0+QBRkWD2sWHk6b1lhA93S1665TvJ8GSTz+8yR8cd1j+p9
 0iuvyO5DqKbO8x9edYDw/UTpOQSKeIszaEUk4Ndk11AQpyoh6wGgBbwloxXYax8XpyT
 8TfTe1W5Bz7v5SQx098++e6sCCFhYXKKtScK2TG0=
Received: from anirudhrb.com (49.207.59.170 [49.207.59.170]) by mx.zohomail.com
 with SMTPS id 1627390638851237.21820913776628;
 Tue, 27 Jul 2021 05:57:18 -0700 (PDT)
Date: Tue, 27 Jul 2021 18:27:06 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v7 2/2] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Message-ID: <YQACopP/tRsLFQVJ@anirudhrb.com>
References: <20210724121134.6364-1-mail@anirudhrb.com>
 <20210724121134.6364-3-mail@anirudhrb.com>
 <20210726182721.3no7ql73ggttdiyx@garbanzo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210726182721.3no7ql73ggttdiyx@garbanzo>
X-ZohoMailClient: External
Cc: syzbot+de271708674e2093097b@syzkaller.appspotmail.com, rafael@kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Jul 26, 2021 at 11:27:21AM -0700, Luis Chamberlain wrote:
> On Sat, Jul 24, 2021 at 05:41:34PM +0530, Anirudh Rayabharam wrote:
> > This use-after-free happens when a fw_priv object has been freed but
> > hasn't been removed from the pending list (pending_fw_head). The next
> > time fw_load_sysfs_fallback tries to insert into the list, it ends up
> > accessing the pending_list member of the previoiusly freed fw_priv.
> > 
> > The root cause here is that all code paths that abort the fw load
> > don't delete it from the pending list. For example:
> > 
> > 	_request_firmware()
> > 	  -> fw_abort_batch_reqs()
> > 	      -> fw_state_aborted()
> > 
> > To fix this, delete the fw_priv from the list in __fw_set_state() if
> > the new state is DONE or ABORTED. This way, all aborts will remove
> > the fw_priv from the list. Accordingly, remove calls to list_del_init
> > that were being made before calling fw_state_(aborted|done).
> > 
> > Also, in fw_load_sysfs_fallback, don't add the fw_priv to the pending
> > list if it is already aborted. Instead, just jump out and return early.
> > 
> > Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
> > Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> > Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> 
> Curious, how do you get syzbot to test this, I mean your custom tree?

Don't need a custom tree. You can send syzbot the git url of an existing
tree (such as linux-next or Linus' tree) and a patch to apply on that
tree before testing. This is documented here:

https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patches

Of course, using a custom tree is also possible.

> 
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> 
> With the changes Shua requested being made:

I'll implement Shua's suggestions and send a new version.

Thanks!

	- Anirudh.

> 
> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
> 
>   Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
