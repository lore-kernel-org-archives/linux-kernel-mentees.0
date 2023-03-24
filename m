Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D53C6FD1C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Mar 2023 16:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9EF60B06;
	Fri, 24 Mar 2023 16:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA9EF60B06
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FC/7deq4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ8SmaYEXFCk; Fri, 24 Mar 2023 16:33:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 405FB606EC;
	Fri, 24 Mar 2023 16:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 405FB606EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A146C0071;
	Fri, 24 Mar 2023 16:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73F01C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 16:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46192415D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 16:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46192415D5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=FC/7deq4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sREIb9aJlOSy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 16:33:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF684159D
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EF684159D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Mar 2023 16:33:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BF430B82548;
 Fri, 24 Mar 2023 16:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0E5C433EF;
 Fri, 24 Mar 2023 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679675601;
 bh=f1wFCUhAyXmbjBDZI6rgUcj7zWfbRRwTxc3RfY86ezk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FC/7deq4Xgdi9t4bCIgu8hWxH21V1+6YRLtGHNy4z2UPjNeD9FnywiSZlv+HKW/Dr
 EM8SPtwy2mLp0wk+GEQV1ASli7PGoRCY/TBugONItUmwLnJ4h4H41mcFFQ4XN/p2YY
 /lWPruX8WjmraohZ8Z74pcs8JRb7taOfLKPv6zyc7F893xV5oNrNr7STV0CUx7toy4
 kR0tK/G08jwNx/kJB9HOR+vwF0m5uuFfWo2X1gjmx+0YCBuJ+7Z+H8i7QDNGbEpEbB
 c+VBhkxEVNMf5mdt/duMe/mouSXN/KBnG8Kpg/vlmpXaLNMwLrhVe+DzU6szh2rCPf
 O/JSXSjdRtJIg==
Date: Fri, 24 Mar 2023 16:33:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Heinrich <hallo@alexanderheinrich.de>
Subject: Re: [PATCH v2] kselftest/alsa: Fix -Wformat compiler warnings
Message-ID: <ZB3Qzes5fpFhmazb@sirena.org.uk>
References: <20230324160158.4076-1-hallo@alexanderheinrich.de>
MIME-Version: 1.0
In-Reply-To: <20230324160158.4076-1-hallo@alexanderheinrich.de>
X-Cookie: Single tasking: Just Say No.
Cc: tiwai@suse.de, linux-kernel-mentees@lists.linuxfoundation.org,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, perex@perex.cz
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
Content-Type: multipart/mixed; boundary="===============0899316501884803686=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============0899316501884803686==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eKo8yaINNsrYcS+7"
Content-Disposition: inline


--eKo8yaINNsrYcS+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 24, 2023 at 05:01:58PM +0100, Alexander Heinrich wrote:

> For the string to int conversion functions, the return values for the test cases
> in pcm-test.conf are non-negative and in the range of unsigned int, so I just
> cast them to unsigned int.

That sounds like you're masking some issue rather than fixing it,
but...

> Please let me know if I can further improve on my patch (it is my first)!

It might be easier to split the different kinds of change up into
separate patches, it'd make it easier to follow what's going on.

> +				phys_width = snd_pcm_format_physical_width(format);
> +				if (phys_width < 0)
> +					ksft_exit_fail_msg("Unknown PCM format\n");
>  				samples = realloc(samples, (rate * channels *
> -							    snd_pcm_format_physical_width(format)) / 8);
> +								  (unsigned int)phys_width) / 8);

...this isn't a formatting function, it's realloc()?

--eKo8yaINNsrYcS+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQd0M0ACgkQJNaLcl1U
h9B5FAf8DDOY2qRM0ARpoXbWW4oA9UFmVb0fMB/TAKue7xi+hEil4hnO7X27wNAV
VaRx7hpF+t0hrQY/LzGgiHOv7KSznAQ9AcWHaqezkTaIfu8E3t1Fr5/e6K5RCE10
9NykMDrgQsE5djIteJrj4mt7A8YVI1rWR8d9FtCPvRnj1jFqRqBM7bQKJZNI6H3i
hoH0l3NnxIVk6Mj1lzboOqg24aixO5HAjn06Ja+j237LkaGytGmQsvcy7NGrN0cq
1Qxb3QdFo8tq35gFwCQHhUFDhtpIX5v7PQyNg1xObtTJ57shfyuHZWPZAxO4YC9q
A15jbE6OAiTrehs5NsCD2/T5sLFspg==
=Cajr
-----END PGP SIGNATURE-----

--eKo8yaINNsrYcS+7--

--===============0899316501884803686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0899316501884803686==--
