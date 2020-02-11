Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E35BC2BA83
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 04:53:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E4820656
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 04:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E4820656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EFB98459E;
	Wed, 12 Feb 2020 04:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZH5cHOewtWS; Wed, 12 Feb 2020 04:53:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A1E0F84542;
	Wed, 12 Feb 2020 04:53:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 878DEC1D80;
	Wed, 12 Feb 2020 04:53:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6D92C07FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 04:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D042A8459E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 04:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NawDG0BFEq9l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 04:53:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0215.hostedemail.com
 [216.40.44.215])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1502D84542
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 04:53:45 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 4442018038174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 21:45:23 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id F0EAE45BC;
 Tue, 11 Feb 2020 21:45:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: dad09_4b9b27a703123
X-Filterd-Recvd-Size: 1989
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf10.hostedemail.com (Postfix) with ESMTPA;
 Tue, 11 Feb 2020 21:45:19 +0000 (UTC)
Message-ID: <161f395543309adb94475cbfbdd442616b68cda9.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Pragat Pandya
 <pragat.pandya@gmail.com>
Date: Tue, 11 Feb 2020 13:44:03 -0800
In-Reply-To: <20200127115530.GZ1847@kadam>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
 <20200127101343.20415-8-pragat.pandya@gmail.com>
 <20200127115530.GZ1847@kadam>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, valdis.kletnieks@vt.edu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 07/22] staging: exfat: Rename
 variable "MilliSecond" to "milli_second"
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

On Mon, 2020-01-27 at 14:55 +0300, Dan Carpenter wrote:
> On Mon, Jan 27, 2020 at 03:43:28PM +0530, Pragat Pandya wrote:
> > Change all the occurrences of "MilliSecond" to "milli_second" in exfat.
> > 
> > Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> > ---
> >  drivers/staging/exfat/exfat.h       |  2 +-
> >  drivers/staging/exfat/exfat_super.c | 16 ++++++++--------
> >  2 files changed, 9 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
> > index 85fbea44219a..5c207d715f44 100644
> > --- a/drivers/staging/exfat/exfat.h
> > +++ b/drivers/staging/exfat/exfat.h
> > @@ -228,7 +228,7 @@ struct date_time_t {
> >  	u16      hour;
> >  	u16      minute;
> >  	u16      second;
> > -	u16      MilliSecond;
> > +	u16      milli_second;
> 
> Normally we would just call it "ms".

msec is a bit more common.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
