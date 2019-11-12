Return-Path: <SRS0=D7LL=ZE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529E0C17440
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 15:55:21 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B62214E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Nov 2019 15:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B62214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 07020C2C;
	Tue, 12 Nov 2019 15:55:21 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE211B8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 15:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 92478623
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 12 Nov 2019 15:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6A4B07DE;
	Tue, 12 Nov 2019 15:55:18 +0000 (UTC)
Date: Tue, 12 Nov 2019 08:55:16 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191112085516.15ed4b1a@lwn.net>
In-Reply-To: <20191108164619.30401-1-dwlsalmeida@gmail.com>
References: <20191108164619.30401-1-dwlsalmeida@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC PATCH] Documentation: filesystems:
	convert fuse to RST
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

On Fri,  8 Nov 2019 13:46:19 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> Converts fuse.txt to reStructuredText format, improving the presentation
> without changing much of the underlying content.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

This generally looks like a good conversion, thanks!  That said, I have a
few small comments...

 - You should copy the FUSE maintainer on this change.  You can find the
   relevant information in the MAINTAINERS file or with
   get_maintainer.pl.

 - Speaking of MAINTAINERS, you also need to fix the reference to
   fuse.txt there when you rename the file.

 - You are reasonably well restrained in your use of markup, but it would
   be good to pull back just a bit more.  Just FUSE everywhere rather than
   ``FUSE`` in some places.  Less **emphasis**.  Remember that the
   readability of the plain-text file is important.

 - This file contains information that is useful to system
   administrators, so I think that a move to admin-guide would be
   warranted.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
