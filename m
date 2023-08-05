Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CB7C04A6A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Aug 2023 15:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1265E8144A;
	Sat,  5 Aug 2023 15:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1265E8144A
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P8fUHnO6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M89AVCO_-ONb; Sat,  5 Aug 2023 15:01:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E5AB981EB1;
	Sat,  5 Aug 2023 15:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5AB981EB1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE40FC0071;
	Sat,  5 Aug 2023 15:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8DA8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 15:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8112F8138F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 15:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8112F8138F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qjce72kGr0g8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 15:01:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE8BA81EB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Aug 2023 15:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE8BA81EB1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D5F20601D0;
 Sat,  5 Aug 2023 15:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAEDC433C7;
 Sat,  5 Aug 2023 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691247683;
 bh=iqhG8zGnNgHzhhKVF57pGLW7oa5B2TIRYJfd06foZsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P8fUHnO6NtIYmR+u9iacqVv2PiVwUn9y7CbG1l1BvcoL9uBRBCusmvcTaC5YTtNOn
 oaDLciEJoNTzX0aI+vX16OtUdwTWYq5u0qJF1ACTMogexmJBbQpM1FpOMKMIKwwSe8
 RmY1rf978zigt1XWRX3iZBF3Z1kJlPtCR6yMlmEIblhk98d1AhT4lHE1RocYNy/scZ
 Rl8M9cWh3lwCkNqcXMSF4xsyiyl9IAzKxJJSRHvku28nzItZe//MYZixRrIF/60u7a
 47Vm0Ue4kJjHsr0vVMhL4nYQW2/B3uPC1RL9kbbxJXFZ5wYyd2szPX0kFsolsLIPvx
 NCYY2VQ5AXa5A==
Date: Sat, 5 Aug 2023 16:01:20 +0100
From: Mark Brown <broonie@kernel.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH v2] fixes warning
Message-ID: <ZM5kQPFLx/uTRq5z@finisterre.sirena.org.uk>
References: <20230804200711.65750-1-coolrrsh@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230804200711.65750-1-coolrrsh@gmail.com>
X-Cookie: Give him an evasive answer.
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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
Content-Type: multipart/mixed; boundary="===============8074729288585148108=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>


--===============8074729288585148108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EYufw1NlEPPk6xU4"
Content-Disposition: inline


--EYufw1NlEPPk6xU4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 05, 2023 at 01:37:10AM +0530, coolrrsh@gmail.com wrote:

> Typecasting the interrupt number from "unsigned int" to "signed int" to compare with 0(signed int by default).
> Declaring interrupt number as "signed int" would violate kernel standards. So typecasting is the possible approach.

Why would it violate kernel standards?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--EYufw1NlEPPk6xU4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTOZD8ACgkQJNaLcl1U
h9BmHgf8CEAFiUgsAeNYJEC3VIeduqopElmrsctoybd2GEGTBydlWEPVwpAJSst8
NFEQbJL+/bquNjFbwEz5Tavq9G5XvqRHaPiyg7qUrr4TuSD92poX+yjzjtWvhSp8
0u4/FMa/b0Y+VcXMSduGtbrjuKudXUMbauzAuLcetATRwTldXhhWdSwTW6zJdlcx
T9nJd3v0XyuNjzcQP26U+gJJdj0TDlboPX4YTroxg5mQPM7UX2QoSxVa/6SqZERb
1WfdlHF37IrisajIUOi4RR3TpAb81LsW38MOVAd4a0yNos6luIZA/qHUjibTSDci
lCSl2RnvkZThEyuEnFfvlTsqdOJVCQ==
=kOe8
-----END PGP SIGNATURE-----

--EYufw1NlEPPk6xU4--

--===============8074729288585148108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8074729288585148108==--
