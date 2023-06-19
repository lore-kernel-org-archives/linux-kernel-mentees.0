Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311A5EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 19 Jun 2023 13:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABCDB40BF5;
	Mon, 19 Jun 2023 13:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABCDB40BF5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FAMVwzQm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppJ9yjSTJMmD; Mon, 19 Jun 2023 13:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB7EE405EF;
	Mon, 19 Jun 2023 13:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB7EE405EF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9092AC007A;
	Mon, 19 Jun 2023 13:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DCEBC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CA1540B60
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA1540B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Yl-Kdj8q3_E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:53:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E0A4405EF
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E0A4405EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 19 Jun 2023 13:53:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFCA260C6C;
 Mon, 19 Jun 2023 13:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAADBC433C8;
 Mon, 19 Jun 2023 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687182812;
 bh=kCKiD5fhFEy0gvMVk7RDP9g5QMN6OPehQVjGRcV+P8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FAMVwzQmxhRioT42KFYyC7x9NbIPwZmIL+XoxvE/UrpB49eF9jv4TeItklHVLOPub
 RJ43cO6RPlhUsuVDb0XmOLn/BJ/7T7183OcrtHdGlZkzbM1pA44l5hAmV7zDCiZ6fH
 Vz5SWKZGu/oEJbir2k6gQNyI/argnwH2+f7x5DGU=
Date: Mon, 19 Jun 2023 15:53:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Subject: Re: [PATCH v3 0/4] Trivial code cleanup patches
Message-ID: <2023061922-numeric-runner-f36d@gregkh>
References: <cover.1687092111.git.yogi.kernel@gmail.com>
 <e80d385d-5515-ed42-e5dd-f9c977f7d4d1@gmail.com>
 <2023061938-unbounded-unbent-e706@gregkh>
 <ZJBc4bok1krfjqWf@zephyrusG14>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJBc4bok1krfjqWf@zephyrusG14>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, dan.carpenter@linaro.org
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

On Mon, Jun 19, 2023 at 07:19:21PM +0530, Yogesh Hegde wrote:
> Hi Greg, 
> On Mon, Jun 19, 2023 at 02:57:56PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Jun 18, 2023 at 10:26:37PM +0200, Philipp Hortmann wrote:
> > > This patch series alone is fine. But when my patch series ([PATCH 0/9]
> > > staging: rtl8192e: Remove unsupported modes a and 5G) is applied before it
> > > fails as we change same lines. Will see what happens.
> > 
> > Yes, none of these apply :(
> > 
> > Yogesh, can you rebase this on my staging-next branch and resend?
> Sure, will rebase and resend. Did you mean staging-testing branch instead of 
> staging-next branch ? 

Yes, sorry.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
