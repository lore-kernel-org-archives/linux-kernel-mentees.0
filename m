Return-Path: <SRS0=0JRt=DW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA96C43467
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 21:59:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45A82076A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Oct 2020 21:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r/sYPjtV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45A82076A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0ABEA884B7;
	Thu, 15 Oct 2020 21:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1luvh6rmZvIP; Thu, 15 Oct 2020 21:59:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5753888258;
	Thu, 15 Oct 2020 21:59:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49FFEC0052;
	Thu, 15 Oct 2020 21:59:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0FF6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 21:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97AF28820D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 21:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpE5krl9BPK9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 21:59:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F794881FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Oct 2020 21:59:30 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC38q3d0Gz9sRk;
 Fri, 16 Oct 2020 08:59:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1602799165;
 bh=+pnzsjShTAYUFByi2kxPHD5vmPagopDyvYTnovjDFKo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r/sYPjtVXyWbfO7RIEbH/rOJ2P6pR810JvjkldvF82NIgXBG9clxZUpitNs9GdPfR
 IYKieLHQuZYSh1fGuDcKFHpvowkvzdHEH6zwBQDTpvVW+xohEhLbyijK0zuXQAijyj
 2wGA9gQBmqg3F7Q95D7EKdsLAOgJ4s+stZ0mKMgoBxRyKZVn9AS5fO3NnWjX+T5dKe
 trJ8DINgEXz3r/CmNwcRZTbwO1sSb1t4eCCRQDTm2uDu6rLsHTbc1rdVXAbBUyfUVc
 JRtNSFMuVcLeHKR+kEh8Maxmxhvqi/RsNPyfvV+9S1ranwWayZuJc5HXBFbrwxpx8n
 Rd25nvflLo8sw==
Date: Fri, 16 Oct 2020 08:59:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Message-ID: <20201016085922.4a2b90d1@canb.auug.org.au>
In-Reply-To: <20201012091428.103fc2be@canb.auug.org.au>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
 <20201011173030.141582-1-anant.thazhemadam@gmail.com>
 <20201012091428.103fc2be@canb.auug.org.au>
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, petkan@nucleusys.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, kuba@kernel.org,
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
Content-Type: multipart/mixed; boundary="===============6670611950536955677=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6670611950536955677==
Content-Type: multipart/signed; boundary="Sig_/4scCr8VwCta4sNLSHfaz3O8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4scCr8VwCta4sNLSHfaz3O8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 12 Oct 2020 09:14:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Sun, 11 Oct 2020 23:00:30 +0530 Anant Thazhemadam <anant.thazhemadam@g=
mail.com> wrote:
> >
> > In set_ethernet_addr(), if get_registers() succeeds, the ethernet addre=
ss
> > that was read must be copied over. Otherwise, a random ethernet address
> > must be assigned.
> >=20
> > get_registers() returns 0 if successful, and negative error number
> > otherwise. However, in set_ethernet_addr(), this return value is
> > incorrectly checked.
> >=20
> > Since this return value will never be equal to sizeof(node_id), a
> > random MAC address will always be generated and assigned to the
> > device; even in cases when get_registers() is successful.
> >=20
> > Correctly modifying the condition that checks if get_registers() was
> > successful or not fixes this problem, and copies the ethernet address
> > appropriately.
> >=20
> > Fixes: f45a4248ea4c ("net: usb: rtl8150: set random MAC address when se=
t_ethernet_addr() fails")
> > Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> > ---
> > Changes in v2:
> >         * Fixed the format of the Fixes tag
> >         * Modified the commit message to better describe the issue bein=
g=20
> >           fixed
> >=20
> > +CCing Stephen and linux-next, since the commit fixed isn't in the netw=
orking
> > tree, but is present in linux-next.
> >=20
> >  drivers/net/usb/rtl8150.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
> > index f020401adf04..bf8a60533f3e 100644
> > --- a/drivers/net/usb/rtl8150.c
> > +++ b/drivers/net/usb/rtl8150.c
> > @@ -261,7 +261,7 @@ static void set_ethernet_addr(rtl8150_t *dev)
> > =20
> >  	ret =3D get_registers(dev, IDR, sizeof(node_id), node_id);
> > =20
> > -	if (ret =3D=3D sizeof(node_id)) {
> > +	if (!ret) {
> >  		ether_addr_copy(dev->netdev->dev_addr, node_id);
> >  	} else {
> >  		eth_hw_addr_random(dev->netdev);
> > --=20
> > 2.25.1
> >  =20
>=20
> I will apply the above patch to the merge of the usb tree today to fix
> up a semantic conflict between the usb tree and Linus' tree.

It looks like you forgot to mention this one to Linus :-(

It should probably say:

Fixes: b2a0f274e3f7 ("net: rtl8150: Use the new usb control message API.")

--=20
Cheers,
Stephen Rothwell

--Sig_/4scCr8VwCta4sNLSHfaz3O8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+IxjoACgkQAVBC80lX
0Gy7GQgAgTCi7yUieCsVP9nVMN6eZTAGF0DOJf2MRoyZrb7YW1X8IOYZdnl7xJvZ
Ek5GE39cs4iU/nxNNmBCRykM9csSdCl9oewJ8QU6lBL/kEedWaLYarf6s+S8LO3k
piYQP7msA7erP9cG0dXFQt3Kql7YhLJi/QwQDXp4RGckZnAj9LOIHEvnETn1buMv
QsHWAl06LLgYDqMFnQi143UJ6lhd1pbHt97nLALJsCdDwsYXmbKHjDlcpR/Gu3RV
zyM+dQ20wO3cxWnHNeaFdXZJ+4IuHehBPD3AS5jj2zQFjei76f7YWQ1Kle37/UM6
hbSNKOAmmt47m4iMGOykq1HOK8f6og==
=ftXM
-----END PGP SIGNATURE-----

--Sig_/4scCr8VwCta4sNLSHfaz3O8--

--===============6670611950536955677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6670611950536955677==--
