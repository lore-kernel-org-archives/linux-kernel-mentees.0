Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB28C001DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Aug 2023 08:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B48360F0F;
	Sun, 13 Aug 2023 08:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B48360F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QCqmBnKDaTA; Sun, 13 Aug 2023 08:00:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 31B9D60EF4;
	Sun, 13 Aug 2023 08:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31B9D60EF4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FA3BC0071;
	Sun, 13 Aug 2023 08:00:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EF43C0032
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 08:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE33640597
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 08:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE33640597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUUUycfRK7kL
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 08:00:09 +0000 (UTC)
X-Greylist: delayed 529 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 13 Aug 2023 08:00:09 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2531740004
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2531740004
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Aug 2023 08:00:08 +0000 (UTC)
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 37D7owDC008261;
 Sun, 13 Aug 2023 09:50:58 +0200
Date: Sun, 13 Aug 2023 09:50:58 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ping
Message-ID: <20230813075058.GA8237@1wt.eu>
References: <301364dc-9709-8c8e-6881-66863cb3d29b@gmail.com>
 <2023081356-grew-passage-e17c@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023081356-grew-passage-e17c@gregkh>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: luisbg@kernel.org, salah.triki@gmail.com,
 20230801155823.206985-1-ghandatmanas@gmail.com, linux-kernel@vger.kernel.org,
 syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com,
 Linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Aug 13, 2023 at 08:25:17AM +0200, Greg KH wrote:
> On Sun, Aug 13, 2023 at 11:48:29AM +0530, Manas Ghandat wrote:
> > Just a friendly ping to the patch :)
> 
> There was no context here at all as to what patch you are responding to :(

I guess it's about this one from the same sender:

   [PATCH v4] ntfs : fix shift-out-of-bounds in ntfs_iget

   https://lore.kernel.org/lkml/20230813055948.12513-1-ghandatmanas@gmail.com/

Willy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
