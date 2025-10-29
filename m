Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1471D3546EB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761759995; cv=none; b=h7TVaqvwvU53qgPJPhbaSjC0y0mOPaT+bbnV7LtrWYY0NZREh0goxDtfkBAgdbUpi2+nT6NbKTujCM6hw9t75ZSJevIVtfKvS1A9n7QdTStLhlacbZmEyMQA7S70us3hcUpST6xVBaT2BOsOKoPf+hcJDnx9k8gZWJ58+SpDaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761759995; c=relaxed/simple;
	bh=0GcNG07yBfRtnGSr93AMWW49CLvHPWSaS1nz2iKTswE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQVEiryZ8666wg80r2g830kUcosPcDhb0mLbDAYUGTttviR4HSrnflAR/MmIf48PpVyoW8l84Vt9sTmLEa1XuZkBcGQ1ntNePPos8uSmXfae8VhYE8Cfh3F44jz+ZocqItgyKYin2Nju6oTuSac4dVG8h41zfyRIHsySKLadl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0p2IDbB; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0p2IDbB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5BBA82430
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.792
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yw-6D37J13EY for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Oct 2025 17:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=conor@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0C29582425
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C29582425
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K0p2IDbB
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0C29582425
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Oct 2025 17:46:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49D7C621D3;
	Wed, 29 Oct 2025 17:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789BBC4CEF7;
	Wed, 29 Oct 2025 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759991;
	bh=0GcNG07yBfRtnGSr93AMWW49CLvHPWSaS1nz2iKTswE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0p2IDbBJqpJmwtIeTEVsnYo0QJpsjZlqe1ZVIHj4PHCg86HDJmARAUin1VkOSR70
	 D+3GDz6085YArZjjDr5ZVy6oQiWazCfDa4kL5PZBZ+ei2Wxm8R5jcxF490I/id3K9D
	 inYQ+eDKiEBR+N3CsJqJBau+xaU42c+ZZLTCByn0PASfGZ6+V06JxSEukSFHWGsRXa
	 zVjZsZuBxs5Xkx+eKbCIq4fPurn122eBVrzpo6Kypo6nLI82svx11KeM1tmdEFa+q1
	 4tmaDL7xXdm9eitduCY3gPIm/j/wzqxxe1Wvm+yihqbX7o1MF4yHilK7GAYyIoe6NV
	 MpD3kNvRFiBnA==
Date: Wed, 29 Oct 2025 17:46:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v3] dt_bindings: sound: ti,pcm186x: convert to dtschema
Message-ID: <20251029-figure-greeting-d2cd3b0106e1@spud>
References: <20251029-dtbs-v3-1-3cc162221c22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQDXzErXS/p83zou"
Content-Disposition: inline
In-Reply-To: <20251029-dtbs-v3-1-3cc162221c22@gmail.com>


--wQDXzErXS/p83zou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 10:53:04AM +0530, Ranganath V N wrote:
> convert the Texas Instruments PCM186x Universal audio ADC bindings
> to DT schema.
>=20
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm186x.yaml b/Do=
cumentation/devicetree/bindings/sound/ti,pcm186x.yaml

> +properties:
> +  compatible:
> +    enum:
> +      - ti,pcm1862
> +      - ti,pcm1863
> +      - ti,pcm1864
> +      - ti,pcm1865

Usually we want the filename to match one of compatibles in the file,
rather than have wildcards.

Secondly, the subject is not really as expected for a binding, let alone
one in sound. It should be "ASoC: dt-bindings: ".

With those,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

--wQDXzErXS/p83zou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJS8gAKCRB4tDGHoIJi
0rY5AP9FCapP66GaWKhNgK2JNY0tM15uxn+NOJSXtxCTv+QGOwD/dW/JxlxLLUX0
JndN1+H6zOApYCqy9BE00Jy5enqN/Qw=
=tUb6
-----END PGP SIGNATURE-----

--wQDXzErXS/p83zou--
