Return-Path: <SRS0=QHLe=6W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A893C35280
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 00:14:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C67A208CA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  8 May 2020 00:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DBt7o0ZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C67A208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B50483641;
	Fri,  8 May 2020 00:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bu4-yAkt90XP; Fri,  8 May 2020 00:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48267838D9;
	Fri,  8 May 2020 00:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F614C0865;
	Fri,  8 May 2020 00:14:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB819C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AEEDE82157
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mIs5CuMDQncw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:14:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 858A08347D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2020 00:14:09 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49J9mW64lkz9sRf;
 Fri,  8 May 2020 10:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1588896844;
 bh=5JVunjKKLRhUSNnnqzV1JmO8bxvGIcNPJwEqJeM9ZSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DBt7o0ZOxEL1jBrKW5SujOI9MKaROriVgIo426I6egRbjzkgMm6JiQa19OD1PYEoh
 1rr3QHTUKXhoRXgDXRj99NYJb8bvZpnusU/kirSDt9J2EqFPd2bmANxvhrqTxQY4Or
 CLHV3GYTolkmOe9eh5Qy+6IJP6uMbUeFFZe2eEyrl42A1BEajRs80MfDq2VSngl8yp
 09YoNTVDcaykm+tSrLrM6BIJP3og6UjCVDbY8/rPbwyYbuChfkG72qMJulBaSGI/58
 vTKVaKU6DQ6EcjfGwcHkilWvVnmALULkTdX0KnnVN9IQP/kRCIv41FbipeUDQtoHQG
 KgvJN7TCqMJhg==
