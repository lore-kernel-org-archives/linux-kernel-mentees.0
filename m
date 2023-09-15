Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C745EE6423
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Sep 2023 06:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BCF42083;
	Fri, 15 Sep 2023 06:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BCF42083
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DilZRN7J
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrIetzkZefbW; Fri, 15 Sep 2023 06:52:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A92D042075;
	Fri, 15 Sep 2023 06:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92D042075
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86B2BC0039;
	Fri, 15 Sep 2023 06:52:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D86E4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 06:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F31240A8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 06:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F31240A8B
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=DilZRN7J
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQVw0HyKQ0CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 06:51:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A222B4061F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 06:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A222B4061F
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 97F5CCE29F2;
 Fri, 15 Sep 2023 06:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A7FC433C8;
 Fri, 15 Sep 2023 06:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1694760713;
 bh=PQoeNqV6xHn7JACo5D6UVtHw6kZFO2kntyCiUbxhaDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DilZRN7JAb8G+9kk1vgiNoy1SKXy1zou8JL3D0lzUIxto+hiFbV7mBJDXwB7CMSk5
 8EnNpLMLn16HijWN14skXIETQeK8sXDTJkKZ9vu5Bm2jpWfR8CRnkgxY+bIPCsyfWF
 pwe6snVlnhkxLJveMlns+EINWhH8cS0EtfgT6Pfk=
Date: Fri, 15 Sep 2023 08:51:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH] drivers: core: ensure device has a name
Message-ID: <2023091533-subdued-antler-d6ac@gregkh>
References: <20230915011930.199009-1-ricardo@marliere.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915011930.199009-1-ricardo@marliere.net>
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

On Thu, Sep 14, 2023 at 10:19:31PM -0300, Ricardo B. Marliere wrote:
> device_add() relies on dev_name() and dev_set_name() to set the device
> name. This patch adds the fallback case where both the call to
> dev_name() and (dev->bus && dev->bus->dev_name) fails.
> 
> Reported-by: syzbot+bbc59256015533127d80@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=bbc59256015533127d80
> Fixes: d21fdd07cea4 ("driver core: Return proper error code when dev_set_name() fails")
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/base/core.c | 2 ++
>  1 file changed, 2 insertions(+)

Already submitted and in linux-next:
	https://lore.kernel.org/r/20230828145824.3895288-1-andriy.shevchenko@linux.intel.com
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
