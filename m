Return-Path: <SRS0=EZza=B6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEC0C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 04:52:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2264B2078B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 20 Aug 2020 04:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg30RJgw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2264B2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D4D79868A9;
	Thu, 20 Aug 2020 04:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgEUi6N703fr; Thu, 20 Aug 2020 04:52:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 57893868B6;
	Thu, 20 Aug 2020 04:52:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39EBEC0889;
	Thu, 20 Aug 2020 04:52:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D7E0C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 99BD5868B6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkeKHBjR0Ht7
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 22BDB868A9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Aug 2020 04:52:45 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x6so562771pgx.12
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5VWHI9n0+G3Tugiglsr+/xN2YwY1eAl4mqxcjHXV038=;
 b=sg30RJgwK8Lv5XRHi/WimqIf3rB9gatyZVHbgFDOwMn7DjJxESwLjKeUKI2qYM5QF4
 nTFUfN0Y+S9GN2ac/6llvCHHe0Lo5YX0H+8ITh+k2JsR1uztzHIK2d34f0VJUrZLcyhx
 h/YQ2oVahy/2yRuf7hAaey+KgMV+xdQUgbaEBal1/4jQoYeJUk4Rr4g0BhS+79D9ezMp
 xJTz/olwauOaZme+0lHGzyRNUSwtxL9ZMJnrsIl0wGyvuNjQVIi0OkiGLi9O4xopuhkt
 /R3IbmbP/0LM91dhD9sEfL8VuuTfSlbHlt9VsqOotqNn0nXj4wwMcyCzSCFWbsn3augQ
 j93A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5VWHI9n0+G3Tugiglsr+/xN2YwY1eAl4mqxcjHXV038=;
 b=kKDkba54xl2PjUmgnG7Ix4qApw450IGoywQyoa2Iikzpog0cOwHOLTANHKov5M5FEF
 lQ0lkOMxCvROdqNvGvYuTC8XJ06horUldUrzQOzgWGk0vktctD1IbVblRpJVwrMvgReH
 lLA5jQYhC0NDMaOQwlfiCfYrZ9pV1HzOHMLgXnvyWNDbc8JtaL7VZJ/XZ3ZcCRhcTVje
 62igZlS9EwVAgucvMSHXslPoFYKJ2xPzW7KwiR6U0ACrjEk1liD+2KsMGzC0YKecdNhE
 cOt+orJISWQgzRbfer2vw3vh1SmSVvn50WPL6MP44A957kVDwasvBboR+CGOUNoEr1/G
 kiDw==
X-Gm-Message-State: AOAM532YhUmQiIOP1w4m6dSmJnsL2sf4a2KTOWmCYj1cFiKDDJ07CzQ6
 daVyBEdhcIci80GDK68OJ3E=
X-Google-Smtp-Source: ABdhPJwk8QJnC9KbOI5ziFvW6UbllAaSRg+AL5gHNG6xLAWMh2Mh0hNlihlPpcjmyT2/1uEAMMDVPg==
X-Received: by 2002:a63:64b:: with SMTP id 72mr1201470pgg.157.1597899164625;
 Wed, 19 Aug 2020 21:52:44 -0700 (PDT)
Received: from localhost ([1.23.143.142])
 by smtp.gmail.com with ESMTPSA id lk16sm572071pjb.13.2020.08.19.21.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 21:52:36 -0700 (PDT)
Date: Thu, 20 Aug 2020 10:22:32 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: apw@canonical.com, joe@perches.com, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org
Message-ID: <20200820045232.tmun7jlppeeesg4p@mrinalpandey>
References: <20200714032352.f476hanaj2dlmiot@mrinalpandey>
 <alpine.DEB.2.21.2007300746330.13710@felia>
 <a2773089a844047407855f2da7bd72c2970d2e6b.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <a2773089a844047407855f2da7bd72c2970d2e6b.camel@perches.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: Fix the usage of
	capture group ( ... )
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
Content-Type: multipart/mixed; boundary="===============7979509816298083648=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============7979509816298083648==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ux4q3enrmoiq3cjy"
Content-Disposition: inline


--ux4q3enrmoiq3cjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/07/30 12:31AM, Joe Perches wrote:
> On Thu, 2020-07-30 at 07:58 +0200, Lukas Bulwahn wrote:
> > Hi Joe,
> >=20
> > did you see this quick fix to checkpatch.pl? Can you comment on the=20
> > commit and can we get a quick ack on that fix, please?
>=20
> Yes, in a bit.
>=20
> > General question on patches for ./scripts/checkpatch.pl:
> > How do they travel to Linus?
>=20
> Generally via Andrew Morton.
>=20
> > Do you pick those patches and provide them to Andrew Morton?
> > Or do you just ack them and we need to send them to Andrew Morton to ge=
t=20
> > them into mainline?
>=20
> Generally, ack and forward.
>=20
>=20
Respected maintainers,

Did you get the time to check this patch out? This patch is a part of my
mentorship project and your comments on it would help me to make the
best out of this learning process.
Please review it as time permits and let me know if what I propose makes
sense at all.

Thank you.

--ux4q3enrmoiq3cjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl8+AZAACgkQxIwpEWwx
hGSRYhAAsnHeGya+r57xffK0LAGoAC8gmK0pURMm8cSkIuwN8Q6pUQoqHR5lT6U0
HnKCqnDhdyivZLHpM2ApQtZ3eAAVyJyRwzbltybExm74IOdNTGdfvUoonDmzWq4j
9AacN7giMY5BHtrhaGuq4ULSD6Nh45wl/yYfVIqAhKZxYLAAZyQzCIwIiY62YB5z
QWF15M8GwzS5XJM3qqyuA5gmngljnQ11fd1AcRSvdBQLDVRcFO/7OwCkvZQFxsgl
wB2TF2FB6u2MP/7j2DoCfGTwSSlOp1rOQN1mMsLT+EoxWbIpX+yd1aw+4Igm07De
7R0lOcMQ6V0M1kvO+Kos38kW5HqeJ7YsSSsSx7FlFCbxVUpvK42jrAtbFY9RTofA
SBPTrb1SaFNXVZEM3yO05kkgPx5aF3IveOxZnBjT0A8IrfFERYXEEIVytOhR5IoB
xJp41qx6C8F9hhDXrvwcflxqt5vueJLth100xZaklc0/1DO4FtPcxwJYwflLz1C3
Jn+lzC6v7QBgyXHEI1lWCN2PLODjW2RZd+QkRIoMQjVCeqnDmhBEKfeAF3Ru1wux
yCDiQrmrqxHZGJLi/1oOCM+xICd6Xh89YFn24YQXv7lEw6OIdgy2fhqMoU0+Z4ab
4kbEI1D6sDan0mNjvs/iQvkU/GRpkt4JQygvafVHpJLPoZ+IRc4=
=GBtR
-----END PGP SIGNATURE-----

--ux4q3enrmoiq3cjy--

--===============7979509816298083648==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7979509816298083648==--
