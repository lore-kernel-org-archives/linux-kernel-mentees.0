Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8870C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 15:15:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC7720771
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 15:15:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tSaAtD1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC7720771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8070088858;
	Thu, 23 Jul 2020 15:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMMDIuhEPb94; Thu, 23 Jul 2020 15:15:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6049288852;
	Thu, 23 Jul 2020 15:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 413E5C004E;
	Thu, 23 Jul 2020 15:15:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05981C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E21DC88852
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TMn8VAacjuTF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:15:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6029388846
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:15:52 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id dm12so2713085qvb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KyocJ093PD2YbzDHrbxPUouVLOVe2BF7XP9Bhi4fh1o=;
 b=tSaAtD1GxyjwJ2PveArLh3Q+zJiVlHY6dLhLVtfSYNs73jjvOW8FF2WUoYGV52TyF5
 w8aPxeDiojYhblWMBFz02zV1w6Xd1ml0awr2xDX/AFPMteUXKTsIak19BG96adtMz3MO
 5ZHY6tGyTtyoEeWRR78YZFU6j4sJCYTOQVV+qs+z5KdElgT+chPzvvtap+zIlyfcrQKa
 w5xF7uvPrCfBQazolZFSFxVgYNIV8pNwTRSwqvbrkDvsgfPy70jBTm28ZHkRFaKhnoFj
 xlDMrAlsRVRRsS3e01/MPCvlTb+GBwj7HY8moxVImB/lcRbD2h+XAOWOlY8Dj1oOc9QC
 MM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KyocJ093PD2YbzDHrbxPUouVLOVe2BF7XP9Bhi4fh1o=;
 b=BjKsorw7Lh5eJlxmEAAkk1KcHd9pt1cH8oxfJznGy5bSejmgb0iAIQOqzTdR1QF+Ji
 zRXTe739SmqaciN0eTlENz3ehly/4w9YfykM5Wcwk/tYmI2PHXrn0Yi+xEHwSv7TXJ2w
 Cgdum8DOytHDn1e6k9er35CAta5NPQKHD71uXOkCunwIzOOW3fAi/Cuv4DBtprP34OA1
 cJ4WSpKde/BMpW1dTPQnOHbp2L+Y87CKX2gs56YtLHgRatUtJ9ps1XnXbvBjfW+rJ5wl
 SYcjywFqqqdjiFHlJeRXLbwt2IufZnZ7G6WafSvWubGE7AZih6Zw0CuXhw/G3Tr7HS5g
 U8Xw==
X-Gm-Message-State: AOAM530Gt81RlAtsPDWKJZiu/LSOigE07gtqDrpTrwJDD8AtN/kjhHRq
 xaDa2eUDxYrRiRIEPBvvxA==
X-Google-Smtp-Source: ABdhPJzWD5cPz+PppE7bcUfnZGrw4meoQmK3sWtAMYS+kEQC7kvitfKpmB8shezAhiME4IeXhYMgbA==
X-Received: by 2002:a0c:ee4a:: with SMTP id m10mr5012504qvs.41.1595517351389; 
 Thu, 23 Jul 2020 08:15:51 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id t187sm2725394qkf.73.2020.07.23.08.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:15:50 -0700 (PDT)
Date: Thu, 23 Jul 2020 11:15:48 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200723151548.GB412829@PWN>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200722.175714.1713497446730685740.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722.175714.1713497446730685740.davem@davemloft.net>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 ralf@linux-mips.org, netdev@vger.kernel.org, linux-hams@vger.kernel.org,
 kuba@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 jreuter@yaina.de
Subject: Re: [Linux-kernel-mentees] [PATCH net] AX.25: Fix out-of-bounds
 read in ax25_connect()
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

On Wed, Jul 22, 2020 at 05:57:14PM -0700, David Miller wrote:
> From: Peilin Ye <yepeilin.cs@gmail.com>
> Date: Wed, 22 Jul 2020 11:19:01 -0400
> 
> > Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
> > ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
> > equals to 7 or 8. Fix it.
> > 
> > This issue has been reported as a KMSAN uninit-value bug, because in such
> > a case, ax25_connect() reaches into the uninitialized portion of the
> > `struct sockaddr_storage` statically allocated in __sys_connect().
> > 
> > It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
> > `addr_len` is guaranteed to be less than or equal to
> > `sizeof(struct full_sockaddr_ax25)`.
> > 
> > Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Applied and queued up for -stable, thanks.

Thank you for reviewing my patch!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
