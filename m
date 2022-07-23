Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CC3C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jul 2022 15:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86C561AD7;
	Sat, 23 Jul 2022 15:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A86C561AD7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=lwAEDaBc
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZ82IWabOwMQ; Sat, 23 Jul 2022 15:28:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A9CC760D58;
	Sat, 23 Jul 2022 15:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9CC760D58
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8766FC0033;
	Sat, 23 Jul 2022 15:28:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7752C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34A360D58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34A360D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SkcYUiqBJJr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A9560782
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 39A9560782
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jul 2022 15:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658590104; cv=none; d=zohomail.in; s=zohoarc; 
 b=SfXn29km/qJz/tyr1mEVbXFLg9lP11bJxbf9W4N664oeLlxSJXky7g+FNxTWxKTRXBnDKR5ip/ZuLKVkL1VQIKNNxkYuOzwrL0h6EPjABeKK6TpjaxaEgk9TJdZGerKYJYvuFYQRuCJqLBi7wBWX1uFR+FDG2Zj6ZZUMtUQkiDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658590104;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=c1lQAq9l2Vi8XJIR9+FZPadcoaYjnJn9vuGp/Q5uuoE=; 
 b=a9OW8xI5fv1pW1A++gMs6sE9pCgr33942KvaplJ/Mu/4WGKFchUg3nwSmmfGw7lbXurGZZl5ZbOmq+5GbFcFWDenuxf4v93fIfIPtZv2E217/bxQ1TsCfjp0UWPbbBCuyFxGWSnbapDiCeHnUDlea0TS3kp+0pwiBPEJB5pWjVc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658590104; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=c1lQAq9l2Vi8XJIR9+FZPadcoaYjnJn9vuGp/Q5uuoE=;
 b=lwAEDaBcqbpoTMrbx8xU+XgUjI5zEmh8ONCKOEoT+C37vmL0x1s1g+b0XpP6ZKON
 HYRGQOIj0oxNDYVUyds4QpDjYj6nJJbXnOYBnN6qXe5rsEWchmmtcbx8c15nrSOODxJ
 0Y/pjeP6CJJ+5mNFcMbvSL4PDN/fWLPmqN7pEsy8=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658590092355322.4350711864895;
 Sat, 23 Jul 2022 20:58:12 +0530 (IST)
Date: Sat, 23 Jul 2022 20:58:12 +0530
To: "Greg KH" <gregkh@linuxfoundation.org>
Message-ID: <1822bac5c28.17c2e13a236951.2030393349322231875@siddh.me>
In-Reply-To: <YtwI/3/Qp3lSKuls@kroah.com>
References: <20220723135035.199188-1-code@siddh.me>
 <YtwAHGISvlgXgXZM@kroah.com>
 <1822b7c129a.14411444236159.6380883938307880248@siddh.me>
 <YtwI/3/Qp3lSKuls@kroah.com>
Subject: Re: [PATCH] keys/keyctl: Use kfree_rcu instead of kfree
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
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

On Sat, 23 Jul 2022 20:13:11 +0530  Greg KH <gregkh@linuxfoundation.org> wrote:
> You need to explain all of this in a changelog text.  Don't say what you
> do, but say why you are doing it.

Okay, I will keep this in mind next time.

> > > And how was this tested?
> > 
> > It compiles locally for me, and I used syzbot on this along with testing the
> > other `watch_queue_clear` patch, which generated no errors.
> 
> How does the watch queue stuff relate to this keyctl logic?
> 
> Again, be specific as to why you are doing things.

It doesn't relate, I just wanted to say that syzbot didn't crash too (I had
this change in the same branch as that patch for testing, and syzbot compiled
it successfully).

Sorry for the confusion.

Though now as James has pointed out, this patch isn't needed.

Apologies,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
