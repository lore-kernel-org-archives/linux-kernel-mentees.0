Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F77C4727D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 14:29:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4DD206A4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 14:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nucleusys.com header.i=@nucleusys.com header.b="Aw5vGkll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4DD206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nucleusys.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2ECEE86C65;
	Fri,  2 Oct 2020 14:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YeYl9JKnnpvN; Fri,  2 Oct 2020 14:29:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FD3386CC3;
	Fri,  2 Oct 2020 14:29:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1639EC016F;
	Fri,  2 Oct 2020 14:29:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C52CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 03EDD2BC43
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Improper folded header field made up
 entirely of whitespace (char 20 hex): X-Spam-Report: ...that system
 for details.\n \n Content previ[...]
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aWS-VZPcFk9k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:29:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zztop.nucleusys.com (lan.nucleusys.com [92.247.61.126])
 by silver.osuosl.org (Postfix) with ESMTPS id 151C02DADE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=nucleusys.com; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+46LdM6PcDOkzQb5JDU0b6k7u6FWkT7DMAIIJ4jYqA=; b=Aw5vGkll/h+gwLv9n0jja96gT1
 UJ6NwKXEuQQ6w0Ti7GrZtrtXb0iz7YGLmNe5yGAE5k02mxXqk7/7yThcWdcr84YLZOEA9KrnSLNUK
 DJLZtGNWhcvs+hgMbWiznzrw3tztBR+nHzb8+0Qrt7yTmkwFPbVaSfa6Bz1BP7kUIbJ4=;
Received: from [94.26.108.4] (helo=carbon)
 by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <petkan@nucleusys.com>)
 id 1kOM3S-00015G-U7; Fri, 02 Oct 2020 17:29:03 +0300
Date: Fri, 2 Oct 2020 17:29:01 +0300
From: Petko Manolov <petkan@nucleusys.com>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201002142901.GA3901@carbon>
Mail-Followup-To: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Greg KH <greg@kroah.com>, David Miller <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20201001073221.239618-1-anant.thazhemadam@gmail.com>
 <20201001.191522.1749084221364678705.davem@davemloft.net>
 <83804e93-8f59-4d35-ec61-e9b5e6f00323@gmail.com>
 <20201002115453.GA3338729@kroah.com>
 <a19aa514-14a9-8c92-d41a-0b9e17daa8e3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a19aa514-14a9-8c92-d41a-0b9e17daa8e3@gmail.com>
Cc: syzbot+abbc768b560c84d92fd3@syzkaller.appspotmail.com,
 Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kuba@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 David Miller <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: prevent
 set_ethernet_addr from setting uninit address
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

On 20-10-02 17:35:25, Anant Thazhemadam wrote:
> 
> Yes, this clears things up for me. I'll see to it that this gets done in a v3.

If set_ethernet_addr() fail, don't return error, but use eth_hw_addr_random() 
instead to set random MAC address and continue with the probing.

You can take a look here:
https://lore.kernel.org/netdev/20201002075604.44335-1-petko.manolov@konsulko.com/


cheers,
Petko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
