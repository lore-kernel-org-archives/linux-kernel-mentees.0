Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DDEC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jul 2022 03:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C0CA40123;
	Thu, 14 Jul 2022 03:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C0CA40123
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QIeYv8Yc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tw0VWUzWpeJY; Thu, 14 Jul 2022 03:58:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 34F26400CE;
	Thu, 14 Jul 2022 03:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34F26400CE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F349CC0033;
	Thu, 14 Jul 2022 03:58:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF454C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA26424A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA26424A0
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=QIeYv8Yc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMFjHADTdEyi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:58:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362304249D
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 362304249D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:58:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7428BCE24C7;
 Thu, 14 Jul 2022 03:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C31DC34115;
 Thu, 14 Jul 2022 03:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657771106;
 bh=oo63PaGjPpwIVhi/pmHBgQPiQmqbOpRR7v0EHyoS0Tg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QIeYv8YcxlMDJrwSoqk6B3PrfnNHl9b7zTww1m7GhJdryiyDFihSYcx/jytelcXkA
 Qiv6ixVNE9yGH8H67D4NGtDwtWZynoR6aq2MsiHdGP3DmtSdFs6y+kR7ECMJcJFK/p
 dYtsu0MVEmr691XCw9WkxHLaUUoJDfpkBPYHCxjIfrRSWbXbmeY34tLO1J3dJoDTNN
 FyvYKcfo1Gp5ETvy6ti1gXIkddObNlUeHlrDWSDIcqpufrpbw54eoaTwSgWDX6liWh
 5LSLkraiM6j9HIozN3M+sDukWfLiCPo6bv+a6WJouVTaRYXHjUuDjZ8/8YTofbVR8n
 tBz+6iHfxW2Tw==
Date: Wed, 13 Jul 2022 20:58:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Khalid Masum <khalid.masum.92@gmail.com>
Subject: Re: [RFC PATCH 0/1][RESEND] Fix KASAN: slab-out-of-bounds Read in
 sk_psock_get
Message-ID: <20220713205825.33ea6e9c@kernel.org>
In-Reply-To: <CAABMjtG9PDPUm9vrK-Kho7WW+V5h9MmMox1EiLuvfKfiCNp=xw@mail.gmail.com>
References: <20220713181324.14228-1-khalid.masum.92@gmail.com>
 <20220713115622.25672f01@kernel.org>
 <CAABMjtG9PDPUm9vrK-Kho7WW+V5h9MmMox1EiLuvfKfiCNp=xw@mail.gmail.com>
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Pavel Skripkin <paskripkin@gmail.com>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, 14 Jul 2022 09:55:18 +0600 Khalid Masum wrote:
> On Thu, Jul 14, 2022 at 12:56 AM Jakub Kicinski <kuba@kernel.org> wrote:
> > On Thu, 14 Jul 2022 00:13:23 +0600 Khalid Masum wrote:  
> > > Using size of sk_psock as the size for kcm_psock_cache size no longer
> > > reproduces the issue. There might be a better way to solve this issue
> > > though so I would like to ask for feedback.
> > >
> > > The patch was sent to the wrong mailing list so resending it. Please
> > > ignore the previous one.  
> >
> > What happened to my other off-list feedback?
> >
> > I pointed you at another solution which was already being discussed -
> > does it solve the issue you're fixing?  
> 
> Yes, this patch solves the issue I am fixing.

Thanks for checking! You can send your

Tested-by:

tag in reply to the most recent posting if you'd like:

https://lore.kernel.org/all/165772238175.1757.4978340330606055982.stgit@oracle-102.nfsv4.dev/
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
