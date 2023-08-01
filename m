Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACED0C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Aug 2023 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A00F60AC0;
	Tue,  1 Aug 2023 21:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A00F60AC0
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ea86IZrl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WunjeBmGExNn; Tue,  1 Aug 2023 21:51:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5875060743;
	Tue,  1 Aug 2023 21:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5875060743
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39121C0072;
	Tue,  1 Aug 2023 21:51:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31E36C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 21:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4B5C81492
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 21:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B5C81492
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=Ea86IZrl
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKfy0aDeW7E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 21:51:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54A2C81F38
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Aug 2023 21:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54A2C81F38
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48D73615F2;
 Tue,  1 Aug 2023 21:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7081DC433C7;
 Tue,  1 Aug 2023 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690926676;
 bh=4dYL6EavnS6V/WEwMnlud6nMt53cQOrRwJGdMdREcSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ea86IZrl/0H6euUS4i9ji2lVI4hqosY13fdKD8VJiQOs/xLhRtHS5ZeUhYFiS+Vg4
 GrqrxzNevJoM9iBxCHbi+MYzYHdzRLcmrXkstsOihtbRkPiWZut6lS/JMxjUU1On7V
 Ef848XgqHAqcJw9hKurZL05cGCuB5Yv+vQMNzxRCYilxSGZe9b7+VwuPQqkI0fAXqr
 7CX7KP6d+Q1cM95rwTv/tzqZ41m8TtESjCOGaTrg6e8xTbmOkVeMI8HYCLbcwCRWDK
 MKdumOKc6bzBo6VXUQGoWMpI/XRSFwJ9trRH34fnvw/NAkoErCLsfsAj1fzsVz7DZ1
 NX8XKQgsThM3Q==
Date: Tue, 1 Aug 2023 14:51:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Atul Raut <rauji.raut@gmail.com>
Subject: Re: [PATCH] net/macmace: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Message-ID: <20230801145115.153f3629@kernel.org>
In-Reply-To: <ZMkSIfUEnvYvHyZx@lincoln>
References: <20230730231442.15003-1-rauji.raut@gmail.com>
 <20230731073801.GA87829@unreal> <ZMkSIfUEnvYvHyZx@lincoln>
MIME-Version: 1.0
Cc: Larysa Zaremba <larysa.zaremba@intel.com>, netdev@vger.kernel.org,
 avem@davemloft.net, rafal@milecki.pl, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, 1 Aug 2023 16:09:37 +0200 Larysa Zaremba wrote:
> > > -	u8	data[1];
> > > +	DECLARE_FLEX_ARRAY(u8, data);  
> > 
> > But data[1] is not zero-length array.
> 
> So, please, if you are certain that data should be a flexible array,
> send v2 without calling data a zero-length array. Also, with such change, I 
> think driver code could be improved in many places in the same patchset.

Atul, you should respond to reviewers promptly. These are legit
questions.
On closer inspection the patch looks fine so to avoid clogging up 
the review queue and wasting more time on it I'm just going to apply it.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
