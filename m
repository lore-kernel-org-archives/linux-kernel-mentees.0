Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F2241E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mb8+WjAM"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9E642D20
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 15:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9E642D20
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mb8+WjAM
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g9XEO4wTtiYq
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri, 22 Dec 2023 15:27:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 94D9E42D1A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 15:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D9E42D1A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 50903B8235A;
	Fri, 22 Dec 2023 15:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDD9C433C8;
	Fri, 22 Dec 2023 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703258860;
	bh=mric/lmzfirQKK3VimVwUxUikQJ+5ehDBdufnZS/Evs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mb8+WjAM5GCoxU8wGkpM0Z/bj4lVn1AVfjdMKnKleeEJjF0etVklkTODCXeXDscxW
	 fAosX+182tQTt+kRQidLoTF9Txzp+mFmRLfx4M425PvigrNudFICkWCw2dRK/FH1gt
	 A4xcv0c/eb/K5mcXSLdIinmaoUmxKstYub3jjSDSHXkI/cI8lep4aQMUzEGE6bOZPn
	 1dE5m/XH1EnWwhl04L60iKZJpJG2w5YbY5XAEiYPBmduWjnZeQdX31zwKZS10EA6J7
	 GvWQuCXYDBXDLQ2QMNfS5s1Dy+DQRrAaAKTrdxymvt8lq0TFm1gKhOrmnDzYcopZJr
	 QvTnEkUIjC04Q==
Date: Fri, 22 Dec 2023 15:27:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Petre Rodan <petre.rodan@subdimension.ro>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/2] dt-bindings: iio: pressure: honeywell,mprls0025pa
Message-ID: <20231222-thread-secret-d8b49c896249@spud>
References: <20231219130230.32584-1-petre.rodan@subdimension.ro>
 <20231219130230.32584-2-petre.rodan@subdimension.ro>
 <20231220151645.16ada807@jic23-huawei>
 <ZYMjhfAbWfw9vUdd@sunspire>
 <20231221110417.0bd5b002@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ba29eN3gYKwLHH9V"
Content-Disposition: inline
In-Reply-To: <20231221110417.0bd5b002@jic23-huawei>


--Ba29eN3gYKwLHH9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 11:04:17AM +0000, Jonathan Cameron wrote:
> On Wed, 20 Dec 2023 19:25:25 +0200
> Petre Rodan <petre.rodan@subdimension.ro> wrote:
>=20
> > hi Jonathan,
> >=20
> > On Wed, Dec 20, 2023 at 03:16:45PM +0000, Jonathan Cameron wrote:
> > > On Tue, 19 Dec 2023 15:02:20 +0200
> > > Petre Rodan <petre.rodan@subdimension.ro> wrote: =20
> > > >    honeywell,pmin-pascal:
> > > >      description:
> > > >        Minimum pressure value the sensor can measure in pascal.
> > > > +      To be specified only if honeywell,pressure-triplet is set to=
 "NA". =20
> > > That just added a backwards compatibility break.  It would be fine
> > > if there was a default: NA for honeywell,pressure-triplet or a check =
that either
> > > one or the other was supplied (which I'd prefer).  Thus old bindings =
will work
> > > and new ones also supported. =20
> >=20
> > ok, I see your reasoning. but in this second scenario that you prefer h=
ow can we
> > propery define the 'required:' block? an equivalent to
> >=20
> > required:
> >   - compatible
> >   - reg
> >   - (honeywell,pmin-pascal && honeywell,pmax-pascal) || honeywell,press=
ure-triplet
> >   - honeywell,transfer-function
>=20
> Yes, it would end up something like that.  There are exclusive or example=
s in tree.
> I think something like dac/adi,ad3552r.yaml
>  should work.
>=20
> oneOf:
>   - required:
>       - honeywell,pmin-pascal
>       - honeywell,pmax-pascal
>   - required:
>       - honeywell,pressure-triplet
>=20
> but you will want to try all the cases to make sure that works (my abilit=
y to
> figure these ones out is tricky).
>=20
> + you ideally want to exclude them all being set which is fiddlier.
>=20
> Some similar examples but they are based on a value in the property. I'm =
not
> sure how you check for it just being defined.
>=20
> Something along lines of.
>=20
> allOf:
>   - if:
>       properties:
>         honeywell,pressure-triplet
>     then:
>       properties:
>         honeywell,pmin-pascal: false
>         honeywell,pmax-pascal: false
>=20
> Might work?  I always end up trawling the kernel to find a similar exampl=
e for cases but
> can't find anything closer right now.

I hate to admit it, but I'm not great at expressing these in the minimum
forms either, but I think you're missing a "required" from here, in place
of the "properties":
allOf:
  - if:
      required:
        - honeywell,pressure-triplet
    then:
      properties:
        honeywell,pmin-pascal: false
        honeywell,pmax-pascal: false

Cheers,
Conor.

--Ba29eN3gYKwLHH9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYWq6AAKCRB4tDGHoIJi
0sGFAQCS3lpqDDVpd0E7HfIT4+N4EHkkAJryhPfoBZyl0+bDSgEA5odFWMtIApkV
9fU4oaAh5VlqUtiwBtY1OCUWX+omLQ4=
=2QDc
-----END PGP SIGNATURE-----

--Ba29eN3gYKwLHH9V--
