Return-Path: <SRS0=Pn+h=MV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F18C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 01:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8A2360F91
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 29 Jul 2021 01:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8A2360F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AF89606E0;
	Thu, 29 Jul 2021 01:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q-gkKyrHf0qF; Thu, 29 Jul 2021 01:06:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 70D11606C2;
	Thu, 29 Jul 2021 01:06:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C42AC001A;
	Thu, 29 Jul 2021 01:06:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3449DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 01:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AB39606CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 01:06:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdEwylBd1qLu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 01:06:11 +0000 (UTC)
X-Greylist: delayed 09:28:40 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0110.hostedemail.com
 [216.40.44.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72ABA606C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Jul 2021 01:06:10 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 62CA91803322A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 21:30:58 +0000 (UTC)
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id B560E180D0797;
 Wed, 28 Jul 2021 21:30:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id 640A113D99; 
 Wed, 28 Jul 2021 21:30:55 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 28 Jul 2021 14:30:54 -0700
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: patch suggestion: Kconfig symbols
In-Reply-To: <09db53b9-7edf-44fc-c6b7-7c4e9198a2d4@infradead.org>
References: <295b8f8c-4264-9f32-6723-9d2d574021ac@infradead.org>
 <e77e2329bdafdbea538be0d7edb8a9d7d3e45990.camel@perches.com>
 <09db53b9-7edf-44fc-c6b7-7c4e9198a2d4@infradead.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <733d2747b67a8a172333b51bacbf77fe@perches.com>
X-Sender: joe@perches.com
X-Stat-Signature: 1rkzgomx86n88r4rw5msropwwmhpsboi
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 640A113D99
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/hNJ9eNNNyc+Lzlm6mkIzHlx1pO20mbns=
X-HE-Tag: 1627507855-712796
Cc: kernel-janitors <kernel-janitors@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 LKML <linux-kernel@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 2021-07-28 12:41, Randy Dunlap wrote:
> On 7/28/21 8:37 AM, Joe Perches wrote:
>> On Mon, 2021-07-26 at 17:21 -0700, Randy Dunlap wrote:
>>> Running scripts/checkkconfigsymbols.py reports several hundred (maybe 
>>> thousand)
>>> Kconfig symbols that are used questionably. Lots of these are false 
>>> positives
>>> but lots of the remainder could use some cleaning up.
>> []
>>> False positive example:
>>> 
>>> XCHOFFLD_MEM
>>> Referencing files: drivers/scsi/qla2xxx/qla_mbx.c
>>> Similar symbols: OF_PMEM, CXL_MEM, CXL_PMEM
>>> 
>>> The Referencing source file does this:
>>> #define CONFIG_XCHOFFLD_MEM	0x3
>>> 
>>> which is legitimate, so no change is needed.
>> 
>> Legitimate is perhaps dubious.
>> 
>> It might be better if Kconfig has exclusive use of CONFIG_<foo> naming 
>> so
>> renaming all the other existing CONFIG_<foo> defines might be 
>> appropriate.
> 
> I would prefer that as well -- maybe 15 years ago.
> But I think it's too invasive to make that change now.

I do not think it's that invasive.

It's something that doesn't have to be done immediately either.

It's not too many macro defines and not too many uses of those defines.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
