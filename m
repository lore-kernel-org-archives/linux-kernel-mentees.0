Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9336C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 01:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68AF38196A;
	Wed,  3 Aug 2022 01:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68AF38196A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GDfEfES8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIuGBfrAsoE7; Wed,  3 Aug 2022 01:16:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6F0E481846;
	Wed,  3 Aug 2022 01:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0E481846
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41E30C0032;
	Wed,  3 Aug 2022 01:16:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 447A4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DDC840A04
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DDC840A04
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=GDfEfES8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j4zcjlVRA40v
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:16:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6340409FC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6340409FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 01:16:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2F95B810B0;
 Wed,  3 Aug 2022 01:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF4DC433C1;
 Wed,  3 Aug 2022 01:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659489375;
 bh=4hAj5swXgHDnxb10vMlloiSdI7KbG9hPid+FRMnvni0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDfEfES8aloL6MhzNoaLmD/6xw+dBsC76ivGrEX2iOS4wC6IWL/XE7TAqZsl+tcPw
 1J4a/46fyM8PgCNDGrWneKJAxSIEZ5ashF9zae9ubl4hScsscij5RfwDeCjmW5QKku
 DvCXlAIYn5jfRHa3T71RxkLMQQjsND8JBBhs7mWq5tZBALDzadOP3y26DolIIF2Ynn
 4H3HYkl9Dn+dgvo9nXhkyl2GCv0wXxcYP8yNoO2FWE7sZqUrDxt6yhzeZq9Jfwutzr
 YL0niMjFVCm0969OT04TeYC9IgiQRFLBSBO5o7m+3U6ow1JNLrGtN1qNvZgfIeNTlA
 eDut7lRBbwIDA==
Date: Tue, 2 Aug 2022 18:16:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v3] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
Message-ID: <YunMXRhAM5g3tNnJ@sol.localdomain>
References: <20220728155121.12145-1-code@siddh.me>
 <18258c1d370.6c4bec7a269297.4170944235031209431@siddh.me>
 <Yuepw21SyLbWt9F+@kroah.com>
 <182597c78f6.70a93066293735.4741894763116073008@siddh.me>
 <182597eccd3.14cac6a4293987.1730526835854998440@siddh.me>
 <20220801161642.GA1932489@berlinger>
 <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1825abd83c7.2fc2819e194605.6286442523651645797@siddh.me>
Cc: linux-security-modules <linux-security-module@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Dipanjan Das <mail.dipanjan.das@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

On Tue, Aug 02, 2022 at 12:19:05AM +0530, Siddh Raman Pant wrote:
> On Mon, 01 Aug 2022 21:46:42 +0530  Dipanjan Das <mail.dipanjan.das@gmail.com> wrote:
> > Are you referring to the reproducer attached to our original report?
> > https://lore.kernel.org/all/CANX2M5bHye2ZEEhEV6PUj1kYL2KdWYeJtgXw8KZRzwrNpLYz+A@mail.gmail.com/
>  
> Yes, I meant the reproducer you gave.
> 
> I suspect I must have missed CONFIG_WATCH_QUEUE=y while setting the kernel
> up, extremely sorry for it.
> 
> I now tried 5.10.y with it (using a modification of syzkaller's dashboard
> config I had been using[1]), and I'm getting a __post_watch_notification()
> crash (which is a related crash, as the fix[2][3] for that causes the
> reproducer to not reproduce the post_one_notification crash on mainline),
> but not the post_one_notification() crash you had reported. It seems if I
> apply my patch, it doesn't trigger this related crash, so these bugs are
> seem to be very related maybe due to racing? I haven't looked at that yet.
> 
> I then tried on v5.10.131 since that was the exact version you had
> reproduced on, and it reproduces the post_one_notification() error
> successfully. Applying 353f7988dd84 causes __post_watch_notification()
> crash, and then applying this v3 patch does not trigger the issue, but
> the patch to fix __post_watch_notification() crash is [2], which does
> not really address the issue of post_one_notification() crash which
> is due to the dangling reference to a freed pipe.
> 
> Can you please try reproducer at your end?
> 
> Thanks,
> Siddh

There were several watch_queue fixes that got merged in v5.10.134, so there's no
point in testing v5.10.131.  If you're still seeing a bug in the *latest*
5.10.y, then please check whether it's also present upstream.  If yes, then send
out a fix for it.  If no, then tell stable@vger.kernel.org what commit(s) need
to be backported.  Please provide *full* details in each case, including any
KASAN reports or other information that would help people understand the bug.

- Eric
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
