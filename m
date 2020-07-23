Return-Path: <SRS0=mJtO=BC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3BCC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 16:43:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0D1920714
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 16:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kX9ZDlrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0D1920714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7DE94868BF;
	Thu, 23 Jul 2020 16:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPWq5347DV7Y; Thu, 23 Jul 2020 16:43:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC01A864D6;
	Thu, 23 Jul 2020 16:43:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3213C004D;
	Thu, 23 Jul 2020 16:43:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1021C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 16:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C9EB588538
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 16:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUdbT3HLJ6UL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 16:43:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4F73288528
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 16:43:55 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w9so4863367qts.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MEzelzK6A1iR0Hq7ZpzeCYIL/zPgCeRTH83ADsVGxVg=;
 b=kX9ZDlrNi/NNtBhQdsixkzD+2djUYGtXWcT5dSG6iUJ9uAZDl3d6DMpXFQH6zNSXEy
 QJ9idstZlH1PlPtq8ZMZcuVDgEw+SWGRhlDOWItu0rti2XQrNeV0g1DJel1zfTcqLcM2
 nozFlKR2fi654peEjxpEkk8ralx/uwSHM3HH9j0dVZIHp5kBuwrKPlt2yZ3idTSmwd7t
 u7wMV1l85Wkyz6UHBb+Hul95XmPkmMi3I6V1dNxcdCJJcFlKcwtccMMubJAk1kp83uvY
 Ol2XIYLoEltNvBWDgwnh92J+ckXaEuPh62V8YRFCcaZF1OxXMtMGGSojmMOuc/KPS7tH
 KOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MEzelzK6A1iR0Hq7ZpzeCYIL/zPgCeRTH83ADsVGxVg=;
 b=Pr+nKMeXna4mxdskFV52unSXoO5rL27w0JT7gausbHzxoiP397g5E6I71HlfLRmUko
 p43rsp00XMHMDOZIlizDrGlvUkUlTKa86flUZEA/YGqLCxswdAtMVZrtsHvPJbMsZZxc
 h7LJqUu4Qi3PGYlimYU/AHDI/0kBu4Tb4+d64hOCFhR9w79UYqbXArj/DuSHiExcIDDw
 Vhqe3eV9clichNZ26Txt7yURfhnyZBkWF2tGqdrwhNHU6kKYJc+6pmFa6AqZJhBqCRqB
 WJR33t5xgpDIFynaaOBgFUKs/547f14dlnEF6BRGG8Yhz3YIJZ8WmV+omuzDnR+CNcaN
 O4rg==
X-Gm-Message-State: AOAM531QYG3Jr9y+OCFUBlRYHTR98sc1Mh265pBsdiqqzDWlMt7duWk6
 AzQonhpTCFIyDGATrTJruA==
X-Google-Smtp-Source: ABdhPJypQVQ/7ruPg17P9HpCoEw1Fd2hBQjD42iQgBhKQA07at/5hrtKIBWajFHaziSgQDpC0GhOvA==
X-Received: by 2002:ac8:3528:: with SMTP id y37mr4281156qtb.308.1595522634257; 
 Thu, 23 Jul 2020 09:43:54 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id t93sm2842529qtd.97.2020.07.23.09.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:43:53 -0700 (PDT)
Date: Thu, 23 Jul 2020 12:43:51 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200723164351.GA413286@PWN>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200723142814.GQ2549@kadam> <20200723151355.GA412829@PWN>
 <20200723155057.GS2549@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723155057.GS2549@kadam>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, netdev@vger.kernel.org,
 linux-hams@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>, Joerg Reuter <jreuter@yaina.de>
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

On Thu, Jul 23, 2020 at 06:50:58PM +0300, Dan Carpenter wrote:
> On Thu, Jul 23, 2020 at 11:13:55AM -0400, Peilin Ye wrote:
> > On Thu, Jul 23, 2020 at 05:28:15PM +0300, Dan Carpenter wrote:
> > > On Wed, Jul 22, 2020 at 11:19:01AM -0400, Peilin Ye wrote:
> > > > Checks on `addr_len` and `fsa->fsa_ax25.sax25_ndigis` are insufficient.
> > > > ax25_connect() can go out of bounds when `fsa->fsa_ax25.sax25_ndigis`
> > > > equals to 7 or 8. Fix it.
> > > > 
> > > > This issue has been reported as a KMSAN uninit-value bug, because in such
> > > > a case, ax25_connect() reaches into the uninitialized portion of the
> > > > `struct sockaddr_storage` statically allocated in __sys_connect().
> > > > 
> > > > It is safe to remove `fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS` because
> > > > `addr_len` is guaranteed to be less than or equal to
> > > > `sizeof(struct full_sockaddr_ax25)`.
> > > > 
> > > > Reported-by: syzbot+c82752228ed975b0a623@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?id=55ef9d629f3b3d7d70b69558015b63b48d01af66
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > > > ---
> > > >  net/ax25/af_ax25.c | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> > > > index fd91cd34f25e..ef5bf116157a 100644
> > > > --- a/net/ax25/af_ax25.c
> > > > +++ b/net/ax25/af_ax25.c
> > > > @@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
> > > >  	if (addr_len > sizeof(struct sockaddr_ax25) &&
> > > >  	    fsa->fsa_ax25.sax25_ndigis != 0) {
> > > >  		/* Valid number of digipeaters ? */
> > > > -		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
> > > > +		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
> > > > +		    addr_len < sizeof(struct sockaddr_ax25) +
> > > > +		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
> > > 
> > > The "sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis" can have an
> > > integer overflow so you still need the
> > > "fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS" check.
> > 
> > Thank you for fixing this up! I did some math but I didn't think of
> > that. Will be more careful when removing things.
> 
> No problem.  You had the right approach to look for ways to clean things
> up.
> 
> Your patches make me happy because you're trying to fix important bugs.

It is very encouraging to hear that! I will try to do what I can do.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
