Return-Path: <SRS0=P4BV=CS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD79C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:31:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0180221D79
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Sep 2020 10:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZaX6Lnby"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0180221D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=disroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB85B86DD6;
	Wed,  9 Sep 2020 10:31:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o-3xEHUuG2xg; Wed,  9 Sep 2020 10:31:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 125A38492B;
	Wed,  9 Sep 2020 10:31:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01B5FC0052;
	Wed,  9 Sep 2020 10:31:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF9F5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5F96875A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WZJyH3FM4bRt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:31:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 669DF875A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Sep 2020 10:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 56F4D51B36;
 Wed,  9 Sep 2020 12:31:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ja2_fiPKpOBg; Wed,  9 Sep 2020 12:31:27 +0200 (CEST)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1599647487; bh=IVeXskU+Qqu4tY5/GPpaoI2n6jg3iP1Bl/OYq/UHtq4=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=ZaX6Lnby3J9xBdOo8VH7/XkiMPo/lL29Xs/Rj/4Bbq1TKSVAZLAAFyo6C4UT0D6Yd
 klICS9AQuGEUq2Hg+8rzy7mWh32WQiyqptjdGvm+eeeUVJgUwlyyE1vaTamoFs063E
 b5ATVv0Mst5ftHopmUVyJoqk13PsBMYL3BZUs68A9S6jRuHeqfMqJfr7RxgZj+KxVy
 iozNMBPWmJGF7ON2eMVx0Fmj/8LgWBggdnn+7Bz13a1J/Y6SIzFTmdyG1Q0l02CEnN
 NHJW8ymQK2B9j/Wc37vzoipssskKGutGMER4LOg4MD7zqNNotsiuXdXdjI1KeCgPGO
 +hN8PnNvijMrg==
Date: Wed, 09 Sep 2020 10:31:26 +0000
From: "Ayush" <ayush@disroot.org>
Message-ID: <3dea1eefdbbf97791bed3f838d4f06a7@disroot.org>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2009091152530.5622@felia>
References: <alpine.DEB.2.21.2009091152530.5622@felia>
 <beed63208cc412f122fe273602675801add08ede.camel@perches.com>
 <20200907151417.44453-1-ayush@disroot.org>
 <22db634e7be36f4514f0c9b3ecf0060a@disroot.org>
Cc: Joe Perches <joe@perches.com>, apw@canonical.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

Sir,

> As the mentor in the linux kernel community bridge program, I usually
> inform the mentees when the review on the mentee mailing list has
> successfully concluded to a first acceptable state and I think it is well
> advised to reach out to the maintainers for further discussion.
> 
> You did not do that, but just send some patch to the maintainers.
> That is fully up to you, but I will not support the patch acceptance in
> any way, and it suggests that you do not see the need to be mentored.
> 
> If you can land patches without mentoring support successfully, that is
> great, but then you do not need a mentorship.

I am extremely sorry for my mistakes. It won't happen again.
 
> Now, to the commit:
> 
> Ayush, your commit message is largely incomprehensible.
> 
> Your follow-up explanation that was needed should have been in the commit
> message in the first place.

It was my first patch, so I had very little idea of forming commit messages. 
I will discuss it with mentors next time before sending the patch next time.

> Ayush, you did not sign-off with your full legal name.

My legal name according to all official identification documents of India is Ayush. 
I have no surname registered legally.
So should I include "Ayush <ayush@disroot.org>"  or do I need to include my last name too (Which is Ayush only)?

Please accept my apology.

Thanks,
Ayush
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
