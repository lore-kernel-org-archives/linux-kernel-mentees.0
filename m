Return-Path: <SRS0=axgb=4X=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F573C3F2D5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 07:17:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DC32073D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Mar 2020 07:17:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="YKaxSYI6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DC32073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3DB687D6E;
	Fri,  6 Mar 2020 07:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fDvxlAWuous1; Fri,  6 Mar 2020 07:17:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4EE7887D0E;
	Fri,  6 Mar 2020 07:17:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 379D2C18D3;
	Fri,  6 Mar 2020 07:17:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86C7DC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 07:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 70F07867A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 07:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WhgeC2LnHTe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 07:17:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 152B786781
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Mar 2020 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1583479025;
 bh=E/mu8G35dCkLAsTEx8zbO4YazrvfaubIoESF6EWFlH0=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=YKaxSYI6Xp7j/M1CInhTuPdbcWpcCsKSGXnF+nFf5Yi31X1mUygkweuRZehbPEhuN
 5LF7mvpsKl0+TwSp8RrQjwZgfaxvEEwaHBOKSk5vg0irQMMIMvYU4tCp2yuqWQwFIc
 CwSb1hr5jdDuKikWTfgTa5BzghGTFrneBJlNfVbI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MI5Q5-1j72wx1xt1-00F9KM; Fri, 06
 Mar 2020 08:17:05 +0100
To: madhuparnabhowmik10@gmail.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com
References: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; prefer-encrypt=mutual; keydata=
 mQENBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAG0IlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT6JAU4EEwEIADgCGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1oQAKCRDC
 PZHzoSX+qCY6CACd+mWu3okGwRKXju6bou+7VkqCaHTdyXwWFTsr+/0ly5nUdDtT3yEVggPJ
 3VP70wjlrxUjNjFb6iIvGYxiPOrop1NGwGYvQktgRhaIhALG6rPoSSAhGNjwGVRw0km0PlIN
 D29BTj/lYEk+jVM1YL0QLgAE1AI3krihg/lp/fQT53wLhR8YZIF8ETXbClQG1vJ0cllPuEEv
 efKxRyiTSjB+PsozSvYWhXsPeJ+KKjFen7ebE5reQTPFzSHctCdPnoR/4jSPlnTlnEvLeqcD
 ZTuKfQe1gWrPeevQzgCtgBF/WjIOeJs41klnYzC3DymuQlmFubss0jShLOW8eSOOWhLRuQEN
 BFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcgaCbPEwhLj
 1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj/IrRUUka
 68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fNGSsRb+pK
 EKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0q1eW4Jrv
 0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEvABEBAAGJ
 ATwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCXZw1rgUJCWpOfwAKCRDCPZHz
 oSX+qFcEB/95cs8cM1OQdE/GgOfCGxwgckMeWyzOR7bkAWW0lDVp2hpgJuxBW/gyfmtBnUai
 fnggx3EE3ev8HTysZU9q0h+TJwwJKGv6sUc8qcTGFDtavnnl+r6xDUY7A6GvXEsSoCEEynby
 72byGeSovfq/4AWGNPBG1L61Exl+gbqfvbECP3ziXnob009+z9I4qXodHSYINfAkZkA523JG
 ap12LndJeLk3gfWNZfXEWyGnuciRGbqESkhIRav8ootsCIops/SqXm0/k+Kcl4gGUO/iD/T5
 oagaDh0QtOd8RWSMwLxwn8uIhpH84Q4X1LadJ5NCgGa6xPP5qqRuiC+9gZqbq4Nj
