Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60829C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 11:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D36776076C;
	Tue, 26 Jul 2022 11:50:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D36776076C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=GXuIDkiS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2T22hNjdo1p; Tue, 26 Jul 2022 11:50:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BDCC6606F5;
	Tue, 26 Jul 2022 11:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCC6606F5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 997D9C0035;
	Tue, 26 Jul 2022 11:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D27CFC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 11:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABBC683495
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 11:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABBC683495
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=GXuIDkiS
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Pluj0MHH0zg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 11:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F6A183490
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F6A183490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 11:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658836225; cv=none; d=zohomail.in; s=zohoarc; 
 b=WSpg8KPJETneI5AZXqZG2Xo+QF9K6OWYXEGoNLBhcVRq1DV+/Y1sqc9n+DAX3SaiTADgCejJ/zcn3V8f/35O40cJZVpczIlv8V08xFBsuuGA7SKIFRLu/MYvy3X2hUTOeapUr9s5qEkAXYDI9PTu9F8nSNuLXWfGF1qB4fdI56U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658836225;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=l0zptIRyEcZyy0C3kf9GDQRw2Zi+JN1Q7S6n+N0vGIM=; 
 b=fXYBHscjQeqXdzbflmTvcDxoHxEMvkX5RSrwbNEMkKBioDpJg8b1AHK0Q1eDxIldwZ4eRbwRN6TFcIxePTYWB1Hoquev0qAPkodcDHotHR9uKazGZhbTsfH+JxZmhiwrYIbp0nIPVAWvuRKFY7GKSj6yRXrJCk29d8Z73XXT2DE=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658836225; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=l0zptIRyEcZyy0C3kf9GDQRw2Zi+JN1Q7S6n+N0vGIM=;
 b=GXuIDkiSSLbukku99oGbHP0rFZ8U+DpqqvJ2y8bEtutG8U5Ofv1bXLmS6Wda5ScD
 98NAMUYRoOyJjULA6Liu5rl6D6KWFYpVNggaaOmJhxRqEsV2I/u3xoHttg/aKFp0NmI
 mUifysZ3Bibdl41v6CpRnIQiDkYjWFtCfGNVHDOI=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658836214239674.8528097307659;
 Tue, 26 Jul 2022 17:20:14 +0530 (IST)
Date: Tue, 26 Jul 2022 17:20:14 +0530
To: "Kalle Valo" <kvalo@kernel.org>
Message-ID: <1823a57e1cc.284bcb72769210.9086833687126088621@siddh.me>
In-Reply-To: <8735eomc5h.fsf@kernel.org>
References: <20220701145423.53208-1-code@siddh.me> <8735eomc5h.fsf@kernel.org>
Subject: Re: [PATCH] net: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "David S . Miller" <davem@davemloft.net>
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

On Tue, 26 Jul 2022 15:25:06 +0530  Kalle Valo <kvalo@kernel.org> wrote --- 
> The title should be:
> 
> wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
> 

Noted. Will fix.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
