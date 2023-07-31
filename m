Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD709C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 31 Jul 2023 06:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B33460A64;
	Mon, 31 Jul 2023 06:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B33460A64
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=TLKicy3o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=QBIYDec7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LDO5lWw0KSe; Mon, 31 Jul 2023 06:10:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 26D9D60A79;
	Mon, 31 Jul 2023 06:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26D9D60A79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02B3DC0071;
	Mon, 31 Jul 2023 06:10:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 626A3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD99C81831
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD99C81831
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com
 header.a=rsa-sha256 header.s=fm3 header.b=TLKicy3o; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=QBIYDec7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-PlU9zT3XGY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:10:48 +0000 (UTC)
X-Greylist: delayed 523 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 06:10:48 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3344C817F2
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3344C817F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 31 Jul 2023 06:10:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B18BA5C0108;
 Mon, 31 Jul 2023 02:02:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 Jul 2023 02:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1690783322; x=1690869722; bh=sh
 FjnfGoAytyshPf/JloNkqJqiuNTHMwi4VXx3Cfmkc=; b=TLKicy3o98eJU9lRlm
 6rh+0FbGi/sZG2SspygPj6L6OSNoik5Wj9k8vOQg9S4DY67vHQsQemuhOREzSCpB
 q6SHXmEye9XxA9ESyWVFJJUeMP0Of0e9tCsZgzeDGy890c0va1XB24Qtyf9NNEYI
 BWOHZKrADqhk7W89MZG1iElZBoxZX3YjmHS6Nssr/E0e2pHRyT/n0yVDeUGFZ9+y
 5rCYoBetKQkScCv75qQFja5ib7p0bQ1ZPTyNvcyubbF6YAngnM5W7R/ucogf6tF9
 l/UEjvcfOr/b8jVh5MfTUVRnvuBztvpTiKYqHwkmdmKTyUsoVUlSh0FlhRQ1HVMN
 GJ2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690783322; x=1690869722; bh=shFjnfGoAytys
 hPf/JloNkqJqiuNTHMwi4VXx3Cfmkc=; b=QBIYDec7e1TF0FA+X79c/dUryVYXw
 cK+f6cEJp3Zam7XidYavRlMg3f6/Smtnw0wqSCz2GzvuaEC5kjA6rvseTaptaphI
 d4OdN3kMCVbZfwxsW6L5tUtRWyAsBzI+U/9LWCguqlRWdKnfewWsHRsu5XsXeSK4
 GBqhqZ05Wx1TBGcOkZbhwaCyD/Z8bQvXj6X/WO9RdYv4UzO+ZIeUwwgjyJ5cOLi+
 HPHLpcjk4AAJvf7r5HThZbI2w80VOxC+KWNfxlu5nqwfCsDdLCBhmiccMKzPz9qT
 MqONOlZYwyX9nhM/tigewVotgGp/brmx4z0AZpPgw826apcpkYQMDZkdw==
X-ME-Sender: <xms:Wk7HZJ5-cJxAn29i5bFLwRuKDmUMhc84i5q99gdcJ5fTwompJrYYrg>
 <xme:Wk7HZG75RbM980csNmRu0_6g9KqwqxuNHdM5EeWbyoJSGbZmoUJG3yLAcSiaSPbz4
 9jxXAzCyZGpBA>
X-ME-Received: <xmr:Wk7HZAdgrH-3a6-Atx0UY0o-ymB9Q3TJPVc0Pv-ISJYp6dfc9LdOP29xqYl->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjedvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
 evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:Wk7HZCKZAhhF7W4ZWWW-N6J-jKZ10kd2VYLk4CHeylhMUSM2w-4jqw>
 <xmx:Wk7HZNKDS3IHvIVG4wnKQQ_SmhfDrwqAjx9bIj_HbWg3-p63YyrKxA>
 <xmx:Wk7HZLxoFKUN6b9BcXGRKNoxbU3a6lfn1apU2B0DdaeF1EJ06ZWeSA>
 <xmx:Wk7HZFILGlc_JerTsYJQqiuSCzsc07ABGdoByGKfy1PM_NjK8f8oPg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jul 2023 02:02:01 -0400 (EDT)
Date: Mon, 31 Jul 2023 08:01:58 +0200
From: Greg KH <greg@kroah.com>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] ath6kl: Fix debugfs_create_dir error checking
Message-ID: <2023073148-blurt-pulmonary-bd3f@gregkh>
References: <20230731024542.27248-1-rauji.raut@gmail.com>
 <8b6229da-ca60-f352-f374-47f9b6d33862@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b6229da-ca60-f352-f374-47f9b6d33862@web.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Minjie Du <duminjie@vivo.com>,
 opensource.kernel@vivo.com, kernel-janitors@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Wang Ming <machel@vivo.com>,
 Atul Raut <rauji.raut@gmail.com>,
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

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
