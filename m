Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D742C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 18:04:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727C82072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 18:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727C82072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2BD42884D4;
	Fri, 10 Jan 2020 18:04:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2oN++BvkLsU; Fri, 10 Jan 2020 18:04:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C554884D9;
	Fri, 10 Jan 2020 18:04:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54DA6C1D7D;
	Fri, 10 Jan 2020 18:04:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA49CC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B901287698
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:04:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kognlq6p1z5q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:04:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 254DA873B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 18:04:39 +0000 (UTC)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 7F5EF77D;
 Fri, 10 Jan 2020 18:04:38 +0000 (UTC)
Date: Fri, 10 Jan 2020 11:04:37 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200110110437.1a028da8@lwn.net>
In-Reply-To: <20191223010030.434902-1-dwlsalmeida@gmail.com>
References: <20191223010030.434902-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, hirofumi@mail.parknet.co.jp,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v3] Documentation: filesystems:
	convert vfat.txt to RST
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

On Sun, 22 Dec 2019 22:00:30 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> Converts vfat.txt to the reStructuredText format, improving presentation
> without changing the underlying content.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> -----------------------------------------------------------
> Changes in v3:
> Removed unnecessary markup.
> Removed section "BUG REPORTS" as recommended by the maintainer.
> 
> Changes in v2:
> Refactored long lines as pointed out by Jonathan
> Copied the maintainer
> Updated the reference in the MAINTAINERS file for vfat
> 
> I did not move this into admin-guide, waiting on what the
> maintainer has to say about this and also about old sections
> in the text, if any.

Things seem to have calmed down here for now, so I've gone ahead and
applied this.  We can always move it in the future if that seems to make
sense.

Thanks,

jon
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
