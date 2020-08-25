Return-Path: <SRS0=1t6x=CD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70074C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 16:59:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA6D2075F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Aug 2020 16:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hZ1ECiYu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA6D2075F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFFAF86C18;
	Tue, 25 Aug 2020 16:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ljxLEjmkzv8V; Tue, 25 Aug 2020 16:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58EB586BE1;
	Tue, 25 Aug 2020 16:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FC9AC016F;
	Tue, 25 Aug 2020 16:59:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 982CFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9462E88717
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTqD9K2cseAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:59:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 21B63885F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Aug 2020 16:59:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6990F2075F;
 Tue, 25 Aug 2020 16:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598374759;
 bh=2Eoi4JuT/2UvkyPyIIEp3dpOaCKju5u8+p+7/8hN/JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hZ1ECiYuQPey2gRphijbkFwEfU/6M9n7W+P1pXvULH2llmI0/bhQb3TX/jgoKOBrq
 239qu8it0RoF3qgTO2s2yhaElpMD5WHH4CsLhCqSw2KkgJ3Ph47I8Sjf4Nit7ZYWEB
 Eiewmb4gmXUxxQ1L9FaiiTpzEfTIvn63Ohl2ZQWE=
Date: Tue, 25 Aug 2020 18:59:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peilin Ye <yepeilin.cs@gmail.com>
Message-ID: <20200825165935.GA1527003@kroah.com>
References: <20200818085706.12163-15-jslaby@suse.cz>
 <20200825164804.860743-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825164804.860743-1-yepeilin.cs@gmail.com>
Cc: syzkaller-bugs@googlegroups.com, jslaby@suse.cz,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 15/16] vc_screen: extract
	vcs_read_buf_header
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

On Tue, Aug 25, 2020 at 12:48:04PM -0400, Peilin Ye wrote:
> Hi all,
> 
> Link: https://syzkaller.appspot.com/bug?id=f332576321998d36cd07d09c9c1268cfed1895c9
> 
> As reported by syzbot, vcs_read_buf() is overflowing `con_buf16`, since
> this patch removed the following check:
> 
> -		if (count > CON_BUF_SIZE) {
> -			count = CON_BUF_SIZE;
> -			filled = count - pos;
> -		}
> 
> Decreasing `count` by `min(HEADER_SIZE - pos, count)` bypasses this check.
> Additionally, this patch also removed updates to `skip` and `filled`.
> 
> What should we do in order to fix it?

This patch is already reverted, and it has been discussed a bit as to
how to do this properly if you look at the email where this was reported
to us.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
