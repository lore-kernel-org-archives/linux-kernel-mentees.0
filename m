Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19F0C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 04:01:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CDB020732
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 04:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vt-edu.20150623.gappssmtp.com header.i=@vt-edu.20150623.gappssmtp.com header.b="ZLiF4nKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CDB020732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vt.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 289FA86DE5;
	Sat, 22 Aug 2020 04:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMCZn6RN9TZc; Sat, 22 Aug 2020 04:01:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8398186DD7;
	Sat, 22 Aug 2020 04:01:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DDF4C0889;
	Sat, 22 Aug 2020 04:01:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5486C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 04:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B531823086
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 04:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 41q8Et93rdWT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 04:01:08 +0000 (UTC)
X-Greylist: delayed 00:18:37 by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 11A572152E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 04:01:07 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k18so2691300qtm.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 21:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vt-edu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:in-reply-to:references:mime-version
 :content-transfer-encoding:date:message-id;
 bh=KG6D35LrETrIbEfRR6i8e5kjQoSsAlfAd76Negglopk=;
 b=ZLiF4nKTa6K1HQaBpXgSIFMMvGzHJi8jg30bu8smasWga6F6Z6Dp/z48oYS+prRwEL
 j91ry5qS9XZJsCmKuR0SiRVobdT73zx55YSa01bGbr35MgE40OO0yjBa4C0nVAUpIqCa
 dCzOwPEUo6ug+qKL++tJRdAfIf0ARwvMUC9aF+LVLfYQsOJGF4OwXNu+UY20YhvfHndb
 POpJoYvGm2z1DGNwoSYJe1XWaDa1zTonVDmD+/T9dH1NlLgIUCRKkivCaUGd3qmnyn1H
 KNKTsIHJ9OR+ijbYH+Oxw37DIcwj+Ro6f/A+TZysAycsp51Sp+/rKKFiwI+scuouCpSQ
 J0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
 :mime-version:content-transfer-encoding:date:message-id;
 bh=KG6D35LrETrIbEfRR6i8e5kjQoSsAlfAd76Negglopk=;
 b=heIWgUo4dFmgdNMx8YGeqj0LW6/XzWxuvv8U7ziwXlsf5IVzVnoXMWdJOFUUzsU8A9
 mhvdjpUvPbUZFjLopnrUS+Fi2B5yQTiNmoSzhTyvo08JE/gFbdpNp35j//5xGpoQ/XRX
 gsb/ev4WUzAjFZgxgz9Q8zd0KU6J4bz9JItUbCTJgVlpsY+asDp5nJvMNnrHoUqNClES
 3cD6M8iNpqhtKALraJJPNd/oXzQJURKocLJxFz0VuodLP8DZ4l7Oc+eATRm3l5Iju1/G
 V9Isgf4HaFBf/uVSOE77ricsilVqhHbe+rreEHMFpUsRofqSCioXNJTYdIpa/2EHi3yQ
 q5ig==
X-Gm-Message-State: AOAM531beMctbAHJcBwNrmSsIfvC59ALAnNYTcjMK+XKa0WHnN+Syv7q
 +uUNaiQltoVFwNL187cK4SfLnbcIXrNRUg==
X-Google-Smtp-Source: ABdhPJyXiMG8R/vxxpTmr6jwH49uQw4sDsejPXcgr60otWQbrUaOArpxK+wbVrBg76CIxpKdyIKIUA==
X-Received: by 2002:a05:620a:128e:: with SMTP id
 w14mr5216948qki.97.1598067341235; 
 Fri, 21 Aug 2020 20:35:41 -0700 (PDT)
Received: from turing-police ([2601:5c0:c000:a8c1::359])
 by smtp.gmail.com with ESMTPSA id w44sm4481201qtj.86.2020.08.21.20.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 20:35:39 -0700 (PDT)
From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks"
 <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To: Joe Perches <joe@perches.com>
