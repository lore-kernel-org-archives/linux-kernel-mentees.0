Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F252EEB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  8 Jul 2023 06:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6611D82D0C;
	Sat,  8 Jul 2023 06:43:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6611D82D0C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bbNkaqu9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQUvUvz7NRvT; Sat,  8 Jul 2023 06:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 87DA582CFA;
	Sat,  8 Jul 2023 06:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87DA582CFA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CBECC0072;
	Sat,  8 Jul 2023 06:43:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 478E1C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Jul 2023 06:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BA5D82D0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Jul 2023 06:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA5D82D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FlOdvYxq2TwS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Jul 2023 06:43:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBC982CFA
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CBC982CFA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  8 Jul 2023 06:43:03 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-78363cc070aso97863239f.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688798582; x=1691390582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zXbxOrtc/7HExwdEy81ap1KW/6Wb6IjSa8/lqjdTN7k=;
 b=bbNkaqu94bD3Z8Q3ops5q4L6MtwCeLvnWqk7bN2rYslLjjWTN77P7FrkdA6+Tf2RS8
 2jupOVYIpsmJFoS9kjbZKQBcIIyY1PBUn+FQcE7QPyjcvo4kMbi32ozLIUHHI5/AREJH
 BR77pXtBNSoLbeOmDsY/xwXGx+R6Ve7TPw8QzuiT2LNae19i05vUpnQ+Ltul4zPIOul/
 dnqrGI0TqoLxXkOhFGaTHfgKVIlzsu8ajkBCmHGFV8n8ZWE5VYp67Mk/Bhmo+lFClVsA
 fVzQMAAUF8cWQDGUPoKTf1UXQK9ITrhL8n5HN5vA00yTgQ1j2dSWFK82uzjGz9NIqtz/
 iD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688798582; x=1691390582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXbxOrtc/7HExwdEy81ap1KW/6Wb6IjSa8/lqjdTN7k=;
 b=DXLGpNiH5MzsA1J9CwrceGiraReUILoHU0MGR2RtVE0FWAKtfOvrJGTBos8MxOnxvy
 5u5AU/yP65n1x8MIDObHTJbQy7QQbs/WSLFKFzhEfABn+fVG21HMxzh0nUiwPxZmYGDU
 uQ9Bq0qY/eMqcdMzjLBOqIdt6de8ZnGWiv/tvsTmrPFPWbuRBoxllc6JvtUl6DAz3cdS
 9WxXn0DWgHxSVzED3YsKuRZr8HlUJ3p+WxHgIlwnbiuuE+Pp867bvebT+vqmMP3kmuzo
 e+YhWRxCUmRfaablbr07R/301SuZaGDxEWhNZVQdQpk5Fs6icOifnNIhiDyUHZjg/4Gh
 zOHw==
X-Gm-Message-State: ABy/qLbTg6AhKMDzPKxg2mCILOfgBgK1OW7xc5ls6xE5TocQCfBRWv1v
 LGuqqgVcN34wit/6gFCN2Ss=
X-Google-Smtp-Source: APBJJlF9GgTcKPdXZXqu1n+r10Z6nI6NKh+tsarmEYMX+VBnwQEtjev1lE+nuiaEL6y2wlVb0BL+GQ==
X-Received: by 2002:a05:6602:642:b0:786:2498:40f0 with SMTP id
 d2-20020a056602064200b00786249840f0mr8507275iox.10.1688798582264; 
 Fri, 07 Jul 2023 23:43:02 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a632003000000b0053031f7a367sm3736170pgg.85.2023.07.07.23.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 23:43:01 -0700 (PDT)
Date: Sat, 8 Jul 2023 12:12:56 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Re: [PATCH 0/4] Trivial code cleanup patches
Message-ID: <ZKkFcMCGFhD5Q1WU@zephyrusG14>
References: <cover.1688299890.git.yogi.kernel@gmail.com>
 <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Jul 06, 2023 at 05:30:27PM +0200, Philipp Hortmann wrote:
> On 7/2/23 14:14, Yogesh Hegde wrote:
> > Rename variables in function _rtl92e_dm_check_rate_adaptive
> > to avoid checkpatch complains.
> > 
> > The patches are required to be applied in sequence.
> > 
> > Yogesh Hegde (4):
> >    staging: rtl8192e: Rename variable currentRATR
> >    staging: rtl8192e: Rename variable targetRATR
> >    staging: rtl8192e: Rename variable LowRSSIThreshForRA
> >    staging: rtl8192e: Rename variable HighRSSIThreshForRA
> > 
> >   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
> >   1 file changed, 19 insertions(+), 19 deletions(-)
> > 
> 
> Please use the "staging: rtl8192e:" also for the cover letter in the subject
> for the next patch series you are sending.
Ack. Will keep in mind for next patch series. 
> 
> 
> Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

Thanks 
Yogesh 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
