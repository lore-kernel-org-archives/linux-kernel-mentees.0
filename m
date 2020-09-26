Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769CDC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:11:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28B920878
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 06:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3+dQJ+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F28B920878
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 97F9B204A2;
	Sat, 26 Sep 2020 06:11:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BbiYv0GF6TZb; Sat, 26 Sep 2020 06:11:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 920E220119;
	Sat, 26 Sep 2020 06:11:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D4E8C0859;
	Sat, 26 Sep 2020 06:11:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B149C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 33FC18748F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psBaaHSfGWOg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:11:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B3A368748D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 06:11:04 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7573720882;
 Sat, 26 Sep 2020 06:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601100664;
 bh=UYwxVJ+FaojZVNBh29dAtkYP0tCvuVBaXI/Yk+fdR7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3+dQJ+bEjyrEVb1/uDbmDPKt4QLhK89yGDIe+gPb5FvS6PMT+QVulsIj6UPxa1g4
 S/87tIeqQskbpY5vOLBbr7il2zuZ1Xqn7ySqJMhUG+cjaza32JLFkofGMInE/5twk6
 2ITgfsvdIzWkCscVp53D9uu3D6Wd/VDRWop5RsKo=
Date: Sat, 26 Sep 2020 08:11:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <20200926061100.GB637197@kroah.com>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
 when calling scripts
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

On Sat, Sep 26, 2020 at 02:50:08AM +0530, Ujjwal Kumar wrote:
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>

I know I can't take pathces with no changelog text, maybe other
maintainers are more lax :(

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