In-Reply-To: <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
References: <20200818184107.f8af232fb58b17160c570874@linux-foundation.org>
 <3bf27caf462007dfa75647b040ab3191374a59de.camel@perches.com>
 <b0fd63e4b379eda69ee85ab098353582b8c054bb.camel@perches.com>
 <alpine.DEB.2.22.394.2008201021400.2524@hadrien>
 <a5713d8597065ef986f780499428fcc4cd31c003.camel@perches.com>
 <alpine.DEB.2.22.394.2008201856110.2524@hadrien>
 <744af177c09f8ce22c99d6e1df458bced558518b.camel@perches.com>
Mime-Version: 1.0
Date: Fri, 21 Aug 2020 23:35:38 -0400
Message-ID: <162653.1598067338@turing-police>
Cc: Giuseppe Scrivano <gscrivan@redhat.com>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>,
 Andy Whitcroft <apw@shadowen.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, cocci <cocci@systeme.lip6.fr>
Subject: Re: [Linux-kernel-mentees] [Cocci] coccinelle: Convert comma to
	semicolons (was Re: [PATCH] checkpatch: Add test for comma
	use that should be semicolon)
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
Content-Type: multipart/mixed; boundary="===============0176585043511207231=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0176585043511207231==
Content-Type: multipart/signed; boundary="==_Exmh_1598067338_2109P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit

--==_Exmh_1598067338_2109P
Content-Type: text/plain; charset=us-ascii

On Fri, 21 Aug 2020 18:08:08 -0700, Joe Perches said:
> (forwarding on to kernel-janitors/mentees and kernelnewbies)
>
> Just fyi for anyone that cares:
>
> A janitorial task for someone might be to use Julia's coccinelle
> script below to convert the existing instances of commas that
> separate statements into semicolons.

Note that you need to *really* check for possible changes in semantics.
It's *usually* OK to do that, but sometimes it's not...

for (i=0; i++, last++; !last) {

changing that comma to a ; will break the compile.  In other cases, it can
introduce subtle bugs.

> > I do appreciate that coccinelle adds braces for multiple
> > expression comma use after an if.
> >
> > i.e.:
> > 	if (foo)
> > 		a = 1, b = 2;
> > becomes
> > 	if (foo) {
> > 		a = 1; b = 2;
> > 	}

Yeah.  Like there, if you forget to add the {}.

--==_Exmh_1598067338_2109P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBX0CSigdmEQWDXROgAQKNCQ/8DDgTmFpZiCAqadYFLPHzj4cazPnhAUXW
F7pYc//dQ403pifqc84z6kGRQsocCpaXTMRzYfSe/EMYP/oCLxYr+qvbG2UJg1qs
ltyI+7Z3UY0lz/OxBmzwm+/QmCc5YHpEZ+eK4zmQwgP4KfgjD8BDrraWqAueAHi2
mOBcWxQ2/KcYwN4dvDJ3ESRJyiws6KOfCe4a216h1mpc+u94zgmRUkUXBxVNZQB+
Ew3a+GI5cLTAXt9JbSrakXqoj/sH9+GqJnJ1T0flu/mBhs5gRRXDmcfoEDgxUeJQ
T+5Yunwj00vqcCql+G6jOaLvBcPnxI2xx7UaOIzl3JO+4wQZOjj6JC3EJjpLYtLL
RZGwHt/35XSJV6Tci/tAE/5H7twYwhig68ChnuGAOgxm2yg1sUxpKdgl/K6u+qOs
xIzp1f66xWljUPSx7xJxxc1445gd1I6udjeY8tUP2wVLlUseD4L2JwJInRvfufy5
7dN3nTy4e1s3Vu5P6CK4PntJagNPNm83EQtBk9a0A3skoPZyADW1UUCPRhIdy/te
Z1IC/I3rGRw6lVzVZR8tXox70QhVBRHLL99Zxv4w5DedB0dDNsu7//pE3YSQrRW+
t2vRvfBi0Nz6MZVxMMV/uMHa4sqJjqt9T4JD3uijdvQFkMxtm5o6cSXWuAobIU/T
w6QQ1Tjr1Z4=
=9BEy
-----END PGP SIGNATURE-----

--==_Exmh_1598067338_2109P--

--===============0176585043511207231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0176585043511207231==--
