Return-Path: <SRS0=TUsn=ZY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3BEC432C0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 05:36:10 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F9C20705
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Dec 2019 05:36:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U7v/I2bc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F9C20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4095B87ACB;
	Mon,  2 Dec 2019 05:36:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9V7wma-w2MC; Mon,  2 Dec 2019 05:36:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9404A87AB5;
	Mon,  2 Dec 2019 05:36:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 882F4C1DD9;
	Mon,  2 Dec 2019 05:36:07 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEBF2C087F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A535E2010B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:36:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36PpOxrg+M4K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:36:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id 2FB7320104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Dec 2019 05:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzQN8wezjT7b8g3+ghWsdGp9+x99xEeyGabO3I6sDJg=; b=U7v/I2bc5x5IaFlgbKhxfCG9/
 3alyresmA6+o81UZ1foOF28PTS51KwKjRyhlwbda2VanIfwRh3q0+xs0PR5Pb61sWpfT7oY0RI4HA
 BmF0XKuX9YTc0KHeMF0e1H9J/a9qQ9s0EFCn4qXa+xFJ5dEdAniVTm5RyzRCk9O3josCIR07amc4n
 fHUKXBwc9mQgPaDLto9J0zhXIND5sXPYfHsQlQ0xUJC1eQFjCcejbwuzm1ZtLlzEMMzA5N5sFA4/X
 jItRphDUN+6O2M/dNDs7JPp5CUdXtCm5lr7K83ptbZMotQ3Eab2VxU8xHkV/F+gOHkcfaLs7MdOQh
 4iZRJA2YA==;
Received: from [80.156.29.194] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibeNM-0007z9-8d; Mon, 02 Dec 2019 05:36:00 +0000
Date: Mon, 2 Dec 2019 06:35:55 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Amit Choudhary <amitchoudhary2305@gmail.com>
Message-ID: <20191202063555.0f75e68f@kernel.org>
In-Reply-To: <CAFzckaFfmVYV_baqV9bHrnguXfOKs42DJ2VgA4C1y2Ey-+99xQ@mail.gmail.com>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-5-dwlsalmeida@gmail.com>
 <CAFzckaFfmVYV_baqV9bHrnguXfOKs42DJ2VgA4C1y2Ey-+99xQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rfontana@redhat.com, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH 4/6] media: dvb_dummy_fe: Fix
	long lines
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

Em Sun, 1 Dec 2019 22:07:22 +0530
Amit Choudhary <amitchoudhary2305@gmail.com> escreveu:

> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
> 
> > +                                            u16 *strength)
> >  
> 
> In my opinion, the arguments on new line should be just below the start of
> arguments on top line. Like this:
> 
> +static int dvb_dummy_fe_read_signal_strength(struct dvb_frontend *fe,
> +                                                                     u16
> *strength)

No, that is not the way we indent. The alignment is relative to the open
parenthesis:

  foo(arg1,
      arg2);

Btw, if you run checkpatch --strict, you'll see it complaining if the
alignment is different:

	CHECK: Alignment should match open parenthesis
	#2: FILE: a.c:2:
	+void foo(int arg1,
	+		int arg2)

> +               .caps = FE_CAN_FEC_1_2 |
> > +                       FE_CAN_FEC_2_3 |

The alignment here is given by the first argument:

   bitfield = BIT_1 |
              BIT_2 |
              BIT_3 |
              ...

or

   bitfield = BIT_1
              | BIT_2
              | BIT_3
              ...

On media, we usually prefer the first form.

Cheers,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
