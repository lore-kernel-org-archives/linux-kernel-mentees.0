Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5D3655E5;
	Mon, 22 Jun 2026 07:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113254; cv=none; b=A/9aedeF1g9/Dg1ZUFWGsygw72G+/BO4qjBtkIn9wtVMDg1mVl7iWaKaiybKJ5TVcorKBcb7ihwXAr6m5BegCsrvVJq5FERIaOV6yGo9w3DMVxApulClL9cTZHVgxBMnBQyXdjsWSD3giPfOga9BX96O2oxOzUYHxF26Ft87eXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113254; c=relaxed/simple;
	bh=Dhih4u6qHgiZNyqOHHiLJRf1kt4mdzb5cp4alEbmWV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rz1euFg75wjnDoMiWoZzbROcgJDaQbtZD8KuDyH08ruBV0KOsXOayBBbWYZ6rQ0166DkuiBxCSsxlQHfcajl99DUoeCZUx84mInH5ULbLJGjYitEY/xMx8ygemATbSQu7Jx2WNTxmFUxGGc4Q04dmEdBiJfT0IAof4jaihFqOEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffjPSvkF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffjPSvkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D106D1F000E9;
	Mon, 22 Jun 2026 07:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113252;
	bh=NgN6RTq8zSwqE1eU3ABQ5JBArgsCushzNFmwojjYw0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ffjPSvkFdi24lwbke4pqySkkNhbx53lhZRNYTy6cItpMIPSVcvaOJoDDfixXu4BfR
	 FvM1PuTonPm/MHvnjEpiAwqWMxOjhoeD7f9BSro40la05U3wCyjB4o9YtW01t7oivy
	 +9jBa0SW6FXFHccD1l1y+3nWNg4+M84OyU8aq6U0U/oexu9LxA/MtkSNTZ5MVkiYPd
	 dFDnOT8DTocd98jbVL6d5OkNdNozHruVMKC47BMzz4J3uT5T5Yt7XbAsPttNFWzuGf
	 OBbZOgiGwlMxXbDgR5o/44qzAjWz4gTBChpAE4D55r1rdZp0iF6d1VEa2806GLGncq
	 S6IZvGQj4HUkw==
Message-ID: <3121288e-fa1f-42e1-95cb-0dd7e491213b@kernel.org>
Date: Mon, 22 Jun 2026 16:27:28 +0900
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs/mm: fix documentation warning for GFP parameter in
 kmalloc_obj, kmalloc_objs and kmalloc_flex
To: Jakov Novak <jakovnovak30@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20260619113622.11712-1-jakovnovak30@gmail.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260619113622.11712-1-jakovnovak30@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ziDE6CTIcIY9ynMXidyxEyNP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ziDE6CTIcIY9ynMXidyxEyNP
Content-Type: multipart/mixed; boundary="------------uWzkArt3zftxILELT3ooxlUi";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Jakov Novak <jakovnovak30@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <3121288e-fa1f-42e1-95cb-0dd7e491213b@kernel.org>
Subject: Re: [PATCH] Docs/mm: fix documentation warning for GFP parameter in
 kmalloc_obj, kmalloc_objs and kmalloc_flex
References: <20260619113622.11712-1-jakovnovak30@gmail.com>
In-Reply-To: <20260619113622.11712-1-jakovnovak30@gmail.com>

--------------uWzkArt3zftxILELT3ooxlUi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/19/26 8:36 PM, Jakov Novak wrote:
> Compiling the documentation currently gives the errors:
>=20
> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' de=
scription in 'kmalloc_obj'
> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' de=
scription in 'kmalloc_objs'
> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' de=
scription in 'kmalloc_flex'
> WARNING: ./include/linux/slab.h:1100 Excess function parameter 'GFP' de=
scription in 'kmalloc_obj'
> WARNING: ./include/linux/slab.h:1112 Excess function parameter 'GFP' de=
scription in 'kmalloc_objs'
> WARNING: ./include/linux/slab.h:1127 Excess function parameter 'GFP' de=
scription in 'kmalloc_flex'
>=20
> This effectively omits the GFP parameter from the current kernel
> documentation. This patch marks the "..." parameter with the previous
> description of the GFP parameter along with an "optional" tag in
> parantheses.
>=20
> Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>

Hi Jakov, thanks for the patch!

For your information, Randy Dunlap already fixed this issue [1] and it
is queued to slab/for-next [2].

[1]
https://lore.kernel.org/all/20260617163125.2716279-1-rdunlap@infradead.or=
g/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?h=
=3Dslab/for-next&id=3D7b5f5865fb11e60edd03c5e063e2d228b7062317

> ---
>  include/linux/slab.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index d4a873a16289..ee952784a150 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -1093,7 +1093,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags=
, int node);
>  /**
>   * kmalloc_obj - Allocate a single instance of the given type
>   * @VAR_OR_TYPE: Variable or type to allocate.
> - * @GFP: GFP flags for the allocation.
> + * @...: GFP flags for the allocation (optional).
>   *
>   * Returns: newly allocated pointer to a @VAR_OR_TYPE on success, or N=
ULL
>   * on failure.
> @@ -1105,7 +1105,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags=
, int node);
>   * kmalloc_objs - Allocate an array of the given type
>   * @VAR_OR_TYPE: Variable or type to allocate an array of.
>   * @COUNT: How many elements in the array.
> - * @GFP: GFP flags for the allocation.
> + * @...: GFP flags for the allocation (optional).
>   *
>   * Returns: newly allocated pointer to array of @VAR_OR_TYPE on succes=
s,
>   * or NULL on failure.
> @@ -1118,7 +1118,7 @@ void *kmalloc_nolock(size_t size, gfp_t gfp_flags=
, int node);
>   * @VAR_OR_TYPE: Variable or type to allocate (with its flex array).
>   * @FAM: The name of the flexible array member of the structure.
>   * @COUNT: How many flexible array member elements are desired.
> - * @GFP: GFP flags for the allocation.
> + * @...: GFP flags for the allocation (optional).
>   *
>   * Returns: newly allocated pointer to @VAR_OR_TYPE on success, NULL o=
n
>   * failure. If @FAM has been annotated with __counted_by(), the alloca=
tion

--=20
Cheers,
Harry / Hyeonggon


--------------uWzkArt3zftxILELT3ooxlUi--

--------------ziDE6CTIcIY9ynMXidyxEyNP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajjj4AAKCRCGXBN6rc5S
1i28AP9kZ/R5pJglLW7vQ3k/JRuXXtw1sVO8AuErHMquPp6JHAEA89I0Mn4aL1z3
2/mnej3IuOHwj/PvVf8Y2GEoesHeCAI=
=T/7b
-----END PGP SIGNATURE-----

--------------ziDE6CTIcIY9ynMXidyxEyNP--
