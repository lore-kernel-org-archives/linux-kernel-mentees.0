Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DBEC2BB41
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Aug 2022 08:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EED60FE0;
	Tue, 16 Aug 2022 08:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EED60FE0
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=mDbyrzOE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RqS9Y4FzVjt5; Tue, 16 Aug 2022 08:53:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C4EE560ECD;
	Tue, 16 Aug 2022 08:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4EE560ECD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91964C0033;
	Tue, 16 Aug 2022 08:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66C10C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 08:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2457160E39
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 08:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2457160E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmVsa2xgZwhb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 08:53:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E09460D75
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E09460D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 08:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1660639964; cv=none; d=zohomail.in; s=zohoarc; 
 b=bBQz/4sKlLICMgbpZQBlxJ4ZpV0UELPxP+kG+s5aNdRnBGGP9HtWC9K9JhNTK9oLNFz1jm90QSEdgyAQ2LytI1A9fxxlVx2F3lEdMFKLNfH3MA7PrhxZUfsnc+4MTQ0kgFWZfGne2OrxkXB5+bGb9rjJCx3J+q7Qbt3zD3jy+jc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1660639964;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=IgzfXa929JbnTFKwJvpgWOiZxryBGnSfK2GVAMJkbgM=; 
 b=SsLnPMgAdLBZpaqQ/+3uq9JDYYt2oWd8IntLdbjH2KARzzzFEIBBfJqtlKoPWVedKUt14CNfJYstPAjElUZdBADOPRUVVIDfOS6ossUGgylV+FXSkDKrtJmfPYyvEFo06Rz14OrDS8Bo6orK/UwHsRMBKUrXfFZo/xAbH6BnYfE=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660639964; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IgzfXa929JbnTFKwJvpgWOiZxryBGnSfK2GVAMJkbgM=;
 b=mDbyrzOEt6NsXcLWJhF+qdtYrjYSAkd49rJVKuRmwiSyj7WppdcYL0Nj0FGaW2om
 5QSg2dhJKksD4u9xNqiNWwHuOkQ96QkJ3Dk3TM+wHocGz+x4xfMnTq152AlCi/YDZ8W
 SUbyEgiXFx0HvNf9Uy2cxIM3UMeVyj0GrPa4ZbVg=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1660639952099625.7238247365526;
 Tue, 16 Aug 2022 14:22:32 +0530 (IST)
Date: Tue, 16 Aug 2022 14:22:32 +0530
To: "Johannes Berg" <johannes@sipsolutions.net>
Message-ID: <182a5dabcc5.36efd4946461.1649818863091410857@siddh.me>
In-Reply-To: <18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net>
References: <20220726123921.29664-1-code@siddh.me>
 <18291779771.584fa6ab156295.3990923778713440655@siddh.me>
 <YvZEfnjGIpH6XjsD@kroah.com>
 <18292791718.88f48d22175003.6675210189148271554@siddh.me>
 <YvZxfpY4JUqvsOG5@kroah.com>
 <18292e1dcd8.2359a549180213.8185874405406307019@siddh.me>
 <20220812122509.281f0536@kernel.org>
 <182980137c6.5665bf61226802.3084448395277966678@siddh.me>
 <20220815094722.3c275087@kernel.org>
 <18fd9b89d45aedc1504d0cbd299ffb289ae96438.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: cfg80211: Fix UAF in ieee80211_scan_rx()
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: netdev <netdev@vger.kernel.org>, eric dumazet <edumazet@google.com>,
 jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>,
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

On Tue, 16 Aug 2022 01:28:24 +0530  Johannes Berg  wrote:
> Sorry everyone, I always thought "this looks odd" and then never got
> around to taking a closer look.
> 
> So yeah, I still think this looks odd - cfg80211 doesn't really know
> anything about how mac80211 might be doing something with RCU to protect
> the pointer.
> 
> The patch also leaves the NULL-ing in mac80211 (that is how we reach it)
> broken wrt. the kfree_rcu() since it doesn't happen _before_, and the
> pointer in rdev isn't how this is reached through RCU (it's not even
> __rcu annotated).
> 

Thanks for the critical review.

> I think it might be conceptually better, though not faster, to do
> something like https://p.sipsolutions.net/1d23837f455dc4c2.txt which
> ensures that from mac80211's POV it can no longer be reached before we
> call cfg80211_scan_done().
> 
> Yeah, that's slower, but scanning is still a relatively infrequent (and
> slow anyway) operation, and this way we can stick to "this is not used
> once you call cfg80211_scan_done()" which just makes much more sense?
> 
> johannes
> 

Agreed, that looks like a good way to go about.

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
