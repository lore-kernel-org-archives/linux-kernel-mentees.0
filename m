Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C520C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 13:15:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF8D020760
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 13:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pum2+WRG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF8D020760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26D188565B;
	Tue,  6 Oct 2020 13:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXDCko2iMfo2; Tue,  6 Oct 2020 13:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B9B2F8494E;
	Tue,  6 Oct 2020 13:15:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB2C2C016F;
	Tue,  6 Oct 2020 13:15:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12DE2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 13:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EBE0585516
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 13:15:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHFcVqJqn-Md
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 13:15:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C2C828494E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 13:15:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id m7so12552293oie.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 06 Oct 2020 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8PQDR6xEkwdf8z21ZSAjpXNnKLZEbtQBlFLv4LSaZxY=;
 b=Pum2+WRGwkZnNacWNwd4EdFzBwLvaRZLjeyPAk+dol4O81w7EEIh1r9FeXqMnevyuc
 bW44jmIJbHgUMavHk2d7g65TX5FKXAonlXyjtQ7NDsD82AbT8sm8SJMH7qWcRwBGVKTw
 higDWlSELtLB5rvXAucZb7l7fNxYTAFL1LTSTnoNAuhQpb1YP1cN9xri5YMGqM5emVRX
 QOLeTu5b4niYPkzbM0QguaifBjoRUqzXFerBuLEJd2Xmtk9Pa90zW5gQefVkqJNFA3fm
 zLgGDBz+MsE0EZBJVrItFDmOA3hdXMy6bYIu1pMot3JWRC0Ks/F4Uzk2HHVI7jyaMJql
 1/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PQDR6xEkwdf8z21ZSAjpXNnKLZEbtQBlFLv4LSaZxY=;
 b=kw1gAV/xGflHOmNmiaIxkg0nRUXargY/dkwqek5IRzD1+FfAKtiKesc7dqjZsGttTv
 pujHnAiOxTh/N/bYR24idEtT3FPPdGz7zP/4x3R4k28GroYEMtjzd77x4JXtxDmbA5ny
 ry1zQ/n3nDq0wW2aJk9ZkQj6k/RBUWhpBVAKqGRgxoLT04n87QOYwD9X/p1nQory1gLx
 YGT8OtjwMSvoNIE1OGsN12q2u4Qgs1mU0ccSi+QvbIEF4ve35I5YlUIT9kzOfqUsT7TV
 st13GGgaViipfBUqQeuUNq9lyTG1Yb4f1H7DZ+r7XyyD2Z5MQwRcCoLh/5M13CMEo2Q1
 7pBw==
X-Gm-Message-State: AOAM5333FCN+qWeIu6Mr94L3DqNAQhbu9g/fAdqYfjQR6VSAQn9pE0Tl
 JVn3K/EuUSOoN15SyIg4kGy6FqYAwkTJPOsWrcU=
X-Google-Smtp-Source: ABdhPJxXT29W0nR6ZmhQVN5laWvvvvsskZjceEF6/vckR1lgtFXx9eAOW9Z9CeDCa1um2vSWw8ZkCvGaFb6GhezFjYw=
X-Received: by 2002:aca:cc54:: with SMTP id c81mr2732805oig.74.1601990123878; 
 Tue, 06 Oct 2020 06:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201005192409.192317-1-dwaipayanray1@gmail.com>
 <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
 <CABJPP5DDmurU9c2qCoJcg7hvwnkYo4LCx+TW6xKG2G23Uf_Cxw@mail.gmail.com>
 <c1ca28e77e8e3bfa7aadf3efa8ed70f97a9d369c.camel@perches.com>
 <CABJPP5AmvDPFQhWfxC8TA7SCGtwzurVykR5mtPx0ytm-PJDmYA@mail.gmail.com>
 <alpine.DEB.2.21.2010060635000.10609@felia>
In-Reply-To: <alpine.DEB.2.21.2010060635000.10609@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 6 Oct 2020 18:45:00 +0530
Message-ID: <CABJPP5AkdKekb2mRuiDm1-GOuqZ1vL=eNt=OJZN2iAPH1yNytQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new warnings
	to author signoff checks.
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

> > > Except for comments and quotes like:
> > >
> > >         From: J. Random Developer (BigCorp) <jrd@bigcorp.com>
> > >         Signed-off-by: "J. Random Developer" <jrd@bigcorp.com>
> > >
> > > I think any time there's a mismatch, there
> > > should be a warning emitted.
> > >
> > > That includes any subaddress detail difference.
> > >
> > >
> > Hi,
> > Yeah these cases are being handled.
> >
> > Comments and quotes don't generate any warning message but
> > all the other mismatches do.
> >
> > Only the check for subaddress generates a --strict check message.
> > others are all WARN messages. It was followed from our discussion at
> > https://lore.kernel.org/linux-kernel-mentees/7b52e085f0b69ad1742966f8eacd02deb9299b96.camel@perches.com/
> >
> > So does it need to be changed to a WARN or is it fine like that?
> >
>
> I will repeat what I suggested before:
>
> I think the complete mismatch where we cannot even find a name or an email
> match the author deserves to be reported as ERROR.
>
> Dwaipayan, if Joe does not disagree, could you change that in your PATCH v4?
>

Yes sure I hope to do that after Joe gives his affirmation.

To summarize it, two changes that could be made are
the CHK for subaddress extension could be converted to
a WARN, and the WARN in case of a missing author signoff
could be converted to an ERROR.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
