Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C20C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 10:16:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B70D20663
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 10:16:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzjEmw3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B70D20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F34302E204;
	Fri, 11 Sep 2020 10:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D2gGi+EdZ5Eq; Fri, 11 Sep 2020 10:16:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0F96F20485;
	Fri, 11 Sep 2020 10:16:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECDB4C0052;
	Fri, 11 Sep 2020 10:16:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A679C0051
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4791A8735D
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcrm7SoAkk4j
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:16:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 672CB8731B
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 10:16:38 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id g29so6337308pgl.2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Y2D0zRwJCnEFVuJ3Jd1F8RmkGb177PJyTvMjl5ioqfc=;
 b=GzjEmw3wRrGU6WNctnBiB9CmZL3m+MMKMlUfKvPZMqlw1is2fRk9N2+dO23XYsrQvZ
 UGOLvKfnYLOSNTvjB2KNEEEqqccGSNAzE+BQQElLn0tRRYWfI4defT8gnUPMP1uRw2El
 j+pStW76FwM4GQJwPUP+1G+mFloZ0xQBw0Lk8Y/07LG4fx0isGUoWUlgrKjjSW2XZ16w
 8ZUi3Sgarq9HpRtNmIC+wuKmSpWtHSRgKDiwcL+b9pSd/ubUewh+RfI4hwwPq4Mp3NyB
 0ybvbTOzsfG6PK2Nd3T1agDU0XkdgN139kWxPl7JkHqvXRFyd2IN5Pklc40mnhKFukIh
 s5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y2D0zRwJCnEFVuJ3Jd1F8RmkGb177PJyTvMjl5ioqfc=;
 b=AbuWBZ8zpMGvf5d+kAk+XmGv3Qvp8hkG4kG/xDC1IoMmXFH0encO4upmjOcyO93nFW
 iiLXs0Ns2TvQnkc2f4g5qw436K7MkOsHeVvHQjPAXNkFHVu54MduCM/ndLshlfnTToNK
 tmG16gsgCA26KrJvDJibd4BniXm1uzzIJgdgEBKgWtt4ubDKJPX4Sx8JnxHL7km6V68t
 LHrAsU/8QxkRICGKhGrt7S0FMJWXsFAwLsQHX26BqjgTDY+IhY+bbKDWJicbVRJZjR0i
 SvAEAJF/y6ar5dskHIP/UYiJBt1I1qy2w+J9NoNalSvwLSFCuNd4QJqqoOka+gcLnkE1
 AfwA==
X-Gm-Message-State: AOAM530hm8ieB35LQLcb4WpUZqjyTW1kkSCA0Gk/gBXuGRy80MgWEOeK
 3XSDCpUdF9VecnIyPFJYeMI=
X-Google-Smtp-Source: ABdhPJw828uomWC4R3NRtDxLedl3T6B3+tb+Os2GXMXMV7zYw6ULol/KNLyKS7WOzoPYn6epp348ig==
X-Received: by 2002:a63:a23:: with SMTP id 35mr1200554pgk.333.1599819397740;
 Fri, 11 Sep 2020 03:16:37 -0700 (PDT)
Received: from localhost ([203.90.99.113])
 by smtp.gmail.com with ESMTPSA id y195sm1793569pfc.137.2020.09.11.03.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 03:16:36 -0700 (PDT)
Date: Fri, 11 Sep 2020 15:46:31 +0530
From: Mrinal Pandey <mrinalmni@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, skhan@linuxfoundation.org,
 Linux-kernel-mentees@lists.linuxfoundation.org, mrinalmni@gmail.com
Message-ID: <20200911101631.4lylpsbaog5g5jdj@mrinalpandey>
References: <20200804155640.x3kzgqfsmmkj5z2b@mrinalpandey>
 <alpine.DEB.2.21.2008042131530.4346@felia>
 <20200809072240.lvuuwscinkfqpwxo@mrinalpandey>
 <20200820044241.4ivtq5co6cm4aze6@mrinalpandey>
 <alpine.DEB.2.21.2008221014310.12792@felia>
 <20200824082325.4prwz56p2ppgfojl@mrinalpandey>
 <alpine.DEB.2.21.2008241052310.2932@felia>
 <20200825045358.hygtrkm6qxyiwjft@mrinalpandey>
 <20200906042724.p6gbirsugnvslmh7@mrinalpandey>
 <CAKXUXMyh1eVusXc+2DAN9H9WfyXHkTuCuhaiG8dfM54Km+rW4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKXUXMyh1eVusXc+2DAN9H9WfyXHkTuCuhaiG8dfM54Km+rW4A@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Improve SPDX license
 identifier check for script files
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
Content-Type: multipart/mixed; boundary="===============9193492118409688114=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============9193492118409688114==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnngrpyiogruxkqu"
Content-Disposition: inline