Message-ID: <dfd2c14c-acda-3862-9f48-a512e16a895c@gmx.com>
Date: Fri, 6 Mar 2020 15:16:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306065243.11699-1-madhuparnabhowmik10@gmail.com>
X-Provags-ID: V03:K1:3nx6RiTDtQKMzf0Xx6TUzD/vCqaunGpJUZf+t2+quMU/Ahs0F44
 YL9PgGwR/uhZMiCeezD+qM9ISW0JIzpHqYXsWJBaPxqkb7vR1EmgzihOU03jv4eA3wNQx1O
 i/MUj+ZADoExUWRRKHSVc6ofLQIZkq263lBhI8tYSEVbV9GC8sGYs/PgviMZD6jpFqIcOS2
 fUMCWNOSIqRx6PJ1Ovgrw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5GmarVaAovA=:L6tAdTeBz0X764LQx0WRrs
 uRqomaqgAb2HRm/3dWPEg1dC3XPEqIQJCS1YXCq6KFm5hER0DrOpatrNjA1BhxVuoRZOEN6qG
 WF2OF8YLnHn0sWCo1cOjyI0jrO9Mpp5c8Okooj4Y4tkzObEXvAqAq3gcnS9YtJWugaGq93Hkj
 /uMFvivbv9vOO3bKiIkJtOEmP/I8eXV6imFrmho7aP4mtzYZ3s0OAG0mTCVF0xmudLrWidhQi
 UuqZzzPxGN68nTzMCS6mgOHZdRpbjRLUAZRhzIqi5y9osxGW5lvLzKSnCVvRpJWBMDFtQW/0t
 rNwaQ1AvuqSJ7ThKo+ZfN4CH3cBE58rSw6w7EQ0G3XvclNdRDFiagvUgoJncAP022bCmOIypa
 novO0nVz7d7cy48TdyyLuFSOcEcKX1tINK+uD8wGLrsF2RUjoELzxczqEupNFTAoYpx5ez2Ot
 MwFFlRXAooRuGuMnu0/SbI8JsaxhwkMSFQR3537MOZxWAudXv6TOdriyeME327rgdeLAkqfBz
 Zr4mo0HpJGQ76ZG3HNWf4AJDjAuF3+QWiG4y/1qAI8eGVvtXA+93/Zva5mVgb1JT0IcF157dq
 DGgMlfEhB7VkIr4m8VTwhzA0h5EF4BEBPA+12i9sGcHqWzGvSwNFLaa68ro//NhQzCnSTo1hb
 VajaHc9UFlogRtav93MJKg58vjT4LfsMKVmuuWBTJsW8ZiFAltIhQZ/9uiaKw3HbX3Z1sSCkS
 +5DHvR24oCE911Vg1fdI/nM5VoWdrvEAU1B3ppA+yVIO13EmuMn4sHwQOfS+07VgAJjKXPOXI
 n4HlTSp64skzko3A2V5n8ueUAs2pOcIYX49DD9FFhTem+VX+cfY6ij5YFd5WSJhN1aiMkWGkb
 ggeLnEe0awiUgs70Sl2Z5fQQG8ATq8HLkEYQagEjfPbQ3ObiIJEs+UoLTel0nv2Ts8veXgYlu
 lQwRpqg7I0WyDeEzzmlR8NCg6C3I24ErIAQzQrPSsnVkgADNDkXvhvHSg6eJYGyhle0XRFvzM
 4D3dVM9o8e3WjpeDnx0aTw+ha53zzir2uAsFGFrymTw/lwof81KIuX5y/TuzjQd0F4JUNu6tW
 0XBp1A24D6S5bWyfrfCupw+GVBNF+lPdz/mz9Ld35Glmp4ve8CZhgfzWX3JV+blqg44marNWy
 12rcpo66mNIHMiuODiy9w0rvEmAaT7WzFExXRjev3l7Vwtwu8r9I4YT/v8RzENwhzaE4A8Fly
 mIcWfKB86KV+n9Cpx
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: btrfs: block-group.c: Fix
 suspicious RCU usage warning
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
Content-Type: multipart/mixed; boundary="===============6502456257459994447=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6502456257459994447==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LD9mQYuiTMqfXIWU3qhe30S1bI9VyCThS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LD9mQYuiTMqfXIWU3qhe30S1bI9VyCThS
Content-Type: multipart/mixed; boundary="Gf5hfQbAFfCGVZm3bnLWwitsYxWOuU5yY"

--Gf5hfQbAFfCGVZm3bnLWwitsYxWOuU5yY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2020/3/6 =E4=B8=8B=E5=8D=882:52, madhuparnabhowmik10@gmail.com wrote:
> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
>=20
> The space_info list is rcu protected.
> Hence, it should be traversed with rcu_read_lock held.
>=20
> Warning:
> [   29.104591] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   29.104756] WARNING: suspicious RCU usage
> [   29.105046] 5.6.0-rc4-next-20200305 #1 Not tainted
> [   29.105231] -----------------------------
> [   29.105401] fs/btrfs/block-group.c:2011 RCU-list traversed in non-re=
ader section!!
>=20
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> ---
>  fs/btrfs/block-group.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/btrfs/block-group.c b/fs/btrfs/block-group.c
> index 404e050ce8ee..9cabeef66f5b 100644
> --- a/fs/btrfs/block-group.c
> +++ b/fs/btrfs/block-group.c
> @@ -1987,6 +1987,7 @@ int btrfs_read_block_groups(struct btrfs_fs_info =
*info)

This function is only triggered at mount time, where no other rcu
operation can happen.

Thanks,
Qu
>  		btrfs_release_path(path);
>  	}
> =20
> +	rcu_read_lock();
>  	list_for_each_entry_rcu(space_info, &info->space_info, list) {
>  		if (!(btrfs_get_alloc_profile(info, space_info->flags) &
>  		      (BTRFS_BLOCK_GROUP_RAID10 |
> @@ -2007,7 +2008,8 @@ int btrfs_read_block_groups(struct btrfs_fs_info =
*info)
>  				list)
>  			inc_block_group_ro(cache, 1);
>  	}
> -
> +	rcu_read_unlock();
> +	=09
>  	btrfs_init_global_block_rsv(info);
>  	ret =3D check_chunk_block_group_mappings(info);
>  error:
>=20


--Gf5hfQbAFfCGVZm3bnLWwitsYxWOuU5yY--

--LD9mQYuiTMqfXIWU3qhe30S1bI9VyCThS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEELd9y5aWlW6idqkLhwj2R86El/qgFAl5h+OUACgkQwj2R86El
/qj+uAf+P4/IkqnNP9Lst8poavyrPd/t7oGYpdQk9+2MckPsWSj8xr5eje2gGmG8
1oqKF8muMRUoGmU78VOEtvo+XI2tlH5IxlZzsRrc0XVIXP6fLmULuu3Nl4uNNL8c
ie5wZjrlPYMyBTbwk3PUERU9kx5jQGr7MY0tosR5ze8PNb5YTAU2kUM5Jq2b79Tj
+KbOZg6pi/ocOTKYGfAZN9WipCNejrRmUdbWDbboXckFMrgmRtrA7UlM4t8jogn+
TnTJanzNpnm/5YirnyOl10J/ygryMGqmb8HxESV4slUybJjYrilNWY1I9IGFcZ5j
ot85xo2NtPhRScPSxrlrHscqCyxHOw==
=DNMN
-----END PGP SIGNATURE-----

--LD9mQYuiTMqfXIWU3qhe30S1bI9VyCThS--

--===============6502456257459994447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6502456257459994447==--
