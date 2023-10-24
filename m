Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FB3C07545
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 24 Oct 2023 14:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A6381761;
	Tue, 24 Oct 2023 14:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32A6381761
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GVjYHRiP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gzo1rBrWm4ti; Tue, 24 Oct 2023 14:24:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3F166814BA;
	Tue, 24 Oct 2023 14:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F166814BA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13ECDC0039;
	Tue, 24 Oct 2023 14:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF3E7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 14:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D45F70380
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 14:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D45F70380
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=GVjYHRiP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCsGvWNHIK4q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 14:24:55 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A2A960B6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 24 Oct 2023 14:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A2A960B6F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 560ADB80760;
 Tue, 24 Oct 2023 14:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570D0C433C7;
 Tue, 24 Oct 2023 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698157491;
 bh=JiAgJPKemF9Wi2E3Nn7vBcVAiqFYF94P9jyQ6bRIssY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVjYHRiP6+XxzVH7PcvA+cqVtDnX8XjFr68MPXEr15HWpNxUubJZCvRUsGdSYooIB
 96TTfcHjGLsQqmO1T/idyHpCLQAReQYVEHrT07OtneqwvON7jrBfaQgWr95vLuPB0Z
 de2nNZifq44lq9aPDX3UXBBMf3N5vSxPvGY9mYyRvjNTz0pmvwQ+5qa2o8abfRAIUh
 1ZGa4qjYnbCThn/DunhPbmAAcvqtUV1zGKMad0cd+AcGL9EtLouUkTgForBJ5hE4sx
 09h28lmevoSWX3HbXOqTM+1X8xATWi7uw6BirOy+44AR+mwIVoNeSidc26ZQ+lAnYm
 YNikKsPR4ggpA==
Date: Tue, 24 Oct 2023 16:24:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: docs: Remove item from TODO list
Message-ID: <c6kwqxz2xgl64qb6dzetjjh6j2a6hj7mvbkeg57f5ulfs2hrib@ocjjsoxw3ns6>
References: <DB3PR10MB683528B8252ED2A802A0E154E8D8A@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=FV=W0G6C-=99viHMQaW2REGRQr2xgaejnJmadOdZkoE7AjA@mail.gmail.com>
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, corbet@lwn.net,
 sam@ravnborg.org, linux-doc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org, daniel@ffwll.ch,
 Yuran Pereira <yuran.pereira@hotmail.com>, airlied@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============8035122817457673624=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8035122817457673624==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hybcvdpiqm52svmj"
Content-Disposition: inline


--hybcvdpiqm52svmj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 23, 2023 at 10:25:50AM -0700, Doug Anderson wrote:
> On Mon, Oct 23, 2023 at 9:31=E2=80=AFAM Yuran Pereira <yuran.pereira@hotm=
ail.com> wrote:
> >
> > Since "Clean up checks for already prepared/enabled in panels" has
> > already been done and merged [1], I think there is no longer a need
> > for this item to be in the gpu TODO.
> >
> > [1] https://patchwork.freedesktop.org/patch/551421/
> >
> > Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> > ---
> >  Documentation/gpu/todo.rst | 25 -------------------------
> >  1 file changed, 25 deletions(-)
>=20
> It's not actually all done. It's in a bit of a limbo state right now,
> unfortunately. I landed all of the "simple" cases where panels were
> needlessly tracking prepare/enable, but the less simple cases are
> still outstanding.
>=20
> Specifically the issue is that many panels have code to properly power
> cycle themselves off at shutdown time and in order to do that they
> need to keep track of the prepare/enable state. After a big, long
> discussion [1] it was decided that we could get rid of all the panel
> code handling shutdown if only all relevant DRM KMS drivers would
> properly call drm_atomic_helper_shutdown().
>=20
> I made an attempt to get DRM KMS drivers to call
> drm_atomic_helper_shutdown() [2] [3] [4]. I was able to land the
> patches that went through drm-misc, but currently many of the
> non-drm-misc ones are blocked waiting for attention.
>=20
> ...so things that could be done to help out:
>=20
> a) Could review patches that haven't landed in [4]. Maybe adding a
> Reviewed-by tag would help wake up maintainers?
>=20
> b) Could see if you can identify panels that are exclusively used w/
> DRM drivers that have already been converted and then we could post
> patches for just those panels. I have no idea how easy this task would
> be. Is it enough to look at upstream dts files by "compatible" string?

I think it is, yes.

Maxime

--hybcvdpiqm52svmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTfTsAAKCRDj7w1vZxhR
xcQLAQDLOftRXQ2lHJ/6tZ1C2DlWodIPleYTRFzDQVKVJDBTtQEAvg5gQvFvDTgw
ic2BwYSSUUEriwl/ml0eDvtollJE0gM=
=HH4h
-----END PGP SIGNATURE-----

--hybcvdpiqm52svmj--

--===============8035122817457673624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8035122817457673624==--