--rnngrpyiogruxkqu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20/09/07 09:10AM, Lukas Bulwahn wrote:
> > I was wondering how should I go about the original patch? Should I keep
> > both the checks or just the executable one and let be the patch as it is
> > as further cleanup can lead to better performance as we have already
> > seen with the evaluations.
> >
>=20
> Kees Cook and Andrew Morton pointed out that a tool may not rely on
> the executable flag. So, checkpatch.pl may not rely on the executable
> flag; the patch we created here is misdesigned, now we know that.

Sir,

Yes.
>=20
> > Also, I have completed all the tasks related to this project on Communi=
ty
> > Bridge's site. What are the next steps of mentorship? By when can I
> > expect the results sir/ma'am?
> >
>=20
> Mentorship can begin by October 1st. We need to develop a project plan
> for the mentorship, you are in the lead to write that. We need a
> project plan for the mentorship to start.
>=20
Eagerly looking forward to writing the plan. How, when and to whom am I
required to submit this plan and what should it broadly contain?

> In the process of the checkpatch.pl patch creation, we identified that
> we can check if we find any invocations that rely on the executable
> flag. This could be a first set of tasks to do in the mentorship.
>
Yes, sure sir.

> Maybe, you can find another aspect to look into the checkpatch.pl
> evaluation? Maybe the check for the line of the SPDX-Identifier was
> not the best case to start with, because it is more complex than
> initially thought.
>
I suggested few patches before, guess they can sip into mentorship if
you find them fit enough.
Apart from those I have a few other observations on checkpatch.pl and I
am continuously evaluating the output file for more.
I will share these evaluations on a different thread.
>=20
> Lukas

--rnngrpyiogruxkqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE8DwCG1PwaC2uTI99xIwpEWwxhGQFAl9bTnoACgkQxIwpEWwx
hGRsMxAAveKuWP7hf80l8ZKVQ36nMNIlmV0OcjUAdPX2U10qg9T7zGnyq/u5YVGN
9nACsgoq2oLRqfPSoL1y9NcCsG7PpVuWFfz7u8/YPHHAwk1ne4cfES95kJbVtOLI
QBSKRcv03+YRyzq0FfZKm4uJD6PrXA9nBcFdQ6ab8a7upPPFK+26JNIppsi+Taam
SyoBai6muthl1O+ZledDzArAlPDbC5eJQTCy+b8ug0xikMhyQosIty/vCjEsy11X
y4oVenFkuAoeldlFcuLNkPlc9TDTkufScjAoqa9OMqnZU1yAvzoqdquuoWmevAC7
ibCfLWNkUWyQrY8+Dx8uD0JQYxA22by3zZtfIVjAKQqcodkjoaiaSsNbd14lM+yx
AOkJhCz2bFNtWt5vp/X+bYIjBsdGC/xViU34XOVZTDDTpmFGSs7lSVviYcEFAuQU
HsYH+R4KmaOe0Zk8HS5WSq87a2qaJQe8gFX6GiDljGnfdCMUruRSwFukaEw7x9J1
EZdbQgZEXAHxZMHDuj9HnJJD+BYXpdE6+iKeZKugVcFzTyqOrldY6+vIYCHVmkf9
eXA+QC26ugOfOPNGrbZoogcMK3s8ur2mLiVeK6TdFKUd1lp/JYkR6a1pRXtvV67o
g2Cx8BsCAIjjBVyvc70RYXYWFDzhC4tI2wOfKJi81tZLGVJQtwo=
=8U4q
-----END PGP SIGNATURE-----

--rnngrpyiogruxkqu--

--===============9193492118409688114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============9193492118409688114==--
