Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B191C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 08:32:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC90215A4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 08:32:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UL12KF8I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC90215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EEDB86847;
	Tue,  8 Sep 2020 08:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbqCQaG4EE7x; Tue,  8 Sep 2020 08:32:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42F2E8680F;
	Tue,  8 Sep 2020 08:32:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31BCAC0052;
	Tue,  8 Sep 2020 08:32:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92E6DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 08:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72EAF2052F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 08:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qTkXzU7hm9d8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 08:32:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by silver.osuosl.org (Postfix) with ESMTPS id 7CEB427261
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 08:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 97CA251BBF;
 Tue,  8 Sep 2020 10:32:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yhz0DXSapah2; Tue,  8 Sep 2020 10:32:45 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599553965; bh=MtTkkrjUArcAs0hadvKRy5v5FwaP4zALze6rrGVH8yI=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=UL12KF8Iv8VO3iSfSVMnBnYwXLSspHQbo6YAP8dVAceoioWuARTDnhvSTj5ht64Yy
 OVnnBqiaS34hxCzVki+7sToTM1RxFJccFMvD9EZGPInBLXpOatjlbWOHhJmgp5N96N
 t6np8bLbrOfQzLMYumY8jKtLoHowFhQs+5iVo3v21P7sSuzITdXdAJr8y5XIn0l2Fh
 aD7WPBudiwdjV6R8ODguCHrcItZ43o45vHW4ZGa4yeDMGIUX3KVIDPeZ84qE9VEX2j
 Bm6pfZvI4CI61VABl4+cqFa04eVCWigy5YOW2pW8AmiYLGohLhr9+6aweiP0gmkg6n
 aUdsMH0ZtHjjA==
Date: Tue, 08 Sep 2020 08:32:45 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
To: "Joe Perches" <joe@perches.com>, apw@canonical.com
In-Reply-To: <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
References: <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
 <20200907151417.44453-1-ayush@disroot.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: GIT_COMMIT_ID:
 handle commit messages with multiple quotes
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

> I think all your examples are broken.
> 
> I think all should start with revert
> i.e.: Reverts commit <SHA-1> ("description...")

Actually I am talking about those commits which referenced a revert commit.

For example:

If I want to mention a revert commit in my commit message, I will do something like.

This bug appeared first in commit 1234567890ab ("Revert "abc: foo bar"").
(Just an example)

Here, according to syntax, it is right but checkpatch.pl gives an error as multiple
quotes in commit messages are not handled in checkpatch.pl.

Regards,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
