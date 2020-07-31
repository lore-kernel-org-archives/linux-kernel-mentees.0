Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6553AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 11:59:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3053622B40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 11:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGisF+dj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3053622B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00B3D886F3;
	Fri, 31 Jul 2020 11:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8NWwVgqDEaQ; Fri, 31 Jul 2020 11:59:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8520A88642;
	Fri, 31 Jul 2020 11:59:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BD2CC0050;
	Fri, 31 Jul 2020 11:59:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60CD0C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5B6FF88236
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDpe8hXCmIPA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:59:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2CD88829E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 11:59:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5757222B40;
 Fri, 31 Jul 2020 11:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596196762;
 bh=b+H2aGZZOROnQ/51JKv6Xi/z1ePZ0oxtoEognaZJMIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGisF+djPeQZoIGyDlgzXQSa9HruHrtWGR7CV62J+NtSeFm3+xLraywyTwdWedwLu
 FtOiv0kaw5g7NAOAct73ZpIb+xgN1/fSFHo17CeZJwYihaMKUlPRcd5m+gKFyWPPqa
 Sj7DvKxXFeso1O8xUXs0QcVnvmEoZe563KFz6qx0=
Date: Fri, 31 Jul 2020 13:59:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>
Message-ID: <20200731115909.GA1649637@kroah.com>
References: <20200730192026.110246-1-yepeilin.cs@gmail.com>
 <20200731045301.GI75549@unreal> <20200731095943.GI5493@kadam>
 <81B40AF5-EBCA-4628-8CF6-687C12134552@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81B40AF5-EBCA-4628-8CF6-687C12134552@oracle.com>
Cc: rds-devel@oss.oracle.com, Arnd Bergmann <arnd@arndb.de>,
 Leon Romanovsky <leon@kernel.org>,
 OFED mailing list <linux-rdma@vger.kernel.org>, netdev@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, linux-kernel@vger.kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] rds: Prevent kernel-infoleak
 in rds_notify_queue_get()
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jul 31, 2020 at 01:14:09PM +0200, H=E5kon Bugge wrote:
> =

> =

> > On 31 Jul 2020, at 11:59, Dan Carpenter <dan.carpenter@oracle.com> wrot=
e:
> > =

> > On Fri, Jul 31, 2020 at 07:53:01AM +0300, Leon Romanovsky wrote:
> >> On Thu, Jul 30, 2020 at 03:20:26PM -0400, Peilin Ye wrote:
> >>> rds_notify_queue_get() is potentially copying uninitialized kernel st=
ack
> >>> memory to userspace since the compiler may leave a 4-byte hole at the=
 end
> >>> of `cmsg`.
> >>> =

> >>> In 2016 we tried to fix this issue by doing `=3D { 0 };` on `cmsg`, w=
hich
> >>> unfortunately does not always initialize that 4-byte hole. Fix it by =
using
> >>> memset() instead.
> >> =

> >> Of course, this is the difference between "{ 0 }" and "{}" initializat=
ions.
> >> =

> > =

> > No, there is no difference.  Even struct assignments like:
> > =

> > 	foo =3D *bar;
> > =

> > can leave struct holes uninitialized.  Depending on the compiler the
> > assignment can be implemented as a memset() or as a series of struct
> > member assignments.
> =

> What about:
> =

> struct rds_rdma_notify {
> 	__u64                      user_token;
> 	__s32                      status;
> } __attribute__((packed));

Why is this still a discussion at all?

Try it and see, run pahole and see if there are holes in this structure
(odds are no), you don't need us to say what is happening here...

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
