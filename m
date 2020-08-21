Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA04C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 14:17:32 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39929204FD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 14:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2CrjOGAe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39929204FD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1051820422;
	Fri, 21 Aug 2020 14:17:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le2ZQVgIS941; Fri, 21 Aug 2020 14:17:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B5AB203E3;
	Fri, 21 Aug 2020 14:17:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 164DFC07FF;
	Fri, 21 Aug 2020 14:17:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 789E4C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 14:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 68C0186C06
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 14:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YjYOK5dgWqd2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 14:17:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC90886BED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 14:17:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21AE5204FD;
 Fri, 21 Aug 2020 14:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598019448;
 bh=LZ6uEEG5K0nVeHkce/NO0hAkcziwbjB+HU9jzXk/f8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2CrjOGAe4FM/pVjmAqP4s7nDVYNcm5pJyE0YAc+E6SqRc+t3ZTSx3S1uhvbPNRyN4
 /bL8Uex/4c6XhniKV0pUs5TSMNn/3QmquInogF5tjadTeuiTNmLXVn/T5Yl5s3KvQ5
 rL7yVKjrKnN9qRRG/9q4HrnkArTHVtVcgT51zuKg=
Date: Fri, 21 Aug 2020 16:17:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20200821141747.GA2810106@kroah.com>
References: <CACT4Y+bC7Nd7Q_3bva07uQ0e5z_2vnQi85CwY36t3gWqb9eaFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+bC7Nd7Q_3bva07uQ0e5z_2vnQi85CwY36t3gWqb9eaFQ@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] What is "linux-kernel-mentees"?
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

On Fri, Aug 21, 2020 at 03:58:30PM +0200, Dmitry Vyukov via Linux-kernel-mentees wrote:
> Hello,
> 
> I see this list is CCed on a bunch of syzbot fixes and emails have
> "[linux-kernel-mentees]" prefix. I wonder what is
> "linux-kernel-mentees"? Is it some kind of program? Run by whom? Is
> there is any page/info/stats about this program? I can't find anything
> relevant on the web, nor is there the first announcement email on the
> list.

It's a list used by many of the mentees of the LF kernel mentor
projects.

There are a number of different projects at the moment, all working on
the kernel, here is one of them that I help run:
	https://people.communitybridge.org/project/f06db0d5-537e-4e0f-8ca4-0a471f95a04d

and if you search for "Linux" on this page:
	https://people.communitybridge.org/#projects
you will see a number of other ones.

Hope this helps explain things,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
