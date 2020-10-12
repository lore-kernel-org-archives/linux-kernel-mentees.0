Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C030C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 10:40:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B1E2078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 10:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B1E2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4ABCE869D7;
	Mon, 12 Oct 2020 10:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-R7G7Q1OeO4; Mon, 12 Oct 2020 10:40:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A9E2F869F3;
	Mon, 12 Oct 2020 10:40:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88652C07FF;
	Mon, 12 Oct 2020 10:40:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3239DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 10:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D7DCD204D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 10:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTzN+DpDLUES
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 10:40:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 by silver.osuosl.org (Postfix) with ESMTPS id 524B3204A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 10:40:48 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 6A40AC009; Mon, 12 Oct 2020 12:40:45 +0200 (CEST)
Date: Mon, 12 Oct 2020 12:40:30 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Message-ID: <20201012104030.GA888@nautica>
References: <20201012042404.2508-1-anant.thazhemadam@gmail.com>
 <20201012075910.GA17745@nautica>
 <147004bd-5cff-6240-218d-ebd80a9b48a1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <147004bd-5cff-6240-218d-ebd80a9b48a1@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: lucho@ionkov.net, syzbot+75d51fe5bf4ebe988518@syzkaller.appspotmail.com,
 ericvh@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kuba@kernel.org, v9fs-developer@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH net] net: 9p: initialize
 sun_server.sun_path to have addr's value only when addr is valid
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

Anant Thazhemadam wrote on Mon, Oct 12, 2020:
> You mentioned how a fully zeroed address isn't exactly faulty. By extension, wouldn't that
> mean that an address that simply begins with a 0 isn't faulty as well?

That is correct.
If you have a look at the unix(7) man page that describes AF_UNIX, it
describes what 'abstract' addresses are and unix_mkname() in linux's
net/unix/af_unix.c shows how it's handled.

> This is an interesting point, because if the condition is modified to checking for addr[0] directly,
> addresses that simply begin with 0 (but have more non-zero content following) wouldn't be
> copied over either, right?

Yes, we would reject any address that starts with a nul byte -- but that
is already exactly what your patch does with strlen() already: a '\0' at
the start of the string is equivalent to strlen(addr) == 0.
The only difference is that checking for addr[0] won't run through all
the string if it doesn't start with a nul byte; but this is a one-time
thing at mount so it really doesn't matter.

> In the end, it comes down to what you define as a "valid" value that sun_path can have.
> We've already agreed that a fully zeroed address wouldn't qualify as a valid value for sun_path.
> Are addresses that aren't fully zeroed, but only begin with a 0 also to be considered as an
> unacceptable value for sun_path?

Yes, because the strcpy() a few lines below would copy nothing, leaving
sun_server.sun_path uninitialized like your example.

At that point you could ask why not "fix" that strcpy to properly copy
the address passed instead but that doesn't really make sense given
where 'addr' comes from: it's passed from userspace as a nul-terminated
string, so nothing after the first '\0' is valid.

There probably are ways to work around that (e.g. iproute's ss will
display abstract addresses with a leading '@' instead) but given nobody
ever seemed to care I think it's safe to just return EINVAL there like
you did ; there's nothing wrong with your patch as far as I'm concerned.

-- 
Dominique
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