Date: Fri, 8 May 2020 10:14:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: madhuparnabhowmik10@gmail.com
Message-ID: <20200508101402.267ca0f2@canb.auug.org.au>
In-Reply-To: <20200430160205.17798-1-madhuparnabhowmik10@gmail.com>
References: <20200430160205.17798-1-madhuparnabhowmik10@gmail.com>
MIME-Version: 1.0
Cc: paulmck@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 joel@joelfernandes.org, linux-integrity@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, serge@hallyn.com
Subject: Re: [Linux-kernel-mentees] [PATCH] integrity: evm: Fix RCU list
	related warnings.
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
Content-Type: multipart/mixed; boundary="===============0429741262967751197=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0429741262967751197==
Content-Type: multipart/signed; boundary="Sig_/UbniLlvkEYP3TYb2kyVKYqX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UbniLlvkEYP3TYb2kyVKYqX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Apr 2020 21:32:05 +0530 madhuparnabhowmik10@gmail.com wrote:
>
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>=20
> This patch fixes the following warning and few other
> instances of traversal of evm_config_xattrnames list:
>=20
> [   32.848432] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   32.848707] WARNING: suspicious RCU usage
> [   32.848966] 5.7.0-rc1-00006-ga8d5875ce5f0b #1 Not tainted
> [   32.849308] -----------------------------
> [   32.849567] security/integrity/evm/evm_main.c:231 RCU-list traversed i=
n non-reader section!!
>=20
> Since entries are only added to the list and never deleted,
> use list_For_each_entry_lockless() instead of
> list_for_each_entry_rcu() for traversing the list.
> Also, add a relevant comment in evm_secfs.c to indicate this fact.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>
> ---
>  security/integrity/evm/evm_crypto.c | 2 +-
>  security/integrity/evm/evm_main.c   | 4 ++--
>  security/integrity/evm/evm_secfs.c  | 9 ++++++++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/security/integrity/evm/evm_crypto.c b/security/integrity/evm=
/evm_crypto.c
> index 35682852ddea..b2dc87da5f50 100644
> --- a/security/integrity/evm/evm_crypto.c
> +++ b/security/integrity/evm/evm_crypto.c
> @@ -207,7 +207,7 @@ static int evm_calc_hmac_or_hash(struct dentry *dentr=
y,
>  	data->hdr.length =3D crypto_shash_digestsize(desc->tfm);
> =20
>  	error =3D -ENODATA;
> -	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
> +	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
>  		bool is_ima =3D false;
> =20
>  		if (strcmp(xattr->name, XATTR_NAME_IMA) =3D=3D 0)
> diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm/e=
vm_main.c
> index d361d7fdafc4..0d36259b690d 100644
> --- a/security/integrity/evm/evm_main.c
> +++ b/security/integrity/evm/evm_main.c
> @@ -97,7 +97,7 @@ static int evm_find_protected_xattrs(struct dentry *den=
try)
>  	if (!(inode->i_opflags & IOP_XATTR))
>  		return -EOPNOTSUPP;
> =20
> -	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
> +	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
>  		error =3D __vfs_getxattr(dentry, inode, xattr->name, NULL, 0);
>  		if (error < 0) {
>  			if (error =3D=3D -ENODATA)
> @@ -228,7 +228,7 @@ static int evm_protected_xattr(const char *req_xattr_=
name)
>  	struct xattr_list *xattr;
> =20
>  	namelen =3D strlen(req_xattr_name);
> -	list_for_each_entry_rcu(xattr, &evm_config_xattrnames, list) {
> +	list_for_each_entry_lockless(xattr, &evm_config_xattrnames, list) {
>  		if ((strlen(xattr->name) =3D=3D namelen)
>  		    && (strncmp(req_xattr_name, xattr->name, namelen) =3D=3D 0)) {
>  			found =3D 1;
> diff --git a/security/integrity/evm/evm_secfs.c b/security/integrity/evm/=
evm_secfs.c
> index 39ad1038d45d..cfc3075769bb 100644
> --- a/security/integrity/evm/evm_secfs.c
> +++ b/security/integrity/evm/evm_secfs.c
> @@ -232,7 +232,14 @@ static ssize_t evm_write_xattrs(struct file *file, c=
onst char __user *buf,
>  		goto out;
>  	}
> =20
> -	/* Guard against races in evm_read_xattrs */
> +	/*
> +	 * xattr_list_mutex guards against races in evm_read_xattrs().
> +	 * Entries are only added to the evm_config_xattrnames list
> +	 * and never deleted. Therefore, the list is traversed
> +	 * using list_for_each_entry_lockless() without holding
> +	 * the mutex in evm_calc_hmac_or_hash(), evm_find_protected_xattrs()
> +	 * and evm_protected_xattr().
> +	 */
>  	mutex_lock(&xattr_list_mutex);
>  	list_for_each_entry(tmp, &evm_config_xattrnames, list) {
>  		if (strcmp(xattr->name, tmp->name) =3D=3D 0) {

I will apply this to linux-next today.

Is there something stopping this being applied to a tree?  And does it
need to be sent to Linus soon?
--=20
Cheers,
Stephen Rothwell

--Sig_/UbniLlvkEYP3TYb2kyVKYqX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60pEsACgkQAVBC80lX
0GyT5gf5AV5sKJWc2s7DxIUwzMEtqo3i5TLKBASh2pPvMzQssGl/56WFeynwk+fJ
V00jxnjGGSBEj5KGnDo2tv4nakQx+dPkZnQjnnUIwszwjglf8/ByYCWAKL2uNL3t
0KzD4LMyjkF/DSPHGxHR1a/nP1vVCj6QHfejkPffplGop6RZYXjaCHRSY3llwP8W
CL990yw2YuKSvHDiMNo3/oWRaOU6PWgJPXrjsFvAkXZBRQnU0xNTX4F/yvp/6k8q
VHwrGiHGfpmdbdBcoQGbd6fye0X/dTkf/v6Ev5rsw1qEp/vscYWG8jRTK/h1FC66
u+jm+K5/l6nBsEKs6psFZBCwCBB1zQ==
=tSJR
-----END PGP SIGNATURE-----

--Sig_/UbniLlvkEYP3TYb2kyVKYqX--

--===============0429741262967751197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0429741262967751197==--
