Return-Path: <SRS0=w7vp=DN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F2EC47095
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:38:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12B40208B6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  6 Oct 2020 04:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtbI7jxu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12B40208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B61FA853D9;
	Tue,  6 Oct 2020 04:38:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgFc14Je5vba; Tue,  6 Oct 2020 04:38:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19C8A84E1A;
	Tue,  6 Oct 2020 04:38:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F176EC016F;
	Tue,  6 Oct 2020 04:38:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1373C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C868B864FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5kE9wfGjWW8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95450858B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  6 Oct 2020 04:38:06 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id u21so15648881eja.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 21:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UX3RCPrcGPIrqbUR3n59SCIf8TFoEsCauVyzo+DA3ec=;
 b=BtbI7jxuD2tSaxYjg9Y1Q/u0svxxBJ2fTSfMePeuhgX0R67Oubt+RaNzbgbLVEhTZS
 VYrLlMyt62cgemHc2wY80mXdcgbgaOUvPgJAOwvZ4jfOwLiKaUaz1xzROfNIkbnO9TzO
 9gAzVHe643wT5urCjG+EQ4dJHXHFW20Vi+m3IfaNvBKBPqIiyHsP9GtWKRXDP1hXKLUw
 AfgDcu2nkeBD+NWOnm2jhGpQ7SHrMiQoPBkR1nKDjpR9W6ebixHE/c6tpqw+DFmVVoGp
 l/vl/NcjdW0x3ojClvU3UBDb8CKKNixQ4Ymkwn7Z0Pm5joZszHItgy1TT/AsMPIe1iEe
 nI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UX3RCPrcGPIrqbUR3n59SCIf8TFoEsCauVyzo+DA3ec=;
 b=DdG3S1mvsXKRYbSVaSqM+Cu4WSl/txq/mq5E18PXsBRX+Z2tI3v9MoFjJuAsrIP5eU
 pIfgCdxcTBaRQM4b0ochLbF9EsMzF3mfM0PizNPeIwjn5V9jd+J3aaoritY9QGOKdYzB
 S96hjS8RS7HzsiQWlC57BLf8RTzZz7aeGIAOibRYjYr2ucJm3DlyHug8DrXMBsKAX4es
 rbPfwrxN2zq/4P5wTmx5hCr2FAZneyFB7Il6EMkuB+cpQuKF4IkJATt7sWOqchAeLs07
 PAjvrU8r3hvGcGAD1zP7f8aGnn63L8Dm6Eh96MDZDvcuAAbVVYzMdAmSPVb1lMef/JK9
 OUkw==
X-Gm-Message-State: AOAM530p+yGfh6efd8GIj1jG0tkoUJ3aShxh//ARmJKYUf4/xh8R5p7b
 cwsAsiqaq8HLiavHhVzbTUQ=
X-Google-Smtp-Source: ABdhPJxiSxU0j/zKJ0sQ+aLdTW8YRHvbvpeOl5LpshvHzdwmskFIFWRh25dkohjVxsLMhZJKe/te/w==
X-Received: by 2002:a17:906:1a4c:: with SMTP id
 j12mr3156834ejf.372.1601959084888; 
 Mon, 05 Oct 2020 21:38:04 -0700 (PDT)
Received: from felia ([2001:16b8:2d91:5500:d137:30b3:dfba:6d8f])
 by smtp.gmail.com with ESMTPSA id a19sm1366382edb.84.2020.10.05.21.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 21:38:04 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Tue, 6 Oct 2020 06:38:02 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5AmvDPFQhWfxC8TA7SCGtwzurVykR5mtPx0ytm-PJDmYA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010060635000.10609@felia>
