Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6B0C04A68
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 30 Jul 2022 15:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B67F6117A;
	Sat, 30 Jul 2022 15:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B67F6117A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=uAHwyKWF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F05Kv_4j9PGU; Sat, 30 Jul 2022 15:52:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6733060AE9;
	Sat, 30 Jul 2022 15:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6733060AE9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB05C0033;
	Sat, 30 Jul 2022 15:52:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 616F5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 15:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AF8E417A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 15:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AF8E417A1
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=uAHwyKWF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCJj0YYYtQvX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 15:52:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B33424179D
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B33424179D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 30 Jul 2022 15:52:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659196316; cv=none; d=zohomail.in; s=zohoarc; 
 b=YlURlAEWwZZDxfCQefkLozeADwMcUOka33Ne9+CUlp9Bb2vrc0hJyFQkcsbffJpckfFmuhCu8SEuzMHNQ1z/Y57N0VHZrjFuUBJZhcpACVuOBLhHDCfPGBCMicgxEa6wsYdFyuynqS8H4Q53eZ085+W2rN6inFU6xd/yDWYpz3M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659196316;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=btUHak4aC7AHbcsohvLeq8y59tKpw5lXk3saZUZchRA=; 
 b=b6mYHse//3Id2udqgxXoOwnoBIjEXRbYbbtuAIFM4pOR2i8448jkfLQ99tkEmhRa4Li07ciqOCcMV/HbjvEvpR7aEC1jNhlLk4+bZKIs+MIzJRWsULQ/2hfzzoRDWXe5RBj2HaxxyjeZa+R3Y/BClgAAlxylDNcm71Bvwh3fzdE=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659196316; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=btUHak4aC7AHbcsohvLeq8y59tKpw5lXk3saZUZchRA=;
 b=uAHwyKWFwNr89AYnV5sr8LgwJZL+c6K5Wzw+xWUZTnV0EA2jGAPzHtMV7Z8VYpps
 B6trckRvDxP56qj65jgM3Oh9u6OK1Qj2YmFLrhwmAmFk61ucyrnZgy1TaXtIyVJuy1p
 wI0RnE5j5KARd4VciVbbtWYnEBYb2fLRfmvtL9Ak=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1659196305433511.22681407777645;
 Sat, 30 Jul 2022 21:21:45 +0530 (IST)
Date: Sat, 30 Jul 2022 21:21:45 +0530
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>
Message-ID: <1824fce6ffa.649b18b496010.5533738718445972188@siddh.me>
In-Reply-To: <CAKXUXMzeSLuH31zQDe3Q_1YAvfmFR16ZsfFGmxEMiMQSKcp_Nw@mail.gmail.com>
References: <20220721101018.17902-1-code@siddh.me>
 <CAKXUXMzeSLuH31zQDe3Q_1YAvfmFR16ZsfFGmxEMiMQSKcp_Nw@mail.gmail.com>
Subject: Re: [RESEND PATCH] net: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>, syzbot+6cb476b7c69916a0caca
 <syzbot+6cb476b7c69916a0caca@syzkaller.appspotmail.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 syzbot+f9acff9bf08a845f225d
 <syzbot+f9acff9bf08a845f225d@syzkaller.appspotmail.com>,
 Eric Dumazet <edumazet@google.com>, syzbot+9250865a55539d384347
 <syzbot+9250865a55539d384347@syzkaller.appspotmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Paolo Abeni <pabeni@redhat.com>,
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

Hello Lukas,

Sorry for the late reply.

On Thu, 21 Jul 2022 16:05:01 +0530  Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> Siddh,
> 
> I had a look at the Bug report above. Currently, we do not have any
> syzkaller or C reproducer to confirm that the bug was actually fixed.
> 
> Now, that you have a supposed fix for the issue:
> Can you write a 'stress test' and (qemu) setup script that eventually
> makes that bug trigger (e.g., if we run the stress test for two or
> three days it will eventually trigger)? Then, we can also use that to
> confirm that your patch fixes the issue (beyond the normal sanity code
> review).
> 
> This is certainly something you can do on your side to move this patch
> forward, and other developers with testing infrastructure can pick up
> and confirm your tests and results independently.

I have been intermittently looking about this for the past few days. Since
such test creation is new to me, I am stuck at how to go about calling the
requisite function.

What I have gathered is that I need to use the netlink API or related tool
and issue the scan and recieve commands. Since qemu by default doesn't
have a WiFi interface setup by default, I was looking at simulation and
came across the mac80211_hwsim module. After building the kernel it, I
tried using `iw` command for scanning with the two phy simulated devices,
but I seem to hit a deadend due to not being able to properly use them
for the task at hand.

Do you have any resources or/and examples on such "stress tests"?

> I hope this helps, otherwise you will just need to have some patience.
> 
> Best regards,
> 
> Lukas

Eric had replied to me on the original email soon after, and I have sent
a v2. Though, I still want to see how people go about making the tests,
so any resources for further exploring will be useful.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
