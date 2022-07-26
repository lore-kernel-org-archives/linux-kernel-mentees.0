Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3254DC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jul 2022 12:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB19441B7F;
	Tue, 26 Jul 2022 12:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB19441B7F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=nUa2GObI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3tB4vtWQ82C7; Tue, 26 Jul 2022 12:17:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8C75741B74;
	Tue, 26 Jul 2022 12:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C75741B74
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A047C0033;
	Tue, 26 Jul 2022 12:17:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D06FCC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9F5240AB4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9F5240AB4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=nUa2GObI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UgX7c2SNgq3o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:17:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 610A24018F
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 610A24018F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jul 2022 12:17:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658837831; cv=none; d=zohomail.in; s=zohoarc; 
 b=DwvStKCMX7XoSZbjyoswQoy4twyd44xhM49CK5T8sZq0ysHOuMdHO4gEucz21a+caA0AUUfMpjRLtcrLsZRG8h8J/+STMIB5fpYYq0xypc+ki3wyJOf18uTj1zi6G0xZUgjrQE0fXQPIKTdW5P/8XWaHUmDqTVsnYZHzIw5tNwY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658837831;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=18GXarUQ3jL1O2RMagJvrp6VQJVu7m+DREZ1/MUGIKE=; 
 b=ZTDAh/jHJfjZlzakiKGVEgaNoU2l59n863+h41BvGV/RSPSEN95p0lAoyrTIRGo9k3PFGX2vls1Fw85SUtFcOYfRWRe3L9oCIHvCdyGM2w6L7J8WLPeMMEHlyAyLqjWO2tH7KuIseNlAgjw91Oz3WJJDmKuzWYFwyYeKaE11NhI=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658837831; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=18GXarUQ3jL1O2RMagJvrp6VQJVu7m+DREZ1/MUGIKE=;
 b=nUa2GObIJsbmqiwdL3ub9h03vWog6RC7JII2RTx/fKCgQ8v8ELiwY0Ngrgqh8GYR
 AwGzeXfwiyF9Gpbp7HRRmdSlI+lIwdoSY744F7S6JMSRnnQXiPZ4DWC+JbbLkZAL1lg
 SZ//HSLlFEaFW/Y6g0NP+HJGgkFgQyXE8dOlQzOE=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 165883781910727.618496178340138;
 Tue, 26 Jul 2022 17:46:59 +0530 (IST)
Date: Tue, 26 Jul 2022 17:46:59 +0530
To: "Eric Dumazet" <edumazet@google.com>
Message-ID: <1823a705ed0.2c95d162772051.7830246635749918178@siddh.me>
In-Reply-To: <CANn89iLN27NWA7Stkr4ODp6V-Q-3em0dJ2JixDMNcNY7Ap5muA@mail.gmail.com>
References: <20220701145423.53208-1-code@siddh.me>
 <CANn89iLN27NWA7Stkr4ODp6V-Q-3em0dJ2JixDMNcNY7Ap5muA@mail.gmail.com>
Subject: Re: [PATCH] net: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: "Paul E. McKenney" <paulmck@kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
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

On Tue, 26 Jul 2022 15:37:16 +0530  Eric Dumazet <edumazet@google.com> wrote:
> Note: this is slightly racy.
> 
> You are supposed to follow this order in this situation.
> 
> 1) Clear the pointer
> 
> Then:
> 
> 2) wait an rcu grace period (synchronize_rcu()) or use call_rcu()/kfree_rcu().
>  

Noted. Due to rcu_dereference() used to get scan_req, null ptr dereference
cannot happen. That had completely missed my eyes, sorry for that.

I will send a v2.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
