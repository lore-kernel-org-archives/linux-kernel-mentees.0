Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7715E95A60
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Oct 2023 11:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD90822DB;
	Sat,  7 Oct 2023 11:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BD90822DB
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=r2Fsx2BT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c2OSavD_Clp; Sat,  7 Oct 2023 11:41:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 51A258233F;
	Sat,  7 Oct 2023 11:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A258233F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33ADBC0039;
	Sat,  7 Oct 2023 11:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2A93C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 11:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD6941E36
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 11:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD6941E36
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=r2Fsx2BT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxI70HBulgAO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 11:41:45 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78DD441E26
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Oct 2023 11:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DD441E26
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7A55DB8047E;
 Sat,  7 Oct 2023 11:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12080C433C8;
 Sat,  7 Oct 2023 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1696678901;
 bh=VgylUM7zk0Dl3tHTAheTcH5TcrIM7+TR+ZDe5P5GAlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r2Fsx2BTHs9odemk42u48Jjp0cc+6rKHPKXDqjeJzkcyNG7lnijNgl6mW3Yaxi29a
 JAh8CijSWTszMjltPoCqGKSQOOfMjSgDUI8tYFmJRyQt6d8iRorol41JuQbrbCrrUN
 gdhwMv/zwCNpRTDnVogz2Sg9dAxYXulM6qkK7xmU=
Date: Sat, 7 Oct 2023 13:41:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuran Pereira <yuran.pereira@hotmail.com>
Subject: Re: [PATCH] Bluetooth: hci_conn_failed: Fixes memory leak
Message-ID: <2023100727-passive-untidy-8df4@gregkh>
References: <AM9P192MB12672AA34A0480B522D23741E8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM9P192MB12672AA34A0480B522D23741E8C8A@AM9P192MB1267.EURP192.PROD.OUTLOOK.COM>
Cc: johan.hedberg@gmail.com, marcel@holtmann.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, Oct 07, 2023 at 05:09:01PM +0530, Yuran Pereira wrote:
> The hci_conn_failed() function currently calls hci_connect_cfm(), which
> indirectly leads to the allocation of an l2cap_conn struct in l2cap_conn_add().
> This operation results in a memory leak, as the l2cap_conn structure
> becomes unreferenced.
> 
> To address this issue and prevent the memory leak, this patch modifies
> hci_conn_failed() to replace the call to hci_connect_cfm() with a
> call to hci_disconn_cfm().
> 
> Reported-by: syzbot+39ec16ff6cc18b1d066d@syzkaller.appspotmail.com
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>  net/bluetooth/hci_conn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What commit id does this fix?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
