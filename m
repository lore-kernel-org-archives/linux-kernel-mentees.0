Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8329C47247
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:04:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3F6205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 20:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3F6205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64D948893B;
	Thu, 30 Apr 2020 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTka0hYvI1AP; Thu, 30 Apr 2020 20:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BB60988937;
	Thu, 30 Apr 2020 20:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE2DC0889;
	Thu, 30 Apr 2020 20:04:16 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBBECC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B136988937
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ss-+eEOmVxpI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:04:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 412E08893B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 20:04:14 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 58A696E3;
 Thu, 30 Apr 2020 20:04:13 +0000 (UTC)
Date: Thu, 30 Apr 2020 14:04:12 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Vitor Massaru Iha <vitor@massaru.org>
Message-ID: <20200430140412.7d4c692d@lwn.net>
In-Reply-To: <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
References: <20200430190737.80950-1-vitor@massaru.org>
 <20200430134704.236c612b@lwn.net>
 <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
Organization: LWN.net
MIME-Version: 1.0
Cc: martin@omnibond.com, linux-doc@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 devel@lists.orangefs.org, hubcap@omnibond.com
Subject: Re: [Linux-kernel-mentees] [PATCH] docs: filesystems: fix `make
	htmldocs` warning
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

On Thu, 30 Apr 2020 16:57:24 -0300
Vitor Massaru Iha <vitor@massaru.org> wrote:

> Sorry about that. I searched but I didn't find the documentation tree.
> Could you point me to the git url?

The MAINTAINERS file is always the place to look for such things:

> T:	git git://git.lwn.net/linux.git docs-next

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
