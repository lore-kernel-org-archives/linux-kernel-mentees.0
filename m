Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777FAC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 22:14:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D062D2078B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 22:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M8CTsaTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D062D2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F68E8628A;
	Sun, 11 Oct 2020 22:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zPYUziqRyCrO; Sun, 11 Oct 2020 22:14:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E202861D4;
	Sun, 11 Oct 2020 22:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 786D4C07FF;
	Sun, 11 Oct 2020 22:14:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C1BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E820B874FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id evZ-nm9467lY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:14:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6CB6874FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:14:33 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8bh54hRXz9sSG;
 Mon, 12 Oct 2020 09:14:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602454471;
 bh=mZvIGiWYUI2zqFWGL8GvHQkWoM+kEmNPm9h8dkDqO6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M8CTsaTMOwigYIzmyPiWUcUPwN+tDtawIjfTIU15QgvzCx83yoyqdPJtWpq3T9gjo
 zgvvp23lLmSH1anq7WtNLI40Q6QTNcxQe+CXwn5pX3cD9mFhnEDkijksp78Gtk+jU/
 /AjLC1vaZPCFBwpubQeuXwqfz6ogqOY4QBfA2Bb8eSifqYa2F80HEJ8MehuhQUrf5T
 +49+huat3eww7IO+a3MLCJ/90tIbFOaLvDuSmHR33Ag7ZQzPCDnuRHejJTCLtFyTAM
 BiHRsTrfpbxMIs4Uvmok/uk/skBbW67fd19wZGzoiLdSWzudUL7nsYCco0rsDi5YkF
 4bQnEB48b7A0w==
Date: Mon, 12 Oct 2020 09:14:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Message-ID: <20201012091428.103fc2be@canb.auug.org.au>
In-Reply-To: <20201011173030.141582-1-anant.thazhemadam@gmail.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, petkan@nucleusys.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, davem@davemloft.net
Subject: Re: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: don't
 incorrectly assign random MAC addresses
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
Content-Type: multipart/mixed; boundary="===============0239968426980808001=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0239968426980808001==
Content-Type: multipart/signed; boundary="Sig_/UgAcjbHUvajYlQ+TL+=e3lV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UgAcjbHUvajYlQ+TL+=e3lV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam <anant.thazhemadam@gma=
il.com> wrote:
>
> In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
> that was read must be copied over. Otherwise, a random ethernet address
> must be assigned.
>=20
> get_registers() returns 0 if successful, and negative error number
> otherwise. However, in set_ethernet_addr(), this return value is
> incorrectly checked.
>=20
> Since this return value will never be equal to sizeof(node_id), a
> random MAC address will always be generated and assigned to the
> device; even in cases when get_registers() is successful.
>=20
> Correctly modifying the condition that checks if get_registers() was
> successful or not fixes this problem, and copies the ethernet address
> appropriately.
>=20
> Fixes: f45a4248ea4c ("net: usb: rtl8150: set random MAC address when set_=
ethernet_addr() fails")
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
> Changes in v2:
>         * Fixed the format of the Fixes tag
>         * Modified the commit message to better describe the issue being=
=20
>           fixed
>=20
> +CCing Stephen and linux-next, since the commit fixed isn't in the networ=
king
> tree, but is present in linux-next.
>=20
>  drivers/net/usb/rtl8150.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> index f020401adf04..bf8a60533f3e 100644
> --- a/drivers/net/usb/rtl8150.c
> +++ b/drivers/net/usb/rtl8150.c
> @@ -261,7 +261,7 @@ static void set_ethernet_addr(rtl8150_t *dev)
> =20
>  	ret =3D get_registers(dev, IDR, sizeof(node_id), node_id);
> =20
> -	if (ret =3D=3D sizeof(node_id)) {
> +	if (!ret) {
>  		ether_addr_copy(dev->netdev->dev_addr, node_id);
>  	} else {
>  		eth_hw_addr_random(dev->netdev);
> --=20
> 2.25.1
>=20

I will apply the above patch to the merge of the usb tree today to fix
up a semantic conflict between the usb tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UgAcjbHUvajYlQ+TL+=e3lV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Dg8QACgkQAVBC80lX
0GzhMAf/fbC6R3v0ksr5x4jSQeQIxhEc/3Z0uzspPaHzbQEIl6yMGHBGI4b2gmGr
1LzThwRKFwGd3yBeYFy0ug9lOQAwko+bbUHZaPMXefZn/1INQeLQZ+7BoqJ1tEnA
YGv185+gtBEpobWro3b14mmoxInTjG0nOjAMtbEaqpLOtSAEmaGP2L6oE9HnF/Dk
8up/QXkBsSq+zH/qrsIf+YyETkhqSvDQEBlRrxzGPJEPuAs4ml2DPhQme8zbXChW
25u0MKcekdfOKvm+brSuF++0cr/k0Al8AvI10s7yOmbEoaeKCP/gI0SODASUjD5V
UW8xiG8Bei3sXqck7YHemgrf+rX7gw==
=+QPX
-----END PGP SIGNATURE-----

--Sig_/UgAcjbHUvajYlQ+TL+=e3lV--

--===============0239968426980808001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0239968426980808001==--
