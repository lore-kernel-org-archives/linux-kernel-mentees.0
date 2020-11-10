Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A461C61DD8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 19:45:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32E820639
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 19:45:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxd//I0N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32E820639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE85085816;
	Tue, 10 Nov 2020 19:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3wBF0Jmcfuh; Tue, 10 Nov 2020 19:45:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99831855C6;
	Tue, 10 Nov 2020 19:45:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84470C088B;
	Tue, 10 Nov 2020 19:45:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CEE7C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 89722871FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52-wr9ePBU5S
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:45:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2785986F3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 19:45:28 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v12so12362514pfm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 11:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FlTBekxLH9k5lDusEIqJe96gy2kgeT7w1mYQIC7teW8=;
 b=jxd//I0NFIFChmNjGPdP8n7pBMNdp35EWhyQUGVNOEFkxBmgDczY8aKnJ72aGscLiK
 xIzyZsPlCXjMasMkWXUCKiHfHwnmx2DzZiTZm5bqBDwwcImUAC/JktCOJlZDjztgEONa
 qtbH+61o+GqAoP48KdwdB/7mZKBkLEnlk9BjOaPasX7pLtcQ6Q07uAJxP5kDH8ge4L2c
 GTEv8im5JOuzgIFTMM7wYc6kE0/hwOYNhJ1wCG6Yt3Gn4bx48gRzBwNUNvxN1rU7b+xR
 Qdul0H+cR6XHCU7UAC0ShUPDT7BQuYEt/0E0UyM3aobauUNUVwjS48oRiTk9ZioZ3voB
 7yxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FlTBekxLH9k5lDusEIqJe96gy2kgeT7w1mYQIC7teW8=;
 b=r42mg+fzGHyUP9AT/U7B186ei8eiau9hXpOsYCSllRvIeyKEH1tp9pPmoHoeHmtYUo
 5X2w74YLE2eujKKs76a8Wc2ue96rG5ja0vghVjpXKa4iWh5nIyMgH3AEXMqRxtRqQi3L
 lrlW1//QJgU/1V6Srdgw1o698lQmfcnu826WLzyheQFRtzZj4Tx0NsT0D7l4ZcWSU7+b
 LAVDN0p9BGFj++OXGrrI0l50xtrGofNDI8bDtShdyglvCKcEFaAEMkbIxpNQg/w6K0PO
 Gha+LesXKvNoSl3k+iwHSjQv0+ijDe4+3+y4Iyatz7MIkylo2ef9/1aYW1glAPEeVnnU
 QXTg==
X-Gm-Message-State: AOAM530ts3Eq5CiWY/O3rZdIoGlVjuNqTFqvZdCJoW2H/G+6syIMkOtS
 aHF5rcOvuLSMHiCrMXgGD9o=
X-Google-Smtp-Source: ABdhPJwWl1MxrloEhHd7y4GBg3SQI528A+IjM7SIRT9Y15gRTroeExL72kLv0O57JDQ2MrodPavS6Q==
X-Received: by 2002:a17:90a:8c87:: with SMTP id
 b7mr782716pjo.162.1605037527447; 
 Tue, 10 Nov 2020 11:45:27 -0800 (PST)
Received: from Thinkpad ([45.118.167.192])
 by smtp.gmail.com with ESMTPSA id j9sm3985736pjl.48.2020.11.10.11.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:45:26 -0800 (PST)
Date: Wed, 11 Nov 2020 01:15:18 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20201110194518.GA97719@Thinkpad>
References: <20201107082041.GA2675@Thinkpad>
 <20201107191835.5541-1-anmol.karan123@gmail.com>
 <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110095815.41577920@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, saeed@kernel.org,
 syzbot+a1c743815982d9496393@syzkaller.appspotmail.com,
 linux-hams@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v3 net] rose: Fix Null pointer
 dereference in rose_send_frame()
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

Hello Sir,

On Tue, Nov 10, 2020 at 09:58:15AM -0800, Jakub Kicinski wrote:
> On Sun,  8 Nov 2020 00:48:35 +0530 Anmol Karn wrote:
> > +			dev = rose_dev_get(dest);
> 
> this calls dev_hold internally, you never release that reference in
> case ..neigh->dev is NULL
> 
> > +			if (rose_loopback_neigh->dev && dev) {

Ah, I missed to `dev_put()` the `dev` after checking for, if neigh->dev is NULL,
I will fix it soon and send another version.

Thank you for review.


Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
