Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911D0C432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 06:35:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 654C2206DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 06:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayJVAXAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 654C2206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3E65D87F5D;
	Tue,  3 Dec 2019 06:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRI9CLwClJt5; Tue,  3 Dec 2019 06:35:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF4AD879A5;
	Tue,  3 Dec 2019 06:35:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5D8DC1798;
	Tue,  3 Dec 2019 06:35:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A972C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 536D287F5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uh9TMYnIU053
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:35:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A6FA7879A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:35:26 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA6DF206DF;
 Tue,  3 Dec 2019 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575354926;
 bh=tfQwQMStmLv/uqKyHBc+f6dzo9IHOr6b1jDEVdf+aio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ayJVAXAWvH0yTMLSxgNEJYES6BI05nLsWjKObnj7fljpbXqXidJWkcGUAQJJEF9PD
 2WjdJ3TsXTkg8HRk9qGbAyMtRGIUfKk2fQhtG09Bo1uN9FO8ClVtdfmUcPlRgHR/Yh
 ZXbIjZyStJfAiTz8QrU4FN9ZDugX5VVprKpaIF74=
Date: Tue, 3 Dec 2019 07:35:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: madhuparnabhowmik04@gmail.com
Message-ID: <20191203063521.GA1771875@kroah.com>
References: <20191202221310.6189-1-madhuparnabhowmik04@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202221310.6189-1-madhuparnabhowmik04@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Boot Test: Linux 5.4.1
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

On Tue, Dec 03, 2019 at 03:43:10AM +0530, madhuparnabhowmik04@gmail.com wrote:
> Hi,
> 
> I boot tested Linux 5.4.1, everything seems okay except the following error:
> 
> [    0.275509] platform MSFT0101:00: failed to claim resource 1: [mem 0xfed40000-0xfed40fff]
> [    0.275515] acpi MSFT0101:00: platform device creation failed: -16

Is this new compared to 5.4.0?  Compared to 5.3.y?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
