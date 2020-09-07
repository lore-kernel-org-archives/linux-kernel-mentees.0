Return-Path: <SRS0=YKtx=CQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75531C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:48:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5EA121556
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Sep 2020 06:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Xh57S0T7";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Fj/s3g0+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5EA121556
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D11B858BA;
	Mon,  7 Sep 2020 06:47:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDJ6mBB4kZPT; Mon,  7 Sep 2020 06:47:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27BDA858DA;
	Mon,  7 Sep 2020 06:47:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DCA9C0859;
	Mon,  7 Sep 2020 06:47:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A217FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8D53687040
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id msy5QxKbtQaH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:47:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5EDF86F93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Sep 2020 06:47:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F5DA5804E5;
 Mon,  7 Sep 2020 02:47:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Sep 2020 02:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Q0DBGCLdRqpgGeoV451zpNYeMR7
 zl4F6cl2pawEVPVc=; b=Xh57S0T7w6SXHwUa2aBko3QAwKpDlhfB3FguZTO7L3r
 GwWviGYE0MG5QawyiTxh6r6NDlKaAZzCQMRC+mu/RxRH4/LErPHLUoWZJgZc9aOG
 Iy69jmi1WA5tOrrlf/FmUqVZuAuFDcR/X6FpQuWjnkuijsW57ETYPJysBUCl55mn
 cFqpWmhP76lxT9NFHGVCCAvCjOVvbDX3FmzVM1Kl8z9v2qOG0Fqbh2cfdx57V78D
 HTTRUFeKPETNAERB2t7djtTrqiFBdpwUQyNlVvSe5vQqfzVMrWv8xIMGNEKkTr1+
 MGGfFNmxE8S8PxO8EDEy/UGHUfi/052pB8+QkUIuALA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q0DBGC
 LdRqpgGeoV451zpNYeMR7zl4F6cl2pawEVPVc=; b=Fj/s3g0++VFkweOmX33oB/
 +J9XCYnBNEdjADKK06fIZsDLQHE1nJWk0ta1NycH0G/F364+eDZAfCTYpO+6DI8c
 g3KATIB0tG4h8fi5QNmMDrTCdOJdKhAQcVCLqfYIRZrcWqBHW7j7exwmx84Raund
 GsnV5wFA4epetdauHe3UjYVL1ZqkxgAz7bLb36u/aV36Z8b4MDvjzHgAs+9+OMXT
 sV9Xud15CeuO8gwesmSQda6XewX4wz/moAecMpJ7NBNbpngX7Pk5VNVz2C4Xsp4q
 I82fbjlBZW8srfLLaPdgcsogvh+h38V+MLq8eFFKRjfiKbN39EiA04QAJICYPvOg
 ==
X-ME-Sender: <xms:mddVX9x_7LZbFXF7WguT4fg_1-WpYe2CMzogeGS3KZG5m_88xUf4HA>
 <xme:mddVX9Q0WEywN9poOGwO-KfifkfK77CvCxlXUqk7WFeCbYvw9f5y18vR7VgCIb7Q9
 BJTuCnVfWM69g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegledgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:mddVX3VO1UOQxljzmxXESbTD_CBZj7O1FOP_ntD94FTATiwX1zzFAQ>
 <xmx:mddVX_jxDpXL8nFayqwxWzmssc6B5mIUMpSugM6seUzlxY-xVkizIg>
 <xmx:mddVX_CapUHn4AqHSgYB5QOiZkwxQhAA2zxOGfdNYNxOKT0IxXcPgQ>
 <xmx:m9dVXz7JaLvxQSA7z-n-7F41m5HUZh3WMdMZgeFNLgLesfo6Dg-91A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id B80A2306467D;
 Mon,  7 Sep 2020 02:47:52 -0400 (EDT)
Date: Mon, 7 Sep 2020 08:47:50 +0200
From: Greg KH <greg@kroah.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200907064750.GA284261@kroah.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200806072658.592444-1-vaibhavgupta40@gmail.com>
 <20200907063153.GA29062@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907063153.GA29062@gmail.com>
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thierry Reding <treding@nvidia.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 0/2] video: fbdev: radeonfb:
 PCI PM framework upgrade and fix-ups.
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

On Mon, Sep 07, 2020 at 12:01:53PM +0530, Vaibhav Gupta wrote:
> Please review this patch-series.

I see no patch here :(
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
