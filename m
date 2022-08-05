Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD84C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 18:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 167C540AF9;
	Fri,  5 Aug 2022 18:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167C540AF9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QkS9cUj7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1eHawDKsm80r; Fri,  5 Aug 2022 18:33:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 13A04408D1;
	Fri,  5 Aug 2022 18:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A04408D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F005BC0032;
	Fri,  5 Aug 2022 18:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE593C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9565383EE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9565383EE3
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=QkS9cUj7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFBkR9lieOGN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 005E683EAD
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005E683EAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 18:33:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC123618F9;
 Fri,  5 Aug 2022 18:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAA3C433C1;
 Fri,  5 Aug 2022 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659724402;
 bh=3f5o70JbYlPCgy6ykT0F1POnBTLd6YMhY5LFfRMH/fw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkS9cUj74TflOnU0+bxxreIvQS+BNlIOidVDR/w+/s4epHg8niNzflgQ9Rf6KrYaq
 SwCVQBgZ/r8jlkjw+Oc+oyPCWJsCshWhicmsbI+xiFciiWhY6qID9nYgut46YOZLiv
 rOGJtbLMFbh+jTjlI9SpCxxrU9PLPPwB9WskudvKm4bf09hDYNruZ3PDG13q7/UYtu
 fyzp0/SEscqaSjKVaVoqda1t+cpTk9D88/wuL6kCcvmobCywaMdcA3ooZZalupDd0H
 nSs0FYjnLboOlqig2VSyzdqrZUnSxHEzEh3uXnapUKIe7mHAOnyhX6/i83eAi3EuXB
 0U3k/O+rvOcbg==
Date: Fri, 5 Aug 2022 18:33:20 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v2 3/3] kernel/watch_queue: Remove wqueue->defunct and
 use pipe for clear check
Message-ID: <Yu1icG/o8VcfsQdy@gmail.com>
References: <cd2a10ffd8cb11c79754f43d0d20fd3cd4ba9b7e.1659618705.git.code@siddh.me>
 <20220804144152.468916-1-code@siddh.me>
 <YuzFrzrTnTtUHMn/@sol.localdomain>
 <1826d5c4a90.282ac4bf118702.5300662644268737477@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1826d5c4a90.282ac4bf118702.5300662644268737477@siddh.me>
Cc: corbet <corbet@lwn.net>, rdunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, dhowells <dhowells@redhat.com>,
 edumazet <edumazet@google.com>,
 "christophe.jaillet" <christophe.jaillet@wanadoo.fr>,
 mchehab <mchehab@kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Fri, Aug 05, 2022 at 03:05:41PM +0530, Siddh Raman Pant wrote:
> On Fri, 05 Aug 2022 12:54:31 +0530  Eric Biggers  wrote:
> > Why is the READ_ONCE() needed?  Doesn't wqueue->lock protect wqueue->pipe?
> 
> We are changing the pointer while a notification can be potentially waiting to
> be posted to the pipe. So a barrier is needed to prevent compiler magic from
> reloading the value.
> 

wqueue->pipe is only read or written while wqueue->lock is held, so that is not
an issue at all.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
