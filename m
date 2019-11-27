Return-Path: <SRS0=A+ee=ZT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD7F4C432C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 06:50:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8252070B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Nov 2019 06:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NSfxhZaU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A8252070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8E1522152F;
	Wed, 27 Nov 2019 06:50:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gBl2-86olYmR; Wed, 27 Nov 2019 06:50:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DECE32151E;
	Wed, 27 Nov 2019 06:50:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C461AC1DDA;
	Wed, 27 Nov 2019 06:50:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E8BBC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 06:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 56FB72152F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 06:50:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZ-efbF8Sj0u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 06:50:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 3D0572151E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Nov 2019 06:50:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EBA72070B;
 Wed, 27 Nov 2019 06:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574837437;
 bh=lfZhXu1ebmZ0LcDlWL3BPgBtFD5kDb2TxGZqbn3nVp4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSfxhZaUfBtlbe3jKP7Tz15BObu+nwu5Icy0JdkZTijghSutBYE6RBqqKFfOOIT2j
 mVWcUzUq7S+r3qz4VqnjuMvUYUn+85BIIyYfkw9wV9kP09FLbX1PmKOvCPwUqb61oP
 ds8Xv1l5VyJJL/uz0qvdzALJ2knHmP1W+/NpHJd8=
Date: Wed, 27 Nov 2019 07:50:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20191127065034.GD1711684@kroah.com>
References: <55294cee-5a17-bcd1-1014-b0f51c4360bd@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55294cee-5a17-bcd1-1014-b0f51c4360bd@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: linux-kernel-mentees@lists.linuxfoundation.org, stable@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] Linux 5.3.13 BOOT TEST: Compiled, Booted,
	everything OK.
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

On Tue, Nov 26, 2019 at 04:19:42PM -0300, Daniel W. S. Almeida wrote:
> No crashes and no new errors on dmesg.

Great, thanks for testing.

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
