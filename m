Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A5C352A2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 09:46:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B264022464
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 09:46:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHgfkjw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B264022464
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9129A203A6;
	Fri,  7 Feb 2020 09:46:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBxkUfg0QqfZ; Fri,  7 Feb 2020 09:46:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3E4D9203BF;
	Fri,  7 Feb 2020 09:46:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21060C1796;
	Fri,  7 Feb 2020 09:46:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9F9BC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 09:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C0A2386B49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 09:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUQFt73Di64y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 09:46:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5C62C86388
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 09:46:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC4C722314;
 Fri,  7 Feb 2020 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581068775;
 bh=ZRczVq8huS30y5na4+I2se7v9Uv/Sjaw+uD78GP3QtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fHgfkjw0Ypl+1TcQRFuzJAfU1WwSx87eqQZZ8FgBcbTay1WBHfcRR58zgp/Eu6SdL
 +w/EeOG/Bc05fx1OKZKACJoYxSo36OFwHANIQTblgVou81ATSucC/Sv5IB4KSS4IBD
 F/tKrKJmPUKtQTecJlUUQkmhLXDiuM1WLieFnuJo=
Date: Fri, 7 Feb 2020 10:46:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200207094612.GA562325@kroah.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
 <20200127101343.20415-3-pragat.pandya@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127101343.20415-3-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, valdis.kletnieks@vt.edu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 02/22] staging: exfat: Rename
	variable "Month" to "mont"h
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

On Mon, Jan 27, 2020 at 03:43:23PM +0530, Pragat Pandya wrote:
> Change all the occurrences of "Month" to "month" in exfat.

Your subject line is a bit "odd" :(

Anyway, can you rebase this series and resend only what you want to do
here instead of me having to randomly pick out different parts?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
