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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B2DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 15:14:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D24D620771
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jul 2020 15:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQMxms0g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D24D620771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC63E88852;
	Thu, 23 Jul 2020 15:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1ccIH8u6t1M; Thu, 23 Jul 2020 15:14:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F067988846;
	Thu, 23 Jul 2020 15:14:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7592C004E;
	Thu, 23 Jul 2020 15:14:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64097C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4BDDB886CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsl487tlf1h9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:13:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1C8B3877EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 15:13:59 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id e13so5648454qkg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jul 2020 08:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xCacgrFd+CeqplPw/FPP7QZv3RakcaPw1XtaPxtRK50=;
 b=FQMxms0gk4BtYkF+Y6xdMqkO0brMc/N8YVyqawJqvFtfXFvc046VUcsbgj+WOdAm1T
 WUDKxyAUhmQfN6W5fvASZTemKcusm7wHucBr94ZycBwuW9w6iKnCRn/WLUGVxcbtfb1M
 mNMnDldvsYdph8NM8+YjqrHdeMTlRkPbN2/ISI2FZwZKcS5ef88aWR2tSm4t+FO+2X1J
 f5xbnGbQz8HmhCfGkMBNQoL9hGsD5oddptelhjP5eovSQ6awnHSRxTfWRooTEAoGMlrk
 8BmHSiQGEnEmvw+nWZEAt6SsUWwpJ2MVmgl5VGhMMNjioMtsYGA3ye9KbkB6lkTaVzRC
 QH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xCacgrFd+CeqplPw/FPP7QZv3RakcaPw1XtaPxtRK50=;
 b=Iupyxaxckpki4NHJ3NpvC1n+DJ2LSnG/cE8ItkpwzlgkvAu0dVUO4RW31b4srt0p+y
 B8vYsfee9achHGo0BiSq0NQUxCmOzgTkticAI0RbHPT2ORPKnGfkTgKUyN7gOKIsBdOd
 4fJx6Ii73ENWw0Y+CV+/WTp4i9BNaEvEcAcf20BM7SRMUsQLNLNj4ZkiQ2FdFcp5AkI5
 Tz9JLG/kwqv2uHYszmethV9vgrOKpRt1SYFlKNX+v9bCRe4QqaZILci8fcEdxgbvVP+L
 7km1L3Ge8SAYxyVY5gCxjz/0uzXfRUo8b9oHo6NRgsJ8E3Mhk+60GnRwmnBqYKlqdrNk
 cohw==
X-Gm-Message-State: AOAM531wWS5sWt+C4BXhSIxOo9tSN+Tbd8cG+3wkX7bgZ1wNDSFed3fn
 vBJ6Ctcgp7Kmp+YzIjOD+Q==
X-Google-Smtp-Source: ABdhPJxivZbrfCP5ExQeiI6WKCZdjsoaMPpewN0v8CCULqzXhfcbfWpMqJpbdHv9GLrKaIDB/AIiHg==
X-Received: by 2002:a37:4fd1:: with SMTP id d200mr5530244qkb.163.1595517237913; 
 Thu, 23 Jul 2020 08:13:57 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id c33sm2778547qtk.40.2020.07.23.08.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:13:57 -0700 (PDT)
Date: Thu, 23 Jul 2020 11:13:55 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200723151355.GA412829@PWN>
References: <20200722151901.350003-1-yepeilin.cs@gmail.com>
 <20200723142814.GQ2549@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200723142814.GQ2549@kadam>
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

On Thu, Jul 23, 2020 at 05:28:15PM +0300, Dan Carpenter wrote:
> On Wed, Jul 22, 2020 at 11:19:01AM -0400, Peilin Ye wrote:
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
> > ---
> >  net/ax25/af_ax25.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
> > index fd91cd34f25e..ef5bf116157a 100644
> > --- a/net/ax25/af_ax25.c
> > +++ b/net/ax25/af_ax25.c
> > @@ -1187,7 +1187,9 @@ static int __must_check ax25_connect(struct socket *sock,
> >  	if (addr_len > sizeof(struct sockaddr_ax25) &&
> >  	    fsa->fsa_ax25.sax25_ndigis != 0) {
> >  		/* Valid number of digipeaters ? */
> > -		if (fsa->fsa_ax25.sax25_ndigis < 1 || fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS) {
> > +		if (fsa->fsa_ax25.sax25_ndigis < 1 ||
> > +		    addr_len < sizeof(struct sockaddr_ax25) +
> > +		    sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis) {
> 
> The "sizeof(ax25_address) * fsa->fsa_ax25.sax25_ndigis" can have an
> integer overflow so you still need the
> "fsa->fsa_ax25.sax25_ndigis > AX25_MAX_DIGIS" check.

Thank you for fixing this up! I did some math but I didn't think of
that. Will be more careful when removing things.

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
