Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101D5C7EE29
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Jun 2023 17:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 891AC83B71;
	Fri,  9 Jun 2023 17:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 891AC83B71
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=codeagain.dev header.i=@codeagain.dev header.a=rsa-sha256 header.s=protonmail header.b=xSW1uFYH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQrPo4XmAzgZ; Fri,  9 Jun 2023 17:06:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 019D6842AC;
	Fri,  9 Jun 2023 17:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 019D6842AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D48FBC007C;
	Fri,  9 Jun 2023 17:06:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0263BC0029
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Jun 2023 17:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E0CC61621
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Jun 2023 17:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E0CC61621
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=codeagain.dev header.i=@codeagain.dev
 header.a=rsa-sha256 header.s=protonmail header.b=xSW1uFYH
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYECUsTHGMb8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Jun 2023 17:06:51 +0000 (UTC)
X-Greylist: delayed 00:07:54 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C4261626
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C4261626
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Jun 2023 17:06:49 +0000 (UTC)
Date: Fri, 09 Jun 2023 16:58:36 +0000
Authentication-Results: mail-41104.protonmail.ch;
 dkim=pass (2048-bit key) header.d=codeagain.dev header.i=@codeagain.dev
 header.b="xSW1uFYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codeagain.dev;
 s=protonmail; t=1686329922; x=1686589122;
 bh=thZ9AvDqosRlh9HocNmqiKPLQpnXw+HgbMRbI6ynRsg=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=xSW1uFYHg7Z+uvxdeeXbDvFM8wSUytNRPOUqM1Le3Xy7ZMks7f71J8kXBDmMtYOCl
 jTFKs+uSKMx/knCecRqQNASela5FG3lZTydSEYcGSy3xjeny2Lx2UknWVTJFNUcTqH
 EalJTPKUJ9USHXxygassHR5sdhB1gug9dO6WYneTTyBbMZgtUwEA/6yC63dvKivI5V
 ULIRiMC5M4h/Xc+t6WiIcyf2/Hk7ARDzxNCT3b9OYfmVzKxKJWM5mFUAnwYWUZTSmp
 n6BhBP2l6tZePm1B9m31tv7JU2dwKiFtdIQGE7Ad/0mUDpeytK6DJEDx3lurqs5EeW
 xoW7YuEeqDxaQ==
To: Shuah Khan <skhan@linuxfoundation.org>
From: Bru Moreira-Guedes <codeagain@codeagain.dev>
Subject: Information About Kernel Documentation at the Website kernel.org
Message-ID: <nqnsvo2cpaonuw2i7kn3o23rheuj63rss3jawtq2tdqg6wj7rq@vethxpehgnyj>
Feedback-ID: 75407897:user:proton
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Hello Shuah, Ivan and fellow mentees,

I was looking into the patch I told I would be doing and I noticed I
might be wrong about something I was mistakenly assuming (in parts
mistakenly).

I often browse kernel documentation via web from https://docs.kernel.org
and I always assumed that the documentation in there was from the latest
release. Both in HTML format (previou link) as in the text format
available at https://www.kernel.org/doc/Documentation/ as well.

If you take a look into the left sidebar in the HTML you'll see the
version (now 6.4.0-rc5) in there. However, when I went to the source
tree to edit the code I haven't found the outdated documentation, and
that's when I figured out there is another problem with the kernel
documentation, but it's a issue at kernel.org instead. The problem is
that it has old files.

The documentation files have been renamed from '.txt' into '.rst' a long
time ago, but the '.txt' files are still there in the website, with
outdated information. I understand the webmaster likely decided to keep
them there to avoid broken links, since the kernel documentation is
linked in thousands of places.

Anyway, is there anyone I could reach to inform about this issue? I
think ideally these old files should be replaced by symbolic links to
the new ones, or something like that. I'm not sure if the kernel-docs
mailing list would be the right place to inform about this. What do you
think?

Sincerely,
Bru Moreira-Guedes


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
