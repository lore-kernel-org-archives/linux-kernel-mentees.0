Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E90C7EE26
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 May 2023 01:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934D6813D2;
	Mon, 15 May 2023 01:28:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 934D6813D2
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G1Y2xdQf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MgN51DR8zxPM; Mon, 15 May 2023 01:28:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8401C813BB;
	Mon, 15 May 2023 01:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8401C813BB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F130C0037;
	Mon, 15 May 2023 01:28:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A521C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 01:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3EE4417D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 01:28:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3EE4417D3
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=G1Y2xdQf
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MHPUNC42Skc4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 01:28:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17749417D2
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17749417D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 01:28:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F411560C0A;
 Mon, 15 May 2023 01:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14340C433EF;
 Mon, 15 May 2023 01:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684114115;
 bh=I20Qcx+0QMlKTWmytfbz1TfDFmdsrpzG804q+DcMxT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1Y2xdQfgmvkV3nlC0SWXnCZv8HEt7Eax23r2n7MNPoTbqzv/MyK3LUaH4mVX9nfx
 +WQQ8nB54nSKvq1alqJITAVnLKiEL59gzUn1tQ4DT3DnCvU+WQyRwne2QkaBN8vvLa
 OIAXkd3qBS/l1upiwA5SBn5NKWo7K0d77fqqUzJN0fyKqdri3RrGPA803A6g8riOtT
 FpHDa+Tmkmkr1ZuLD+LZu8lcg19G+ucHnotuRi5srfdmH75F/m9MIoWJ1cqAXZNyrZ
 MBPgJ3eB5XhqUpwVvtqGhIR8w6JYa8J7WrDw+mOOY/BifTtXRGuJEYqw1PV00I+loP
 zd4xXi4/X080A==
Date: Mon, 15 May 2023 10:28:32 +0900
From: Mark Brown <broonie@kernel.org>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 3/3] selftests: ALSA: Add test for the 'valsa' driver
Message-ID: <ZGGKwA10shGGUr87@finisterre.sirena.org.uk>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
 <20230513202037.158777-3-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230513202037.158777-3-ivan.orlov0322@gmail.com>
X-Cookie: Avoid contact with eyes.
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net, tiwai@suse.com, perex@perex.cz,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1577908180762306288=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============1577908180762306288==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7tubSUVrD+xV4Inh"
Content-Disposition: inline


--7tubSUVrD+xV4Inh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 14, 2023 at 12:20:37AM +0400, Ivan Orlov wrote:

> +uid=$(id -u)
> +if [ $uid -ne 0 ]; then
> +	echo "$0: Must be run as root"
> +	exit 1
> +fi

It is not an error to run the selftest as a non-root user, the test
should be skipped.

> +modprobe snd-valsa

We don't check if the module was already loaded.

> +if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
> +	mount -t debugfs none /sys/kernel/debug
> +
> +	if [ ! -e /sys/kernel/debug/valsa/pc_test ]; then
> +		echo "$0: Error mounting debugfs"
> +		exit 4
> +	fi
> +fi

This will unconditionally attempt to mount debugfs in a standard
location and won't clean up after itself, if the system didn't have
debugfs mounted for some reason then this will leave it sitting there.

> +success="1"
> +arecord -D hw:CARD=valsa,DEV=0 -c 1 --buffer-size=8192 -f S16_LE -r 8000 --duration=4 out.wav
> +
> +if [[ $(< /sys/kernel/debug/valsa/ioctl_test) == "$success" ]]; then
> +	echo "$0: ioctl test: success"
> +else
> +	echo "$0: ioctl test: fail"
> +fi

Would it not be better to have a C program that actually calls the ioctl
rather than a custom debugfs thing that may or may not be wired up to do
the same thing as an ioctl would?  It seems like other than whatever
this ioctl test actually does this is all just a simplified version of
the existing pcm-test.

--7tubSUVrD+xV4Inh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRhir8ACgkQJNaLcl1U
h9DDEQf+IjmNUuTXgXNfQLkMLf76FazxTesXhLu7ittBq9lGs7S5/GQaJ8QTMgzC
TddmGnsS6C774id02yqhg4QU04zGQQ66amxkeAcdylaQZlK8e7U4UwKtXHq4UTDU
X79NmH2oYOE6keq6GYZ7r1KsmfOMD0flHA6+vuq2Lak8PEHms/OlHvQtyNmA7DTE
YUYAzmBzh+zGmq5dbWloNGsJgmdgdcXh6x8eIMDiCDiCo4JKekDXNlY0f/G7wLuh
3U5d9Ud/q2VmgXeCMLkCzKR7o9F1p4ym3MLLM2Up9GevfInfJwTih6XyvtW8WKyR
GdU4RbkyizlI7hiqcmOyBJR1b0Ypcw==
=E/Qm
-----END PGP SIGNATURE-----

--7tubSUVrD+xV4Inh--

--===============1577908180762306288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1577908180762306288==--
