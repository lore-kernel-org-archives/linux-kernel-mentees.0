Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CEE2874F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811859; cv=none; b=LIMpQFSPSGnNNK3rDhs+kQrJxWXuuYsiSg2G5AV/Q3rTpYuPWWkDPJZ7yGyxBHXMLIR2rmldO8uJMl1CZQI+r1lunap7S3FF5fg22n9gRk4fsyh89SGyIhrdAh2Y2NR4mHR3Gq2MZMZjBALseJOsj0hK2y0EINlPSDAzmRGikII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811859; c=relaxed/simple;
	bh=/ty/vVkt74iKPXOsP7kI5bxNFsiih+atHcD6arkGgaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iq2NV0hjzDCRq/+yBfM2JTEIgt1ORE3+F/9sO0KOqaOpVjYL0kr/wzSbiJtPmlqMm9MR8k1ZxtjSUSSqPNAWEj4CXmuBpzbjm25xltVEuWHMg18eF6DD7zPxSc1Hu9MAHkaBE2Tnll5x4TA8Pcr1IGf6+q0neDkl8HgEh91b58A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW9mUdlD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW9mUdlD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597A0415E2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5t-rhTHsQWR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 21:30:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C665B415CE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C665B415CE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LW9mUdlD
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C665B415CE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 21:30:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F7D35C5903;
	Thu, 21 Aug 2025 21:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC2AC4CEEB;
	Thu, 21 Aug 2025 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755811855;
	bh=/ty/vVkt74iKPXOsP7kI5bxNFsiih+atHcD6arkGgaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW9mUdlDSGZ+grjKxbSX+AifJztORJQOb1dSeDbgHwiwmQZNgdGl5UHApou6TLyQ/
	 FvpG+3V9fQxQ9Kg6rkc8EssNSNWz2GXdmwiqS7oT7vf/lO+0PZJoM7iiBlFDDYffMC
	 vSLssyLMUr6hA92WxQwpM+P0a/lamHbRXvbiDSbO3+l1BAEQDtl8UhdIMQHhLqHMS8
	 DUH3juTT7zbBRixz0rsprBs/UNsFmXyA6TYQ57HPmYQ/0Uft5Pz10zdO58Dvro8sR/
	 lHSitmXV0Eh7BkhJWEprfSOwqAG6KgGtgbfTT8wGKoNiBquFvVtGUuLZr0plL98/Vf
	 6PEyCVfjLtC8Q==
Date: Thu, 21 Aug 2025 22:30:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Nikola Ivanov <zlatistiv@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, shuah@kernel.org,
	linux-sound@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] selftests/alsa: remove 0/NULL global variable assignment
Message-ID: <f7ff446f-2a9e-49dc-af7a-6e4c76803471@sirena.org.uk>
References: <20250821200132.1218850-1-zlatistiv@gmail.com>
 <9c310ab7-0f0b-412f-8df7-71730a2d2caa@sirena.org.uk>
 <CAHjv_as7m7UbSLAPU6hX_=tAvLZYR_7Q=1n+Xq-nW-6OJ237PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wXnrCk0mND4j2nmE"
Content-Disposition: inline
In-Reply-To: <CAHjv_as7m7UbSLAPU6hX_=tAvLZYR_7Q=1n+Xq-nW-6OJ237PA@mail.gmail.com>
X-Cookie: Warp 7 -- It's a law we can live with.


--wXnrCk0mND4j2nmE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 22, 2025 at 12:17:14AM +0300, Nikola Ivanov wrote:
> On Thu, Aug 21, 2025 at 09:49:29PM +0100, Mark Brown wrote:

> > > -int num_cards = 0;
> > > -int num_controls = 0;
> > > -struct card_data *card_list = NULL;
> > > -struct ctl_data *ctl_list = NULL;
> > > +int num_cards;
> > > +int num_controls;
> > > +struct card_data *card_list;
> > > +struct ctl_data *ctl_list;

> > Nothing now sets initial values for these variables so they all have
> > undefined values which is buggy.  The code is relying on the default
> > values.

> Checkpatch reports it as an error, it looks to be part of the C
> standard that all compilers must initialize globals to 0.
> Though I suppose it helps with readability to see
> the num_ counters assigned 0.

Do you have a reference there, note that these are just plain non-static
variables?  I wouldn't trust checkpatch for anything that isn't kernel
code (and even there it's got issues).

--wXnrCk0mND4j2nmE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAminkAoACgkQJNaLcl1U
h9Ch0Qf7BQo2dqPlUT7IzMvCZC9WzUrMkweHu+WVhf8d5Zkyb0EIaj1SuQqcxCxN
030Alv6gWo+vWae3AOV+uRCfZ23AC4sATuUdHXTP2rq2pD5rWGhOOw04GcItAgnU
I2Hso7PI/VvVh83VeGfR/rtgJc1+EcVzkOUnCz1Zbmy8rxDJlhxRiWZr9wb+OaZQ
uEbP247E29lUdKuG1enVqcxAy6qedKa+zfjwuFPs9M1Jsr2vMkyLyiOBcQFwpYDo
OhF//Lb5chZrQszhr1RYuF5nEjuJYueKumw7IqxZkUwDToUxSPa0c9gBtCDCrsPl
JnwKwwjDjBV0EC+n94ryHvctoFxXvQ==
=qDLL
-----END PGP SIGNATURE-----

--wXnrCk0mND4j2nmE--
