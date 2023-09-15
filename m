Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C8EE645A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Sep 2023 12:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 028EE83C1A;
	Fri, 15 Sep 2023 12:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 028EE83C1A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=FSiH66A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJYru7F0qNsj; Fri, 15 Sep 2023 12:03:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 95D8882252;
	Fri, 15 Sep 2023 12:03:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95D8882252
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69BFFC0071;
	Fri, 15 Sep 2023 12:03:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A9D5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 12:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D2934192B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 12:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2934192B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net
 header.a=rsa-sha256 header.s=zmail header.b=FSiH66A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsgPJDL3ihpd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 12:03:39 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F21E04192A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 12:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F21E04192A
ARC-Seal: i=1; a=rsa-sha256; t=1694779416; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H9SJ2/ylRin1fjSy+mrNOs5Hu65G+9KER1RnNpQu74qp58wxXQfoQo+I/Hwpq9AT++UPrvDOrCs7EoS1+HWEc/CAsscSpb7xo+DyL/Wl1zG17fSqRLrknzW6lzb8dzXMARM8zcJIKemGV4g3alwf6aaI0p998ES/n3NalPmAeBA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1694779416;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iVexVT2zh8T1OsT3V0tLN6PhoO+tdF7BsYZMZ241m5w=; 
 b=jto7nWBR0Ab/QDlOXIYl5jpsCN9QkDBzE+hJoyLZZXByF+oJTbQOhlgkW9aLuSg+CLurX1g1beCzlMR8ObITVNm87MnuqDI2Zdrm3iNhdonb8yzIu+3XJzrxhlyExA3QNkor7iaMk75zQVXK0BrB3AUbbGwtqMOWyZ1whFatEug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694779416; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=iVexVT2zh8T1OsT3V0tLN6PhoO+tdF7BsYZMZ241m5w=;
 b=FSiH66A9re+AWHXuPfZRuaH4bIruyMq83AEjZe2B0zuJ2oBnWbMtubCAd+YxSdnq
 DlB8xsar8HdIrBlzjjM768J8urk3AG9dILY7BD0JkJnYfEkmAlpy/7vTnpx03xYWT9F
 /A1xD59YtM0dbLAxqgV/w02BRziLtQQG8Jj01fTg=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1694779413281802.1657557561805;
 Fri, 15 Sep 2023 05:03:33 -0700 (PDT)
Date: Fri, 15 Sep 2023 09:03:39 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers: core: ensure device has a name
Message-ID: <a6heh7hn45avcmttxvlmu6cobzjnsz6rsvpr7vkvvoqmadoikk@girnrpbu32go>
References: <20230915011930.199009-1-ricardo@marliere.net>
 <2023091533-subdued-antler-d6ac@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023091533-subdued-antler-d6ac@gregkh>
X-ZohoMailClient: External
Cc: syzbot+bbc59256015533127d80@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On 23/09/15 08:51AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 14, 2023 at 10:19:31PM -0300, Ricardo B. Marliere wrote:
> > device_add() relies on dev_name() and dev_set_name() to set the device
> > name. This patch adds the fallback case where both the call to
> > dev_name() and (dev->bus && dev->bus->dev_name) fails.
> > 
> > Reported-by: syzbot+bbc59256015533127d80@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=bbc59256015533127d80
> > Fixes: d21fdd07cea4 ("driver core: Return proper error code when dev_set_name() fails")
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > ---
> >  drivers/base/core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Already submitted and in linux-next:
> 	https://lore.kernel.org/r/20230828145824.3895288-1-andriy.shevchenko@linux.intel.com

Ah, of course. I'll do a better job grepping the mail next time :)

Thanks for reviewing,
-	Ricardo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
