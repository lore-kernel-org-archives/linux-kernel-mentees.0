Return-Path: <SRS0=Rn35=ZK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A992C43215
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4593622318
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4593622318
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 02B8585BA7;
	Mon, 18 Nov 2019 19:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZgHC2hHRFfk; Mon, 18 Nov 2019 19:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5F72856B8;
	Mon, 18 Nov 2019 19:21:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2B1FC18DA;
	Mon, 18 Nov 2019 19:21:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06581C07AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 19:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0142E21FFB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 19:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZeHzPFdTcRT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 19:21:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by silver.osuosl.org (Postfix) with ESMTPS id 6D4DE204F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Nov 2019 19:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A56389B3;
 Mon, 18 Nov 2019 19:21:22 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:21:21 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
Message-ID: <20191118122121.64c77fcb@lwn.net>
In-Reply-To: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
References: <20191117172436.8831-1-jaskaransingh7654321@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: mszeredi@redhat.com, ebiggers@google.com, linux-doc@vger.kernel.org,
 neilb@suse.com, linux-kernel@vger.kernel.org, tobin@kernel.org,
 stefanha@redhat.com, mchehab+samsung@kernel.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, christian@brauner.io,
 raven@themaw.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2 0/3] docs: filesystems:
	convert autofs.txt to reST
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

On Sun, 17 Nov 2019 22:54:33 +0530
Jaskaran Singh <jaskaransingh7654321@gmail.com> wrote:

> The following patch series is for converting autofs.txt to reST, and
> updating some of the content.
> 
> Changes from v1:
> ----------------
> - Split patch into multiple logical changes as per Jonathan Corbet's
>   request.
> - Few more formatting changes and fixes, as pointed out by Jonathan.
> - Add short description of master map used by autofs.
> 
>  autofs.rst |  273 ++++++++++++++++++++++++++++++++-----------------------------
>  index.rst  |    1 
>  2 files changed, 148 insertions(+), 126 deletions(-)
> 
OK, I have applied this set.  Thanks for doing this work!

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
