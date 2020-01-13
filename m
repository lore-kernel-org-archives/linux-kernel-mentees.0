Return-Path: <SRS0=VDQn=3C=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBA0C33CAF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 18:43:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8979A21739
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jan 2020 18:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEeJ0bbG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8979A21739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6068985C45;
	Mon, 13 Jan 2020 18:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZN-0d2RsDJFJ; Mon, 13 Jan 2020 18:43:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F2D0382C36;
	Mon, 13 Jan 2020 18:43:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E640EC18DD;
	Mon, 13 Jan 2020 18:43:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D561BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C42CC8579E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4dZtuX-EyFUs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:43:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 65A0D855FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 18:43:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8704020CC7;
 Mon, 13 Jan 2020 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578941001;
 bh=2Pma3/cx78GLTAW61r1F5Jwdm6NzhJEJcPWrFF9uls8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IEeJ0bbGhTdr5RPtnE4bMgC1gdBDUCHLpuTR3u08lPJ2TLhJcuKN0+X5S8ktNGBSH
 GU8UIy+xN+9GwQNdpewuD4ZlaGboTBZ+vxzjedoPqkYuHZTm3FK7AYhLSHwj3Lzgty
 Ua9Jd3LYKp8MhT6a9j3vQe/sn90R4L0q1L0w4nz8=
Date: Mon, 13 Jan 2020 19:43:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200113184318.GB431441@kroah.com>
References: <20200109233757.734008-1-dwlsalmeida@gmail.com>
 <20200110073024.GA156006@kroah.com>
 <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6d119cf-7447-31ce-37db-25503cf2f9bc@gmail.com>
Cc: sean@mess.org, linux-kernel@vger.kernel.org, tglx@linutronix.de,
 mchehab@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media: dvb_dummy_tuner:
	implement driver skeleton
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

On Mon, Jan 13, 2020 at 03:23:02PM -0300, Daniel W. S. Almeida wrote:
> Hi Greg,
> 
> I am working on v3. Would you mind clarifying this?
> 
> 
> > > + *
> > > + * The virtual DVB test driver serves as a reference DVB driver and helps
> > > + * validate the existing APIs in the media subsystem. It can also aid developers
> > > + * working on userspace applications.
> > > + *
> > > + * This dummy tuner should support common TV standards such as DVB-T/T2/S/S2,
> > > + * ISDB-T and ATSC when completed.
> > > + *
> > > + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> > Normally this is the first comment line above in this block.
> > 
> 
> Just so we're clear, do you mean this? e.g.:
> 
> + * Copyright (c) 2020 Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Yes.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
