Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C3C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 24 Aug 2022 08:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D83481429;
	Wed, 24 Aug 2022 08:12:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D83481429
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=QXUy31uj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TIGQ0v-E2UuZ; Wed, 24 Aug 2022 08:12:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1A1ED81390;
	Wed, 24 Aug 2022 08:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1ED81390
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED68CC0032;
	Wed, 24 Aug 2022 08:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3923EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 009F68140A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 08:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 009F68140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOFbyviuLRiU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 08:12:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6933381390
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6933381390
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 24 Aug 2022 08:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1661328756; cv=none; d=zohomail.in; s=zohoarc; 
 b=DSlC6MNqXJEKuLWWv9hD5ReOtHPCoIIspX9WVJYwx76RtxpYjqB3NGMU3dedRU3CL1lSicqv3EZfUcnhQ1EJIyaNSME4Ri4EKFI9jmwB5/XzPNh0OL9ammAtpqD7c+41CFO2mL6ydJ8/IvNIpIRJHgo7BvTjDy/4c6AI/9+xwus=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1661328756;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=nxuDlBnh7rD26c84GHsAUGHCF7GK79bwk7nQ3eQxjyY=; 
 b=eLZ9qpm4vxcJ0enFIjDW/CuyYqacaj3hvYJNWkUIU3lQ6Qmp2Snj7Q1uCQEVHyZaoLtKVXmJ+pb6dSbFJDou1TXhFrAQWVyQ65YIjaWtEQrf11pFVd8nEkcEa75iS3JIAgg8JmVKNe8q3sQ/4V6fxnRE8UyNxwJLN+MVlZbBbo8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661328756; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nxuDlBnh7rD26c84GHsAUGHCF7GK79bwk7nQ3eQxjyY=;
 b=QXUy31uj4dbboP+XiXGdXmL43R95UeAcwm0xOMj/EcZneZkZEKQG6FCsq/pMFLcU
 mlWD6fj6JCJ9uOXfnN/r9w616HiOgvi2fB8VSl+IxO65Kzi7SB0N2+i5MmCFcs+wT+A
 +zSVw/g3xbbuxu0s5eMM9Z9DXsRVvezkiOxewFWs=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1661328745149618.5620763655653;
 Wed, 24 Aug 2022 13:42:25 +0530 (IST)
Date: Wed, 24 Aug 2022 13:42:25 +0530
To: "Jens Axboe" <axboe@kernel.dk>
Message-ID: <182cee8e2a7.5a62eb4811173.7413734946973464259@siddh.me>
In-Reply-To: <166127140632.124225.483036207879834754.b4-ty@kernel.dk>
References: <20220823160810.181275-1-code@siddh.me>
 <166127140632.124225.483036207879834754.b4-ty@kernel.dk>
Subject: Re: [PATCH v2] loop: Check for overflow while configuring loop
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 syzbot+a8e049cd3abd342936b6
 <syzbot+a8e049cd3abd342936b6@syzkaller.appspotmail.com>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, 23 Aug 2022 21:46:46 +0530  Jens Axboe  wrote:
> Applied, thanks!
> 
> [1/1] loop: Check for overflow while configuring loop
>       commit: f11ebc7347340d291ba032a3872e40d3283fc351

Thanks!

Though, it seems that you have used the mailing list's address
(linux-kernel-mentees@lists.linuxfoundation.org) in the author
field instead of the Signed-off email.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