References: <20201005192409.192317-1-dwaipayanray1@gmail.com>
 <1d8396cb33b33c3d0107ba701b7e597041dfdbc2.camel@perches.com>
 <CABJPP5DDmurU9c2qCoJcg7hvwnkYo4LCx+TW6xKG2G23Uf_Cxw@mail.gmail.com>
 <c1ca28e77e8e3bfa7aadf3efa8ed70f97a9d369c.camel@perches.com>
 <CABJPP5AmvDPFQhWfxC8TA7SCGtwzurVykR5mtPx0ytm-PJDmYA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-908877500-1601959084=:10609"
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-908877500-1601959084=:10609
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 6 Oct 2020, Dwaipayan Ray wrote:

> On Tue, Oct 6, 2020 at 2:39 AM Joe Perches <joe@perches.com> wrote:
> >
> > On Tue, 2020-10-06 at 01:37 +0530, Dwaipayan Ray wrote:
> > > On Tue, Oct 6, 2020 at 1:07 AM Joe Perches <joe@perches.com> wrote:
> > > > On Tue, 2020-10-06 at 00:54 +0530, Dwaipayan Ray wrote:
> > > > > The author signed-off-by checks are currently very vague.
> > > > > Cases like same name or same address are not handled separately.
> > > >
> > > > When you run tests for this, how many mismatches are
> > > > caused by name formatting changes like:
> > > >
> > > > From: "Developer, J. Random" <jrd@bigcorp.com>
> > > > ...
> > > > Signed-off-by: "J. Random Developer" <jrd@bigcorp.com>?
> > > >
> > > > Should these differences generate a warning?
> > > >
> > >
> > > Hi,
> > > I ran my tests on non merge commits between v5.7 and v5.8.
> > >
> > > There were a total of 250 NO_AUTHOR_SIGN_OFF Warnings
> > >
> > > 203 of these were email address mismatches.
> > > 32 of these were name mismatches.
> > >
> > > So for the name mismatches, the typical cases are like:
> > >
> > > 'From: tannerlove <tannerlove@google.com>' != 'Signed-off-by: Tanner
> > > Love <tannerlove@google.com>'
> > > 'From: "朱灿灿" <zhucancan@vivo.com>' != 'Signed-off-by: zhucancan
> > > <zhucancan@vivo.com>'
> > > 'From: Yuval Basson <ybason@marvell.com>' != 'Signed-off-by: Yuval
> > > Bason <ybason@marvell.com>'
> > > 'From: allen <allen.chen@ite.com.tw>' != 'Signed-off-by: Allen Chen
> > > <allen.chen@ite.com.tw>'
> > >
> > > I didn't find the exact formatting change you mentioned in my commit range.
> > > But I did find something like:
> > >
> > > 'From: "Paul A. Clarke" <pc@us.ibm.com>' != 'Signed-off-by: Paul
> > > Clarke <pc@us.ibm.com>'
> > >
> > > So it's like some have parts of their names removed, some have language
> > > conflicts, and yet some have well different spellings, or initials,
> > > etc. It's like
> > > a wide variety of things happening here.
> > >
> > > I think considering these, it should be warned about, and let people know
> > > that there might be something wrong going on.
> > >
> > > What do you think?
> >
> > Except for comments and quotes like:
> >
> >         From: J. Random Developer (BigCorp) <jrd@bigcorp.com>
> >         Signed-off-by: "J. Random Developer" <jrd@bigcorp.com>
> >
> > I think any time there's a mismatch, there
> > should be a warning emitted.
> >
> > That includes any subaddress detail difference.
> >
> >
> Hi,
> Yeah these cases are being handled.
> 
> Comments and quotes don't generate any warning message but
> all the other mismatches do.
> 
> Only the check for subaddress generates a --strict check message.
> others are all WARN messages. It was followed from our discussion at
> https://lore.kernel.org/linux-kernel-mentees/7b52e085f0b69ad1742966f8eacd02deb9299b96.camel@perches.com/
> 
> So does it need to be changed to a WARN or is it fine like that?
>

I will repeat what I suggested before:

I think the complete mismatch where we cannot even find a name or an email 
match the author deserves to be reported as ERROR.

Dwaipayan, if Joe does not disagree, could you change that in your PATCH v4?

Lukas
--8323329-908877500-1601959084=:10609
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-908877500-1601959084=:10609--
