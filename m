Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8A8C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 14:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFD2418F4;
	Fri, 12 Aug 2022 14:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EFD2418F4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=CV76Upvi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ok4KM9ybFtGH; Fri, 12 Aug 2022 14:33:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CDED5418EE;
	Fri, 12 Aug 2022 14:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDED5418EE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A68DCC0033;
	Fri, 12 Aug 2022 14:33:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71043C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 14:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24AED60797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 14:33:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24AED60797
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=CV76Upvi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id soY8MjQ4XbnI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 14:33:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04AE7606F5
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04AE7606F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 14:33:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660314797; cv=none; d=zohomail.in; s=zohoarc; 
 b=ZsPeTBwCvtjfBth8vCDZ73XUlW82+n2II13ffIl313k1+oOYiENtHB9UVPUFiUH7/nlK4XZFKluKR0d9y5YWaPv646IhMo1/sVmoVRIB3FEN4J3h7Dsh3CM7nsGQ8WSh3Xwia0qaWVzyuH7XvNy61XI9ZB0LxGmDUH8MwCtIJy8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660314797;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=dumJYXz+P7lT1DPflB6oGqlatTwRRoJ0LNEvMWFK+Lc=; 
 b=FiZ9xtbApy4datR1Ci/1lkexOq5Ep6P1qVUCJzPRp11JDSa3uq9aHYz9mlzp0AzFWiqTNWo+TWbKcbfpOUUY8bkllsYytUWedSDC2z2bDiD0oOLTy46PXHp+ey4u+hUemHYfz7Fqp461prmdddCj+Zqugl+OlF2enx1nwhu/Fqg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660314797; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=dumJYXz+P7lT1DPflB6oGqlatTwRRoJ0LNEvMWFK+Lc=;
 b=CV76Upvi9tklgyTLuwhoGmyhL+YvwHD62NLAPtXIeXioCiczbg5LLWx2beUVNX7t
 bqvFXs5cL3Y7+FqQyT2EjKeUaeaaV2F7KUtQ2ufvyxfKujAXub4ezVjuTlldBXXE5dU
 UXUdsOZIf9kTOwYO5TtmrlgBTj4prl8cs/KiYuHQ=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 166031478558942.555014497664615;
 Fri, 12 Aug 2022 20:03:05 +0530 (IST)
Date: Fri, 12 Aug 2022 20:03:05 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <18292791718.88f48d22175003.6675210189148271554@siddh.me>
In-Reply-To: <YvZEfnjGIpH6XjsD@kroah.com>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>, syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 eric dumazet <edumazet@google.com>, syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 jakub kicinski <kuba@kernel.org>, johannes berg <johannes@sipsolutions.net>,
 paolo abeni <pabeni@redhat.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "david s. miller" <davem@davemloft.net>
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

On Fri, 12 Aug 2022 17:45:58 +0530  Greg KH  wrote:
> The merge window is for new features to be added, bugfixes can be merged
> at any point in time, but most maintainers close their trees until after
> the merge window is closed before accepting new fixes, like this one.
> 
> So just relax, wait another week or so, and if there's no response,
> resend it then.
> 

Okay, sure.

> Personally, this patch seems very incorrect, but hey, I'm not the wifi
> subsystem maintainer :)

Why do you think so?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
