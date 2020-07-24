Return-Path: <SRS0=SEG9=BD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE52C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 23:29:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A260F206EB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Jul 2020 23:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A260F206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trinnet.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A959893FD;
	Fri, 24 Jul 2020 23:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w+Q1+abQR21s; Fri, 24 Jul 2020 23:29:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB215893CD;
	Fri, 24 Jul 2020 23:29:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4099C004D;
	Fri, 24 Jul 2020 23:29:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8454BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BB4CF88483
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 23:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUwKYmatgyVZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 23:28:46 +0000 (UTC)
X-Greylist: delayed 01:03:18 by SQLgrey-1.7.6
Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
 by whitealder.osuosl.org (Postfix) with ESMTP id 11D6D86234
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Jul 2020 23:28:46 +0000 (UTC)
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
 by trinity3.trinnet.net (TrinityOS/8.15.2) with ESMTP id 06OMPJee005392;
 Fri, 24 Jul 2020 14:25:19 -0800
To: David Miller <davem@davemloft.net>, yepeilin.cs@gmail.com
References: <20200722160512.370802-1-yepeilin.cs@gmail.com>
 <20200722.180723.102622644879670834.davem@davemloft.net>
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <9ed88432-ef95-f01a-9655-7c60158e3b09@trinnet.net>
Date: Fri, 24 Jul 2020 15:25:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200722.180723.102622644879670834.davem@davemloft.net>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0
 (trinity3.trinnet.net [192.168.0.1]); Fri, 24 Jul 2020 14:25:20 -0800 (GMT+8)
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, netdev@vger.kernel.org, linux-hams@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 jreuter@yaina.de
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Prevent out-of-bounds
 read in ax25_sendmsg()
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


I need to ask the following question to the Linux kernel community as 
the AX25 amateur radio community is already having to
work around a few broken commits that were committed 4.1.22+:

   Is anyone actually _*testing*_ these proposed changes to make sure 
the AX.25 and related ecosystem still work afterwards?

I've personally tried multiple times to recruit some help to get some of 
these previous commits rolled back from some
recommended kernel people including even some the original authors like 
Alan Cox, etc without any success.  I fear that if
more commits come into the kernel without any testing, the whole AX.25 
stack will become toxic and unusable.

I am not a kernel class developer but I am *personally* willing to help 
out on the testing effort and even help setup regression
topologies (VMs, containers, whatever) if there is some place that they 
can be ideally run in a continuous delivery.

If there is anyone also willing to help fix some of these previous 
commits and get the AX.25 stack kernel back on track,
I do have a bunch of details of the commit details, details on why those 
committers THOUGHT they were a good idea, etc.

--David
KI6ZHD


On 07/22/2020 06:07 PM, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Wed, 22 Jul 2020 12:05:12 -0400
>
>> Checks on `addr_len` and `usax->sax25_ndigis` are insufficient.
>> ax25_sendmsg() can go out of bounds when `usax->sax25_ndigis` equals to 7
>> or 8. Fix it.
>>
>> It is safe to remove `usax->sax25_ndigis > AX25_MAX_DIGIS`, since
>> `addr_len` is guaranteed to be less than or equal to
>> `sizeof(struct full_sockaddr_ax25)`
>>
>> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> Applied.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
