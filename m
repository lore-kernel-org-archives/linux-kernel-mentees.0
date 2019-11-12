Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C0AC17441
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 17:05:00 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C68621D7F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 17:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C68621D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 19859D48;
	Tue, 12 Nov 2019 17:05:00 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 34691C6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 17:04:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ECA2B712
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 17:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BFF415A0;
	Tue, 12 Nov 2019 17:04:56 +0000 (UTC)
Date: Tue, 12 Nov 2019 10:04:54 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Message-ID: <20191112100454.3b41f3af@lwn.net>
In-Reply-To: <cd9dbb3704d0a39a161c3e4df8fcd9f84bbc5b03.camel@gmail.com>
References: <20191105071846.GA28727@localhost.localdomain>
	<20191107120455.29a4c155@lwn.net>
	<cd9dbb3704d0a39a161c3e4df8fcd9f84bbc5b03.camel@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	willy@infradead.org, neilb@suse.com, tobin@kernel.org,
	stefanha@redhat.com, hofrat@osadl.org, mchehab+samsung@kernel.org,
	"linux-kernel-mentees@lists.linuxfoundation.org"
	<linux-kernel-mentees@lists.linuxfoundation.org>,
	christian@brauner.io, jeffrey.t.kirsher@intel.com
Subject: Re: [Linux-kernel-mentees] [PATCH][RESEND] docs: filesystems:
 sysfs: convert sysfs.txt to reST
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

On Sat, 09 Nov 2019 18:36:16 +0530
Jaskaran Singh <jaskaransingh7654321@gmail.com> wrote:

> > At a bare minimum, an effort like this needs to put a big flashing
> > warning
> > at the top of the file.  But it would be soooooo much better to
> > actually
> > update the content as well.
> > 
> > The best way to do that would be to annotate the source with proper
> > kerneldoc comments, then pull them into the documentation rather than
> > repeating the information here.  Is there any chance you might be up
> > for
> > taking on a task like this?
> >   
> 
> 
> Sure! I'll send the documentation patch(es) followed by a v2 for this
> patch.

Great.  As an alternative, if you like, redo the current patch with the
other suggested fixes and a "this is obsolete" warning at the top.  Then,
after the subsequent improvements land, that warning can eventually be
removed again.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
