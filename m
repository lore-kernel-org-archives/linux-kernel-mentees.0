Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73D8C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:58:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A8F207D3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 17:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWbeDanD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A8F207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B100486B26;
	Tue, 10 Nov 2020 17:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHe2v5ijzaZP; Tue, 10 Nov 2020 17:58:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5C8E686B25;
	Tue, 10 Nov 2020 17:58:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C800C088B;
	Tue, 10 Nov 2020 17:58:19 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82E47C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7089687253
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asdNWidW8SCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:58:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 178768724D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 17:58:18 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C770F20781;
 Tue, 10 Nov 2020 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605031097;
 bh=RIQtxy/Q98sCLVqwPHTqyM87zYGU1ecCP3Nkry/4KJE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qWbeDanDQ8LTacruEGA8MseDR7iXxqZAsBx00l+C3CFBxnBrM8oMkwL5NS+Jaytom
 CELhIfkUkCHybYESX8bvfAsuraJ31VxvKZ7qYfQ25HYnV63ji4eoSk+N2r6ARt1qxQ
 5hpOt3DIMPY0I8rXOeghBkcE358WN5gOnUWUzBGI=
Date: Tue, 10 Nov 2020 09:58:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anmol Karn <anmol.karan123@gmail.com>
Message-ID: <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201107191835.5541-1-anmol.karan123@gmail.com>
References: <20201107082041.GA2675@Thinkpad>
 <20201107191835.5541-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, saeed@kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v3 net] rose: Fix Null pointer
 dereference in rose_send_frame()
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

On Sun,  8 Nov 2020 00:48:35 +0530 Anmol Karn wrote:
> +			dev = rose_dev_get(dest);

this calls dev_hold internally, you never release that reference in
case ..neigh->dev is NULL

> +			if (rose_loopback_neigh->dev && dev) {
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
