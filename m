Return-Path: <SRS0=o3A5=ZZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA9DC432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 06:41:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5192B2073C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Dec 2019 06:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1v/ehhK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5192B2073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2138487699;
	Tue,  3 Dec 2019 06:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hASVebz6oRMS; Tue,  3 Dec 2019 06:41:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC823876D8;
	Tue,  3 Dec 2019 06:41:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 933B0C1798;
	Tue,  3 Dec 2019 06:41:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 141FFC087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0CA82203DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxqHpRsUESE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:41:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 874AC203C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Dec 2019 06:41:44 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCA1C206DF;
 Tue,  3 Dec 2019 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575355304;
 bh=qMuj5cgIyZLiZwDa2azGWSuf3/RSlu2bWI2PuW4DtSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j1v/ehhKMcxzHyk943lU9wYre6b3OBlI3nmSY8reHWkdD3P2aS/GJT4uQ6rzK7rgL
 NUlCqUYlDaGDrpA5kIXBp3CL7PAsXsV9gCp4+a8TJ/Jevxev4JlEhHwEKjeem1WYTL
 XTWJVBG2UpX/EH0uxh5PzLSZqVhfqN+SJ8Uvg64I=
Date: Tue, 3 Dec 2019 07:40:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Amol Grover <frextrite@gmail.com>
Message-ID: <20191203064052.GA1788679@kroah.com>
References: <20191203062503.GA3467@workstation-kernel-dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203062503.GA3467@workstation-kernel-dev>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [STABLE TEST] 5.3.13
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

On Tue, Dec 03, 2019 at 11:55:03AM +0530, Amol Grover wrote:
> Compiled, Booted, however I'm getting the following errors when running
> "make kselftest"
> 
> sudo dmesg -l alert
> 
> [34381.903893] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [34381.903904] #PF: supervisor read access in kernel mode
> [34381.903908] #PF: error_code(0x0000) - not-present page

Which test causes this problem?

ANd is it new in 5.3.13?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
